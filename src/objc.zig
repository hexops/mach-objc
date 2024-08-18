const std = @import("std");
const builtin = @import("builtin");

extern fn objc_autoreleasePoolPop(pool: *anyopaque) void;
extern fn objc_autoreleasePoolPush() *anyopaque;

pub const autoreleasePoolPop = objc_autoreleasePoolPop;
pub const autoreleasePoolPush = objc_autoreleasePoolPush;

// APIs that are part of libobjc's public API.
pub const Protocol = opaque {};

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
