const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");

// ------------------------------------------------------------------------------------------------
// Types

// CVDisplayLink.h
pub const CGDirectDisplayID = u32;
pub const CVDisplayLinkRef = opaque {};
pub const CVReturn = i32;
pub const CVTime = extern struct {
    flags: i32,
    timeScale: i32,
    timeValue: i64,
};
pub const CVTimeStamp = extern struct {
    flags: u64,
    hostTime: u64,
    rateScalar: f32,
    reserved: u64,
    smpteTime: CVSMPTETime,
    version: u32,
    videoRefreshPeriod: i64,
    videoTime: i64,
    videoTimeScale: i32,
};

pub const CVSMPTETime = extern struct {
    counter: u32,
    flags: u32,
    frames: i16,
    hours: i16,
    minutes: i16,
    seconds: i16,
    subframeDivisor: i16,
    subframes: i16,
    type: i32,
};
pub const CGError = i32;

// ------------------------------------------------------------------------------------------------
// Functions

// CVDisplayLink.h
extern fn CVDisplayLinkCreateWithCGDisplay(CGDirectDisplayID, *CVDisplayLinkRef) CVReturn;
pub const displayLinkWithCGDisplay = CVDisplayLinkCreateWithCGDisplay;

extern fn CVDisplayLinkGetNominalOutputVideoRefreshPeriod(*CVDisplayLinkRef) CVTime;
pub const getNominalOutputVideoRefreshPeriod = CVDisplayLinkGetNominalOutputVideoRefreshPeriod;

extern fn CGGetOnlineDisplayList(i32, ?[*]CGDirectDisplayID, *i32) CGError;
pub const getOnlineDisplayList = CGGetOnlineDisplayList;

extern fn CGMainDisplayID() CGDirectDisplayID;
pub const mainDisplayID = CGMainDisplayID;

extern fn CVDisplayLinkSetOutputCallback(
    *CVDisplayLinkRef,
    *const fn (*CVDisplayLinkRef, *CVTimeStamp, *CVTimeStamp, u64, *u64, ?*anyopaque) callconv(.C) void,
) CVReturn;
pub const setOutputCallback = CVDisplayLinkSetOutputCallback;

extern fn CVDisplayLinkStart(*CVDisplayLinkRef) CVReturn;
pub const displayLinkStart = CVDisplayLinkStart;
