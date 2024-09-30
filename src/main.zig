const std = @import("std");

pub const objc = @import("objc.zig");
pub const avf_audio = @import("avf_audio.zig");
pub const core_foundation = @import("core_foundation.zig");
pub const core_graphics = @import("core_graphics.zig");
pub const foundation = @import("foundation.zig");
pub const metal = @import("metal.zig");
pub const quartz_core = @import("quartz_core.zig");
pub const app_kit = @import("app_kit.zig");
pub const screen_capture_kit = @import("screen_capture_kit.zig");

pub const mach = struct {
    pub const AppDelegate = opaque {
        pub const InternalInfo = objc.ExternClass("MACHAppDelegate", @This(), foundation.ObjectInterface, &.{app_kit.ApplicationDelegate});
        pub const as = InternalInfo.as;
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;
        pub const new = InternalInfo.new;
        pub const alloc = InternalInfo.alloc;
        pub const allocInit = InternalInfo.allocInit;

        pub fn setRunBlock(self: *AppDelegate, block: *foundation.Block(fn () void)) void {
            method(self, block);
        }
        const method = @extern(
            *const fn (*AppDelegate, *foundation.Block(fn () void)) callconv(.C) void,
            .{ .name = "\x01-[MACHAppDelegate setRunBlock:]" },
        );
    };
};

test {
    @setEvalBranchQuota(10000);
    std.testing.refAllDeclsRecursive(@This());
}
