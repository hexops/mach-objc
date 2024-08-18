const c = @import("c.zig");
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
pub const Protocol = objc.Protocol;
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

pub const BackingStoreType = UInteger;
pub const BackingStoreRetained: BackingStoreType = 0;
pub const BackingStoreNonretained: BackingStoreType = 1;
pub const BackingStoreBuffered: BackingStoreType = 2;

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
    pub fn class() *c.objc_class {
        return class_Application;
    }
    pub usingnamespace Methods(Application);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Responder.Methods(T);

            pub fn run(self_: *T) void {
                return objc.msgSend(self_, "run", void, .{});
            }
            pub fn sharedApplication() *Application {
                return objc.msgSend(T.class(), "sharedApplication", *Application, .{});
            }
            pub fn setDelegate(self_: *T, delegate_: ?*ApplicationDelegate) void {
                return objc.msgSend(self_, "setDelegate:", void, .{delegate_});
            }
        };
    }
};

pub const Responder = opaque {
    pub fn class() *c.objc_class {
        return class_Responder;
    }
    pub usingnamespace Methods(Responder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);
        };
    }
};

pub const Window = opaque {
    pub fn class() *c.objc_class {
        return class_Window;
    }
    pub usingnamespace Methods(Window);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Responder.Methods(T);

            pub fn initWithContentRect_styleMask_backing_defer_screen(self_: *T, contentRect_: Rect, style_: WindowStyleMask, backingStoreType_: BackingStoreType, flag_: bool, screen_: ?*Screen) *T {
                return objc.msgSend(self_, "initWithContentRect:styleMask:backing:defer:screen:", *T, .{ contentRect_, style_, backingStoreType_, flag_, screen_ });
            }
            pub fn makeKeyAndOrderFront(self_: *T, sender_: ?*c.objc_object) void {
                return objc.msgSend(self_, "makeKeyAndOrderFront:", void, .{sender_});
            }
            pub fn contentView(self_: *T) ?*View {
                return objc.msgSend(self_, "contentView", ?*View, .{});
            }
            pub fn isReleasedWhenClosed(self_: *T) bool {
                return objc.msgSend(self_, "isReleasedWhenClosed", bool, .{});
            }
            pub fn setReleasedWhenClosed(self_: *T, releasedWhenClosed_: bool) void {
                return objc.msgSend(self_, "setReleasedWhenClosed:", void, .{releasedWhenClosed_});
            }
            pub fn isVisible(self_: *T) bool {
                return objc.msgSend(self_, "isVisible", bool, .{});
            }
            pub fn setIsVisible(self_: *T, flag_: bool) void {
                return objc.msgSend(self_, "setIsVisible:", void, .{flag_});
            }
        };
    }
};

pub const Notification = opaque {
    pub fn class() *c.objc_class {
        return class_Notification;
    }
    pub usingnamespace Methods(Notification);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn name(self_: *T) NotificationName {
                return objc.msgSend(self_, "name", NotificationName, .{});
            }
            pub fn object(self_: *T) ?*c.objc_object {
                return objc.msgSend(self_, "object", ?*c.objc_object, .{});
            }
        };
    }
};

pub const ObjectInterface = opaque {
    pub fn class() *c.objc_class {
        return class_ObjectInterface;
    }
    pub usingnamespace Methods(ObjectInterface);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn alloc() *T {
                return objc.msgSend(T.class(), "alloc", *T, .{});
            }
        };
    }
};

pub const View = opaque {
    pub fn class() *c.objc_class {
        return class_View;
    }
    pub usingnamespace Methods(View);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Responder.Methods(T);

            pub fn layer(self_: *T) *ca.Layer {
                return objc.msgSend(self_, "layer", *ca.Layer, .{});
            }
            pub fn setLayer(self_: *T, layer_: *ca.Layer) void {
                return objc.msgSend(self_, "setLayer:", void, .{layer_});
            }
        };
    }
};

pub const Screen = opaque {
    pub fn class() *c.objc_class {
        return class_Screen;
    }
    pub usingnamespace Methods(Screen);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn screens() *Array(*Screen) {
                return objc.msgSend(T.class(), "screens", *Array(*Screen), .{});
            }
            pub fn mainScreen() ?*Screen {
                return objc.msgSend(T.class(), "mainScreen", ?*Screen, .{});
            }
        };
    }
};

pub const ApplicationDelegate = opaque {
    pub usingnamespace Methods(ApplicationDelegate);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectProtocol.Methods(T);

            pub fn applicationDidFinishLaunching(self_: *T, notification_: *Notification) void {
                return objc.msgSend(self_, "applicationDidFinishLaunching:", void, .{notification_});
            }
        };
    }
};

pub const ObjectProtocol = opaque {
    pub usingnamespace Methods(ObjectProtocol);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn release(self_: *T) void {
                return objc.msgSend(self_, "release", void, .{});
            }
        };
    }
};
var class_Application: *c.objc_class = undefined;
var class_Responder: *c.objc_class = undefined;
var class_Window: *c.objc_class = undefined;
var class_Notification: *c.objc_class = undefined;
var class_ObjectInterface: *c.objc_class = undefined;
var class_View: *c.objc_class = undefined;
var class_Screen: *c.objc_class = undefined;
pub fn init() void {
    class_Application = c.objc_getClass("NSApplication").?;
    class_Responder = c.objc_getClass("NSResponder").?;
    class_Window = c.objc_getClass("NSWindow").?;
    class_Notification = c.objc_getClass("NSNotification").?;
    class_ObjectInterface = c.objc_getClass("NSObject").?;
    class_View = c.objc_getClass("NSView").?;
    class_Screen = c.objc_getClass("NSScreen").?;
}
