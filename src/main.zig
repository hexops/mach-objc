const std = @import("std");

pub const objc = @import("objc.zig");
pub const avf_audio = @import("avf_audio.zig");
pub const core_foundation = @import("core_foundation.zig");
pub const core_graphics = @import("core_graphics.zig");
pub const foundation = @import("foundation.zig");
pub const metal = @import("metal.zig");
pub const quartz_core = @import("quartz_core.zig");
pub const app_kit = @import("app_kit.zig");

pub const mach = struct {
    pub const AppDelegate = opaque {
        pub const InternalInfo = objc.ExternClass("MACHAppDelegate", AppDelegate, foundation.ObjectInterface, &.{app_kit.ApplicationDelegate});
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

    pub const WindowDelegate = opaque {
        pub const InternalInfo = objc.ExternClass("MACHWindowDelegate", WindowDelegate, foundation.ObjectInterface, &.{app_kit.WindowDelegate});
        pub const as = InternalInfo.as;
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;
        pub const new = InternalInfo.new;
        pub const alloc = InternalInfo.alloc;
        pub const allocInit = InternalInfo.allocInit;

        pub fn setBlock_windowDidResize(self: *WindowDelegate, block: *foundation.Block(fn () void)) void {
            method_windowDidResize(self, block);
        }
        const method_windowDidResize = @extern(
            *const fn (*WindowDelegate, *foundation.Block(fn () void)) callconv(.C) void,
            .{ .name = "\x01-[MACHWindowDelegate setBlock_windowDidResize:]" },
        );

        pub fn setBlock_windowShouldClose(self: *WindowDelegate, block: *foundation.Block(fn () bool)) void {
            method_windowShouldClose(self, block);
        }
        const method_windowShouldClose = @extern(
            *const fn (*WindowDelegate, *foundation.Block(fn () bool)) callconv(.C) void,
            .{ .name = "\x01-[MACHWindowDelegate setBlock_windowShouldClose:]" },
        );
    };

    pub const View = opaque {
        pub const InternalInfo = objc.ExternClass("MACHView", View, app_kit.View, &.{});
        pub const as = InternalInfo.as;
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;
        pub const new = InternalInfo.new;
        pub const alloc = InternalInfo.alloc;
        pub const allocInit = InternalInfo.allocInit;

        pub fn initWithFrame(self_: *@This(), frameRect_: app_kit.Rect) *@This() {
            return objc.msgSend(self_, "initWithFrame:", *@This(), .{frameRect_});
        }

        pub fn currentDrawable(self_: *@This()) ?*quartz_core.MetalDrawable {
            return objc.msgSend(self_, "currentDrawable", ?*quartz_core.MetalDrawable, .{});
        }

        pub fn layer(self_: *@This()) *quartz_core.MetalLayer {
            return objc.msgSend(self_, "layer", *quartz_core.MetalLayer, .{});
        }
        pub fn setLayer(self_: *@This(), layer_: *quartz_core.MetalLayer) void {
            return objc.msgSend(self_, "setLayer:", void, .{layer_});
        }

        pub fn setBlock_keyDown(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_keyDown(self, block);
        }
        const method_keyDown = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_keyDown:]" },
        );

        pub fn setBlock_keyUp(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_keyUp(self, block);
        }
        const method_keyUp = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_keyUp:]" },
        );

        pub fn setBlock_flagsChanged(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_flagsChanged(self, block);
        }
        const method_flagsChanged = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_flagsChanged:]" },
        );

        pub fn setBlock_mouseMoved(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_mouseMoved(self, block);
        }
        const method_mouseMoved = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_mouseMoved:]" },
        );

        pub fn setBlock_mouseDown(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_mouseDown(self, block);
        }
        const method_mouseDown = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_mouseDown:]" },
        );

        pub fn setBlock_mouseUp(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_mouseUp(self, block);
        }
        const method_mouseUp = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_mouseUp:]" },
        );

        pub fn setBlock_scrollWheel(self: *View, block: *foundation.Block(fn (*app_kit.Event) void)) void {
            method_scrollWheel(self, block);
        }
        const method_scrollWheel = @extern(
            *const fn (*View, *foundation.Block(fn (*app_kit.Event) void)) callconv(.C) void,
            .{ .name = "\x01-[MACHView setBlock_scrollWheel:]" },
        );
    };
};

test {
    @setEvalBranchQuota(10000);
    std.testing.refAllDeclsRecursive(@This());
}
