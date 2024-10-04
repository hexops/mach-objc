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

pub const SCShareableContentStyle = ns.Integer;
pub const SCShareableContentStyleNone: SCShareableContentStyle = 0;
pub const SCShareableContentStyleWindow: SCShareableContentStyle = 0;
pub const SCShareableContentStyleDisplay: SCShareableContentStyle = 0;
pub const SCShareableContentStyleApplication: SCShareableContentStyle = 0;

pub const SCStreamType = ns.Integer;
pub const SCStreamTypeWindow: SCStreamType = 0;
pub const SCStreamTypeDisplay: SCStreamType = 0;

pub const SCCaptureResolutionType = ns.Integer;
pub const SCCaptureResolutionAutomatic: SCCaptureResolutionType = 0;
pub const SCCaptureResolutionBest: SCCaptureResolutionType = 0;
pub const SCCaptureResolutionNominal: SCCaptureResolutionType = 0;

pub const SCPresenterOverlayAlertSetting = ns.Integer;
pub const SCPresenterOverlayAlertSettingSystem: SCPresenterOverlayAlertSetting = 0;
pub const SCPresenterOverlayAlertSettingNever: SCPresenterOverlayAlertSetting = 0;
pub const SCPresenterOverlayAlertSettingAlways: SCPresenterOverlayAlertSetting = 0;

pub const SCStreamOutputType = ns.Integer;
pub const SCStreamOutputTypeScreen: SCStreamOutputType = 0;
pub const SCStreamOutputTypeAudio: SCStreamOutputType = 0;

