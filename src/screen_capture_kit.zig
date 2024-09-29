// const ca = @import("quartz_core.zig");
// const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");
const cg = @import("core_graphics.zig");
const objc = @import("objc.zig");

// pub const applicationMain = NSApplicationMain;
// extern fn NSApplicationMain(argc: c_int, argv: [*]*c_char) c_int;

// // ------------------------------------------------------------------------------------------------
// // Shared

// pub const ErrorDomain = ns.ErrorDomain;
// pub const ErrorUserInfoKey = ns.ErrorUserInfoKey;
// pub const Integer = ns.Integer;
// pub const NotificationName = ns.NotificationName;
// pub const TimeInterval = ns.TimeInterval;
// pub const UInteger = ns.UInteger;
// pub const unichar = ns.unichar;
// pub const Range = ns.Range;
// pub const StringEncoding = ns.StringEncoding;
// pub const StringTransform = ns.StringTransform;
// pub const StringEncodingDetectionOptionsKey = ns.StringEncodingDetectionOptionsKey;
// pub const Array = ns.Array;
// pub const String = ns.String;

// // ------------------------------------------------------------------------------------------------
// // Types

// pub const ModalResponse = *String;
// pub const PasteboardType = *String;
// pub const AboutPanelOptionKey = *String;
// pub const ModalSession = *opaque {};
// pub const PrintInfoAttributeKey = *String;
// pub const Rect = cg.Rect;
// pub const Point = cg.Point;
// pub const Size = cg.Size;
// pub const RunLoopMode = *String;
// pub const PrinterPaperName = *String;
// pub const PrintJobDispositionValue = *String;
// pub const InterfaceStyle = UInteger;
// pub const TouchBarItemIdentifier = *String;
// pub const TouchBarCustomizationIdentifier = *String;
// pub const TouchBarItemPriority = f32;
// pub const DeviceDescriptionKey = *String;
// pub const PrinterTypeName = *String;
// pub const PrintInfoSettingKey = *String;
// pub const AccessibilityActionName = *String;
// pub const AccessibilityAttributeName = *String;
// pub const ExceptionName = *String;
// pub const ImageName = *String;
// pub const NibName = *String;
// pub const WindowFrameAutosaveName = *String;
// pub const AccessibilityParameterizedAttributeName = *String;
// pub const UserInterfaceItemIdentifier = *String;

pub const SCShareableContent = opaque {
    pub const InternalInfo = objc.ExternClass("SCShareableContent", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn getShareableContentWithCompletionHandler(completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentWithCompletionHandler:", void, .{completionHandler_});
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnly_completionHandler(excludeDesktopWindows_: bool, onScreenWindowsOnly_: bool, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnly:completionHandler:", void, .{ excludeDesktopWindows_, onScreenWindowsOnly_, completionHandler_ });
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnlyBelowWindow_completionHandler(excludeDesktopWindows_: bool, window_: *SCWindow, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnlyBelowWindow:completionHandler:", void, .{ excludeDesktopWindows_, window_, completionHandler_ });
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnlyAboveWindow_completionHandler(excludeDesktopWindows_: bool, window_: *SCWindow, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnlyAboveWindow:completionHandler:", void, .{ excludeDesktopWindows_, window_, completionHandler_ });
    }
    pub fn infoForFilter(filter_: *SCContentFilter) *SCShareableContentInfo {
        return objc.msgSend(@This().InternalInfo.class(), "infoForFilter:", *SCShareableContentInfo, .{filter_});
    }
    pub fn windows(self_: *@This()) *ns.Array(*SCWindow) {
        return objc.msgSend(self_, "windows", *ns.Array(*SCWindow), .{});
    }
    pub fn displays(self_: *@This()) *ns.Array(*SCDisplay) {
        return objc.msgSend(self_, "displays", *ns.Array(*SCDisplay), .{});
    }
    pub fn applications(self_: *@This()) *ns.Array(*SCRunningApplication) {
        return objc.msgSend(self_, "applications", *ns.Array(*SCRunningApplication), .{});
    }
};

pub const SCRunningApplication = opaque {
    pub const InternalInfo = objc.ExternClass("SCRunningApplication", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn bundleIdentifier(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "bundleIdentifier", *ns.String, .{});
    }
    pub fn applicationName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "applicationName", *ns.String, .{});
    }
    pub fn processID(self_: *@This()) pid_t {
        return objc.msgSend(self_, "processID", pid_t, .{});
    }
};

pub const SCDisplay = opaque {
    pub const InternalInfo = objc.ExternClass("SCDisplay", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn displayID(self_: *@This()) cg.DirectDisplayID {
        return objc.msgSend(self_, "displayID", cg.DirectDisplayID, .{});
    }
    pub fn width(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "width", ns.Integer, .{});
    }
    pub fn height(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "height", ns.Integer, .{});
    }
    pub fn frame(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "frame", cg.Rect, .{});
    }
};

pub const SCWindow = opaque {
    pub const InternalInfo = objc.ExternClass("SCWindow", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn windowID(self_: *@This()) cg.WindowID {
        return objc.msgSend(self_, "windowID", cg.WindowID, .{});
    }
    pub fn frame(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "frame", cg.Rect, .{});
    }
    pub fn title(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "title", ?*ns.String, .{});
    }
    pub fn windowLayer(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "windowLayer", ns.Integer, .{});
    }
    pub fn owningApplication(self_: *@This()) ?*SCRunningApplication {
        return objc.msgSend(self_, "owningApplication", ?*SCRunningApplication, .{});
    }
    pub fn isOnScreen(self_: *@This()) bool {
        return objc.msgSend(self_, "isOnScreen", bool, .{});
    }
    pub fn isActive(self_: *@This()) bool {
        return objc.msgSend(self_, "isActive", bool, .{});
    }
};
