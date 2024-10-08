const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const module = b.addModule("mach-objc", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    module.linkSystemLibrary("objc", .{});

    // TODO: Maybe split this out into a separate module so we only link these in when needed.
    if (target.result.os.tag == .macos) {
        module.linkFramework("AppKit", .{});
        if (target.result.cpu.arch == .x86_64) {
            module.addAssemblyFile(b.path("MACHAppDelegate_x86_64_apple_macos12.s"));
        } else {
            module.addAssemblyFile(b.path("MACHAppDelegate_arm64_apple_macos12.s"));
        }
    } else {
        module.linkFramework("UIKit", .{});
        // TODO: Add iOS asm files once they are generated.
    }

    const xcode_frameworks = b.dependency("xcode_frameworks", .{});
    module.addSystemFrameworkPath(xcode_frameworks.path("Frameworks"));
    module.addSystemIncludePath(xcode_frameworks.path("include"));
    module.addLibraryPath(xcode_frameworks.path("lib"));

    const generator_exe = b.addExecutable(.{
        .name = "generator",
        .root_source_file = b.path("generator.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(generator_exe);
}
