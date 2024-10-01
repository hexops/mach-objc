// const ca = @import("quartz_core.zig");
// const cf = @import("core_foundation.zig");
// const pid_t = @import("std").os.posix.pid_t;
// const size_t = usize;
// const ns = @import("foundation.zig");
// const cg = @import("core_graphics.zig");
// const objc = @import("objc.zig");

pub const TimeValue = i64;
pub const TimeScale = i32;
pub const TimeEpoch = u32;
pub const CMClockRef = *opaque {};

pub const CVImageBufferRef = *CVImageBuffer;
pub const CVImageBuffer = opaque {
    extern fn CVPixelBufferGetBaseAddress(CVImageBufferRef) ?*anyopaque;
    pub inline fn getBaseAddress(pxl: CVImageBufferRef) ?*anyopaque {
        return CVPixelBufferGetBaseAddress(pxl);
    }
    extern fn CVPixelBufferGetBaseAddressOfPlane(CVImageBufferRef) ?*anyopaque;
    pub inline fn getBaseAddressOfPlane(pxl: CVImageBufferRef) ?*anyopaque {
        return CVPixelBufferGetBaseAddressOfPlane(pxl);
    }
};

pub const CMSampleBufferRef = *CMSampleBuffer;
pub const CMSampleBuffer = opaque {
    extern fn CMSampleBufferGetDataBuffer(*anyopaque) callconv(.C) ?CVImageBufferRef;

    pub inline fn getImageBuffer(sbuf: *CMSampleBuffer) ?CVImageBufferRef {
        return CMSampleBufferGetDataBuffer(sbuf);
    }
};

pub const Time = extern struct {
    value: TimeValue,
    timescale: TimeScale,
    flags: CMTimeFlags,
    epoch: TimeEpoch,
};

pub const ClockRef = extern struct {};

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
