const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    _ = b.addModule("mach-objc", .{
        .root_source_file = .{ .path = "src/main.zig" },
    });

    const main_tests = b.addTest(.{
        .name = "mach-objc-tests",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    addPaths(&main_tests.root_module);
    main_tests.linkFramework("Foundation");

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&b.addRunArtifact(main_tests).step);
}

pub fn addPaths(mod: *std.Build.Module) void {
    @import("xcode_frameworks").addPaths(mod);
}
