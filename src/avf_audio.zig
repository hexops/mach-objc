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

pub const AVAudioSessionCategoryOptions = ns.UInteger;
pub const AVAudioSessionCategoryOptionMixWithOthers: AVAudioSessionCategoryOptions = 1;
pub const AVAudioSessionCategoryOptionDuckOthers: AVAudioSessionCategoryOptions = 2;
pub const AVAudioSessionCategoryOptionAllowBluetooth: AVAudioSessionCategoryOptions = 4;
pub const AVAudioSessionCategoryOptionDefaultToSpeaker: AVAudioSessionCategoryOptions = 8;
pub const AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers: AVAudioSessionCategoryOptions = 17;
pub const AVAudioSessionCategoryOptionAllowBluetoothA2DP: AVAudioSessionCategoryOptions = 32;
pub const AVAudioSessionCategoryOptionAllowAirPlay: AVAudioSessionCategoryOptions = 64;
pub const AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption: AVAudioSessionCategoryOptions = 128;

pub const AVAudioSessionRouteSharingPolicy = ns.UInteger;
pub const AVAudioSessionRouteSharingPolicyDefault: AVAudioSessionRouteSharingPolicy = 0;
pub const AVAudioSessionRouteSharingPolicyLongFormAudio: AVAudioSessionRouteSharingPolicy = 1;
pub const AVAudioSessionRouteSharingPolicyLongForm: AVAudioSessionRouteSharingPolicy = 1;
pub const AVAudioSessionRouteSharingPolicyIndependent: AVAudioSessionRouteSharingPolicy = 2;
pub const AVAudioSessionRouteSharingPolicyLongFormVideo: AVAudioSessionRouteSharingPolicy = 3;

pub const AVAudioSessionPortOverride = ns.UInteger;
pub const AVAudioSessionPortOverrideNone: AVAudioSessionPortOverride = 0;
pub const AVAudioSessionPortOverrideSpeaker: AVAudioSessionPortOverride = 1936747378;

pub const AVAudioSessionRecordPermission = ns.UInteger;
pub const AVAudioSessionRecordPermissionUndetermined: AVAudioSessionRecordPermission = 1970168948;
pub const AVAudioSessionRecordPermissionDenied: AVAudioSessionRecordPermission = 1684369017;
pub const AVAudioSessionRecordPermissionGranted: AVAudioSessionRecordPermission = 1735552628;

pub const AVAudioSessionSetActiveOptions = ns.UInteger;
pub const AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation: AVAudioSessionSetActiveOptions = 1;

pub const AVAudioSessionActivationOptions = ns.UInteger;
pub const AVAudioSessionActivationOptionNone: AVAudioSessionActivationOptions = 0;

pub const AVAudioStereoOrientation = ns.Integer;
pub const AVAudioStereoOrientationNone: AVAudioStereoOrientation = 0;
pub const AVAudioStereoOrientationPortrait: AVAudioStereoOrientation = 1;
pub const AVAudioStereoOrientationPortraitUpsideDown: AVAudioStereoOrientation = 2;
pub const AVAudioStereoOrientationLandscapeRight: AVAudioStereoOrientation = 3;
pub const AVAudioStereoOrientationLandscapeLeft: AVAudioStereoOrientation = 4;

pub const AVAudioSessionPromptStyle = ns.UInteger;
pub const AVAudioSessionPromptStyleNone: AVAudioSessionPromptStyle = 1852796517;
pub const AVAudioSessionPromptStyleShort: AVAudioSessionPromptStyle = 1936224884;
pub const AVAudioSessionPromptStyleNormal: AVAudioSessionPromptStyle = 1852992876;

pub const AVAudioSessionIOType = ns.UInteger;
pub const AVAudioSessionIOTypeNotSpecified: AVAudioSessionIOType = 0;
pub const AVAudioSessionIOTypeAggregated: AVAudioSessionIOType = 1;

