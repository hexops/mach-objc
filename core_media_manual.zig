const cv = @import("core_video.zig");

// ------------------------------------------------------------------------------------------------
// Types

pub const TimeValue = i64;
pub const TimeScale = i32;
pub const TimeEpoch = u32;

pub const BlockBufferRef = *BlockBuffer;
pub const BlockBuffer = opaque {};

pub const SampleBufferRef = *SampleBuffer;
pub const SampleBuffer = opaque {
    extern fn CMSampleBufferGetDataBuffer(SampleBufferRef) callconv(.C) ?BlockBufferRef;
    pub inline fn getDataBuffer(sbuf: *SampleBuffer) ?BlockBufferRef {
        return CMSampleBufferGetDataBuffer(sbuf);
    }

    extern fn CMSampleBufferGetImageBuffer(SampleBufferRef) callconv(.C) ?cv.ImageBufferRef;
    pub inline fn getImageBuffer(sbuf: *SampleBuffer) ?cv.ImageBufferRef {
        return CMSampleBufferGetImageBuffer(sbuf);
    }
};

pub const Time = extern struct {
    value: TimeValue,
    timescale: TimeScale,
    // TODO: need to figure out why the generator doesn't remove "CM" prefix here.
    flags: CMTimeFlags,
    epoch: TimeEpoch,
};

pub const ClockRef = *OpaqueCMClock;
pub const OpaqueCMClock = extern struct {};
