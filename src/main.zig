const std = @import("std");
const c = @import("c.zig");
pub const objc = @import("objc.zig");

pub const avf_audio = struct {
    pub const avaudio = @import("avf_audio.zig");
};

pub const core_foundation = struct {
    pub const cf = @import("core_foundation.zig");
};

pub const core_graphics = struct {
    pub const cg = @import("core_graphics.zig");
};

pub const foundation = struct {
    pub const ns = @import("foundation.zig");
};

pub const metal = struct {
    pub const mtl = @import("metal.zig");
};

pub const quartz_core = struct {
    pub const ca = @import("quartz_core.zig");
};

pub const app_kit = struct {
    pub const ns = @import("app_kit.zig");
};
// TODO: delete `appkit` once Mach is using `app_kit`.
pub const appkit = app_kit;

pub const mach = struct {
    pub const AppDelegate = opaque {
        pub fn allocInit() *AppDelegate {
            return objc_alloc_init(c.objc_getClass("MACHAppDelegate").?);
        }
        extern "objc" fn objc_alloc_init(class: *anyopaque) *AppDelegate;

        pub fn setRunBlock(self: *AppDelegate, block: *foundation.ns.Block(fn () void)) void {
            method(self, block);
        }
        const method = @extern(
            *const fn (*AppDelegate, *foundation.ns.Block(fn () void)) callconv(.C) void,
            .{ .name = "\x01-[MACHAppDelegate setRunBlock:]" },
        );
    };
};

test {
    @setEvalBranchQuota(10000);
    std.testing.refAllDeclsRecursive(@This());
}