pub const AVAudioSession = opaque {
    pub const InternalInfo = objc.ExternClass("AVAudioSession", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sharedInstance() *AVAudioSession {
        return objc.msgSend(@This().InternalInfo.class(), "sharedInstance", *AVAudioSession, .{});
    }
    pub fn setCategory_error(self_: *@This(), category_: AVAudioSessionCategory, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setCategory:error:", bool, .{ category_, outError_ });
    }
    pub fn setCategory_withOptions_error(self_: *@This(), category_: AVAudioSessionCategory, options_: AVAudioSessionCategoryOptions, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setCategory:withOptions:error:", bool, .{ category_, options_, outError_ });
    }
    pub fn setCategory_mode_options_error(self_: *@This(), category_: AVAudioSessionCategory, mode_: AVAudioSessionMode, options_: *objc.Id, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setCategory:mode:options:error:", bool, .{ category_, mode_, options_, outError_ });
    }
    pub fn setCategory_mode_routeSharingPolicy_options_error(self_: *@This(), category_: AVAudioSessionCategory, mode_: AVAudioSessionMode, policy_: AVAudioSessionRouteSharingPolicy, options_: AVAudioSessionCategoryOptions, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setCategory:mode:routeSharingPolicy:options:error:", bool, .{ category_, mode_, policy_, options_, outError_ });
    }
    pub fn setMode_error(self_: *@This(), mode_: AVAudioSessionMode, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setMode:error:", bool, .{ mode_, outError_ });
    }
    pub fn setAllowHapticsAndSystemSoundsDuringRecording_error(self_: *@This(), inValue_: bool, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setAllowHapticsAndSystemSoundsDuringRecording:error:", bool, .{ inValue_, outError_ });
    }
    pub fn requestRecordPermission(self_: *@This(), response_: *ns.Block(fn (bool) void)) void {
        return objc.msgSend(self_, "requestRecordPermission:", void, .{response_});
    }
    pub fn overrideOutputAudioPort_error(self_: *@This(), portOverride_: AVAudioSessionPortOverride, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "overrideOutputAudioPort:error:", bool, .{ portOverride_, outError_ });
    }
    pub fn setPreferredInput_error(self_: *@This(), inPort_: ?*AVAudioSessionPortDescription, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredInput:error:", bool, .{ inPort_, outError_ });
    }
    pub fn setPrefersNoInterruptionsFromSystemAlerts_error(self_: *@This(), inValue_: bool, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPrefersNoInterruptionsFromSystemAlerts:error:", bool, .{ inValue_, outError_ });
    }
    pub fn availableCategories(self_: *@This()) *ns.Array(AVAudioSessionCategory) {
        return objc.msgSend(self_, "availableCategories", *ns.Array(AVAudioSessionCategory), .{});
    }
    pub fn category(self_: *@This()) AVAudioSessionCategory {
        return objc.msgSend(self_, "category", AVAudioSessionCategory, .{});
    }
    pub fn categoryOptions(self_: *@This()) AVAudioSessionCategoryOptions {
        return objc.msgSend(self_, "categoryOptions", AVAudioSessionCategoryOptions, .{});
    }
    pub fn routeSharingPolicy(self_: *@This()) AVAudioSessionRouteSharingPolicy {
        return objc.msgSend(self_, "routeSharingPolicy", AVAudioSessionRouteSharingPolicy, .{});
    }
    pub fn availableModes(self_: *@This()) *ns.Array(AVAudioSessionMode) {
        return objc.msgSend(self_, "availableModes", *ns.Array(AVAudioSessionMode), .{});
    }
    pub fn mode(self_: *@This()) AVAudioSessionMode {
        return objc.msgSend(self_, "mode", AVAudioSessionMode, .{});
    }
    pub fn allowHapticsAndSystemSoundsDuringRecording(self_: *@This()) bool {
        return objc.msgSend(self_, "allowHapticsAndSystemSoundsDuringRecording", bool, .{});
    }
    pub fn recordPermission(self_: *@This()) AVAudioSessionRecordPermission {
        return objc.msgSend(self_, "recordPermission", AVAudioSessionRecordPermission, .{});
    }
    pub fn preferredInput(self_: *@This()) ?*AVAudioSessionPortDescription {
        return objc.msgSend(self_, "preferredInput", ?*AVAudioSessionPortDescription, .{});
    }
    pub fn prefersNoInterruptionsFromSystemAlerts(self_: *@This()) bool {
        return objc.msgSend(self_, "prefersNoInterruptionsFromSystemAlerts", bool, .{});
    }
    pub fn setActive_error(self_: *@This(), active_: bool, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setActive:error:", bool, .{ active_, outError_ });
    }
    pub fn setActive_withOptions_error(self_: *@This(), active_: bool, options_: AVAudioSessionSetActiveOptions, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setActive:withOptions:error:", bool, .{ active_, options_, outError_ });
    }
    pub fn activateWithOptions_completionHandler(self_: *@This(), options_: AVAudioSessionActivationOptions, handler_: *ns.Block(fn (bool, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "activateWithOptions:completionHandler:", void, .{ options_, handler_ });
    }
    pub fn setPreferredSampleRate_error(self_: *@This(), sampleRate_: f64, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredSampleRate:error:", bool, .{ sampleRate_, outError_ });
    }
    pub fn setPreferredIOBufferDuration_error(self_: *@This(), duration_: ns.TimeInterval, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredIOBufferDuration:error:", bool, .{ duration_, outError_ });
    }
    pub fn setPreferredInputNumberOfChannels_error(self_: *@This(), count_: ns.Integer, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredInputNumberOfChannels:error:", bool, .{ count_, outError_ });
    }
    pub fn setPreferredOutputNumberOfChannels_error(self_: *@This(), count_: ns.Integer, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredOutputNumberOfChannels:error:", bool, .{ count_, outError_ });
    }
    pub fn setPreferredInputOrientation_error(self_: *@This(), orientation_: AVAudioStereoOrientation, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredInputOrientation:error:", bool, .{ orientation_, outError_ });
    }
    pub fn setInputGain_error(self_: *@This(), gain_: f32, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setInputGain:error:", bool, .{ gain_, outError_ });
    }
    pub fn setInputDataSource_error(self_: *@This(), dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setInputDataSource:error:", bool, .{ dataSource_, outError_ });
    }
    pub fn setOutputDataSource_error(self_: *@This(), dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setOutputDataSource:error:", bool, .{ dataSource_, outError_ });
    }
    pub fn preferredSampleRate(self_: *@This()) f64 {
        return objc.msgSend(self_, "preferredSampleRate", f64, .{});
    }
    pub fn preferredIOBufferDuration(self_: *@This()) ns.TimeInterval {
        return objc.msgSend(self_, "preferredIOBufferDuration", ns.TimeInterval, .{});
    }
    pub fn preferredInputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "preferredInputNumberOfChannels", ns.Integer, .{});
    }
    pub fn preferredOutputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "preferredOutputNumberOfChannels", ns.Integer, .{});
    }
    pub fn preferredInputOrientation(self_: *@This()) AVAudioStereoOrientation {
        return objc.msgSend(self_, "preferredInputOrientation", AVAudioStereoOrientation, .{});
    }
    pub fn inputOrientation(self_: *@This()) AVAudioStereoOrientation {
        return objc.msgSend(self_, "inputOrientation", AVAudioStereoOrientation, .{});
    }
    pub fn maximumInputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "maximumInputNumberOfChannels", ns.Integer, .{});
    }
    pub fn maximumOutputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "maximumOutputNumberOfChannels", ns.Integer, .{});
    }
    pub fn inputGain(self_: *@This()) f32 {
        return objc.msgSend(self_, "inputGain", f32, .{});
    }
    pub fn isInputGainSettable(self_: *@This()) bool {
        return objc.msgSend(self_, "isInputGainSettable", bool, .{});
    }
    pub fn isInputAvailable(self_: *@This()) bool {
        return objc.msgSend(self_, "isInputAvailable", bool, .{});
    }
    pub fn inputDataSources(self_: *@This()) *ns.Array(*AVAudioSessionDataSourceDescription) {
        return objc.msgSend(self_, "inputDataSources", *ns.Array(*AVAudioSessionDataSourceDescription), .{});
    }
    pub fn inputDataSource(self_: *@This()) *AVAudioSessionDataSourceDescription {
        return objc.msgSend(self_, "inputDataSource", *AVAudioSessionDataSourceDescription, .{});
    }
    pub fn outputDataSources(self_: *@This()) *ns.Array(*AVAudioSessionDataSourceDescription) {
        return objc.msgSend(self_, "outputDataSources", *ns.Array(*AVAudioSessionDataSourceDescription), .{});
    }
    pub fn outputDataSource(self_: *@This()) *AVAudioSessionDataSourceDescription {
        return objc.msgSend(self_, "outputDataSource", *AVAudioSessionDataSourceDescription, .{});
    }
    pub fn sampleRate(self_: *@This()) f64 {
        return objc.msgSend(self_, "sampleRate", f64, .{});
    }
    pub fn inputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "inputNumberOfChannels", ns.Integer, .{});
    }
    pub fn outputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "outputNumberOfChannels", ns.Integer, .{});
    }
    pub fn inputLatency(self_: *@This()) ns.TimeInterval {
        return objc.msgSend(self_, "inputLatency", ns.TimeInterval, .{});
    }
    pub fn outputLatency(self_: *@This()) ns.TimeInterval {
        return objc.msgSend(self_, "outputLatency", ns.TimeInterval, .{});
    }
    pub fn IOBufferDuration(self_: *@This()) ns.TimeInterval {
        return objc.msgSend(self_, "IOBufferDuration", ns.TimeInterval, .{});
    }
    pub fn isOtherAudioPlaying(self_: *@This()) bool {
        return objc.msgSend(self_, "isOtherAudioPlaying", bool, .{});
    }
    pub fn secondaryAudioShouldBeSilencedHint(self_: *@This()) bool {
        return objc.msgSend(self_, "secondaryAudioShouldBeSilencedHint", bool, .{});
    }
    pub fn outputVolume(self_: *@This()) f32 {
        return objc.msgSend(self_, "outputVolume", f32, .{});
    }
    pub fn promptStyle(self_: *@This()) AVAudioSessionPromptStyle {
        return objc.msgSend(self_, "promptStyle", AVAudioSessionPromptStyle, .{});
    }
    pub fn setAggregatedIOPreference_error(self_: *@This(), inIOType_: AVAudioSessionIOType, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setAggregatedIOPreference:error:", bool, .{ inIOType_, outError_ });
    }
    pub fn availableInputs(self_: *@This()) *ns.Array(*AVAudioSessionPortDescription) {
        return objc.msgSend(self_, "availableInputs", *ns.Array(*AVAudioSessionPortDescription), .{});
    }
    pub fn currentRoute(self_: *@This()) *AVAudioSessionRouteDescription {
        return objc.msgSend(self_, "currentRoute", *AVAudioSessionRouteDescription, .{});
    }
    pub fn setActive_withFlags_error(self_: *@This(), active_: bool, flags_: ns.Integer, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setActive:withFlags:error:", bool, .{ active_, flags_, outError_ });
    }
    pub fn setPreferredHardwareSampleRate_error(self_: *@This(), sampleRate_: f64, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredHardwareSampleRate:error:", bool, .{ sampleRate_, outError_ });
    }
    pub fn delegate(self_: *@This()) *AVAudioSessionDelegate {
        return objc.msgSend(self_, "delegate", *AVAudioSessionDelegate, .{});
    }
    pub fn setDelegate(self_: *@This(), delegate_: *AVAudioSessionDelegate) void {
        return objc.msgSend(self_, "setDelegate:", void, .{delegate_});
    }
    pub fn inputIsAvailable(self_: *@This()) bool {
        return objc.msgSend(self_, "inputIsAvailable", bool, .{});
    }
    pub fn currentHardwareSampleRate(self_: *@This()) f64 {
        return objc.msgSend(self_, "currentHardwareSampleRate", f64, .{});
    }
    pub fn currentHardwareInputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "currentHardwareInputNumberOfChannels", ns.Integer, .{});
    }
    pub fn currentHardwareOutputNumberOfChannels(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "currentHardwareOutputNumberOfChannels", ns.Integer, .{});
    }
    pub fn preferredHardwareSampleRate(self_: *@This()) f64 {
        return objc.msgSend(self_, "preferredHardwareSampleRate", f64, .{});
    }
};

