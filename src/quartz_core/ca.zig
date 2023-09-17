const c = @import("../c.zig");
const cg = @import("../core_graphics/cg.zig");
const mtl = @import("../metal/mtl.zig");
const ns = @import("../foundation/ns.zig");

pub const Layer = opaque {
    pub fn class() *c.objc_class {
        return class_Layer;
    }
    pub usingnamespace Methods(Layer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
        };
    }
};

pub const MetalDrawable = opaque {
    pub usingnamespace Methods(MetalDrawable);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace mtl.Drawable.Methods(T);

            pub fn texture(self_: *T) *mtl.Texture {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *mtl.Texture, @ptrCast(&c.objc_msgSend))(self_, sel_texture);
            }
            pub fn layer(self_: *T) *MetalLayer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *MetalLayer, @ptrCast(&c.objc_msgSend))(self_, sel_layer);
            }
        };
    }
};

pub const MetalLayer = opaque {
    pub fn class() *c.objc_class {
        return class_MetalLayer;
    }
    pub usingnamespace Methods(MetalLayer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Layer.Methods(T);

            pub fn nextDrawable(self_: *T) ?*MetalDrawable {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*MetalDrawable, @ptrCast(&c.objc_msgSend))(self_, sel_nextDrawable);
            }
            pub fn device(self_: *T) ?*mtl.Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*mtl.Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn setDevice(self_: *T, device_: ?*mtl.Device) void {
                return @as(*const fn (*T, *c.objc_selector, ?*mtl.Device) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDevice_, device_);
            }
            pub fn preferredDevice(self_: *T) ?*mtl.Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*mtl.Device, @ptrCast(&c.objc_msgSend))(self_, sel_preferredDevice);
            }
            pub fn pixelFormat(self_: *T) mtl.PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) mtl.PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_pixelFormat);
            }
            pub fn setPixelFormat(self_: *T, pixelFormat_: mtl.PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, mtl.PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPixelFormat_, pixelFormat_);
            }
            pub fn framebufferOnly(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_framebufferOnly);
            }
            pub fn setFramebufferOnly(self_: *T, framebufferOnly_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFramebufferOnly_, framebufferOnly_);
            }
            pub fn drawableSize(self_: *T) cg.Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cg.Size, @ptrCast(&c.objc_msgSend))(self_, sel_drawableSize);
            }
            pub fn setDrawableSize(self_: *T, drawableSize_: cg.Size) void {
                return @as(*const fn (*T, *c.objc_selector, cg.Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDrawableSize_, drawableSize_);
            }
            pub fn maximumDrawableCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maximumDrawableCount);
            }
            pub fn setMaximumDrawableCount(self_: *T, maximumDrawableCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaximumDrawableCount_, maximumDrawableCount_);
            }
            pub fn presentsWithTransaction(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_presentsWithTransaction);
            }
            pub fn setPresentsWithTransaction(self_: *T, presentsWithTransaction_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPresentsWithTransaction_, presentsWithTransaction_);
            }
            pub fn colorspace(self_: *T) cg.ColorSpaceRef {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cg.ColorSpaceRef, @ptrCast(&c.objc_msgSend))(self_, sel_colorspace);
            }
            pub fn setColorspace(self_: *T, colorspace_: cg.ColorSpaceRef) void {
                return @as(*const fn (*T, *c.objc_selector, cg.ColorSpaceRef) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setColorspace_, colorspace_);
            }
            pub fn wantsExtendedDynamicRangeContent(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_wantsExtendedDynamicRangeContent);
            }
            pub fn setWantsExtendedDynamicRangeContent(self_: *T, wantsExtendedDynamicRangeContent_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setWantsExtendedDynamicRangeContent_, wantsExtendedDynamicRangeContent_);
            }
            // pub fn EDRMetadata(self_: *T) ?*EDRMetadata {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*EDRMetadata, @ptrCast(&c.objc_msgSend))(self_, sel_EDRMetadata);
            // }
            // pub fn setEDRMetadata(self_: *T, EDRMetadata_: ?*EDRMetadata) void {
            //     return @as(*const fn (*T, *c.objc_selector, ?*EDRMetadata) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEDRMetadata_, EDRMetadata_);
            // }
            pub fn displaySyncEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_displaySyncEnabled);
            }
            pub fn setDisplaySyncEnabled(self_: *T, displaySyncEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDisplaySyncEnabled_, displaySyncEnabled_);
            }
            pub fn allowsNextDrawableTimeout(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowsNextDrawableTimeout);
            }
            pub fn setAllowsNextDrawableTimeout(self_: *T, allowsNextDrawableTimeout_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAllowsNextDrawableTimeout_, allowsNextDrawableTimeout_);
            }
        };
    }
};
var class_Layer: *c.objc_class = undefined;
var class_MetalLayer: *c.objc_class = undefined;
var sel_setColorspace_: *c.objc_selector = undefined;
//var sel_EDRMetadata: *c.objc_selector = undefined;
var sel_setWantsExtendedDynamicRangeContent_: *c.objc_selector = undefined;
var sel_setDevice_: *c.objc_selector = undefined;
var sel_setPixelFormat_: *c.objc_selector = undefined;
var sel_setPresentsWithTransaction_: *c.objc_selector = undefined;
var sel_setMaximumDrawableCount_: *c.objc_selector = undefined;
var sel_setDrawableSize_: *c.objc_selector = undefined;
var sel_device: *c.objc_selector = undefined;
var sel_drawableSize: *c.objc_selector = undefined;
var sel_framebufferOnly: *c.objc_selector = undefined;
var sel_texture: *c.objc_selector = undefined;
var sel_developerHUDProperties: *c.objc_selector = undefined;
var sel_wantsExtendedDynamicRangeContent: *c.objc_selector = undefined;
var sel_preferredDevice: *c.objc_selector = undefined;
var sel_allowsNextDrawableTimeout: *c.objc_selector = undefined;
var sel_maximumDrawableCount: *c.objc_selector = undefined;
var sel_presentsWithTransaction: *c.objc_selector = undefined;
var sel_displaySyncEnabled: *c.objc_selector = undefined;
var sel_pixelFormat: *c.objc_selector = undefined;
var sel_colorspace: *c.objc_selector = undefined;
var sel_setDisplaySyncEnabled_: *c.objc_selector = undefined;
var sel_setFramebufferOnly_: *c.objc_selector = undefined;
var sel_setAllowsNextDrawableTimeout_: *c.objc_selector = undefined;
var sel_layer: *c.objc_selector = undefined;
var sel_nextDrawable: *c.objc_selector = undefined;
var sel_setEDRMetadata_: *c.objc_selector = undefined;
var sel_setDeveloperHUDProperties_: *c.objc_selector = undefined;