pub const SCShareableContent = opaque {
    pub const InternalInfo = objc.ExternClass("SCShareableContent", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn getShareableContentWithCompletionHandler(completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentWithCompletionHandler:", void, .{completionHandler_});
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnly_completionHandler(excludeDesktopWindows_: bool, onScreenWindowsOnly_: bool, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnly:completionHandler:", void, .{ excludeDesktopWindows_, onScreenWindowsOnly_, completionHandler_ });
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnlyBelowWindow_completionHandler(excludeDesktopWindows_: bool, window_: *SCWindow, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnlyBelowWindow:completionHandler:", void, .{ excludeDesktopWindows_, window_, completionHandler_ });
    }
    pub fn getShareableContentExcludingDesktopWindows_onScreenWindowsOnlyAboveWindow_completionHandler(excludeDesktopWindows_: bool, window_: *SCWindow, completionHandler_: *ns.Block(fn (?*SCShareableContent, ?*ns.Error) void)) void {
        return objc.msgSend(@This().InternalInfo.class(), "getShareableContentExcludingDesktopWindows:onScreenWindowsOnlyAboveWindow:completionHandler:", void, .{ excludeDesktopWindows_, window_, completionHandler_ });
    }
    pub fn infoForFilter(filter_: *SCContentFilter) *SCShareableContentInfo {
        return objc.msgSend(@This().InternalInfo.class(), "infoForFilter:", *SCShareableContentInfo, .{filter_});
    }
    pub fn windows(self_: *@This()) *ns.Array(*SCWindow) {
        return objc.msgSend(self_, "windows", *ns.Array(*SCWindow), .{});
    }
    pub fn displays(self_: *@This()) *ns.Array(*SCDisplay) {
        return objc.msgSend(self_, "displays", *ns.Array(*SCDisplay), .{});
    }
    pub fn applications(self_: *@This()) *ns.Array(*SCRunningApplication) {
        return objc.msgSend(self_, "applications", *ns.Array(*SCRunningApplication), .{});
    }
};

pub const SCShareableContentInfo = opaque {
    pub const InternalInfo = objc.ExternClass("SCShareableContentInfo", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn style(self_: *@This()) SCShareableContentStyle {
        return objc.msgSend(self_, "style", SCShareableContentStyle, .{});
    }
    pub fn pointPixelScale(self_: *@This()) f32 {
        return objc.msgSend(self_, "pointPixelScale", f32, .{});
    }
    pub fn contentRect(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "contentRect", cg.Rect, .{});
    }
};

pub const SCContentFilter = opaque {
    pub const InternalInfo = objc.ExternClass("SCContentFilter", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithDesktopIndependentWindow(self_: *@This(), window_: *SCWindow) *@This() {
        return objc.msgSend(self_, "initWithDesktopIndependentWindow:", *@This(), .{window_});
    }
    pub fn initWithDisplay_excludingWindows(self_: *@This(), display_: *SCDisplay, excluded_: *ns.Array(*SCWindow)) *@This() {
        return objc.msgSend(self_, "initWithDisplay:excludingWindows:", *@This(), .{ display_, excluded_ });
    }
    pub fn initWithDisplay_includingWindows(self_: *@This(), display_: *SCDisplay, includedWindows_: *ns.Array(*SCWindow)) *@This() {
        return objc.msgSend(self_, "initWithDisplay:includingWindows:", *@This(), .{ display_, includedWindows_ });
    }
    pub fn initWithDisplay_includingApplications_exceptingWindows(self_: *@This(), display_: *SCDisplay, applications_: *ns.Array(*SCRunningApplication), exceptingWindows_: *ns.Array(*SCWindow)) *@This() {
        return objc.msgSend(self_, "initWithDisplay:includingApplications:exceptingWindows:", *@This(), .{ display_, applications_, exceptingWindows_ });
    }
    pub fn initWithDisplay_excludingApplications_exceptingWindows(self_: *@This(), display_: *SCDisplay, applications_: *ns.Array(*SCRunningApplication), exceptingWindows_: *ns.Array(*SCWindow)) *@This() {
        return objc.msgSend(self_, "initWithDisplay:excludingApplications:exceptingWindows:", *@This(), .{ display_, applications_, exceptingWindows_ });
    }
    pub fn streamType(self_: *@This()) SCStreamType {
        return objc.msgSend(self_, "streamType", SCStreamType, .{});
    }
    pub fn style(self_: *@This()) SCShareableContentStyle {
        return objc.msgSend(self_, "style", SCShareableContentStyle, .{});
    }
    pub fn pointPixelScale(self_: *@This()) f32 {
        return objc.msgSend(self_, "pointPixelScale", f32, .{});
    }
    pub fn contentRect(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "contentRect", cg.Rect, .{});
    }
    pub fn includeMenuBar(self_: *@This()) bool {
        return objc.msgSend(self_, "includeMenuBar", bool, .{});
    }
    pub fn setIncludeMenuBar(self_: *@This(), includeMenuBar_: bool) void {
        return objc.msgSend(self_, "setIncludeMenuBar:", void, .{includeMenuBar_});
    }
};

pub const SCStreamConfiguration = opaque {
    pub const InternalInfo = objc.ExternClass("SCStreamConfiguration", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn width(self_: *@This()) size_t {
        return objc.msgSend(self_, "width", size_t, .{});
    }
    pub fn setWidth(self_: *@This(), width_: size_t) void {
        return objc.msgSend(self_, "setWidth:", void, .{width_});
    }
    pub fn height(self_: *@This()) size_t {
        return objc.msgSend(self_, "height", size_t, .{});
    }
    pub fn setHeight(self_: *@This(), height_: size_t) void {
        return objc.msgSend(self_, "setHeight:", void, .{height_});
    }
    pub fn minimumFrameInterval(self_: *@This()) CMTime {
        return objc.msgSend(self_, "minimumFrameInterval", CMTime, .{});
    }
    pub fn setMinimumFrameInterval(self_: *@This(), minimumFrameInterval_: CMTime) void {
        return objc.msgSend(self_, "setMinimumFrameInterval:", void, .{minimumFrameInterval_});
    }
    pub fn pixelFormat(self_: *@This()) OSType {
        return objc.msgSend(self_, "pixelFormat", OSType, .{});
    }
    pub fn setPixelFormat(self_: *@This(), pixelFormat_: OSType) void {
        return objc.msgSend(self_, "setPixelFormat:", void, .{pixelFormat_});
    }
    pub fn scalesToFit(self_: *@This()) bool {
        return objc.msgSend(self_, "scalesToFit", bool, .{});
    }
    pub fn setScalesToFit(self_: *@This(), scalesToFit_: bool) void {
        return objc.msgSend(self_, "setScalesToFit:", void, .{scalesToFit_});
    }
    pub fn preservesAspectRatio(self_: *@This()) bool {
        return objc.msgSend(self_, "preservesAspectRatio", bool, .{});
    }
    pub fn setPreservesAspectRatio(self_: *@This(), preservesAspectRatio_: bool) void {
        return objc.msgSend(self_, "setPreservesAspectRatio:", void, .{preservesAspectRatio_});
    }
    pub fn streamName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "streamName", *ns.String, .{});
    }
    pub fn setStreamName(self_: *@This(), streamName_: *ns.String) void {
        return objc.msgSend(self_, "setStreamName:", void, .{streamName_});
    }
    pub fn showsCursor(self_: *@This()) bool {
        return objc.msgSend(self_, "showsCursor", bool, .{});
    }
    pub fn setShowsCursor(self_: *@This(), showsCursor_: bool) void {
        return objc.msgSend(self_, "setShowsCursor:", void, .{showsCursor_});
    }
    pub fn backgroundColor(self_: *@This()) cg.ColorRef {
        return objc.msgSend(self_, "backgroundColor", cg.ColorRef, .{});
    }
    pub fn setBackgroundColor(self_: *@This(), backgroundColor_: cg.ColorRef) void {
        return objc.msgSend(self_, "setBackgroundColor:", void, .{backgroundColor_});
    }
    pub fn sourceRect(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "sourceRect", cg.Rect, .{});
    }
    pub fn setSourceRect(self_: *@This(), sourceRect_: cg.Rect) void {
        return objc.msgSend(self_, "setSourceRect:", void, .{sourceRect_});
    }
    pub fn destinationRect(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "destinationRect", cg.Rect, .{});
    }
    pub fn setDestinationRect(self_: *@This(), destinationRect_: cg.Rect) void {
        return objc.msgSend(self_, "setDestinationRect:", void, .{destinationRect_});
    }
    pub fn queueDepth(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "queueDepth", ns.Integer, .{});
    }
    pub fn setQueueDepth(self_: *@This(), queueDepth_: ns.Integer) void {
        return objc.msgSend(self_, "setQueueDepth:", void, .{queueDepth_});
    }
    pub fn colorMatrix(self_: *@This()) cf.StringRef {
        return objc.msgSend(self_, "colorMatrix", cf.StringRef, .{});
    }
    pub fn setColorMatrix(self_: *@This(), colorMatrix_: cf.StringRef) void {
        return objc.msgSend(self_, "setColorMatrix:", void, .{colorMatrix_});
    }
    pub fn colorSpaceName(self_: *@This()) cf.StringRef {
        return objc.msgSend(self_, "colorSpaceName", cf.StringRef, .{});
    }
    pub fn setColorSpaceName(self_: *@This(), colorSpaceName_: cf.StringRef) void {
        return objc.msgSend(self_, "setColorSpaceName:", void, .{colorSpaceName_});
    }
    pub fn capturesAudio(self_: *@This()) bool {
        return objc.msgSend(self_, "capturesAudio", bool, .{});
    }
    pub fn setCapturesAudio(self_: *@This(), capturesAudio_: bool) void {
        return objc.msgSend(self_, "setCapturesAudio:", void, .{capturesAudio_});
    }
    pub fn sampleRate(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "sampleRate", ns.Integer, .{});
    }
    pub fn setSampleRate(self_: *@This(), sampleRate_: ns.Integer) void {
        return objc.msgSend(self_, "setSampleRate:", void, .{sampleRate_});
    }
    pub fn channelCount(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "channelCount", ns.Integer, .{});
    }
    pub fn setChannelCount(self_: *@This(), channelCount_: ns.Integer) void {
        return objc.msgSend(self_, "setChannelCount:", void, .{channelCount_});
    }
    pub fn excludesCurrentProcessAudio(self_: *@This()) bool {
        return objc.msgSend(self_, "excludesCurrentProcessAudio", bool, .{});
    }
    pub fn setExcludesCurrentProcessAudio(self_: *@This(), excludesCurrentProcessAudio_: bool) void {
        return objc.msgSend(self_, "setExcludesCurrentProcessAudio:", void, .{excludesCurrentProcessAudio_});
    }
    pub fn ignoreShadowsDisplay(self_: *@This()) bool {
        return objc.msgSend(self_, "ignoreShadowsDisplay", bool, .{});
    }
    pub fn setIgnoreShadowsDisplay(self_: *@This(), ignoreShadowsDisplay_: bool) void {
        return objc.msgSend(self_, "setIgnoreShadowsDisplay:", void, .{ignoreShadowsDisplay_});
    }
    pub fn ignoreShadowsSingleWindow(self_: *@This()) bool {
        return objc.msgSend(self_, "ignoreShadowsSingleWindow", bool, .{});
    }
    pub fn setIgnoreShadowsSingleWindow(self_: *@This(), ignoreShadowsSingleWindow_: bool) void {
        return objc.msgSend(self_, "setIgnoreShadowsSingleWindow:", void, .{ignoreShadowsSingleWindow_});
    }
    pub fn captureResolution(self_: *@This()) SCCaptureResolutionType {
        return objc.msgSend(self_, "captureResolution", SCCaptureResolutionType, .{});
    }
    pub fn setCaptureResolution(self_: *@This(), captureResolution_: SCCaptureResolutionType) void {
        return objc.msgSend(self_, "setCaptureResolution:", void, .{captureResolution_});
    }
    pub fn capturesShadowsOnly(self_: *@This()) bool {
        return objc.msgSend(self_, "capturesShadowsOnly", bool, .{});
    }
    pub fn setCapturesShadowsOnly(self_: *@This(), capturesShadowsOnly_: bool) void {
        return objc.msgSend(self_, "setCapturesShadowsOnly:", void, .{capturesShadowsOnly_});
    }
    pub fn shouldBeOpaque(self_: *@This()) bool {
        return objc.msgSend(self_, "shouldBeOpaque", bool, .{});
    }
    pub fn setShouldBeOpaque(self_: *@This(), shouldBeOpaque_: bool) void {
        return objc.msgSend(self_, "setShouldBeOpaque:", void, .{shouldBeOpaque_});
    }
    pub fn ignoreGlobalClipDisplay(self_: *@This()) bool {
        return objc.msgSend(self_, "ignoreGlobalClipDisplay", bool, .{});
    }
    pub fn setIgnoreGlobalClipDisplay(self_: *@This(), ignoreGlobalClipDisplay_: bool) void {
        return objc.msgSend(self_, "setIgnoreGlobalClipDisplay:", void, .{ignoreGlobalClipDisplay_});
    }
    pub fn ignoreGlobalClipSingleWindow(self_: *@This()) bool {
        return objc.msgSend(self_, "ignoreGlobalClipSingleWindow", bool, .{});
    }
    pub fn setIgnoreGlobalClipSingleWindow(self_: *@This(), ignoreGlobalClipSingleWindow_: bool) void {
        return objc.msgSend(self_, "setIgnoreGlobalClipSingleWindow:", void, .{ignoreGlobalClipSingleWindow_});
    }
    pub fn presenterOverlayPrivacyAlertSetting(self_: *@This()) SCPresenterOverlayAlertSetting {
        return objc.msgSend(self_, "presenterOverlayPrivacyAlertSetting", SCPresenterOverlayAlertSetting, .{});
    }
    pub fn setPresenterOverlayPrivacyAlertSetting(self_: *@This(), presenterOverlayPrivacyAlertSetting_: SCPresenterOverlayAlertSetting) void {
        return objc.msgSend(self_, "setPresenterOverlayPrivacyAlertSetting:", void, .{presenterOverlayPrivacyAlertSetting_});
    }
    pub fn includeChildWindows(self_: *@This()) bool {
        return objc.msgSend(self_, "includeChildWindows", bool, .{});
    }
    pub fn setIncludeChildWindows(self_: *@This(), includeChildWindows_: bool) void {
        return objc.msgSend(self_, "setIncludeChildWindows:", void, .{includeChildWindows_});
    }
};