pub const AVAudioSessionPortDescription = opaque {
    pub const InternalInfo = objc.ExternClass("AVAudioSessionPortDescription", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn setPreferredDataSource_error(self_: *@This(), dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredDataSource:error:", bool, .{ dataSource_, outError_ });
    }
    pub fn portType(self_: *@This()) AVAudioSessionPort {
        return objc.msgSend(self_, "portType", AVAudioSessionPort, .{});
    }
    pub fn portName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "portName", *ns.String, .{});
    }
    pub fn UID(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "UID", *ns.String, .{});
    }
    pub fn hasHardwareVoiceCallProcessing(self_: *@This()) bool {
        return objc.msgSend(self_, "hasHardwareVoiceCallProcessing", bool, .{});
    }
    pub fn isSpatialAudioEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isSpatialAudioEnabled", bool, .{});
    }
    pub fn channels(self_: *@This()) *ns.Array(*AVAudioSessionChannelDescription) {
        return objc.msgSend(self_, "channels", *ns.Array(*AVAudioSessionChannelDescription), .{});
    }
    pub fn dataSources(self_: *@This()) ?*ns.Array(*AVAudioSessionDataSourceDescription) {
        return objc.msgSend(self_, "dataSources", ?*ns.Array(*AVAudioSessionDataSourceDescription), .{});
    }
    pub fn selectedDataSource(self_: *@This()) ?*AVAudioSessionDataSourceDescription {
        return objc.msgSend(self_, "selectedDataSource", ?*AVAudioSessionDataSourceDescription, .{});
    }
    pub fn preferredDataSource(self_: *@This()) ?*AVAudioSessionDataSourceDescription {
        return objc.msgSend(self_, "preferredDataSource", ?*AVAudioSessionDataSourceDescription, .{});
    }
};