pub fn init() void {
    class_Layer = c.objc_getClass("CALayer").?;
    class_MetalLayer = c.objc_getClass("CAMetalLayer").?;

    sel_setColorspace_ = c.sel_registerName("setColorspace:").?;
    //sel_EDRMetadata = c.sel_registerName("EDRMetadata").?;
    sel_setWantsExtendedDynamicRangeContent_ = c.sel_registerName("setWantsExtendedDynamicRangeContent:").?;
    sel_setDevice_ = c.sel_registerName("setDevice:").?;
    sel_setPixelFormat_ = c.sel_registerName("setPixelFormat:").?;
    sel_setPresentsWithTransaction_ = c.sel_registerName("setPresentsWithTransaction:").?;
    sel_setMaximumDrawableCount_ = c.sel_registerName("setMaximumDrawableCount:").?;
    sel_setDrawableSize_ = c.sel_registerName("setDrawableSize:").?;
    sel_device = c.sel_registerName("device").?;
    sel_drawableSize = c.sel_registerName("drawableSize").?;
    sel_framebufferOnly = c.sel_registerName("framebufferOnly").?;
    sel_texture = c.sel_registerName("texture").?;
    sel_wantsExtendedDynamicRangeContent = c.sel_registerName("wantsExtendedDynamicRangeContent").?;
    sel_preferredDevice = c.sel_registerName("preferredDevice").?;
    sel_allowsNextDrawableTimeout = c.sel_registerName("allowsNextDrawableTimeout").?;
    sel_maximumDrawableCount = c.sel_registerName("maximumDrawableCount").?;
    sel_presentsWithTransaction = c.sel_registerName("presentsWithTransaction").?;
    sel_displaySyncEnabled = c.sel_registerName("displaySyncEnabled").?;
    sel_pixelFormat = c.sel_registerName("pixelFormat").?;
    sel_colorspace = c.sel_registerName("colorspace").?;
    sel_setDisplaySyncEnabled_ = c.sel_registerName("setDisplaySyncEnabled:").?;
    sel_setFramebufferOnly_ = c.sel_registerName("setFramebufferOnly:").?;
    sel_setAllowsNextDrawableTimeout_ = c.sel_registerName("setAllowsNextDrawableTimeout:").?;
    sel_layer = c.sel_registerName("layer").?;
    sel_nextDrawable = c.sel_registerName("nextDrawable").?;
    sel_setEDRMetadata_ = c.sel_registerName("setEDRMetadata:").?;
}