pub const SCStream = opaque {
    pub const InternalInfo = objc.ExternClass("SCStream", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithFilter_configuration_delegate(self_: *@This(), contentFilter_: *SCContentFilter, streamConfig_: *SCStreamConfiguration, delegate_: ?*SCStreamDelegate) *@This() {
        return objc.msgSend(self_, "initWithFilter:configuration:delegate:", *@This(), .{ contentFilter_, streamConfig_, delegate_ });
    }
    pub fn addStreamOutput_type_sampleHandlerQueue_error(self_: *@This(), output_: *SCStreamOutput, type_: SCStreamOutputType, sampleHandlerQueue_: dispatch_queue_t, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "addStreamOutput:type:sampleHandlerQueue:error:", bool, .{ output_, type_, sampleHandlerQueue_, error_ });
    }
    pub fn removeStreamOutput_type_error(self_: *@This(), output_: *SCStreamOutput, type_: SCStreamOutputType, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "removeStreamOutput:type:error:", bool, .{ output_, type_, error_ });
    }
    pub fn updateContentFilter_completionHandler(self_: *@This(), contentFilter_: *SCContentFilter, completionHandler_: *ns.Block(fn (?*ns.Error) void)) void {
        return objc.msgSend(self_, "updateContentFilter:completionHandler:", void, .{ contentFilter_, completionHandler_ });
    }
    pub fn updateConfiguration_completionHandler(self_: *@This(), streamConfig_: *SCStreamConfiguration, completionHandler_: *ns.Block(fn (?*ns.Error) void)) void {
        return objc.msgSend(self_, "updateConfiguration:completionHandler:", void, .{ streamConfig_, completionHandler_ });
    }
    pub fn startCaptureWithCompletionHandler(self_: *@This(), completionHandler_: *ns.Block(fn (?*ns.Error) void)) void {
        return objc.msgSend(self_, "startCaptureWithCompletionHandler:", void, .{completionHandler_});
    }
    pub fn stopCaptureWithCompletionHandler(self_: *@This(), completionHandler_: *ns.Block(fn (?*ns.Error) void)) void {
        return objc.msgSend(self_, "stopCaptureWithCompletionHandler:", void, .{completionHandler_});
    }
    pub fn synchronizationClock(self_: *@This()) CMClockRef {
        return objc.msgSend(self_, "synchronizationClock", CMClockRef, .{});
    }
};

