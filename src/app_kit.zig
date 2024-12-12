const ca = @import("quartz_core.zig");
const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");
const cg = @import("core_graphics.zig");
const objc = @import("objc.zig");

pub const applicationMain = NSApplicationMain;
extern fn NSApplicationMain(argc: c_int, argv: [*]*c_char) c_int;

// ------------------------------------------------------------------------------------------------
// Shared

pub const ErrorDomain = ns.ErrorDomain;
pub const ErrorUserInfoKey = ns.ErrorUserInfoKey;
pub const Integer = ns.Integer;
pub const NotificationName = ns.NotificationName;
pub const TimeInterval = ns.TimeInterval;
pub const UInteger = ns.UInteger;
pub const unichar = ns.unichar;
pub const Range = ns.Range;
pub const StringEncoding = ns.StringEncoding;
pub const StringTransform = ns.StringTransform;
pub const StringEncodingDetectionOptionsKey = ns.StringEncodingDetectionOptionsKey;
pub const Array = ns.Array;
pub const String = ns.String;

// ------------------------------------------------------------------------------------------------
// Types

pub const ModalResponse = *String;
pub const PasteboardType = *String;
pub const AboutPanelOptionKey = *String;
pub const ModalSession = *opaque {};
pub const PrintInfoAttributeKey = *String;
pub const Rect = cg.Rect;
pub const Point = cg.Point;
pub const Size = cg.Size;
pub const RunLoopMode = *String;
pub const PrinterPaperName = *String;
pub const PrintJobDispositionValue = *String;
pub const InterfaceStyle = UInteger;
pub const TouchBarItemIdentifier = *String;
pub const TouchBarCustomizationIdentifier = *String;
pub const TouchBarItemPriority = f32;
pub const DeviceDescriptionKey = *String;
pub const PrinterTypeName = *String;
pub const PrintInfoSettingKey = *String;
pub const AccessibilityActionName = *String;
pub const AccessibilityAttributeName = *String;
pub const ExceptionName = *String;
pub const ImageName = *String;
pub const NibName = *String;
pub const WindowFrameAutosaveName = *String;
pub const AccessibilityParameterizedAttributeName = *String;
pub const UserInterfaceItemIdentifier = *String;

pub const TrackingAreaOptions = UInteger;
pub const TrackingMouseEnteredAndExited: TrackingAreaOptions = 1;
pub const TrackingMouseMoved: TrackingAreaOptions = 2;
pub const TrackingCursorUpdate: TrackingAreaOptions = 4;
pub const TrackingActiveWhenFirstResponder: TrackingAreaOptions = 16;
pub const TrackingActiveInKeyWindow: TrackingAreaOptions = 32;
pub const TrackingActiveInActiveApp: TrackingAreaOptions = 64;
pub const TrackingActiveAlways: TrackingAreaOptions = 128;
pub const TrackingAssumeInside: TrackingAreaOptions = 256;
pub const TrackingInVisibleRect: TrackingAreaOptions = 512;
pub const TrackingEnabledDuringMouseDrag: TrackingAreaOptions = 1024;

pub const ApplicationActivationPolicy = Integer;
pub const ApplicationActivationPolicyRegular: ApplicationActivationPolicy = 0;
pub const ApplicationActivationPolicyAccessory: ApplicationActivationPolicy = 0;
pub const ApplicationActivationPolicyProhibited: ApplicationActivationPolicy = 0;

pub const BackingStoreType = UInteger;
pub const BackingStoreRetained: BackingStoreType = 0;
pub const BackingStoreNonretained: BackingStoreType = 1;
pub const BackingStoreBuffered: BackingStoreType = 2;

pub const EventModifierFlags = UInteger;
pub const EventModifierFlagCapsLock: EventModifierFlags = 65536;
pub const EventModifierFlagShift: EventModifierFlags = 131072;
pub const EventModifierFlagControl: EventModifierFlags = 262144;
pub const EventModifierFlagOption: EventModifierFlags = 524288;
pub const EventModifierFlagCommand: EventModifierFlags = 1048576;
pub const EventModifierFlagNumericPad: EventModifierFlags = 2097152;
pub const EventModifierFlagHelp: EventModifierFlags = 4194304;
pub const EventModifierFlagFunction: EventModifierFlags = 8388608;
pub const EventModifierFlagDeviceIndependentFlagsMask: EventModifierFlags = 4294901760;

