const builtin = @import("builtin");
const std = @import("std");

pub extern "System" fn dispatch_async(queue: *anyopaque, work: *const Block(fn (*BlockLiteral(void)) void)) void;
pub extern "System" fn dispatch_async_f(queue: *anyopaque, context: ?*anyopaque, work: *const fn (context: ?*anyopaque) callconv(.C) void) void;
pub extern "System" fn @"dispatch_assert_queue$V2"(queue: *anyopaque) void;
pub extern "System" var _dispatch_main_q: anyopaque;

extern fn _Block_copy(*const anyopaque) *anyopaque; // Provided by libSystem on iOS but not macOS.
extern fn _Block_release(*const anyopaque) void; // Provided by libSystem on iOS but not macOS.

pub fn Block(comptime Signature: type) type {
    const signature_fn_info = @typeInfo(Signature).@"fn";
    return opaque {
        pub fn invoke(self: *@This(), args: std.meta.ArgsTuple(Signature)) signature_fn_info.return_type.? {
            const self_param = std.builtin.Type.Fn.Param{
                .is_generic = false,
                .is_noalias = false,
                .type = *@This(),
            };
            const SignatureForInvoke = @Type(.{
                .@"fn" = .{
                    .calling_convention = std.builtin.CallingConvention.c,
                    .is_generic = signature_fn_info.is_generic,
                    .is_var_args = signature_fn_info.is_var_args,
                    .return_type = signature_fn_info.return_type,
                    .params = .{self_param} ++ signature_fn_info.params,
                },
            });

            const offset = @offsetOf(BlockLiteral(void), "invoke");
            const invoke_ptr: *const SignatureForInvoke = @ptrCast(self + offset);
            return @call(.auto, invoke_ptr, .{self} ++ args);
        }

        pub fn copy(self: *const @This()) *@This() {
            return @ptrCast(_Block_copy(self));
        }

        pub fn release(self: *const @This()) void {
            _Block_release(self);
        }
    };
}

pub fn BlockLiteral(comptime Context: type) type {
    return extern struct {
        isa: *anyopaque,
        flags: i32,
        reserved: i32 = 0,
        invoke: *const anyopaque,
        descriptor: *const anyopaque,
        context: Context,

        fn trivialStaticDescriptor() *const anyopaque {
            return TrivialBlockDescriptor.static(@sizeOf(@This()));
        }

        fn copyDisposeStaticDescriptor(comptime copy: anytype, comptime dispose: anytype) *const anyopaque {
            return CopyDisposeBlockDescriptor(Context).static(@sizeOf(@This()), copy, dispose);
        }

        pub fn asBlockWithSignature(self: *@This(), comptime Signature: type) *Block(Signature) {
            return @ptrCast(self);
        }

        pub fn release(self: *const @This()) void {
            _Block_release(self);
        }
    };
}

pub fn BlockLiteralWithSignature(comptime Context: type, comptime Signature: type) type {
    // We could also obtain `Context` from `@typeInfo(Signature).@"fn".params[0].type`.
    return extern struct {
        literal: BlockLiteral(Context),

        pub fn asBlock(self: *@This()) *Block(Signature) {
            return self.literal.asBlockWithSignature(Signature);
        }
    };
}

const TrivialBlockDescriptor = extern struct {
    reserved: c_ulong = 0,
    size: c_ulong,

    fn static(comptime size: c_ulong) *const TrivialBlockDescriptor {
        const Static = struct {
            const descriptor: TrivialBlockDescriptor = .{ .size = size };
        };
        return &Static.descriptor;
    }
};

fn CopyDisposeBlockDescriptor(comptime Context: type) type {
    return extern struct {
        reserved: c_ulong = 0,
        size: c_ulong,
        copy: *const CopyFn,
        dispose: *const DisposeFn,

        pub const CopyFn = fn (dst: *BlockLiteral(Context), src: *const BlockLiteral(Context)) callconv(.C) void;
        pub const DisposeFn = fn (block: *const BlockLiteral(Context)) callconv(.C) void;

        fn static(comptime size: c_ulong, comptime copy: CopyFn, comptime dispose: DisposeFn) *const CopyDisposeBlockDescriptor {
            const Static = struct {
                const descriptor: CopyDisposeBlockDescriptor = .{
                    .size = size,
                    .copy = copy,
                    .dispose = dispose,
                };
            };
            return &Static.descriptor;
        }
    };
}