pub const SCStreamOutput = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn stream_didOutputSampleBuffer_ofType(self_: *@This(), stream_: *SCStream, sampleBuffer_: CMSampleBufferRef, type_: SCStreamOutputType) void {
        return objc.msgSend(self_, "stream:didOutputSampleBuffer:ofType:", void, .{ stream_, sampleBuffer_, type_ });
    }
};

pub const SCStreamDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn stream_didStopWithError(self_: *@This(), stream_: *SCStream, error_: *ns.Error) void {
        return objc.msgSend(self_, "stream:didStopWithError:", void, .{ stream_, error_ });
    }
    pub fn outputVideoEffectDidStartForStream(self_: *@This(), stream_: *SCStream) void {
        return objc.msgSend(self_, "outputVideoEffectDidStartForStream:", void, .{stream_});
    }
    pub fn outputVideoEffectDidStopForStream(self_: *@This(), stream_: *SCStream) void {
        return objc.msgSend(self_, "outputVideoEffectDidStopForStream:", void, .{stream_});
    }
};

pub const SCRunningApplication = opaque {
    pub const InternalInfo = objc.ExternClass("SCRunningApplication", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn bundleIdentifier(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "bundleIdentifier", *ns.String, .{});
    }
    pub fn applicationName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "applicationName", *ns.String, .{});
    }
    pub fn processID(self_: *@This()) pid_t {
        return objc.msgSend(self_, "processID", pid_t, .{});
    }
};

