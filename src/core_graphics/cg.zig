const builtin = @import("builtin");

pub const ColorSpaceRef = *opaque {};

pub const Float = if (builtin.target.ptrBitWidth() == 64) f64 else f32;

pub const Point = extern struct {
    x: Float,
    y: Float,
};

pub const Size = extern struct {
    width: Float,
    height: Float,
};

pub const Rect = extern struct {
    origin: Point,
    size: Size,
};
