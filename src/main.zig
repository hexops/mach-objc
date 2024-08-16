const std = @import("std");
const c = @import("c.zig");
pub const objc = @import("objc.zig");

pub const avf_audio = struct {
    pub const avaudio = @import("avf_audio/avaudio.zig");
};

pub const core_foundation = struct {
    pub const cf = @import("core_foundation/cf.zig");
};

pub const core_graphics = struct {
    pub const cg = @import("core_graphics/cg.zig");
};

pub const foundation = struct {
    pub const ns = @import("foundation/ns.zig");
};

pub const metal = struct {
    pub const mtl = @import("metal/mtl.zig");
};

pub const quartz_core = struct {
    pub const ca = @import("quartz_core/ca.zig");
};

pub const appkit = struct {
    pub const ns = @import("appkit/appkit.zig");
};

pub const mach = struct {
    pub const AppDelegate = opaque {
        pub fn allocInit() *AppDelegate {
            return objc_alloc_init(c.objc_getClass("MACHAppDelegate").?);
        }
        extern "objc" fn objc_alloc_init(class: *anyopaque) *AppDelegate;

        pub fn setRunBlock(self: *AppDelegate, block: *anyopaque) void {
            method(self, block);
        }
        const method = @extern(
            *const fn (*AppDelegate, *anyopaque) callconv(.C) void,
            .{ .name = "\x01-[MACHAppDelegate setRunBlock:]" },
        );
    };
};

test {
    @setEvalBranchQuota(10000);
    std.testing.refAllDeclsRecursive(@This());
}
