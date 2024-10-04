// ------------------------------------------------------------------------------------------------
// Types

pub const PixelBufferRef = *PixelBuffer;
pub const PixelBuffer = opaque {
    extern fn CVPixelBufferGetBaseAddress(PixelBufferRef) ?*anyopaque;
    pub inline fn getBaseAddress(pxl: PixelBufferRef) ?*anyopaque {
        return CVPixelBufferGetBaseAddress(pxl);
    }

    extern fn CVPixelBufferGetBaseAddressOfPlane(PixelBufferRef) ?*anyopaque;
    pub inline fn getBaseAddressOfPlane(pxl: PixelBufferRef) ?*anyopaque {
        return CVPixelBufferGetBaseAddressOfPlane(pxl);
    }
};

pub const ImageBufferRef = *ImageBuffer;
pub const ImageBuffer = opaque {};