pub const SCDisplay = opaque {
    pub const InternalInfo = objc.ExternClass("SCDisplay", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn displayID(self_: *@This()) cg.DirectDisplayID {
        return objc.msgSend(self_, "displayID", cg.DirectDisplayID, .{});
    }
    pub fn width(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "width", ns.Integer, .{});
    }
    pub fn height(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "height", ns.Integer, .{});
    }
    pub fn frame(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "frame", cg.Rect, .{});
    }
};

pub const SCWindow = opaque {
    pub const InternalInfo = objc.ExternClass("SCWindow", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn windowID(self_: *@This()) cg.WindowID {
        return objc.msgSend(self_, "windowID", cg.WindowID, .{});
    }
    pub fn frame(self_: *@This()) cg.Rect {
        return objc.msgSend(self_, "frame", cg.Rect, .{});
    }
    pub fn title(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "title", ?*ns.String, .{});
    }
    pub fn windowLayer(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "windowLayer", ns.Integer, .{});
    }
    pub fn owningApplication(self_: *@This()) ?*SCRunningApplication {
        return objc.msgSend(self_, "owningApplication", ?*SCRunningApplication, .{});
    }
    pub fn isOnScreen(self_: *@This()) bool {
        return objc.msgSend(self_, "isOnScreen", bool, .{});
    }
    pub fn isActive(self_: *@This()) bool {
        return objc.msgSend(self_, "isActive", bool, .{});
    }
};
