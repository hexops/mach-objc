const c = @import("c.zig");
const cg = @import("core_graphics.zig");
const mtl = @import("metal.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");

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
                return objc.msgSend(self_, "texture", *mtl.Texture, .{});
            }
            pub fn layer(self_: *T) *MetalLayer {
                return objc.msgSend(self_, "layer", *MetalLayer, .{});
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
                return objc.msgSend(self_, "nextDrawable", ?*MetalDrawable, .{});
            }
            pub fn device(self_: *T) ?*mtl.Device {
                return objc.msgSend(self_, "device", ?*mtl.Device, .{});
            }
            pub fn setDevice(self_: *T, device_: ?*mtl.Device) void {
                return objc.msgSend(self_, "setDevice:", void, .{device_});
            }
            pub fn preferredDevice(self_: *T) ?*mtl.Device {
                return objc.msgSend(self_, "preferredDevice", ?*mtl.Device, .{});
            }
            pub fn pixelFormat(self_: *T) mtl.PixelFormat {
                return objc.msgSend(self_, "pixelFormat", mtl.PixelFormat, .{});
            }
            pub fn setPixelFormat(self_: *T, pixelFormat_: mtl.PixelFormat) void {
                return objc.msgSend(self_, "setPixelFormat:", void, .{pixelFormat_});
            }
            pub fn framebufferOnly(self_: *T) bool {
                return objc.msgSend(self_, "framebufferOnly", bool, .{});
            }
            pub fn setFramebufferOnly(self_: *T, framebufferOnly_: bool) void {
                return objc.msgSend(self_, "setFramebufferOnly:", void, .{framebufferOnly_});
            }
            pub fn drawableSize(self_: *T) cg.Size {
                return objc.msgSend(self_, "drawableSize", cg.Size, .{});
            }
            pub fn setDrawableSize(self_: *T, drawableSize_: cg.Size) void {
                return objc.msgSend(self_, "setDrawableSize:", void, .{drawableSize_});
            }
            pub fn maximumDrawableCount(self_: *T) ns.UInteger {
                return objc.msgSend(self_, "maximumDrawableCount", ns.UInteger, .{});
            }
            pub fn setMaximumDrawableCount(self_: *T, maximumDrawableCount_: ns.UInteger) void {
                return objc.msgSend(self_, "setMaximumDrawableCount:", void, .{maximumDrawableCount_});
            }
            pub fn presentsWithTransaction(self_: *T) bool {
                return objc.msgSend(self_, "presentsWithTransaction", bool, .{});
            }
            pub fn setPresentsWithTransaction(self_: *T, presentsWithTransaction_: bool) void {
                return objc.msgSend(self_, "setPresentsWithTransaction:", void, .{presentsWithTransaction_});
            }
            pub fn colorspace(self_: *T) cg.ColorSpaceRef {
                return objc.msgSend(self_, "colorspace", cg.ColorSpaceRef, .{});
            }
            pub fn setColorspace(self_: *T, colorspace_: cg.ColorSpaceRef) void {
                return objc.msgSend(self_, "setColorspace:", void, .{colorspace_});
            }
            pub fn wantsExtendedDynamicRangeContent(self_: *T) bool {
                return objc.msgSend(self_, "wantsExtendedDynamicRangeContent", bool, .{});
            }
            pub fn setWantsExtendedDynamicRangeContent(self_: *T, wantsExtendedDynamicRangeContent_: bool) void {
                return objc.msgSend(self_, "setWantsExtendedDynamicRangeContent:", void, .{wantsExtendedDynamicRangeContent_});
            }
            // pub fn EDRMetadata(self_: *T) ?*EDRMetadata {
            //     return objc.msgSend(self_, "EDRMetadata", ?*EDRMetadata, .{});
            // }
            // pub fn setEDRMetadata(self_: *T, EDRMetadata_: ?*EDRMetadata) void {
            //     return objc.msgSend(self_, "setEDRMetadata:", void, .{EDRMetadata_});
            // }
            pub fn displaySyncEnabled(self_: *T) bool {
                return objc.msgSend(self_, "displaySyncEnabled", bool, .{});
            }
            pub fn setDisplaySyncEnabled(self_: *T, displaySyncEnabled_: bool) void {
                return objc.msgSend(self_, "setDisplaySyncEnabled:", void, .{displaySyncEnabled_});
            }
            pub fn allowsNextDrawableTimeout(self_: *T) bool {
                return objc.msgSend(self_, "allowsNextDrawableTimeout", bool, .{});
            }
            pub fn setAllowsNextDrawableTimeout(self_: *T, allowsNextDrawableTimeout_: bool) void {
                return objc.msgSend(self_, "setAllowsNextDrawableTimeout:", void, .{allowsNextDrawableTimeout_});
            }
        };
    }
};
var class_Layer: *c.objc_class = undefined;
var class_MetalLayer: *c.objc_class = undefined;

pub fn init() void {
    class_Layer = c.objc_getClass("CALayer").?;
    class_MetalLayer = c.objc_getClass("CAMetalLayer").?;
}
