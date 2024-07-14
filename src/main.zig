const std = @import("std");
pub const objc = @import("objc.zig");

// pub const avf_audio = struct {
//     pub const avaudio = @import("avf_audio/avaudio.zig");
// };

// pub const core_foundation = struct {
//     pub const cf = @import("core_foundation/cf.zig");
// };

// pub const core_graphics = struct {
//     pub const cg = @import("core_graphics/cg.zig");
// };

// pub const foundation = struct {
//     pub const ns = @import("foundation/ns.zig");
// };

pub const metal = struct {
    pub const mtl = @import("metal/mtl.zig");
};

// pub const quartz_core = struct {
//     pub const ca = @import("quartz_core/ca.zig");
// };

test {
    @setEvalBranchQuota(10000);
    std.testing.refAllDeclsRecursive(@This());
}