pub const AVAudioSessionDataSourceDescription = opaque {
    pub const InternalInfo = objc.ExternClass("AVAudioSessionDataSourceDescription", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn setPreferredPolarPattern_error(self_: *@This(), pattern_: AVAudioSessionPolarPattern, outError_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "setPreferredPolarPattern:error:", bool, .{ pattern_, outError_ });
    }
    pub fn dataSourceID(self_: *@This()) *ns.Number {
        return objc.msgSend(self_, "dataSourceID", *ns.Number, .{});
    }
    pub fn dataSourceName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "dataSourceName", *ns.String, .{});
    }
    pub fn location(self_: *@This()) AVAudioSessionLocation {
        return objc.msgSend(self_, "location", AVAudioSessionLocation, .{});
    }
    pub fn orientation(self_: *@This()) AVAudioSessionOrientation {
        return objc.msgSend(self_, "orientation", AVAudioSessionOrientation, .{});
    }
    pub fn supportedPolarPatterns(self_: *@This()) ?*ns.Array(AVAudioSessionPolarPattern) {
        return objc.msgSend(self_, "supportedPolarPatterns", ?*ns.Array(AVAudioSessionPolarPattern), .{});
    }
    pub fn selectedPolarPattern(self_: *@This()) AVAudioSessionPolarPattern {
        return objc.msgSend(self_, "selectedPolarPattern", AVAudioSessionPolarPattern, .{});
    }
    pub fn preferredPolarPattern(self_: *@This()) AVAudioSessionPolarPattern {
        return objc.msgSend(self_, "preferredPolarPattern", AVAudioSessionPolarPattern, .{});
    }
};

