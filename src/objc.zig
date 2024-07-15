extern fn objc_autoreleasePoolPop(pool: *anyopaque) void;
extern fn objc_autoreleasePoolPush() *anyopaque;

pub const autoreleasePoolPop = objc_autoreleasePoolPop;
pub const autoreleasePoolPush = objc_autoreleasePoolPush;

const c = @import("c.zig");
pub const Protocol = c.objc_object;
