const builtin = @import("builtin");
const std = @import("std");

extern fn objc_autoreleasePoolPop(pool: *anyopaque) void;
extern fn objc_autoreleasePoolPush() *anyopaque;

pub const autoreleasePoolPop = objc_autoreleasePoolPop;
pub const autoreleasePoolPush = objc_autoreleasePoolPush;

const c = @import("c.zig");
pub const Protocol = c.objc_object;
pub const Class = c.objc_class;

/// Calls `objc_msgSend(receiver, selector, args...)` (or `objc_msgSend_stret` if needed).
///
/// Be careful. The return type and argument types *must* match the Objective-C method's signature.
/// No compile-time verification is performed.
pub fn msgSend(receiver: anytype, comptime selector: []const u8, return_type: type, args: anytype) return_type {
    const n_colons = comptime std.mem.count(u8, selector, ":");
    if (comptime n_colons != args.len) {
        @compileError(std.fmt.comptimePrint(
            "Selector `{s}` has {} argument{s}, but {} were given",
            .{ selector, n_colons, (if (n_colons == 1) "" else "s"), args.len },
        ));
    }

    // TODO: Consider run-time signature verification if `builtin.mode == .Debug` (or use some other
    // toggle). Register the selector, then call `class_getInstanceMethod()` or
    // `class_getClassMethod()`, then call `method_getTypeEncoding()`, and then parse the string and
    // validate it against `receiver` and `args`.

    const fn_type = comptime init: {
        var params: []const std.builtin.Type.Fn.Param = &.{
            .{
                .is_generic = false,
                .is_noalias = false,
                .type = @TypeOf(receiver),
            },
            .{
                .is_generic = false,
                .is_noalias = false,
                .type = [*:0]c_char,
            },
        };
        for (@typeInfo(@TypeOf(args)).Struct.fields) |field| {
            params = params ++
                .{.{
                .is_generic = false,
                .is_noalias = false,
                .type = field.type,
            }};
        }
        break :init std.builtin.Type{
            .Fn = .{
                .calling_convention = .C,
                .is_generic = false,
                .is_var_args = false,
                .return_type = return_type,
                .params = params,
            },
        };
    };

    const needs_fpret = comptime builtin.target.cpu.arch == .x86_64 and (return_type == f32 or return_type == f64);
    const needs_stret = comptime builtin.target.cpu.arch == .x86_64 and @sizeOf(return_type) > 16;
    const msg_send_fn_name = comptime if (needs_stret) "objc_msgSend_stret" else if (needs_fpret) "objc_msgSend_fpret" else "objc_msgSend";
    const msg_send_fn = @extern(*const @Type(fn_type), .{ .name = msg_send_fn_name ++ "$" ++ selector });
    return @call(.auto, msg_send_fn, .{ receiver, undefined } ++ args);
}

pub fn ExternClass(comptime name: []const u8, T: type, SuperType: type, comptime protocols: []const type) type {
    return struct {
        pub fn class() *Class {
            // This global asm lives inside the `class()` function so we only generate it if `class()` is actually called.
            const GlobalAsm = struct {
                comptime {
                    // zig fmt: off
                    asm (
                        "    .section __DATA,__objc_classrefs,regular,no_dead_strip\n" ++
                        "    .p2align 3, 0x0\n" ++
                        "_OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ ":\n" ++
                        "    .quad _OBJC_CLASS_$_" ++ name
                    );
                    // zig fmt: on
                }
            };
            _ = GlobalAsm;

            var ptr: *anyopaque = undefined;
            if (comptime builtin.cpu.arch == .x86_64) {
                // zig fmt: off
                asm (
                    "movq _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "(%rip), %[ptr]"
                    : [ptr] "=r" (ptr),
                );
                // zig fmt: on
            } else {
                // zig fmt: off
                asm (
                    "adrp %[ptr], _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "@PAGE\n" ++
                    "ldr %[ptr], [%[ptr], _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "@PAGEOFF]"
                    : [ptr] "=r" (ptr),
                );
                // zig fmt: on
            }
            return @ptrCast(ptr);
        }

        pub fn canCastTo(comptime Base: type) bool {
            if (Base == T) return true;
            inline for (protocols) |P| {
                if (P.InternalInfo.canCastTo(Base)) return true;
            }
            return SuperType.InternalInfo.canCastTo(Base);
        }

        pub fn as(self: *T, comptime Base: type) *Base {
            if (comptime canCastTo(Base)) return @ptrCast(self);
            @compileError("Cannot cast `" ++ @typeName(T) ++ "` to `" ++ @typeName(Base) ++ "`");
        }
    };
}

pub fn ExternProtocol(T: type, comptime super_protocols: []const type) type {
    return struct {
        pub fn canCastTo(comptime Base: type) bool {
            if (Base == T) return true;
            inline for (super_protocols) |P| {
                if (P.InternalInfo.canCastTo(Base)) return true;
            }
            return false;
        }

        pub fn as(self: *T, comptime Base: type) *Base {
            if (comptime canCastTo(Base)) return @ptrCast(self);
            @compileError("Cannot cast `" ++ @typeName(T) ++ "` to `" ++ @typeName(Base) ++ "`");
        }
    };
}