pub const AVAudioSessionRouteDescription = opaque {
    pub const InternalInfo = objc.ExternClass("AVAudioSessionRouteDescription", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn inputs(self_: *@This()) *ns.Array(*AVAudioSessionPortDescription) {
        return objc.msgSend(self_, "inputs", *ns.Array(*AVAudioSessionPortDescription), .{});
    }
    pub fn outputs(self_: *@This()) *ns.Array(*AVAudioSessionPortDescription) {
        return objc.msgSend(self_, "outputs", *ns.Array(*AVAudioSessionPortDescription), .{});
    }
};

pub const AVAudioSessionChannelDescription = opaque {
    pub const InternalInfo = objc.ExternClass("AVAudioSessionChannelDescription", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn channelName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "channelName", *ns.String, .{});
    }
    pub fn owningPortUID(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "owningPortUID", *ns.String, .{});
    }
    pub fn channelNumber(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "channelNumber", ns.UInteger, .{});
    }
    pub fn channelLabel(self_: *@This()) AudioChannelLabel {
        return objc.msgSend(self_, "channelLabel", AudioChannelLabel, .{});
    }
};

pub const AVAudioSessionDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn beginInterruption(self_: *@This()) void {
        return objc.msgSend(self_, "beginInterruption", void, .{});
    }
    pub fn endInterruptionWithFlags(self_: *@This(), flags_: ns.UInteger) void {
        return objc.msgSend(self_, "endInterruptionWithFlags:", void, .{flags_});
    }
    pub fn endInterruption(self_: *@This()) void {
        return objc.msgSend(self_, "endInterruption", void, .{});
    }
    pub fn inputIsAvailableChanged(self_: *@This(), isInputAvailable_: bool) void {
        return objc.msgSend(self_, "inputIsAvailableChanged:", void, .{isInputAvailable_});
    }
};
