const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");

// ------------------------------------------------------------------------------------------------
// Types

pub const AVAudioSessionCategory = *ns.String;
pub const AVAudioSessionMode = *ns.String;
pub const AVAudioSessionPort = *ns.String;
pub const AVAudioSessionPolarPattern = *ns.String;
pub const AVAudioSessionLocation = *ns.String;
pub const AVAudioSessionOrientation = *ns.String;

pub const AudioChannelLabel = u32;