fn SignatureWithoutBlockLiteral(comptime Signature: type) type {
    var type_info = @typeInfo(Signature);
    type_info.@"fn".calling_convention = .auto;
    type_info.@"fn".params = type_info.@"fn".params[1..];
    return @Type(type_info);
}

fn validateBlockSignature(comptime Invoke: type, comptime ExpectedLiteralType: type) void {
    switch (@typeInfo(Invoke)) {
        .@"fn" => |fn_info| {
            // TODO: unsure how to write this with latest Zig version
            // if (fn_info.calling_convention != .c) {
            //     @compileError("A block's `invoke` must use the C calling convention");
            // }

            // TODO: should we allow zero params? At the ABI-level it would be fine but I think the compiler might consider it UB.
            if (fn_info.params.len == 0 or fn_info.params[0].type != *ExpectedLiteralType) {
                @compileError("The first parameter for a block's `invoke` must be a block literal pointer");
            }
        },
        else => @compileError("A block's `invoke` must be a function"),
    }
}

pub fn stackBlockLiteral(
    invoke: anytype,
    context: anytype,
    comptime copy: ?fn (dst: *BlockLiteral(@TypeOf(context)), src: *const BlockLiteral(@TypeOf(context))) callconv(.C) void,
    comptime dispose: ?fn (block: *const BlockLiteral(@TypeOf(context))) callconv(.C) void,
) BlockLiteralWithSignature(@TypeOf(context), SignatureWithoutBlockLiteral(@TypeOf(invoke))) {
    const Context = @TypeOf(context);
    const Literal = BlockLiteral(Context);
    comptime {
        validateBlockSignature(@TypeOf(invoke), Literal);
        if ((copy == null) != (dispose == null)) {
            @compileError("Both `copy` and `dispose` must either be null or nonnull");
        }
    }
    // const has_copy_dispose = if (comptime copy != null and dispose != null) 1 << 25 else 0;
    const has_copy_dispose = comptime copy != null and dispose != null;
    return .{
        .literal = .{
            .isa = _NSConcreteStackBlock,
            .flags = if (has_copy_dispose) 1 << 25 else 0,
            .invoke = invoke,
            .descriptor = if (has_copy_dispose) Literal.copyDisposeStaticDescriptor(copy, dispose) else Literal.trivialStaticDescriptor(),
            .context = context,
        },
    };
}
const _NSConcreteStackBlock = @extern(*anyopaque, .{
    .name = "_NSConcreteStackBlock",
    .library_name = if (builtin.target.os.tag == .macos) null else "System",
});

pub fn globalBlockLiteral(invoke: anytype, context: anytype) BlockLiteralWithSignature(@TypeOf(context), SignatureWithoutBlockLiteral(@TypeOf(invoke))) {
    const Context = @TypeOf(context);
    const Literal = BlockLiteral(Context);
    comptime {
        validateBlockSignature(@TypeOf(invoke), Literal);
    }
    const block_is_no_escape = 1 << 23;
    const block_is_global = 1 << 28;
    return .{
        .literal = .{
            .isa = _NSConcreteGlobalBlock,
            .flags = block_is_no_escape | block_is_global,
            .invoke = invoke,
            .descriptor = Literal.trivialStaticDescriptor(),
            .context = context,
        },
    };
}
const _NSConcreteGlobalBlock = @extern(*anyopaque, .{
    .name = "_NSConcreteGlobalBlock",
    .library_name = if (builtin.target.os.tag == .macos) null else "System",
});

pub fn globalBlock(comptime invoke: anytype) *Block(SignatureWithoutBlockLiteral(@TypeOf(invoke))) {
    const Static = struct {
        const literal = globalBlockLiteral(invoke, {});
    };
    return Static.literal.asBlock();
}
