const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    _ = b.addModule("mach-objc", .{
        .source_file = .{ .path = "src/main.zig" },
    });

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&testStep(b, optimize, target).step);
}

pub fn testStep(b: *std.Build, optimize: std.builtin.OptimizeMode, target: std.zig.CrossTarget) *std.build.RunStep {
    const main_tests = b.addTest(.{
        .name = "mach-objc-tests",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    link(main_tests);

    // Transitive dependencies, explicit linkage of these works around
    // ziglang/zig#17130
    main_tests.linkFramework("CoreFoundation");

    // Direct dependencies
    main_tests.linkFramework("Foundation");
    b.installArtifact(main_tests);
    return b.addRunArtifact(main_tests);
}

pub fn link(step: *std.build.CompileStep) void {
    if (step.target.toTarget().isDarwin()) {
        @import("xcode_frameworks").addPaths(step);

        // Transitive dependencies, explicit linkage of these works around
        // ziglang/zig#17130
        step.linkSystemLibrary("objc");
    }
}
