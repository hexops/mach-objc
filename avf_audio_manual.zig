const c = @import("../c.zig");
const cf = @import("../core_foundation/cf.zig");
const ns = @import("../foundation/ns.zig");

// ------------------------------------------------------------------------------------------------
// Types

pub const AVAudioSessionCategory = *ns.String;
pub const AVAudioSessionMode = *ns.String;
pub const AVAudioSessionPort = *ns.String;
pub const AVAudioSessionPolarPattern = *ns.String;
pub const AVAudioSessionLocation = *ns.String;
pub const AVAudioSessionOrientation = *ns.String;

pub const AudioChannelLabel = u32;

// TODO - can we use definition in ns
extern const _NSConcreteStackBlock: *anyopaque;
