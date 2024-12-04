const cf = @import("core_foundation.zig");
const pid_t = @import("std").os.posix.pid_t;
const cm = @import("core_media.zig");
const ns = @import("foundation.zig");
const cg = @import("core_graphics.zig");
const objc = @import("objc.zig");

const size_t = usize;
const OSType = [4]u8;
const CMTime = cm.Time;
const CMClockRef = cm.ClockRef;
pub const CMSampleBufferRef = cm.SampleBufferRef;
pub const dispatch_queue_t = *anyopaque;
