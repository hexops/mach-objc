const std = @import("std");

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

test {
    @setEvalBranchQuota(10000);
    const refAllDecls = std.testing.refAllDecls;
    refAllDecls(core_foundation.cf);
    refAllDecls(core_graphics.cg);
    refAllDecls(foundation.ns);
    refAllDecls(metal.mtl);
    refAllDecls(quartz_core.ca);
}