pub const WindowStyleMask = UInteger;
pub const WindowStyleMaskBorderless: WindowStyleMask = 0;
pub const WindowStyleMaskTitled: WindowStyleMask = 1;
pub const WindowStyleMaskClosable: WindowStyleMask = 2;
pub const WindowStyleMaskMiniaturizable: WindowStyleMask = 4;
pub const WindowStyleMaskResizable: WindowStyleMask = 8;
pub const WindowStyleMaskTexturedBackground: WindowStyleMask = 256;
pub const WindowStyleMaskUnifiedTitleAndToolbar: WindowStyleMask = 4096;
pub const WindowStyleMaskFullScreen: WindowStyleMask = 16384;
pub const WindowStyleMaskFullSizeContentView: WindowStyleMask = 32768;
pub const WindowStyleMaskUtilityWindow: WindowStyleMask = 16;
pub const WindowStyleMaskDocModalWindow: WindowStyleMask = 64;
pub const WindowStyleMaskNonactivatingPanel: WindowStyleMask = 128;
pub const WindowStyleMaskHUDWindow: WindowStyleMask = 8192;

pub const Application = opaque {
    pub const InternalInfo = objc.ExternClass("NSApplication", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn activateIgnoringOtherApps(self_: *@This(), flag_: bool) void {
        return objc.msgSend(self_, "activateIgnoringOtherApps:", void, .{flag_});
    }
    pub fn run(self_: *@This()) void {
        return objc.msgSend(self_, "run", void, .{});
    }
    pub fn setActivationPolicy(self_: *@This(), activationPolicy_: ApplicationActivationPolicy) bool {
        return objc.msgSend(self_, "setActivationPolicy:", bool, .{activationPolicy_});
    }
    pub fn sharedApplication() *Application {
        return objc.msgSend(@This().InternalInfo.class(), "sharedApplication", *Application, .{});
    }
    pub fn setDelegate(self_: *@This(), delegate_: ?*ApplicationDelegate) void {
        return objc.msgSend(self_, "setDelegate:", void, .{delegate_});
    }
};

pub const Responder = opaque {
    pub const InternalInfo = objc.ExternClass("NSResponder", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

pub const Window = opaque {
    pub const InternalInfo = objc.ExternClass("NSWindow", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn frameRectForContentRect(self_: *@This(), contentRect_: Rect) Rect {
        return objc.msgSend(self_, "frameRectForContentRect:", Rect, .{contentRect_});
    }
    pub fn contentRectForFrameRect(self_: *@This(), frameRect_: Rect) Rect {
        return objc.msgSend(self_, "contentRectForFrameRect:", Rect, .{frameRect_});
    }
    pub fn initWithContentRect_styleMask_backing_defer_screen(self_: *@This(), contentRect_: Rect, style_: WindowStyleMask, backingStoreType_: BackingStoreType, flag_: bool, screen_: ?*Screen) *@This() {
        return objc.msgSend(self_, "initWithContentRect:styleMask:backing:defer:screen:", *@This(), .{ contentRect_, style_, backingStoreType_, flag_, screen_ });
    }
    pub fn setFrame_display_animate(self_: *@This(), frameRect_: Rect, displayFlag_: bool, animateFlag_: bool) void {
        return objc.msgSend(self_, "setFrame:display:animate:", void, .{ frameRect_, displayFlag_, animateFlag_ });
    }
    pub fn update(self_: *@This()) void {
        return objc.msgSend(self_, "update", void, .{});
    }
    pub fn center(self_: *@This()) void {
        return objc.msgSend(self_, "center", void, .{});
    }
    pub fn makeKeyAndOrderFront(self_: *@This(), sender_: ?*objc.Id) void {
        return objc.msgSend(self_, "makeKeyAndOrderFront:", void, .{sender_});
    }
    pub fn title(self_: *@This()) *String {
        return objc.msgSend(self_, "title", *String, .{});
    }
    pub fn setTitle(self_: *@This(), title_: *String) void {
        return objc.msgSend(self_, "setTitle:", void, .{title_});
    }
    pub fn titlebarAppearsTransparent(self_: *@This()) bool {
        return objc.msgSend(self_, "titlebarAppearsTransparent", bool, .{});
    }
    pub fn setTitlebarAppearsTransparent(self_: *@This(), titlebarAppearsTransparent_: bool) void {
        return objc.msgSend(self_, "setTitlebarAppearsTransparent:", void, .{titlebarAppearsTransparent_});
    }
    pub fn contentView(self_: *@This()) ?*View {
        return objc.msgSend(self_, "contentView", ?*View, .{});
    }
    pub fn setContentView(self_: *@This(), contentView_: ?*View) void {
        return objc.msgSend(self_, "setContentView:", void, .{contentView_});
    }
    pub fn setDelegate(self_: *@This(), delegate_: ?*WindowDelegate) void {
        return objc.msgSend(self_, "setDelegate:", void, .{delegate_});
    }
    pub fn frame(self_: *@This()) Rect {
        return objc.msgSend(self_, "frame", Rect, .{});
    }
    pub fn isReleasedWhenClosed(self_: *@This()) bool {
        return objc.msgSend(self_, "isReleasedWhenClosed", bool, .{});
    }
    pub fn setReleasedWhenClosed(self_: *@This(), releasedWhenClosed_: bool) void {
        return objc.msgSend(self_, "setReleasedWhenClosed:", void, .{releasedWhenClosed_});
    }
    pub fn backgroundColor(self_: *@This()) *Color {
        return objc.msgSend(self_, "backgroundColor", *Color, .{});
    }
    pub fn setBackgroundColor(self_: *@This(), backgroundColor_: ?*Color) void {
        return objc.msgSend(self_, "setBackgroundColor:", void, .{backgroundColor_});
    }
    pub fn isVisible(self_: *@This()) bool {
        return objc.msgSend(self_, "isVisible", bool, .{});
    }
    pub fn backingScaleFactor(self_: *@This()) cg.Float {
        return objc.msgSend(self_, "backingScaleFactor", cg.Float, .{});
    }
    pub fn setMinSize(self_: *@This(), minSize_: Size) void {
        return objc.msgSend(self_, "setMinSize:", void, .{minSize_});
    }
    pub fn setIsVisible(self_: *@This(), flag_: bool) void {
        return objc.msgSend(self_, "setIsVisible:", void, .{flag_});
    }
};

pub const Notification = opaque {
    pub const InternalInfo = objc.ExternClass("NSNotification", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) NotificationName {
        return objc.msgSend(self_, "name", NotificationName, .{});
    }
    pub fn object(self_: *@This()) ?*objc.Id {
        return objc.msgSend(self_, "object", ?*objc.Id, .{});
    }
};

pub const Dictionary = opaque {
    pub const InternalInfo = objc.ExternClass("NSDictionary", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

pub const ObjectInterface = opaque {
    pub const InternalInfo = objc.ExternClass("NSObject", @This(), objc.Id, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn copy(self_: *@This()) *objc.Id {
        return objc.msgSend(self_, "copy", *objc.Id, .{});
    }
};

pub const Event = opaque {
    pub const InternalInfo = objc.ExternClass("NSEvent", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn modifierFlags(self_: *@This()) EventModifierFlags {
        return objc.msgSend(self_, "modifierFlags", EventModifierFlags, .{});
    }
    pub fn buttonNumber(self_: *@This()) Integer {
        return objc.msgSend(self_, "buttonNumber", Integer, .{});
    }
    pub fn locationInWindow(self_: *@This()) Point {
        return objc.msgSend(self_, "locationInWindow", Point, .{});
    }
    pub fn hasPreciseScrollingDeltas(self_: *@This()) bool {
        return objc.msgSend(self_, "hasPreciseScrollingDeltas", bool, .{});
    }
    pub fn scrollingDeltaX(self_: *@This()) cg.Float {
        return objc.msgSend(self_, "scrollingDeltaX", cg.Float, .{});
    }
    pub fn scrollingDeltaY(self_: *@This()) cg.Float {
        return objc.msgSend(self_, "scrollingDeltaY", cg.Float, .{});
    }
    pub fn isARepeat(self_: *@This()) bool {
        return objc.msgSend(self_, "isARepeat", bool, .{});
    }
    pub fn keyCode(self_: *@This()) c_ushort {
        return objc.msgSend(self_, "keyCode", c_ushort, .{});
    }
    // pub fn modifierFlags() EventModifierFlags {
    //     return objc.msgSend(@This().InternalInfo.class(), "modifierFlags", EventModifierFlags, .{});
    // }
    pub fn pressedMouseButtons() UInteger {
        return objc.msgSend(@This().InternalInfo.class(), "pressedMouseButtons", UInteger, .{});
    }
};

pub const View = opaque {
    pub const InternalInfo = objc.ExternClass("NSView", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithFrame(self_: *@This(), frameRect_: Rect) *@This() {
        return objc.msgSend(self_, "initWithFrame:", *@This(), .{frameRect_});
    }
    pub fn layer(self_: *@This()) *ca.Layer {
        return objc.msgSend(self_, "layer", *ca.Layer, .{});
    }
    pub fn setLayer(self_: *@This(), layer_: *ca.Layer) void {
        return objc.msgSend(self_, "setLayer:", void, .{layer_});
    }
};

pub const Color = opaque {
    pub const InternalInfo = objc.ExternClass("NSColor", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn colorWithRed_green_blue_alpha(red_: cg.Float, green_: cg.Float, blue_: cg.Float, alpha_: cg.Float) *Color {
        return objc.msgSend(@This().InternalInfo.class(), "colorWithRed:green:blue:alpha:", *Color, .{ red_, green_, blue_, alpha_ });
    }
};

pub const Screen = opaque {
    pub const InternalInfo = objc.ExternClass("NSScreen", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn screens() *Array(*Screen) {
        return objc.msgSend(@This().InternalInfo.class(), "screens", *Array(*Screen), .{});
    }
    pub fn mainScreen() ?*Screen {
        return objc.msgSend(@This().InternalInfo.class(), "mainScreen", ?*Screen, .{});
    }
    pub fn frame(self_: *@This()) Rect {
        return objc.msgSend(self_, "frame", Rect, .{});
    }
};

pub const TrackingArea = opaque {
    pub const InternalInfo = objc.ExternClass("NSTrackingArea", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithRect_options_owner_userInfo(self_: *@This(), rect_: Rect, options_: TrackingAreaOptions, owner_: ?*objc.Id, userInfo_: ?*Dictionary(*objc.Id, *objc.Id)) *@This() {
        return objc.msgSend(self_, "initWithRect:options:owner:userInfo:", *@This(), .{ rect_, options_, owner_, userInfo_ });
    }
    pub fn rect(self_: *@This()) Rect {
        return objc.msgSend(self_, "rect", Rect, .{});
    }
    pub fn options(self_: *@This()) TrackingAreaOptions {
        return objc.msgSend(self_, "options", TrackingAreaOptions, .{});
    }
    pub fn owner(self_: *@This()) ?*objc.Id {
        return objc.msgSend(self_, "owner", ?*objc.Id, .{});
    }
    pub fn userInfo(self_: *@This()) ?*Dictionary(*objc.Id, *objc.Id) {
        return objc.msgSend(self_, "userInfo", ?*Dictionary(*objc.Id, *objc.Id), .{});
    }
};

pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{ ObjectProtocol, ObjectProtocol });
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn applicationDidFinishLaunching(self_: *@This(), notification_: *Notification) void {
        return objc.msgSend(self_, "applicationDidFinishLaunching:", void, .{notification_});
    }
};

pub const WindowDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{ ObjectProtocol, ObjectProtocol });
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn windowWillResize_toSize(self_: *@This(), sender_: *Window, frameSize_: Size) Size {
        return objc.msgSend(self_, "windowWillResize:toSize:", Size, .{ sender_, frameSize_ });
    }
};

pub const ObjectProtocol = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn retainCount(self_: *@This()) UInteger {
        return objc.msgSend(self_, "retainCount", UInteger, .{});
    }
};
