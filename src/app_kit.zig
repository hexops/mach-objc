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
    pub fn stop(self_: *@This(), sender_: ?*objc.Id) void {
        return objc.msgSend(self_, "stop:", void, .{sender_});
    }
    pub fn terminate(self_: *@This(), sender_: ?*objc.Id) void {
        return objc.msgSend(self_, "terminate:", void, .{sender_});
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
    pub fn isVisible(self_: *@This()) bool {
        return objc.msgSend(self_, "isVisible", bool, .{});
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
    pub fn isARepeat(self_: *@This()) bool {
        return objc.msgSend(self_, "isARepeat", bool, .{});
    }
    pub fn keyCode(self_: *@This()) c_ushort {
        return objc.msgSend(self_, "keyCode", c_ushort, .{});
    }
    // pub fn modifierFlags() EventModifierFlags {
    //     return objc.msgSend(@This().InternalInfo.class(), "modifierFlags", EventModifierFlags, .{});
    // }
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

    pub fn layer(self_: *@This()) *ca.Layer {
        return objc.msgSend(self_, "layer", *ca.Layer, .{});
    }
    pub fn setLayer(self_: *@This(), layer_: *ca.Layer) void {
        return objc.msgSend(self_, "setLayer:", void, .{layer_});
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
