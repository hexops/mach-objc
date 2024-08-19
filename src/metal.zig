const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");

// ------------------------------------------------------------------------------------------------
// Opaque types

pub const dispatch_data_t = *opaque {};
pub const dispatch_queue_t = *opaque {};
pub const IOSurfaceRef = *opaque {};

// ------------------------------------------------------------------------------------------------
// Types

// MTLCounters.hpp
pub const CommonCounter = *ns.String;
pub const CommonCounterSet = *ns.String;

// MTLDevice.hpp
pub const DeviceNotificationName = *ns.String;
pub const AutoreleasedComputePipelineReflection = *ComputePipelineReflection;
pub const AutoreleasedRenderPipelineReflection = *RenderPipelineReflection;
pub const Timestamp = u64;

// MTLLibrary.hpp
pub const AutoreleasedArgument = *Argument;

// ------------------------------------------------------------------------------------------------
// Constants

// MTLCounters.hpp
extern const CounterErrorDomain: ns.ErrorDomain;

extern const CommonCounterTimestamp: CommonCounter;
extern const CommonCounterTessellationInputPatches: CommonCounter;
extern const CommonCounterVertexInvocations: CommonCounter;
extern const CommonCounterPostTessellationVertexInvocations: CommonCounter;
extern const CommonCounterClipperInvocations: CommonCounter;
extern const CommonCounterClipperPrimitivesOut: CommonCounter;
extern const CommonCounterFragmentInvocations: CommonCounter;
extern const CommonCounterFragmentsPassed: CommonCounter;
extern const CommonCounterComputeKernelInvocations: CommonCounter;
extern const CommonCounterTotalCycles: CommonCounter;
extern const CommonCounterVertexCycles: CommonCounter;
extern const CommonCounterTessellationCycles: CommonCounter;
extern const CommonCounterPostTessellationVertexCycles: CommonCounter;
extern const CommonCounterFragmentCycles: CommonCounter;
extern const CommonCounterRenderTargetWriteCycles: CommonCounter;

extern const CommonCounterSetTimestamp: CommonCounterSet;
extern const CommonCounterSetStageUtilization: CommonCounterSet;
extern const CommonCounterSetStatistic: CommonCounterSet;

// MTLDevice.hpp
extern const DeviceWasAddedNotification: DeviceNotificationName;
extern const DeviceRemovalRequestedNotification: DeviceNotificationName;
extern const DeviceWasRemovedNotification: DeviceNotificationName;

// ------------------------------------------------------------------------------------------------
// Functions

// MTLDevice.hpp
extern fn MTLCreateSystemDefaultDevice() ?*Device;
pub const createSystemDefaultDevice = MTLCreateSystemDefaultDevice;

//extern fn MTLCopyAllDevices() *ns.Array;
//extern fn MTLCopyAllDevicesWithObserver(**ns.Object, DeviceNotificationHandlerBlock) *ns.Array;
//extern fn MTLRemoveDeviceObserver(*ns.Object) void;

// ------------------------------------------------------------------------------------------------
// Structs

// MTLComputeCommandEncoder.hpp
pub const DispatchThreadgroupsIndirectArguments = extern struct {
    threadgroupsPerGrid: [3]u32,

    pub fn init(threadgroupsPerGrid: [3]u32) DispatchThreadgroupsIndirectArguments {
        return DispatchThreadgroupsIndirectArguments{ .threadgroupsPerGrid = threadgroupsPerGrid };
    }
};

pub const StageInRegionIndirectArguments = extern struct {
    stageInOrigin: [3]u32,
    stageInSize: [3]u32,

    pub fn init(stageInOrigin: [3]u32, stageInSize: [3]u32) StageInRegionIndirectArguments {
        return StageInRegionIndirectArguments{ .stageInOrigin = stageInOrigin, .stageInSize = stageInSize };
    }
};

// MTLRenderCommandEncoder.hpp
pub const ScissorRect = extern struct {
    x: ns.UInteger,
    y: ns.UInteger,
    width: ns.UInteger,
    height: ns.UInteger,

    pub fn init(x: ns.UInteger, y: ns.UInteger, width: ns.UInteger, height: ns.UInteger) ScissorRect {
        return ScissorRect{ .x = x, .y = y, .width = width, .height = height };
    }
};

pub const Viewport = extern struct {
    originX: f64,
    originY: f64,
    width: f64,
    height: f64,
    znear: f64,
    zfar: f64,

    pub fn init(originX: f64, originY: f64, width: f64, height: f64, znear: f64, zfar: f64) Viewport {
        return Viewport{ .originX = originX, .originY = originY, .width = width, .height = height, .znear = znear, .zfar = zfar };
    }
};

pub const VertexAmplificationViewMapping = extern struct {
    viewportArrayIndexOffset: u32,
    renderTargetArrayIndexOffset: u32,

    pub fn init(viewportArrayIndexOffset: u32, renderTargetArrayIndexOffset: u32) VertexAmplificationViewMapping {
        return VertexAmplificationViewMapping{ .viewportArrayIndexOffset = viewportArrayIndexOffset, .renderTargetArrayIndexOffset = renderTargetArrayIndexOffset };
    }
};

// MTLRenderPass.hpp
pub const ClearColor = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    alpha: f64,

    pub fn init(red: f64, green: f64, blue: f64, alpha: f64) ClearColor {
        return ClearColor{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

// MTLTexture.hpp
pub const TextureSwizzleChannels = extern struct {
    red: TextureSwizzle,
    green: TextureSwizzle,
    blue: TextureSwizzle,
    alpha: TextureSwizzle,

    pub fn init(red: TextureSwizzle, green: TextureSwizzle, blue: TextureSwizzle, alpha: TextureSwizzle) TextureSwizzleChannels {
        return TextureSwizzleChannels{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

// MTLTypes.hpp
pub const Origin = extern struct {
    x: ns.UInteger,
    y: ns.UInteger,
    z: ns.UInteger,

    pub fn init(x: ns.UInteger, y: ns.UInteger, z: ns.UInteger) Origin {
        return .{ .x = x, .y = y, .z = z };
    }
};

pub const Size = extern struct {
    width: ns.UInteger,
    height: ns.UInteger,
    depth: ns.UInteger,

    pub fn init(width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Size {
        return .{ .width = width, .height = height, .depth = depth };
    }
};

pub const Region = extern struct {
    origin: Origin,
    size: Size,

    pub fn init1d(x: ns.UInteger, width: ns.UInteger) Region {
        return .{ .origin = .{ .x = x, .y = 0, .z = 0 }, .size = .{ .width = width, .height = 1, .depth = 1 } };
    }

    pub fn init2d(x: ns.UInteger, y: ns.UInteger, width: ns.UInteger, height: ns.UInteger) Region {
        return .{ .origin = .{ .x = x, .y = y, .z = 0 }, .size = .{ .width = width, .height = height, .depth = 1 } };
    }

    pub fn init3d(x: ns.UInteger, y: ns.UInteger, z: ns.UInteger, width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Region {
        return .{ .origin = .{ .x = x, .y = y, .z = z }, .size = .{ .width = width, .height = height, .depth = depth } };
    }
};

pub const SamplePosition = extern struct {
    x: f32,
    y: f32,

    pub fn init(x: f32, y: f32) SamplePosition {
        return .{ .x = x, .y = y };
    }
};

pub const Coordinate2D = SamplePosition;

pub const ResourceID = extern struct {
    _impl: u64,
};

// MTLCounters.hpp
pub const CounterResultTimestamp = extern struct { timestamp: u64 };

pub const CounterResultStageUtilization = extern struct {
    totalCycles: u64,
    vertexCycles: u64,
    tessellationCycles: u64,
    postTessellationVertexCycles: u64,
    fragmentCycles: u64,
    renderTargetCycles: u64,
};

pub const CounterResultStatistic = extern struct {
    tessellationInputPatches: u64,
    vertexInvocations: u64,
    postTessellationVertexInvocations: u64,
    clipperInvocations: u64,
    clipperPrimitivesOut: u64,
    fragmentInvocations: u64,
    fragmentsPassed: u64,
    computeKernelInvocations: u64,
};

// MTLDevice.hpp
pub const AccelerationStructureSizes = extern struct {
    accelerationStructureSize: ns.UInteger,
    buildScratchBufferSize: ns.UInteger,
    refitScratchBufferSize: ns.UInteger,
};

pub const SizeAndAlign = extern struct {
    size: ns.UInteger,
    @"align": ns.UInteger,
};
// ------------------------------------------------------------------------------------------------

pub const AccelerationStructureUsage = ns.UInteger;
pub const AccelerationStructureUsageNone: AccelerationStructureUsage = 0;
pub const AccelerationStructureUsageRefit: AccelerationStructureUsage = 1;
pub const AccelerationStructureUsagePreferFastBuild: AccelerationStructureUsage = 2;
pub const AccelerationStructureUsageExtendedLimits: AccelerationStructureUsage = 4;

pub const AccelerationStructureInstanceOptions = u32;
pub const AccelerationStructureInstanceOptionNone: AccelerationStructureInstanceOptions = 0;
pub const AccelerationStructureInstanceOptionDisableTriangleCulling: AccelerationStructureInstanceOptions = 1;
pub const AccelerationStructureInstanceOptionTriangleFrontFacingWindingCounterClockwise: AccelerationStructureInstanceOptions = 2;
pub const AccelerationStructureInstanceOptionOpaque: AccelerationStructureInstanceOptions = 4;
pub const AccelerationStructureInstanceOptionNonOpaque: AccelerationStructureInstanceOptions = 8;

pub const MotionBorderMode = u32;
pub const MotionBorderModeClamp: MotionBorderMode = 0;
pub const MotionBorderModeVanish: MotionBorderMode = 1;

pub const AccelerationStructureInstanceDescriptorType = ns.UInteger;
pub const AccelerationStructureInstanceDescriptorTypeDefault: AccelerationStructureInstanceDescriptorType = 0;
pub const AccelerationStructureInstanceDescriptorTypeUserID: AccelerationStructureInstanceDescriptorType = 1;
pub const AccelerationStructureInstanceDescriptorTypeMotion: AccelerationStructureInstanceDescriptorType = 2;
pub const AccelerationStructureInstanceDescriptorTypeIndirect: AccelerationStructureInstanceDescriptorType = 3;
pub const AccelerationStructureInstanceDescriptorTypeIndirectMotion: AccelerationStructureInstanceDescriptorType = 4;

pub const AccelerationStructureRefitOptions = ns.UInteger;
pub const AccelerationStructureRefitOptionVertexData: AccelerationStructureRefitOptions = 1;
pub const AccelerationStructureRefitOptionPerPrimitiveData: AccelerationStructureRefitOptions = 2;

pub const DataType = ns.UInteger;
pub const DataTypeNone: DataType = 0;
pub const DataTypeStruct: DataType = 1;
pub const DataTypeArray: DataType = 2;
pub const DataTypeFloat: DataType = 3;
pub const DataTypeFloat2: DataType = 4;
pub const DataTypeFloat3: DataType = 5;
pub const DataTypeFloat4: DataType = 6;
pub const DataTypeFloat2x2: DataType = 7;
pub const DataTypeFloat2x3: DataType = 8;
pub const DataTypeFloat2x4: DataType = 9;
pub const DataTypeFloat3x2: DataType = 10;
pub const DataTypeFloat3x3: DataType = 11;
pub const DataTypeFloat3x4: DataType = 12;
pub const DataTypeFloat4x2: DataType = 13;
pub const DataTypeFloat4x3: DataType = 14;
pub const DataTypeFloat4x4: DataType = 15;
pub const DataTypeHalf: DataType = 16;
pub const DataTypeHalf2: DataType = 17;
pub const DataTypeHalf3: DataType = 18;
pub const DataTypeHalf4: DataType = 19;
pub const DataTypeHalf2x2: DataType = 20;
pub const DataTypeHalf2x3: DataType = 21;
pub const DataTypeHalf2x4: DataType = 22;
pub const DataTypeHalf3x2: DataType = 23;
pub const DataTypeHalf3x3: DataType = 24;
pub const DataTypeHalf3x4: DataType = 25;
pub const DataTypeHalf4x2: DataType = 26;
pub const DataTypeHalf4x3: DataType = 27;
pub const DataTypeHalf4x4: DataType = 28;
pub const DataTypeInt: DataType = 29;
pub const DataTypeInt2: DataType = 30;
pub const DataTypeInt3: DataType = 31;
pub const DataTypeInt4: DataType = 32;
pub const DataTypeUInt: DataType = 33;
pub const DataTypeUInt2: DataType = 34;
pub const DataTypeUInt3: DataType = 35;
pub const DataTypeUInt4: DataType = 36;
pub const DataTypeShort: DataType = 37;
pub const DataTypeShort2: DataType = 38;
pub const DataTypeShort3: DataType = 39;
pub const DataTypeShort4: DataType = 40;
pub const DataTypeUShort: DataType = 41;
pub const DataTypeUShort2: DataType = 42;
pub const DataTypeUShort3: DataType = 43;
pub const DataTypeUShort4: DataType = 44;
pub const DataTypeChar: DataType = 45;
pub const DataTypeChar2: DataType = 46;
pub const DataTypeChar3: DataType = 47;
pub const DataTypeChar4: DataType = 48;
pub const DataTypeUChar: DataType = 49;
pub const DataTypeUChar2: DataType = 50;
pub const DataTypeUChar3: DataType = 51;
pub const DataTypeUChar4: DataType = 52;
pub const DataTypeBool: DataType = 53;
pub const DataTypeBool2: DataType = 54;
pub const DataTypeBool3: DataType = 55;
pub const DataTypeBool4: DataType = 56;
pub const DataTypeTexture: DataType = 58;
pub const DataTypeSampler: DataType = 59;
pub const DataTypePointer: DataType = 60;
pub const DataTypeR8Unorm: DataType = 62;
pub const DataTypeR8Snorm: DataType = 63;
pub const DataTypeR16Unorm: DataType = 64;
pub const DataTypeR16Snorm: DataType = 65;
pub const DataTypeRG8Unorm: DataType = 66;
pub const DataTypeRG8Snorm: DataType = 67;
pub const DataTypeRG16Unorm: DataType = 68;
pub const DataTypeRG16Snorm: DataType = 69;
pub const DataTypeRGBA8Unorm: DataType = 70;
pub const DataTypeRGBA8Unorm_sRGB: DataType = 71;
pub const DataTypeRGBA8Snorm: DataType = 72;
pub const DataTypeRGBA16Unorm: DataType = 73;
pub const DataTypeRGBA16Snorm: DataType = 74;
pub const DataTypeRGB10A2Unorm: DataType = 75;
pub const DataTypeRG11B10Float: DataType = 76;
pub const DataTypeRGB9E5Float: DataType = 77;
pub const DataTypeRenderPipeline: DataType = 78;
pub const DataTypeComputePipeline: DataType = 79;
pub const DataTypeIndirectCommandBuffer: DataType = 80;
pub const DataTypeLong: DataType = 81;
pub const DataTypeLong2: DataType = 82;
pub const DataTypeLong3: DataType = 83;
pub const DataTypeLong4: DataType = 84;
pub const DataTypeULong: DataType = 85;
pub const DataTypeULong2: DataType = 86;
pub const DataTypeULong3: DataType = 87;
pub const DataTypeULong4: DataType = 88;
pub const DataTypeVisibleFunctionTable: DataType = 115;
pub const DataTypeIntersectionFunctionTable: DataType = 116;
pub const DataTypePrimitiveAccelerationStructure: DataType = 117;
pub const DataTypeInstanceAccelerationStructure: DataType = 118;
pub const DataTypeBFloat: DataType = 121;
pub const DataTypeBFloat2: DataType = 122;
pub const DataTypeBFloat3: DataType = 123;
pub const DataTypeBFloat4: DataType = 124;

pub const BindingType = ns.Integer;
pub const BindingTypeBuffer: BindingType = 0;
pub const BindingTypeThreadgroupMemory: BindingType = 1;
pub const BindingTypeTexture: BindingType = 2;
pub const BindingTypeSampler: BindingType = 3;
pub const BindingTypeImageblockData: BindingType = 16;
pub const BindingTypeImageblock: BindingType = 17;
pub const BindingTypeVisibleFunctionTable: BindingType = 24;
pub const BindingTypePrimitiveAccelerationStructure: BindingType = 25;
pub const BindingTypeInstanceAccelerationStructure: BindingType = 26;
pub const BindingTypeIntersectionFunctionTable: BindingType = 27;
pub const BindingTypeObjectPayload: BindingType = 34;

pub const ArgumentType = ns.UInteger;
pub const ArgumentTypeBuffer: ArgumentType = 0;
pub const ArgumentTypeThreadgroupMemory: ArgumentType = 1;
pub const ArgumentTypeTexture: ArgumentType = 2;
pub const ArgumentTypeSampler: ArgumentType = 3;
pub const ArgumentTypeImageblockData: ArgumentType = 16;
pub const ArgumentTypeImageblock: ArgumentType = 17;
pub const ArgumentTypeVisibleFunctionTable: ArgumentType = 24;
pub const ArgumentTypePrimitiveAccelerationStructure: ArgumentType = 25;
pub const ArgumentTypeInstanceAccelerationStructure: ArgumentType = 26;
pub const ArgumentTypeIntersectionFunctionTable: ArgumentType = 27;

pub const BindingAccess = ns.UInteger;
pub const BindingAccessReadOnly: BindingAccess = 0;
pub const BindingAccessReadWrite: BindingAccess = 1;
pub const BindingAccessWriteOnly: BindingAccess = 2;
pub const ArgumentAccessReadOnly: BindingAccess = 0;
pub const ArgumentAccessReadWrite: BindingAccess = 1;
pub const ArgumentAccessWriteOnly: BindingAccess = 2;

pub const BinaryArchiveError = ns.UInteger;
pub const BinaryArchiveErrorNone: BinaryArchiveError = 0;
pub const BinaryArchiveErrorInvalidFile: BinaryArchiveError = 1;
pub const BinaryArchiveErrorUnexpectedElement: BinaryArchiveError = 2;
pub const BinaryArchiveErrorCompilationFailure: BinaryArchiveError = 3;
pub const BinaryArchiveErrorInternalError: BinaryArchiveError = 4;

pub const BlitOption = ns.UInteger;
pub const BlitOptionNone: BlitOption = 0;
pub const BlitOptionDepthFromDepthStencil: BlitOption = 1;
pub const BlitOptionStencilFromDepthStencil: BlitOption = 2;
pub const BlitOptionRowLinearPVRTC: BlitOption = 4;

pub const CaptureError = ns.Integer;
pub const CaptureErrorNotSupported: CaptureError = 1;
pub const CaptureErrorAlreadyCapturing: CaptureError = 0;
pub const CaptureErrorInvalidDescriptor: CaptureError = 0;

pub const CaptureDestination = ns.Integer;
pub const CaptureDestinationDeveloperTools: CaptureDestination = 1;
pub const CaptureDestinationGPUTraceDocument: CaptureDestination = 0;

pub const CommandBufferStatus = ns.UInteger;
pub const CommandBufferStatusNotEnqueued: CommandBufferStatus = 0;
pub const CommandBufferStatusEnqueued: CommandBufferStatus = 1;
pub const CommandBufferStatusCommitted: CommandBufferStatus = 2;
pub const CommandBufferStatusScheduled: CommandBufferStatus = 3;
pub const CommandBufferStatusCompleted: CommandBufferStatus = 4;
pub const CommandBufferStatusError: CommandBufferStatus = 5;

pub const CommandBufferError = ns.UInteger;
pub const CommandBufferErrorNone: CommandBufferError = 0;
pub const CommandBufferErrorInternal: CommandBufferError = 1;
pub const CommandBufferErrorTimeout: CommandBufferError = 2;
pub const CommandBufferErrorPageFault: CommandBufferError = 3;
pub const CommandBufferErrorBlacklisted: CommandBufferError = 4;
pub const CommandBufferErrorAccessRevoked: CommandBufferError = 4;
pub const CommandBufferErrorNotPermitted: CommandBufferError = 7;
pub const CommandBufferErrorOutOfMemory: CommandBufferError = 8;
pub const CommandBufferErrorInvalidResource: CommandBufferError = 9;
pub const CommandBufferErrorMemoryless: CommandBufferError = 10;
pub const CommandBufferErrorDeviceRemoved: CommandBufferError = 11;
pub const CommandBufferErrorStackOverflow: CommandBufferError = 12;

pub const CommandBufferErrorOption = ns.UInteger;
pub const CommandBufferErrorOptionNone: CommandBufferErrorOption = 0;
pub const CommandBufferErrorOptionEncoderExecutionStatus: CommandBufferErrorOption = 1;

pub const CommandEncoderErrorState = ns.Integer;
pub const CommandEncoderErrorStateUnknown: CommandEncoderErrorState = 0;
pub const CommandEncoderErrorStateCompleted: CommandEncoderErrorState = 1;
pub const CommandEncoderErrorStateAffected: CommandEncoderErrorState = 2;
pub const CommandEncoderErrorStatePending: CommandEncoderErrorState = 3;
pub const CommandEncoderErrorStateFaulted: CommandEncoderErrorState = 4;

pub const DispatchType = ns.UInteger;
pub const DispatchTypeSerial: DispatchType = 0;
pub const DispatchTypeConcurrent: DispatchType = 0;

pub const ResourceUsage = ns.UInteger;
pub const ResourceUsageRead: ResourceUsage = 1;
pub const ResourceUsageWrite: ResourceUsage = 2;
pub const ResourceUsageSample: ResourceUsage = 4;

pub const BarrierScope = ns.UInteger;
pub const BarrierScopeBuffers: BarrierScope = 1;
pub const BarrierScopeTextures: BarrierScope = 2;
pub const BarrierScopeRenderTargets: BarrierScope = 4;

pub const CounterSampleBufferError = ns.Integer;
pub const CounterSampleBufferErrorOutOfMemory: CounterSampleBufferError = 0;
pub const CounterSampleBufferErrorInvalid: CounterSampleBufferError = 0;
pub const CounterSampleBufferErrorInternal: CounterSampleBufferError = 0;

pub const CompareFunction = ns.UInteger;
pub const CompareFunctionNever: CompareFunction = 0;
pub const CompareFunctionLess: CompareFunction = 1;
pub const CompareFunctionEqual: CompareFunction = 2;
pub const CompareFunctionLessEqual: CompareFunction = 3;
pub const CompareFunctionGreater: CompareFunction = 4;
pub const CompareFunctionNotEqual: CompareFunction = 5;
pub const CompareFunctionGreaterEqual: CompareFunction = 6;
pub const CompareFunctionAlways: CompareFunction = 7;

pub const StencilOperation = ns.UInteger;
pub const StencilOperationKeep: StencilOperation = 0;
pub const StencilOperationZero: StencilOperation = 1;
pub const StencilOperationReplace: StencilOperation = 2;
pub const StencilOperationIncrementClamp: StencilOperation = 3;
pub const StencilOperationDecrementClamp: StencilOperation = 4;
pub const StencilOperationInvert: StencilOperation = 5;
pub const StencilOperationIncrementWrap: StencilOperation = 6;
pub const StencilOperationDecrementWrap: StencilOperation = 7;

pub const IOCompressionMethod = ns.Integer;
pub const IOCompressionMethodZlib: IOCompressionMethod = 0;
pub const IOCompressionMethodLZFSE: IOCompressionMethod = 1;
pub const IOCompressionMethodLZ4: IOCompressionMethod = 2;
pub const IOCompressionMethodLZMA: IOCompressionMethod = 3;
pub const IOCompressionMethodLZBitmap: IOCompressionMethod = 4;

pub const FeatureSet = ns.UInteger;
pub const FeatureSet_iOS_GPUFamily1_v1: FeatureSet = 0;
pub const FeatureSet_iOS_GPUFamily2_v1: FeatureSet = 1;
pub const FeatureSet_iOS_GPUFamily1_v2: FeatureSet = 2;
pub const FeatureSet_iOS_GPUFamily2_v2: FeatureSet = 3;
pub const FeatureSet_iOS_GPUFamily3_v1: FeatureSet = 4;
pub const FeatureSet_iOS_GPUFamily1_v3: FeatureSet = 5;
pub const FeatureSet_iOS_GPUFamily2_v3: FeatureSet = 6;
pub const FeatureSet_iOS_GPUFamily3_v2: FeatureSet = 7;
pub const FeatureSet_iOS_GPUFamily1_v4: FeatureSet = 8;
pub const FeatureSet_iOS_GPUFamily2_v4: FeatureSet = 9;
pub const FeatureSet_iOS_GPUFamily3_v3: FeatureSet = 10;
pub const FeatureSet_iOS_GPUFamily4_v1: FeatureSet = 11;
pub const FeatureSet_iOS_GPUFamily1_v5: FeatureSet = 12;
pub const FeatureSet_iOS_GPUFamily2_v5: FeatureSet = 13;
pub const FeatureSet_iOS_GPUFamily3_v4: FeatureSet = 14;
pub const FeatureSet_iOS_GPUFamily4_v2: FeatureSet = 15;
pub const FeatureSet_iOS_GPUFamily5_v1: FeatureSet = 16;
pub const FeatureSet_macOS_GPUFamily1_v1: FeatureSet = 10000;
pub const FeatureSet_OSX_GPUFamily1_v1: FeatureSet = 10000;
pub const FeatureSet_macOS_GPUFamily1_v2: FeatureSet = 10001;
pub const FeatureSet_OSX_GPUFamily1_v2: FeatureSet = 10001;
pub const FeatureSet_macOS_ReadWriteTextureTier2: FeatureSet = 10002;
pub const FeatureSet_OSX_ReadWriteTextureTier2: FeatureSet = 10002;
pub const FeatureSet_macOS_GPUFamily1_v3: FeatureSet = 10003;
pub const FeatureSet_macOS_GPUFamily1_v4: FeatureSet = 10004;
pub const FeatureSet_macOS_GPUFamily2_v1: FeatureSet = 10005;
pub const FeatureSet_tvOS_GPUFamily1_v1: FeatureSet = 30000;
pub const FeatureSet_TVOS_GPUFamily1_v1: FeatureSet = 30000;
pub const FeatureSet_tvOS_GPUFamily1_v2: FeatureSet = 30001;
pub const FeatureSet_tvOS_GPUFamily1_v3: FeatureSet = 30002;
pub const FeatureSet_tvOS_GPUFamily2_v1: FeatureSet = 30003;
pub const FeatureSet_tvOS_GPUFamily1_v4: FeatureSet = 30004;
pub const FeatureSet_tvOS_GPUFamily2_v2: FeatureSet = 30005;

pub const GPUFamily = ns.Integer;
pub const GPUFamilyApple1: GPUFamily = 1001;
pub const GPUFamilyApple2: GPUFamily = 1002;
pub const GPUFamilyApple3: GPUFamily = 1003;
pub const GPUFamilyApple4: GPUFamily = 1004;
pub const GPUFamilyApple5: GPUFamily = 1005;
pub const GPUFamilyApple6: GPUFamily = 1006;
pub const GPUFamilyApple7: GPUFamily = 1007;
pub const GPUFamilyApple8: GPUFamily = 1008;
pub const GPUFamilyApple9: GPUFamily = 1009;
pub const GPUFamilyMac1: GPUFamily = 2001;
pub const GPUFamilyMac2: GPUFamily = 2002;
pub const GPUFamilyCommon1: GPUFamily = 3001;
pub const GPUFamilyCommon2: GPUFamily = 3002;
pub const GPUFamilyCommon3: GPUFamily = 3003;
pub const GPUFamilyMacCatalyst1: GPUFamily = 4001;
pub const GPUFamilyMacCatalyst2: GPUFamily = 4002;
pub const GPUFamilyMetal3: GPUFamily = 5001;

pub const DeviceLocation = ns.UInteger;
pub const DeviceLocationBuiltIn: DeviceLocation = 0;
pub const DeviceLocationSlot: DeviceLocation = 1;
pub const DeviceLocationExternal: DeviceLocation = 2;
pub const DeviceLocationUnspecified: DeviceLocation = 0;

pub const PipelineOption = ns.UInteger;
pub const PipelineOptionNone: PipelineOption = 0;
pub const PipelineOptionArgumentInfo: PipelineOption = 1;
pub const PipelineOptionBufferTypeInfo: PipelineOption = 2;
pub const PipelineOptionFailOnBinaryArchiveMiss: PipelineOption = 4;

pub const ReadWriteTextureTier = ns.UInteger;
pub const ReadWriteTextureTierNone: ReadWriteTextureTier = 0;
pub const ReadWriteTextureTier1: ReadWriteTextureTier = 1;
pub const ReadWriteTextureTier2: ReadWriteTextureTier = 2;

pub const ArgumentBuffersTier = ns.UInteger;
pub const ArgumentBuffersTier1: ArgumentBuffersTier = 0;
pub const ArgumentBuffersTier2: ArgumentBuffersTier = 1;

pub const SparseTextureRegionAlignmentMode = ns.UInteger;
pub const SparseTextureRegionAlignmentModeOutward: SparseTextureRegionAlignmentMode = 0;
pub const SparseTextureRegionAlignmentModeInward: SparseTextureRegionAlignmentMode = 1;

pub const SparsePageSize = ns.Integer;
pub const SparsePageSize16: SparsePageSize = 101;
pub const SparsePageSize64: SparsePageSize = 102;
pub const SparsePageSize256: SparsePageSize = 103;

pub const CounterSamplingPoint = ns.UInteger;
pub const CounterSamplingPointAtStageBoundary: CounterSamplingPoint = 0;
pub const CounterSamplingPointAtDrawBoundary: CounterSamplingPoint = 0;
pub const CounterSamplingPointAtDispatchBoundary: CounterSamplingPoint = 0;
pub const CounterSamplingPointAtTileDispatchBoundary: CounterSamplingPoint = 0;
pub const CounterSamplingPointAtBlitBoundary: CounterSamplingPoint = 0;

pub const DynamicLibraryError = ns.UInteger;
pub const DynamicLibraryErrorNone: DynamicLibraryError = 0;
pub const DynamicLibraryErrorInvalidFile: DynamicLibraryError = 1;
pub const DynamicLibraryErrorCompilationFailure: DynamicLibraryError = 2;
pub const DynamicLibraryErrorUnresolvedInstallName: DynamicLibraryError = 3;
pub const DynamicLibraryErrorDependencyLoadFailure: DynamicLibraryError = 4;
pub const DynamicLibraryErrorUnsupported: DynamicLibraryError = 5;

pub const FunctionOptions = ns.UInteger;
pub const FunctionOptionNone: FunctionOptions = 0;
pub const FunctionOptionCompileToBinary: FunctionOptions = 1;
pub const FunctionOptionStoreFunctionInMetalScript: FunctionOptions = 2;

pub const FunctionLogType = ns.UInteger;
pub const FunctionLogTypeValidation: FunctionLogType = 0;

pub const HeapType = ns.Integer;
pub const HeapTypeAutomatic: HeapType = 0;
pub const HeapTypePlacement: HeapType = 1;
pub const HeapTypeSparse: HeapType = 2;

pub const IndirectCommandType = ns.UInteger;
pub const IndirectCommandTypeDraw: IndirectCommandType = 1;
pub const IndirectCommandTypeDrawIndexed: IndirectCommandType = 2;
pub const IndirectCommandTypeDrawPatches: IndirectCommandType = 4;
pub const IndirectCommandTypeDrawIndexedPatches: IndirectCommandType = 8;
pub const IndirectCommandTypeConcurrentDispatch: IndirectCommandType = 32;
pub const IndirectCommandTypeConcurrentDispatchThreads: IndirectCommandType = 64;
pub const IndirectCommandTypeDrawMeshThreadgroups: IndirectCommandType = 128;
pub const IndirectCommandTypeDrawMeshThreads: IndirectCommandType = 256;

pub const IntersectionFunctionSignature = ns.UInteger;
pub const IntersectionFunctionSignatureNone: IntersectionFunctionSignature = 0;
pub const IntersectionFunctionSignatureInstancing: IntersectionFunctionSignature = 1;
pub const IntersectionFunctionSignatureTriangleData: IntersectionFunctionSignature = 2;
pub const IntersectionFunctionSignatureWorldSpaceData: IntersectionFunctionSignature = 4;
pub const IntersectionFunctionSignatureInstanceMotion: IntersectionFunctionSignature = 8;
pub const IntersectionFunctionSignaturePrimitiveMotion: IntersectionFunctionSignature = 16;
pub const IntersectionFunctionSignatureExtendedLimits: IntersectionFunctionSignature = 32;
pub const IntersectionFunctionSignatureMaxLevels: IntersectionFunctionSignature = 64;
pub const IntersectionFunctionSignatureCurveData: IntersectionFunctionSignature = 128;

pub const IOStatus = ns.Integer;
pub const IOStatusPending: IOStatus = 0;
pub const IOStatusCancelled: IOStatus = 1;
pub const IOStatusError: IOStatus = 2;
pub const IOStatusComplete: IOStatus = 3;

pub const IOPriority = ns.Integer;
pub const IOPriorityHigh: IOPriority = 0;
pub const IOPriorityNormal: IOPriority = 1;
pub const IOPriorityLow: IOPriority = 2;

pub const IOCommandQueueType = ns.Integer;
pub const IOCommandQueueTypeConcurrent: IOCommandQueueType = 0;
pub const IOCommandQueueTypeSerial: IOCommandQueueType = 1;

pub const IOError = ns.Integer;
pub const IOErrorURLInvalid: IOError = 1;
pub const IOErrorInternal: IOError = 2;

pub const PatchType = ns.UInteger;
pub const PatchTypeNone: PatchType = 0;
pub const PatchTypeTriangle: PatchType = 1;
pub const PatchTypeQuad: PatchType = 2;

pub const FunctionType = ns.UInteger;
pub const FunctionTypeVertex: FunctionType = 1;
pub const FunctionTypeFragment: FunctionType = 2;
pub const FunctionTypeKernel: FunctionType = 3;
pub const FunctionTypeVisible: FunctionType = 5;
pub const FunctionTypeIntersection: FunctionType = 6;
pub const FunctionTypeMesh: FunctionType = 7;
pub const FunctionTypeObject: FunctionType = 8;

pub const LanguageVersion = ns.UInteger;
pub const LanguageVersion1_0: LanguageVersion = 65536;
pub const LanguageVersion1_1: LanguageVersion = 65537;
pub const LanguageVersion1_2: LanguageVersion = 65538;
pub const LanguageVersion2_0: LanguageVersion = 131072;
pub const LanguageVersion2_1: LanguageVersion = 131073;
pub const LanguageVersion2_2: LanguageVersion = 131074;
pub const LanguageVersion2_3: LanguageVersion = 131075;
pub const LanguageVersion2_4: LanguageVersion = 131076;
pub const LanguageVersion3_0: LanguageVersion = 196608;
pub const LanguageVersion3_1: LanguageVersion = 196609;

pub const LibraryType = ns.Integer;
pub const LibraryTypeExecutable: LibraryType = 0;
pub const LibraryTypeDynamic: LibraryType = 1;

pub const LibraryOptimizationLevel = ns.Integer;
pub const LibraryOptimizationLevelDefault: LibraryOptimizationLevel = 0;
pub const LibraryOptimizationLevelSize: LibraryOptimizationLevel = 1;

pub const CompileSymbolVisibility = ns.Integer;
pub const CompileSymbolVisibilityDefault: CompileSymbolVisibility = 0;
pub const CompileSymbolVisibilityHidden: CompileSymbolVisibility = 1;

pub const LibraryError = ns.UInteger;
pub const LibraryErrorUnsupported: LibraryError = 1;
pub const LibraryErrorInternal: LibraryError = 2;
pub const LibraryErrorCompileFailure: LibraryError = 3;
pub const LibraryErrorCompileWarning: LibraryError = 4;
pub const LibraryErrorFunctionNotFound: LibraryError = 5;
pub const LibraryErrorFileNotFound: LibraryError = 6;

pub const Mutability = ns.UInteger;
pub const MutabilityDefault: Mutability = 0;
pub const MutabilityMutable: Mutability = 1;
pub const MutabilityImmutable: Mutability = 2;

pub const PixelFormat = ns.UInteger;
pub const PixelFormatInvalid: PixelFormat = 0;
pub const PixelFormatA8Unorm: PixelFormat = 1;
pub const PixelFormatR8Unorm: PixelFormat = 10;
pub const PixelFormatR8Unorm_sRGB: PixelFormat = 11;
pub const PixelFormatR8Snorm: PixelFormat = 12;
pub const PixelFormatR8Uint: PixelFormat = 13;
pub const PixelFormatR8Sint: PixelFormat = 14;
pub const PixelFormatR16Unorm: PixelFormat = 20;
pub const PixelFormatR16Snorm: PixelFormat = 22;
pub const PixelFormatR16Uint: PixelFormat = 23;
pub const PixelFormatR16Sint: PixelFormat = 24;
pub const PixelFormatR16Float: PixelFormat = 25;
pub const PixelFormatRG8Unorm: PixelFormat = 30;
pub const PixelFormatRG8Unorm_sRGB: PixelFormat = 31;
pub const PixelFormatRG8Snorm: PixelFormat = 32;
pub const PixelFormatRG8Uint: PixelFormat = 33;
pub const PixelFormatRG8Sint: PixelFormat = 34;
pub const PixelFormatB5G6R5Unorm: PixelFormat = 40;
pub const PixelFormatA1BGR5Unorm: PixelFormat = 41;
pub const PixelFormatABGR4Unorm: PixelFormat = 42;
pub const PixelFormatBGR5A1Unorm: PixelFormat = 43;
pub const PixelFormatR32Uint: PixelFormat = 53;
pub const PixelFormatR32Sint: PixelFormat = 54;
pub const PixelFormatR32Float: PixelFormat = 55;
pub const PixelFormatRG16Unorm: PixelFormat = 60;
pub const PixelFormatRG16Snorm: PixelFormat = 62;
pub const PixelFormatRG16Uint: PixelFormat = 63;
pub const PixelFormatRG16Sint: PixelFormat = 64;
pub const PixelFormatRG16Float: PixelFormat = 65;
pub const PixelFormatRGBA8Unorm: PixelFormat = 70;
pub const PixelFormatRGBA8Unorm_sRGB: PixelFormat = 71;
pub const PixelFormatRGBA8Snorm: PixelFormat = 72;
pub const PixelFormatRGBA8Uint: PixelFormat = 73;
pub const PixelFormatRGBA8Sint: PixelFormat = 74;
pub const PixelFormatBGRA8Unorm: PixelFormat = 80;
pub const PixelFormatBGRA8Unorm_sRGB: PixelFormat = 81;
pub const PixelFormatRGB10A2Unorm: PixelFormat = 90;
pub const PixelFormatRGB10A2Uint: PixelFormat = 91;
pub const PixelFormatRG11B10Float: PixelFormat = 92;
pub const PixelFormatRGB9E5Float: PixelFormat = 93;
pub const PixelFormatBGR10A2Unorm: PixelFormat = 94;
pub const PixelFormatBGR10_XR: PixelFormat = 554;
pub const PixelFormatBGR10_XR_sRGB: PixelFormat = 555;
pub const PixelFormatRG32Uint: PixelFormat = 103;
pub const PixelFormatRG32Sint: PixelFormat = 104;
pub const PixelFormatRG32Float: PixelFormat = 105;
pub const PixelFormatRGBA16Unorm: PixelFormat = 110;
pub const PixelFormatRGBA16Snorm: PixelFormat = 112;
pub const PixelFormatRGBA16Uint: PixelFormat = 113;
pub const PixelFormatRGBA16Sint: PixelFormat = 114;
pub const PixelFormatRGBA16Float: PixelFormat = 115;
pub const PixelFormatBGRA10_XR: PixelFormat = 552;
pub const PixelFormatBGRA10_XR_sRGB: PixelFormat = 553;
pub const PixelFormatRGBA32Uint: PixelFormat = 123;
pub const PixelFormatRGBA32Sint: PixelFormat = 124;
pub const PixelFormatRGBA32Float: PixelFormat = 125;
pub const PixelFormatBC1_RGBA: PixelFormat = 130;
pub const PixelFormatBC1_RGBA_sRGB: PixelFormat = 131;
pub const PixelFormatBC2_RGBA: PixelFormat = 132;
pub const PixelFormatBC2_RGBA_sRGB: PixelFormat = 133;
pub const PixelFormatBC3_RGBA: PixelFormat = 134;
pub const PixelFormatBC3_RGBA_sRGB: PixelFormat = 135;
pub const PixelFormatBC4_RUnorm: PixelFormat = 140;
pub const PixelFormatBC4_RSnorm: PixelFormat = 141;
pub const PixelFormatBC5_RGUnorm: PixelFormat = 142;
pub const PixelFormatBC5_RGSnorm: PixelFormat = 143;
pub const PixelFormatBC6H_RGBFloat: PixelFormat = 150;
pub const PixelFormatBC6H_RGBUfloat: PixelFormat = 151;
pub const PixelFormatBC7_RGBAUnorm: PixelFormat = 152;
pub const PixelFormatBC7_RGBAUnorm_sRGB: PixelFormat = 153;
pub const PixelFormatPVRTC_RGB_2BPP: PixelFormat = 160;
pub const PixelFormatPVRTC_RGB_2BPP_sRGB: PixelFormat = 161;
pub const PixelFormatPVRTC_RGB_4BPP: PixelFormat = 162;
pub const PixelFormatPVRTC_RGB_4BPP_sRGB: PixelFormat = 163;
pub const PixelFormatPVRTC_RGBA_2BPP: PixelFormat = 164;
pub const PixelFormatPVRTC_RGBA_2BPP_sRGB: PixelFormat = 165;
pub const PixelFormatPVRTC_RGBA_4BPP: PixelFormat = 166;
pub const PixelFormatPVRTC_RGBA_4BPP_sRGB: PixelFormat = 167;
pub const PixelFormatEAC_R11Unorm: PixelFormat = 170;
pub const PixelFormatEAC_R11Snorm: PixelFormat = 172;
pub const PixelFormatEAC_RG11Unorm: PixelFormat = 174;
pub const PixelFormatEAC_RG11Snorm: PixelFormat = 176;
pub const PixelFormatEAC_RGBA8: PixelFormat = 178;
pub const PixelFormatEAC_RGBA8_sRGB: PixelFormat = 179;
pub const PixelFormatETC2_RGB8: PixelFormat = 180;
pub const PixelFormatETC2_RGB8_sRGB: PixelFormat = 181;
pub const PixelFormatETC2_RGB8A1: PixelFormat = 182;
pub const PixelFormatETC2_RGB8A1_sRGB: PixelFormat = 183;
pub const PixelFormatASTC_4x4_sRGB: PixelFormat = 186;
pub const PixelFormatASTC_5x4_sRGB: PixelFormat = 187;
pub const PixelFormatASTC_5x5_sRGB: PixelFormat = 188;
pub const PixelFormatASTC_6x5_sRGB: PixelFormat = 189;
pub const PixelFormatASTC_6x6_sRGB: PixelFormat = 190;
pub const PixelFormatASTC_8x5_sRGB: PixelFormat = 192;
pub const PixelFormatASTC_8x6_sRGB: PixelFormat = 193;
pub const PixelFormatASTC_8x8_sRGB: PixelFormat = 194;
pub const PixelFormatASTC_10x5_sRGB: PixelFormat = 195;
pub const PixelFormatASTC_10x6_sRGB: PixelFormat = 196;
pub const PixelFormatASTC_10x8_sRGB: PixelFormat = 197;
pub const PixelFormatASTC_10x10_sRGB: PixelFormat = 198;
pub const PixelFormatASTC_12x10_sRGB: PixelFormat = 199;
pub const PixelFormatASTC_12x12_sRGB: PixelFormat = 200;
pub const PixelFormatASTC_4x4_LDR: PixelFormat = 204;
pub const PixelFormatASTC_5x4_LDR: PixelFormat = 205;
pub const PixelFormatASTC_5x5_LDR: PixelFormat = 206;
pub const PixelFormatASTC_6x5_LDR: PixelFormat = 207;
pub const PixelFormatASTC_6x6_LDR: PixelFormat = 208;
pub const PixelFormatASTC_8x5_LDR: PixelFormat = 210;
pub const PixelFormatASTC_8x6_LDR: PixelFormat = 211;
pub const PixelFormatASTC_8x8_LDR: PixelFormat = 212;
pub const PixelFormatASTC_10x5_LDR: PixelFormat = 213;
pub const PixelFormatASTC_10x6_LDR: PixelFormat = 214;
pub const PixelFormatASTC_10x8_LDR: PixelFormat = 215;
pub const PixelFormatASTC_10x10_LDR: PixelFormat = 216;
pub const PixelFormatASTC_12x10_LDR: PixelFormat = 217;
pub const PixelFormatASTC_12x12_LDR: PixelFormat = 218;
pub const PixelFormatASTC_4x4_HDR: PixelFormat = 222;
pub const PixelFormatASTC_5x4_HDR: PixelFormat = 223;
pub const PixelFormatASTC_5x5_HDR: PixelFormat = 224;
pub const PixelFormatASTC_6x5_HDR: PixelFormat = 225;
pub const PixelFormatASTC_6x6_HDR: PixelFormat = 226;
pub const PixelFormatASTC_8x5_HDR: PixelFormat = 228;
pub const PixelFormatASTC_8x6_HDR: PixelFormat = 229;
pub const PixelFormatASTC_8x8_HDR: PixelFormat = 230;
pub const PixelFormatASTC_10x5_HDR: PixelFormat = 231;
pub const PixelFormatASTC_10x6_HDR: PixelFormat = 232;
pub const PixelFormatASTC_10x8_HDR: PixelFormat = 233;
pub const PixelFormatASTC_10x10_HDR: PixelFormat = 234;
pub const PixelFormatASTC_12x10_HDR: PixelFormat = 235;
pub const PixelFormatASTC_12x12_HDR: PixelFormat = 236;
pub const PixelFormatGBGR422: PixelFormat = 240;
pub const PixelFormatBGRG422: PixelFormat = 241;
pub const PixelFormatDepth16Unorm: PixelFormat = 250;
pub const PixelFormatDepth32Float: PixelFormat = 252;
pub const PixelFormatStencil8: PixelFormat = 253;
pub const PixelFormatDepth24Unorm_Stencil8: PixelFormat = 255;
pub const PixelFormatDepth32Float_Stencil8: PixelFormat = 260;
pub const PixelFormatX32_Stencil8: PixelFormat = 261;
pub const PixelFormatX24_Stencil8: PixelFormat = 262;

pub const PrimitiveType = ns.UInteger;
pub const PrimitiveTypePoint: PrimitiveType = 0;
pub const PrimitiveTypeLine: PrimitiveType = 1;
pub const PrimitiveTypeLineStrip: PrimitiveType = 2;
pub const PrimitiveTypeTriangle: PrimitiveType = 3;
pub const PrimitiveTypeTriangleStrip: PrimitiveType = 4;

pub const VisibilityResultMode = ns.UInteger;
pub const VisibilityResultModeDisabled: VisibilityResultMode = 0;
pub const VisibilityResultModeBoolean: VisibilityResultMode = 1;
pub const VisibilityResultModeCounting: VisibilityResultMode = 2;

pub const CullMode = ns.UInteger;
pub const CullModeNone: CullMode = 0;
pub const CullModeFront: CullMode = 1;
pub const CullModeBack: CullMode = 2;

pub const Winding = ns.UInteger;
pub const WindingClockwise: Winding = 0;
pub const WindingCounterClockwise: Winding = 1;

pub const DepthClipMode = ns.UInteger;
pub const DepthClipModeClip: DepthClipMode = 0;
pub const DepthClipModeClamp: DepthClipMode = 1;

pub const TriangleFillMode = ns.UInteger;
pub const TriangleFillModeFill: TriangleFillMode = 0;
pub const TriangleFillModeLines: TriangleFillMode = 1;

pub const RenderStages = ns.UInteger;
pub const RenderStageVertex: RenderStages = 1;
pub const RenderStageFragment: RenderStages = 2;
pub const RenderStageTile: RenderStages = 4;
pub const RenderStageObject: RenderStages = 8;
pub const RenderStageMesh: RenderStages = 16;

pub const LoadAction = ns.UInteger;
pub const LoadActionDontCare: LoadAction = 0;
pub const LoadActionLoad: LoadAction = 1;
pub const LoadActionClear: LoadAction = 2;

pub const StoreAction = ns.UInteger;
pub const StoreActionDontCare: StoreAction = 0;
pub const StoreActionStore: StoreAction = 1;
pub const StoreActionMultisampleResolve: StoreAction = 2;
pub const StoreActionStoreAndMultisampleResolve: StoreAction = 3;
pub const StoreActionUnknown: StoreAction = 4;
pub const StoreActionCustomSampleDepthStore: StoreAction = 5;

pub const StoreActionOptions = ns.UInteger;
pub const StoreActionOptionNone: StoreActionOptions = 0;
pub const StoreActionOptionCustomSamplePositions: StoreActionOptions = 1;

pub const MultisampleDepthResolveFilter = ns.UInteger;
pub const MultisampleDepthResolveFilterSample0: MultisampleDepthResolveFilter = 0;
pub const MultisampleDepthResolveFilterMin: MultisampleDepthResolveFilter = 1;
pub const MultisampleDepthResolveFilterMax: MultisampleDepthResolveFilter = 2;

pub const MultisampleStencilResolveFilter = ns.UInteger;
pub const MultisampleStencilResolveFilterSample0: MultisampleStencilResolveFilter = 0;
pub const MultisampleStencilResolveFilterDepthResolvedSample: MultisampleStencilResolveFilter = 1;

pub const BlendFactor = ns.UInteger;
pub const BlendFactorZero: BlendFactor = 0;
pub const BlendFactorOne: BlendFactor = 1;
pub const BlendFactorSourceColor: BlendFactor = 2;
pub const BlendFactorOneMinusSourceColor: BlendFactor = 3;
pub const BlendFactorSourceAlpha: BlendFactor = 4;
pub const BlendFactorOneMinusSourceAlpha: BlendFactor = 5;
pub const BlendFactorDestinationColor: BlendFactor = 6;
pub const BlendFactorOneMinusDestinationColor: BlendFactor = 7;
pub const BlendFactorDestinationAlpha: BlendFactor = 8;
pub const BlendFactorOneMinusDestinationAlpha: BlendFactor = 9;
pub const BlendFactorSourceAlphaSaturated: BlendFactor = 10;
pub const BlendFactorBlendColor: BlendFactor = 11;
pub const BlendFactorOneMinusBlendColor: BlendFactor = 12;
pub const BlendFactorBlendAlpha: BlendFactor = 13;
pub const BlendFactorOneMinusBlendAlpha: BlendFactor = 14;
pub const BlendFactorSource1Color: BlendFactor = 15;
pub const BlendFactorOneMinusSource1Color: BlendFactor = 16;
pub const BlendFactorSource1Alpha: BlendFactor = 17;
pub const BlendFactorOneMinusSource1Alpha: BlendFactor = 18;

pub const BlendOperation = ns.UInteger;
pub const BlendOperationAdd: BlendOperation = 0;
pub const BlendOperationSubtract: BlendOperation = 1;
pub const BlendOperationReverseSubtract: BlendOperation = 2;
pub const BlendOperationMin: BlendOperation = 3;
pub const BlendOperationMax: BlendOperation = 4;

pub const ColorWriteMask = ns.UInteger;
pub const ColorWriteMaskNone: ColorWriteMask = 0;
pub const ColorWriteMaskRed: ColorWriteMask = 8;
pub const ColorWriteMaskGreen: ColorWriteMask = 4;
pub const ColorWriteMaskBlue: ColorWriteMask = 2;
pub const ColorWriteMaskAlpha: ColorWriteMask = 1;
pub const ColorWriteMaskAll: ColorWriteMask = 15;

pub const PrimitiveTopologyClass = ns.UInteger;
pub const PrimitiveTopologyClassUnspecified: PrimitiveTopologyClass = 0;
pub const PrimitiveTopologyClassPoint: PrimitiveTopologyClass = 1;
pub const PrimitiveTopologyClassLine: PrimitiveTopologyClass = 2;
pub const PrimitiveTopologyClassTriangle: PrimitiveTopologyClass = 3;

pub const TessellationPartitionMode = ns.UInteger;
pub const TessellationPartitionModePow2: TessellationPartitionMode = 0;
pub const TessellationPartitionModeInteger: TessellationPartitionMode = 1;
pub const TessellationPartitionModeFractionalOdd: TessellationPartitionMode = 2;
pub const TessellationPartitionModeFractionalEven: TessellationPartitionMode = 3;

pub const TessellationFactorStepFunction = ns.UInteger;
pub const TessellationFactorStepFunctionConstant: TessellationFactorStepFunction = 0;
pub const TessellationFactorStepFunctionPerPatch: TessellationFactorStepFunction = 1;
pub const TessellationFactorStepFunctionPerInstance: TessellationFactorStepFunction = 2;
pub const TessellationFactorStepFunctionPerPatchAndPerInstance: TessellationFactorStepFunction = 3;

pub const TessellationFactorFormat = ns.UInteger;
pub const TessellationFactorFormatHalf: TessellationFactorFormat = 0;

pub const TessellationControlPointIndexType = ns.UInteger;
pub const TessellationControlPointIndexTypeNone: TessellationControlPointIndexType = 0;
pub const TessellationControlPointIndexTypeUInt16: TessellationControlPointIndexType = 1;
pub const TessellationControlPointIndexTypeUInt32: TessellationControlPointIndexType = 2;

pub const PurgeableState = ns.UInteger;
pub const PurgeableStateKeepCurrent: PurgeableState = 1;
pub const PurgeableStateNonVolatile: PurgeableState = 2;
pub const PurgeableStateVolatile: PurgeableState = 3;
pub const PurgeableStateEmpty: PurgeableState = 4;

pub const CPUCacheMode = ns.UInteger;
pub const CPUCacheModeDefaultCache: CPUCacheMode = 0;
pub const CPUCacheModeWriteCombined: CPUCacheMode = 1;

pub const StorageMode = ns.UInteger;
pub const StorageModeShared: StorageMode = 0;
pub const StorageModeManaged: StorageMode = 1;
pub const StorageModePrivate: StorageMode = 2;
pub const StorageModeMemoryless: StorageMode = 3;

pub const HazardTrackingMode = ns.UInteger;
pub const HazardTrackingModeDefault: HazardTrackingMode = 0;
pub const HazardTrackingModeUntracked: HazardTrackingMode = 1;
pub const HazardTrackingModeTracked: HazardTrackingMode = 2;

pub const ResourceOptions = ns.UInteger;
pub const ResourceCPUCacheModeDefaultCache: ResourceOptions = 0;
pub const ResourceCPUCacheModeWriteCombined: ResourceOptions = 1;
pub const ResourceStorageModeShared: ResourceOptions = 0;
pub const ResourceStorageModeManaged: ResourceOptions = 16;
pub const ResourceStorageModePrivate: ResourceOptions = 32;
pub const ResourceStorageModeMemoryless: ResourceOptions = 48;
pub const ResourceHazardTrackingModeDefault: ResourceOptions = 0;
pub const ResourceHazardTrackingModeUntracked: ResourceOptions = 256;
pub const ResourceHazardTrackingModeTracked: ResourceOptions = 512;
pub const ResourceOptionCPUCacheModeDefault: ResourceOptions = 0;
pub const ResourceOptionCPUCacheModeWriteCombined: ResourceOptions = 1;

pub const SparseTextureMappingMode = ns.UInteger;
pub const SparseTextureMappingModeMap: SparseTextureMappingMode = 0;
pub const SparseTextureMappingModeUnmap: SparseTextureMappingMode = 1;

pub const SamplerMinMagFilter = ns.UInteger;
pub const SamplerMinMagFilterNearest: SamplerMinMagFilter = 0;
pub const SamplerMinMagFilterLinear: SamplerMinMagFilter = 1;

pub const SamplerMipFilter = ns.UInteger;
pub const SamplerMipFilterNotMipmapped: SamplerMipFilter = 0;
pub const SamplerMipFilterNearest: SamplerMipFilter = 1;
pub const SamplerMipFilterLinear: SamplerMipFilter = 2;

pub const SamplerAddressMode = ns.UInteger;
pub const SamplerAddressModeClampToEdge: SamplerAddressMode = 0;
pub const SamplerAddressModeMirrorClampToEdge: SamplerAddressMode = 1;
pub const SamplerAddressModeRepeat: SamplerAddressMode = 2;
pub const SamplerAddressModeMirrorRepeat: SamplerAddressMode = 3;
pub const SamplerAddressModeClampToZero: SamplerAddressMode = 4;
pub const SamplerAddressModeClampToBorderColor: SamplerAddressMode = 5;

pub const SamplerBorderColor = ns.UInteger;
pub const SamplerBorderColorTransparentBlack: SamplerBorderColor = 0;
pub const SamplerBorderColorOpaqueBlack: SamplerBorderColor = 1;
pub const SamplerBorderColorOpaqueWhite: SamplerBorderColor = 2;

pub const AttributeFormat = ns.UInteger;
pub const AttributeFormatInvalid: AttributeFormat = 0;
pub const AttributeFormatUChar2: AttributeFormat = 1;
pub const AttributeFormatUChar3: AttributeFormat = 2;
pub const AttributeFormatUChar4: AttributeFormat = 3;
pub const AttributeFormatChar2: AttributeFormat = 4;
pub const AttributeFormatChar3: AttributeFormat = 5;
pub const AttributeFormatChar4: AttributeFormat = 6;
pub const AttributeFormatUChar2Normalized: AttributeFormat = 7;
pub const AttributeFormatUChar3Normalized: AttributeFormat = 8;
pub const AttributeFormatUChar4Normalized: AttributeFormat = 9;
pub const AttributeFormatChar2Normalized: AttributeFormat = 10;
pub const AttributeFormatChar3Normalized: AttributeFormat = 11;
pub const AttributeFormatChar4Normalized: AttributeFormat = 12;
pub const AttributeFormatUShort2: AttributeFormat = 13;
pub const AttributeFormatUShort3: AttributeFormat = 14;
pub const AttributeFormatUShort4: AttributeFormat = 15;
pub const AttributeFormatShort2: AttributeFormat = 16;
pub const AttributeFormatShort3: AttributeFormat = 17;
pub const AttributeFormatShort4: AttributeFormat = 18;
pub const AttributeFormatUShort2Normalized: AttributeFormat = 19;
pub const AttributeFormatUShort3Normalized: AttributeFormat = 20;
pub const AttributeFormatUShort4Normalized: AttributeFormat = 21;
pub const AttributeFormatShort2Normalized: AttributeFormat = 22;
pub const AttributeFormatShort3Normalized: AttributeFormat = 23;
pub const AttributeFormatShort4Normalized: AttributeFormat = 24;
pub const AttributeFormatHalf2: AttributeFormat = 25;
pub const AttributeFormatHalf3: AttributeFormat = 26;
pub const AttributeFormatHalf4: AttributeFormat = 27;
pub const AttributeFormatFloat: AttributeFormat = 28;
pub const AttributeFormatFloat2: AttributeFormat = 29;
pub const AttributeFormatFloat3: AttributeFormat = 30;
pub const AttributeFormatFloat4: AttributeFormat = 31;
pub const AttributeFormatInt: AttributeFormat = 32;
pub const AttributeFormatInt2: AttributeFormat = 33;
pub const AttributeFormatInt3: AttributeFormat = 34;
pub const AttributeFormatInt4: AttributeFormat = 35;
pub const AttributeFormatUInt: AttributeFormat = 36;
pub const AttributeFormatUInt2: AttributeFormat = 37;
pub const AttributeFormatUInt3: AttributeFormat = 38;
pub const AttributeFormatUInt4: AttributeFormat = 39;
pub const AttributeFormatInt1010102Normalized: AttributeFormat = 40;
pub const AttributeFormatUInt1010102Normalized: AttributeFormat = 41;
pub const AttributeFormatUChar4Normalized_BGRA: AttributeFormat = 42;
pub const AttributeFormatUChar: AttributeFormat = 45;
pub const AttributeFormatChar: AttributeFormat = 46;
pub const AttributeFormatUCharNormalized: AttributeFormat = 47;
pub const AttributeFormatCharNormalized: AttributeFormat = 48;
pub const AttributeFormatUShort: AttributeFormat = 49;
pub const AttributeFormatShort: AttributeFormat = 50;
pub const AttributeFormatUShortNormalized: AttributeFormat = 51;
pub const AttributeFormatShortNormalized: AttributeFormat = 52;
pub const AttributeFormatHalf: AttributeFormat = 53;
pub const AttributeFormatFloatRG11B10: AttributeFormat = 54;
pub const AttributeFormatFloatRGB9E5: AttributeFormat = 55;

pub const IndexType = ns.UInteger;
pub const IndexTypeUInt16: IndexType = 0;
pub const IndexTypeUInt32: IndexType = 1;

pub const StepFunction = ns.UInteger;
pub const StepFunctionConstant: StepFunction = 0;
pub const StepFunctionPerVertex: StepFunction = 1;
pub const StepFunctionPerInstance: StepFunction = 2;
pub const StepFunctionPerPatch: StepFunction = 3;
pub const StepFunctionPerPatchControlPoint: StepFunction = 4;
pub const StepFunctionThreadPositionInGridX: StepFunction = 5;
pub const StepFunctionThreadPositionInGridY: StepFunction = 6;
pub const StepFunctionThreadPositionInGridXIndexed: StepFunction = 7;
pub const StepFunctionThreadPositionInGridYIndexed: StepFunction = 8;

pub const TextureType = ns.UInteger;
pub const TextureType1D: TextureType = 0;
pub const TextureType1DArray: TextureType = 1;
pub const TextureType2D: TextureType = 2;
pub const TextureType2DArray: TextureType = 3;
pub const TextureType2DMultisample: TextureType = 4;
pub const TextureTypeCube: TextureType = 5;
pub const TextureTypeCubeArray: TextureType = 6;
pub const TextureType3D: TextureType = 7;
pub const TextureType2DMultisampleArray: TextureType = 8;
pub const TextureTypeTextureBuffer: TextureType = 9;

pub const TextureSwizzle = u8;
pub const TextureSwizzleZero: TextureSwizzle = 0;
pub const TextureSwizzleOne: TextureSwizzle = 1;
pub const TextureSwizzleRed: TextureSwizzle = 2;
pub const TextureSwizzleGreen: TextureSwizzle = 3;
pub const TextureSwizzleBlue: TextureSwizzle = 4;
pub const TextureSwizzleAlpha: TextureSwizzle = 5;

pub const TextureUsage = ns.UInteger;
pub const TextureUsageUnknown: TextureUsage = 0;
pub const TextureUsageShaderRead: TextureUsage = 1;
pub const TextureUsageShaderWrite: TextureUsage = 2;
pub const TextureUsageRenderTarget: TextureUsage = 4;
pub const TextureUsagePixelFormatView: TextureUsage = 16;
pub const TextureUsageShaderAtomic: TextureUsage = 32;

pub const TextureCompressionType = ns.Integer;
pub const TextureCompressionTypeLossless: TextureCompressionType = 0;
pub const TextureCompressionTypeLossy: TextureCompressionType = 1;

pub const VertexFormat = ns.UInteger;
pub const VertexFormatInvalid: VertexFormat = 0;
pub const VertexFormatUChar2: VertexFormat = 1;
pub const VertexFormatUChar3: VertexFormat = 2;
pub const VertexFormatUChar4: VertexFormat = 3;
pub const VertexFormatChar2: VertexFormat = 4;
pub const VertexFormatChar3: VertexFormat = 5;
pub const VertexFormatChar4: VertexFormat = 6;
pub const VertexFormatUChar2Normalized: VertexFormat = 7;
pub const VertexFormatUChar3Normalized: VertexFormat = 8;
pub const VertexFormatUChar4Normalized: VertexFormat = 9;
pub const VertexFormatChar2Normalized: VertexFormat = 10;
pub const VertexFormatChar3Normalized: VertexFormat = 11;
pub const VertexFormatChar4Normalized: VertexFormat = 12;
pub const VertexFormatUShort2: VertexFormat = 13;
pub const VertexFormatUShort3: VertexFormat = 14;
pub const VertexFormatUShort4: VertexFormat = 15;
pub const VertexFormatShort2: VertexFormat = 16;
pub const VertexFormatShort3: VertexFormat = 17;
pub const VertexFormatShort4: VertexFormat = 18;
pub const VertexFormatUShort2Normalized: VertexFormat = 19;
pub const VertexFormatUShort3Normalized: VertexFormat = 20;
pub const VertexFormatUShort4Normalized: VertexFormat = 21;
pub const VertexFormatShort2Normalized: VertexFormat = 22;
pub const VertexFormatShort3Normalized: VertexFormat = 23;
pub const VertexFormatShort4Normalized: VertexFormat = 24;
pub const VertexFormatHalf2: VertexFormat = 25;
pub const VertexFormatHalf3: VertexFormat = 26;
pub const VertexFormatHalf4: VertexFormat = 27;
pub const VertexFormatFloat: VertexFormat = 28;
pub const VertexFormatFloat2: VertexFormat = 29;
pub const VertexFormatFloat3: VertexFormat = 30;
pub const VertexFormatFloat4: VertexFormat = 31;
pub const VertexFormatInt: VertexFormat = 32;
pub const VertexFormatInt2: VertexFormat = 33;
pub const VertexFormatInt3: VertexFormat = 34;
pub const VertexFormatInt4: VertexFormat = 35;
pub const VertexFormatUInt: VertexFormat = 36;
pub const VertexFormatUInt2: VertexFormat = 37;
pub const VertexFormatUInt3: VertexFormat = 38;
pub const VertexFormatUInt4: VertexFormat = 39;
pub const VertexFormatInt1010102Normalized: VertexFormat = 40;
pub const VertexFormatUInt1010102Normalized: VertexFormat = 41;
pub const VertexFormatUChar4Normalized_BGRA: VertexFormat = 42;
pub const VertexFormatUChar: VertexFormat = 45;
pub const VertexFormatChar: VertexFormat = 46;
pub const VertexFormatUCharNormalized: VertexFormat = 47;
pub const VertexFormatCharNormalized: VertexFormat = 48;
pub const VertexFormatUShort: VertexFormat = 49;
pub const VertexFormatShort: VertexFormat = 50;
pub const VertexFormatUShortNormalized: VertexFormat = 51;
pub const VertexFormatShortNormalized: VertexFormat = 52;
pub const VertexFormatHalf: VertexFormat = 53;
pub const VertexFormatFloatRG11B10: VertexFormat = 54;
pub const VertexFormatFloatRGB9E5: VertexFormat = 55;

pub const VertexStepFunction = ns.UInteger;
pub const VertexStepFunctionConstant: VertexStepFunction = 0;
pub const VertexStepFunctionPerVertex: VertexStepFunction = 1;
pub const VertexStepFunctionPerInstance: VertexStepFunction = 2;
pub const VertexStepFunctionPerPatch: VertexStepFunction = 3;
pub const VertexStepFunctionPerPatchControlPoint: VertexStepFunction = 4;

pub const AccelerationStructureDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn usage(self_: *@This()) AccelerationStructureUsage {
        return objc.msgSend(self_, "usage", AccelerationStructureUsage, .{});
    }
    pub fn setUsage(self_: *@This(), usage_: AccelerationStructureUsage) void {
        return objc.msgSend(self_, "setUsage:", void, .{usage_});
    }
};

pub const AccelerationStructureGeometryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureGeometryDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn intersectionFunctionTableOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "intersectionFunctionTableOffset", ns.UInteger, .{});
    }
    pub fn setIntersectionFunctionTableOffset(self_: *@This(), intersectionFunctionTableOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setIntersectionFunctionTableOffset:", void, .{intersectionFunctionTableOffset_});
    }
    pub fn @"opaque"(self_: *@This()) bool {
        return objc.msgSend(self_, "opaque", bool, .{});
    }
    pub fn setOpaque(self_: *@This(), opaque_: bool) void {
        return objc.msgSend(self_, "setOpaque:", void, .{opaque_});
    }
    pub fn allowDuplicateIntersectionFunctionInvocation(self_: *@This()) bool {
        return objc.msgSend(self_, "allowDuplicateIntersectionFunctionInvocation", bool, .{});
    }
    pub fn setAllowDuplicateIntersectionFunctionInvocation(self_: *@This(), allowDuplicateIntersectionFunctionInvocation_: bool) void {
        return objc.msgSend(self_, "setAllowDuplicateIntersectionFunctionInvocation:", void, .{allowDuplicateIntersectionFunctionInvocation_});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn primitiveDataBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "primitiveDataBuffer", ?*Buffer, .{});
    }
    pub fn setPrimitiveDataBuffer(self_: *@This(), primitiveDataBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setPrimitiveDataBuffer:", void, .{primitiveDataBuffer_});
    }
    pub fn primitiveDataBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "primitiveDataBufferOffset", ns.UInteger, .{});
    }
    pub fn setPrimitiveDataBufferOffset(self_: *@This(), primitiveDataBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setPrimitiveDataBufferOffset:", void, .{primitiveDataBufferOffset_});
    }
    pub fn primitiveDataStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "primitiveDataStride", ns.UInteger, .{});
    }
    pub fn setPrimitiveDataStride(self_: *@This(), primitiveDataStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setPrimitiveDataStride:", void, .{primitiveDataStride_});
    }
    pub fn primitiveDataElementSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "primitiveDataElementSize", ns.UInteger, .{});
    }
    pub fn setPrimitiveDataElementSize(self_: *@This(), primitiveDataElementSize_: ns.UInteger) void {
        return objc.msgSend(self_, "setPrimitiveDataElementSize:", void, .{primitiveDataElementSize_});
    }
};

pub const PrimitiveAccelerationStructureDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLPrimitiveAccelerationStructureDescriptor", @This(), AccelerationStructureDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn geometryDescriptors(self_: *@This()) ?*ns.Array(*AccelerationStructureGeometryDescriptor) {
        return objc.msgSend(self_, "geometryDescriptors", ?*ns.Array(*AccelerationStructureGeometryDescriptor), .{});
    }
    pub fn setGeometryDescriptors(self_: *@This(), geometryDescriptors_: ?*ns.Array(*AccelerationStructureGeometryDescriptor)) void {
        return objc.msgSend(self_, "setGeometryDescriptors:", void, .{geometryDescriptors_});
    }
    pub fn motionStartBorderMode(self_: *@This()) MotionBorderMode {
        return objc.msgSend(self_, "motionStartBorderMode", MotionBorderMode, .{});
    }
    pub fn setMotionStartBorderMode(self_: *@This(), motionStartBorderMode_: MotionBorderMode) void {
        return objc.msgSend(self_, "setMotionStartBorderMode:", void, .{motionStartBorderMode_});
    }
    pub fn motionEndBorderMode(self_: *@This()) MotionBorderMode {
        return objc.msgSend(self_, "motionEndBorderMode", MotionBorderMode, .{});
    }
    pub fn setMotionEndBorderMode(self_: *@This(), motionEndBorderMode_: MotionBorderMode) void {
        return objc.msgSend(self_, "setMotionEndBorderMode:", void, .{motionEndBorderMode_});
    }
    pub fn motionStartTime(self_: *@This()) f32 {
        return objc.msgSend(self_, "motionStartTime", f32, .{});
    }
    pub fn setMotionStartTime(self_: *@This(), motionStartTime_: f32) void {
        return objc.msgSend(self_, "setMotionStartTime:", void, .{motionStartTime_});
    }
    pub fn motionEndTime(self_: *@This()) f32 {
        return objc.msgSend(self_, "motionEndTime", f32, .{});
    }
    pub fn setMotionEndTime(self_: *@This(), motionEndTime_: f32) void {
        return objc.msgSend(self_, "setMotionEndTime:", void, .{motionEndTime_});
    }
    pub fn motionKeyframeCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "motionKeyframeCount", ns.UInteger, .{});
    }
    pub fn setMotionKeyframeCount(self_: *@This(), motionKeyframeCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMotionKeyframeCount:", void, .{motionKeyframeCount_});
    }
};

pub const AccelerationStructureTriangleGeometryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureTriangleGeometryDescriptor", @This(), AccelerationStructureGeometryDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn vertexBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "vertexBuffer", ?*Buffer, .{});
    }
    pub fn setVertexBuffer(self_: *@This(), vertexBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setVertexBuffer:", void, .{vertexBuffer_});
    }
    pub fn vertexBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "vertexBufferOffset", ns.UInteger, .{});
    }
    pub fn setVertexBufferOffset(self_: *@This(), vertexBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBufferOffset:", void, .{vertexBufferOffset_});
    }
    pub fn vertexFormat(self_: *@This()) AttributeFormat {
        return objc.msgSend(self_, "vertexFormat", AttributeFormat, .{});
    }
    pub fn setVertexFormat(self_: *@This(), vertexFormat_: AttributeFormat) void {
        return objc.msgSend(self_, "setVertexFormat:", void, .{vertexFormat_});
    }
    pub fn vertexStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "vertexStride", ns.UInteger, .{});
    }
    pub fn setVertexStride(self_: *@This(), vertexStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexStride:", void, .{vertexStride_});
    }
    pub fn indexBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "indexBuffer", ?*Buffer, .{});
    }
    pub fn setIndexBuffer(self_: *@This(), indexBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setIndexBuffer:", void, .{indexBuffer_});
    }
    pub fn indexBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "indexBufferOffset", ns.UInteger, .{});
    }
    pub fn setIndexBufferOffset(self_: *@This(), indexBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setIndexBufferOffset:", void, .{indexBufferOffset_});
    }
    pub fn indexType(self_: *@This()) IndexType {
        return objc.msgSend(self_, "indexType", IndexType, .{});
    }
    pub fn setIndexType(self_: *@This(), indexType_: IndexType) void {
        return objc.msgSend(self_, "setIndexType:", void, .{indexType_});
    }
    pub fn triangleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "triangleCount", ns.UInteger, .{});
    }
    pub fn setTriangleCount(self_: *@This(), triangleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setTriangleCount:", void, .{triangleCount_});
    }
    pub fn transformationMatrixBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "transformationMatrixBuffer", ?*Buffer, .{});
    }
    pub fn setTransformationMatrixBuffer(self_: *@This(), transformationMatrixBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setTransformationMatrixBuffer:", void, .{transformationMatrixBuffer_});
    }
    pub fn transformationMatrixBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "transformationMatrixBufferOffset", ns.UInteger, .{});
    }
    pub fn setTransformationMatrixBufferOffset(self_: *@This(), transformationMatrixBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setTransformationMatrixBufferOffset:", void, .{transformationMatrixBufferOffset_});
    }
};

pub const AccelerationStructureBoundingBoxGeometryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureBoundingBoxGeometryDescriptor", @This(), AccelerationStructureGeometryDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn boundingBoxBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "boundingBoxBuffer", ?*Buffer, .{});
    }
    pub fn setBoundingBoxBuffer(self_: *@This(), boundingBoxBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setBoundingBoxBuffer:", void, .{boundingBoxBuffer_});
    }
    pub fn boundingBoxBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "boundingBoxBufferOffset", ns.UInteger, .{});
    }
    pub fn setBoundingBoxBufferOffset(self_: *@This(), boundingBoxBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setBoundingBoxBufferOffset:", void, .{boundingBoxBufferOffset_});
    }
    pub fn boundingBoxStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "boundingBoxStride", ns.UInteger, .{});
    }
    pub fn setBoundingBoxStride(self_: *@This(), boundingBoxStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setBoundingBoxStride:", void, .{boundingBoxStride_});
    }
    pub fn boundingBoxCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "boundingBoxCount", ns.UInteger, .{});
    }
    pub fn setBoundingBoxCount(self_: *@This(), boundingBoxCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setBoundingBoxCount:", void, .{boundingBoxCount_});
    }
};

pub const MotionKeyframeData = opaque {
    pub const InternalInfo = objc.ExternClass("MTLMotionKeyframeData", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn data() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "data", *@This(), .{});
    }
    pub fn buffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "buffer", ?*Buffer, .{});
    }
    pub fn setBuffer(self_: *@This(), buffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setBuffer:", void, .{buffer_});
    }
    pub fn offset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "offset", ns.UInteger, .{});
    }
    pub fn setOffset(self_: *@This(), offset_: ns.UInteger) void {
        return objc.msgSend(self_, "setOffset:", void, .{offset_});
    }
};

pub const AccelerationStructureMotionTriangleGeometryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureMotionTriangleGeometryDescriptor", @This(), AccelerationStructureGeometryDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn vertexBuffers(self_: *@This()) *ns.Array(*MotionKeyframeData) {
        return objc.msgSend(self_, "vertexBuffers", *ns.Array(*MotionKeyframeData), .{});
    }
    pub fn setVertexBuffers(self_: *@This(), vertexBuffers_: *ns.Array(*MotionKeyframeData)) void {
        return objc.msgSend(self_, "setVertexBuffers:", void, .{vertexBuffers_});
    }
    pub fn vertexFormat(self_: *@This()) AttributeFormat {
        return objc.msgSend(self_, "vertexFormat", AttributeFormat, .{});
    }
    pub fn setVertexFormat(self_: *@This(), vertexFormat_: AttributeFormat) void {
        return objc.msgSend(self_, "setVertexFormat:", void, .{vertexFormat_});
    }
    pub fn vertexStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "vertexStride", ns.UInteger, .{});
    }
    pub fn setVertexStride(self_: *@This(), vertexStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexStride:", void, .{vertexStride_});
    }
    pub fn indexBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "indexBuffer", ?*Buffer, .{});
    }
    pub fn setIndexBuffer(self_: *@This(), indexBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setIndexBuffer:", void, .{indexBuffer_});
    }
    pub fn indexBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "indexBufferOffset", ns.UInteger, .{});
    }
    pub fn setIndexBufferOffset(self_: *@This(), indexBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setIndexBufferOffset:", void, .{indexBufferOffset_});
    }
    pub fn indexType(self_: *@This()) IndexType {
        return objc.msgSend(self_, "indexType", IndexType, .{});
    }
    pub fn setIndexType(self_: *@This(), indexType_: IndexType) void {
        return objc.msgSend(self_, "setIndexType:", void, .{indexType_});
    }
    pub fn triangleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "triangleCount", ns.UInteger, .{});
    }
    pub fn setTriangleCount(self_: *@This(), triangleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setTriangleCount:", void, .{triangleCount_});
    }
    pub fn transformationMatrixBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "transformationMatrixBuffer", ?*Buffer, .{});
    }
    pub fn setTransformationMatrixBuffer(self_: *@This(), transformationMatrixBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setTransformationMatrixBuffer:", void, .{transformationMatrixBuffer_});
    }
    pub fn transformationMatrixBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "transformationMatrixBufferOffset", ns.UInteger, .{});
    }
    pub fn setTransformationMatrixBufferOffset(self_: *@This(), transformationMatrixBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setTransformationMatrixBufferOffset:", void, .{transformationMatrixBufferOffset_});
    }
};

pub const AccelerationStructureMotionBoundingBoxGeometryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor", @This(), AccelerationStructureGeometryDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn boundingBoxBuffers(self_: *@This()) *ns.Array(*MotionKeyframeData) {
        return objc.msgSend(self_, "boundingBoxBuffers", *ns.Array(*MotionKeyframeData), .{});
    }
    pub fn setBoundingBoxBuffers(self_: *@This(), boundingBoxBuffers_: *ns.Array(*MotionKeyframeData)) void {
        return objc.msgSend(self_, "setBoundingBoxBuffers:", void, .{boundingBoxBuffers_});
    }
    pub fn boundingBoxStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "boundingBoxStride", ns.UInteger, .{});
    }
    pub fn setBoundingBoxStride(self_: *@This(), boundingBoxStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setBoundingBoxStride:", void, .{boundingBoxStride_});
    }
    pub fn boundingBoxCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "boundingBoxCount", ns.UInteger, .{});
    }
    pub fn setBoundingBoxCount(self_: *@This(), boundingBoxCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setBoundingBoxCount:", void, .{boundingBoxCount_});
    }
};

pub const InstanceAccelerationStructureDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLInstanceAccelerationStructureDescriptor", @This(), AccelerationStructureDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn descriptor() *@This() {
        return objc.msgSend(@This().InternalInfo.class(), "descriptor", *@This(), .{});
    }
    pub fn instanceDescriptorBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "instanceDescriptorBuffer", ?*Buffer, .{});
    }
    pub fn setInstanceDescriptorBuffer(self_: *@This(), instanceDescriptorBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setInstanceDescriptorBuffer:", void, .{instanceDescriptorBuffer_});
    }
    pub fn instanceDescriptorBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "instanceDescriptorBufferOffset", ns.UInteger, .{});
    }
    pub fn setInstanceDescriptorBufferOffset(self_: *@This(), instanceDescriptorBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setInstanceDescriptorBufferOffset:", void, .{instanceDescriptorBufferOffset_});
    }
    pub fn instanceDescriptorStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "instanceDescriptorStride", ns.UInteger, .{});
    }
    pub fn setInstanceDescriptorStride(self_: *@This(), instanceDescriptorStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setInstanceDescriptorStride:", void, .{instanceDescriptorStride_});
    }
    pub fn instanceCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "instanceCount", ns.UInteger, .{});
    }
    pub fn setInstanceCount(self_: *@This(), instanceCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setInstanceCount:", void, .{instanceCount_});
    }
    pub fn instancedAccelerationStructures(self_: *@This()) ?*ns.Array(*AccelerationStructure) {
        return objc.msgSend(self_, "instancedAccelerationStructures", ?*ns.Array(*AccelerationStructure), .{});
    }
    pub fn setInstancedAccelerationStructures(self_: *@This(), instancedAccelerationStructures_: ?*ns.Array(*AccelerationStructure)) void {
        return objc.msgSend(self_, "setInstancedAccelerationStructures:", void, .{instancedAccelerationStructures_});
    }
    pub fn instanceDescriptorType(self_: *@This()) AccelerationStructureInstanceDescriptorType {
        return objc.msgSend(self_, "instanceDescriptorType", AccelerationStructureInstanceDescriptorType, .{});
    }
    pub fn setInstanceDescriptorType(self_: *@This(), instanceDescriptorType_: AccelerationStructureInstanceDescriptorType) void {
        return objc.msgSend(self_, "setInstanceDescriptorType:", void, .{instanceDescriptorType_});
    }
    pub fn motionTransformBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "motionTransformBuffer", ?*Buffer, .{});
    }
    pub fn setMotionTransformBuffer(self_: *@This(), motionTransformBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setMotionTransformBuffer:", void, .{motionTransformBuffer_});
    }
    pub fn motionTransformBufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "motionTransformBufferOffset", ns.UInteger, .{});
    }
    pub fn setMotionTransformBufferOffset(self_: *@This(), motionTransformBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setMotionTransformBufferOffset:", void, .{motionTransformBufferOffset_});
    }
    pub fn motionTransformCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "motionTransformCount", ns.UInteger, .{});
    }
    pub fn setMotionTransformCount(self_: *@This(), motionTransformCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMotionTransformCount:", void, .{motionTransformCount_});
    }
};

pub const AccelerationStructure = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn size(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "size", ns.UInteger, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const AccelerationStructureCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset(self_: *@This(), accelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, scratchBuffer_: *Buffer, scratchBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", void, .{ accelerationStructure_, descriptor_, scratchBuffer_, scratchBufferOffset_ });
    }
    pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset(self_: *@This(), sourceAccelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, destinationAccelerationStructure_: ?*AccelerationStructure, scratchBuffer_: ?*Buffer, scratchBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:", void, .{ sourceAccelerationStructure_, descriptor_, destinationAccelerationStructure_, scratchBuffer_, scratchBufferOffset_ });
    }
    pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options(self_: *@This(), sourceAccelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, destinationAccelerationStructure_: ?*AccelerationStructure, scratchBuffer_: ?*Buffer, scratchBufferOffset_: ns.UInteger, options_: AccelerationStructureRefitOptions) void {
        return objc.msgSend(self_, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", void, .{ sourceAccelerationStructure_, descriptor_, destinationAccelerationStructure_, scratchBuffer_, scratchBufferOffset_, options_ });
    }
    pub fn copyAccelerationStructure_toAccelerationStructure(self_: *@This(), sourceAccelerationStructure_: *AccelerationStructure, destinationAccelerationStructure_: *AccelerationStructure) void {
        return objc.msgSend(self_, "copyAccelerationStructure:toAccelerationStructure:", void, .{ sourceAccelerationStructure_, destinationAccelerationStructure_ });
    }
    pub fn writeCompactedAccelerationStructureSize_toBuffer_offset(self_: *@This(), accelerationStructure_: *AccelerationStructure, buffer_: *Buffer, offset_: ns.UInteger) void {
        return objc.msgSend(self_, "writeCompactedAccelerationStructureSize:toBuffer:offset:", void, .{ accelerationStructure_, buffer_, offset_ });
    }
    pub fn writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType(self_: *@This(), accelerationStructure_: *AccelerationStructure, buffer_: *Buffer, offset_: ns.UInteger, sizeDataType_: DataType) void {
        return objc.msgSend(self_, "writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:", void, .{ accelerationStructure_, buffer_, offset_, sizeDataType_ });
    }
    pub fn copyAndCompactAccelerationStructure_toAccelerationStructure(self_: *@This(), sourceAccelerationStructure_: *AccelerationStructure, destinationAccelerationStructure_: *AccelerationStructure) void {
        return objc.msgSend(self_, "copyAndCompactAccelerationStructure:toAccelerationStructure:", void, .{ sourceAccelerationStructure_, destinationAccelerationStructure_ });
    }
    pub fn updateFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "updateFence:", void, .{fence_});
    }
    pub fn waitForFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "waitForFence:", void, .{fence_});
    }
    pub fn useResource_usage(self_: *@This(), resource_: *Resource, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResource:usage:", void, .{ resource_, usage_ });
    }
    pub fn useResources_count_usage(self_: *@This(), resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResources:count:usage:", void, .{ resources_, count_, usage_ });
    }
    pub fn useHeap(self_: *@This(), heap_: *Heap) void {
        return objc.msgSend(self_, "useHeap:", void, .{heap_});
    }
    pub fn useHeaps_count(self_: *@This(), heaps_: **const Heap, count_: ns.UInteger) void {
        return objc.msgSend(self_, "useHeaps:count:", void, .{ heaps_, count_ });
    }
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *@This(), sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
        return objc.msgSend(self_, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sampleBuffer_, sampleIndex_, barrier_ });
    }
};

pub const AccelerationStructurePassSampleBufferAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructurePassSampleBufferAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sampleBuffer(self_: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    pub fn setSampleBuffer(self_: *@This(), sampleBuffer_: ?*CounterSampleBuffer) void {
        return objc.msgSend(self_, "setSampleBuffer:", void, .{sampleBuffer_});
    }
    pub fn startOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfEncoderSampleIndex(self_: *@This(), startOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfEncoderSampleIndex:", void, .{startOfEncoderSampleIndex_});
    }
    pub fn endOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfEncoderSampleIndex(self_: *@This(), endOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfEncoderSampleIndex:", void, .{endOfEncoderSampleIndex_});
    }
};

pub const AccelerationStructurePassSampleBufferAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *AccelerationStructurePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *AccelerationStructurePassSampleBufferAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*AccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const AccelerationStructurePassDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAccelerationStructurePassDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn accelerationStructurePassDescriptor() *AccelerationStructurePassDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "accelerationStructurePassDescriptor", *AccelerationStructurePassDescriptor, .{});
    }
    pub fn sampleBufferAttachments(self_: *@This()) *AccelerationStructurePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self_, "sampleBufferAttachments", *AccelerationStructurePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

pub const Type = opaque {
    pub const InternalInfo = objc.ExternClass("MTLType", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn dataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "dataType", DataType, .{});
    }
};

pub const StructMember = opaque {
    pub const InternalInfo = objc.ExternClass("MTLStructMember", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn structType(self_: *@This()) ?*StructType {
        return objc.msgSend(self_, "structType", ?*StructType, .{});
    }
    pub fn arrayType(self_: *@This()) ?*ArrayType {
        return objc.msgSend(self_, "arrayType", ?*ArrayType, .{});
    }
    pub fn textureReferenceType(self_: *@This()) ?*TextureReferenceType {
        return objc.msgSend(self_, "textureReferenceType", ?*TextureReferenceType, .{});
    }
    pub fn pointerType(self_: *@This()) ?*PointerType {
        return objc.msgSend(self_, "pointerType", ?*PointerType, .{});
    }
    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn offset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "offset", ns.UInteger, .{});
    }
    pub fn dataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "dataType", DataType, .{});
    }
    pub fn argumentIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "argumentIndex", ns.UInteger, .{});
    }
};

pub const StructType = opaque {
    pub const InternalInfo = objc.ExternClass("MTLStructType", @This(), Type, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn memberByName(self_: *@This(), name_: *ns.String) ?*StructMember {
        return objc.msgSend(self_, "memberByName:", ?*StructMember, .{name_});
    }
    pub fn members(self_: *@This()) *ns.Array(*StructMember) {
        return objc.msgSend(self_, "members", *ns.Array(*StructMember), .{});
    }
};

pub const ArrayType = opaque {
    pub const InternalInfo = objc.ExternClass("MTLArrayType", @This(), Type, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn elementStructType(self_: *@This()) ?*StructType {
        return objc.msgSend(self_, "elementStructType", ?*StructType, .{});
    }
    pub fn elementArrayType(self_: *@This()) ?*ArrayType {
        return objc.msgSend(self_, "elementArrayType", ?*ArrayType, .{});
    }
    pub fn elementTextureReferenceType(self_: *@This()) ?*TextureReferenceType {
        return objc.msgSend(self_, "elementTextureReferenceType", ?*TextureReferenceType, .{});
    }
    pub fn elementPointerType(self_: *@This()) ?*PointerType {
        return objc.msgSend(self_, "elementPointerType", ?*PointerType, .{});
    }
    pub fn elementType(self_: *@This()) DataType {
        return objc.msgSend(self_, "elementType", DataType, .{});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
    pub fn stride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "stride", ns.UInteger, .{});
    }
    pub fn argumentIndexStride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "argumentIndexStride", ns.UInteger, .{});
    }
};

pub const PointerType = opaque {
    pub const InternalInfo = objc.ExternClass("MTLPointerType", @This(), Type, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn elementStructType(self_: *@This()) ?*StructType {
        return objc.msgSend(self_, "elementStructType", ?*StructType, .{});
    }
    pub fn elementArrayType(self_: *@This()) ?*ArrayType {
        return objc.msgSend(self_, "elementArrayType", ?*ArrayType, .{});
    }
    pub fn elementType(self_: *@This()) DataType {
        return objc.msgSend(self_, "elementType", DataType, .{});
    }
    pub fn access(self_: *@This()) BindingAccess {
        return objc.msgSend(self_, "access", BindingAccess, .{});
    }
    pub fn alignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "alignment", ns.UInteger, .{});
    }
    pub fn dataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "dataSize", ns.UInteger, .{});
    }
    pub fn elementIsArgumentBuffer(self_: *@This()) bool {
        return objc.msgSend(self_, "elementIsArgumentBuffer", bool, .{});
    }
};

pub const TextureReferenceType = opaque {
    pub const InternalInfo = objc.ExternClass("MTLTextureReferenceType", @This(), Type, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn textureDataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "textureDataType", DataType, .{});
    }
    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn access(self_: *@This()) BindingAccess {
        return objc.msgSend(self_, "access", BindingAccess, .{});
    }
    pub fn isDepthTexture(self_: *@This()) bool {
        return objc.msgSend(self_, "isDepthTexture", bool, .{});
    }
};

pub const Argument = opaque {
    pub const InternalInfo = objc.ExternClass("MTLArgument", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn @"type"(self_: *@This()) ArgumentType {
        return objc.msgSend(self_, "type", ArgumentType, .{});
    }
    pub fn access(self_: *@This()) BindingAccess {
        return objc.msgSend(self_, "access", BindingAccess, .{});
    }
    pub fn index(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "index", ns.UInteger, .{});
    }
    pub fn isActive(self_: *@This()) bool {
        return objc.msgSend(self_, "isActive", bool, .{});
    }
    pub fn bufferAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferAlignment", ns.UInteger, .{});
    }
    pub fn bufferDataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferDataSize", ns.UInteger, .{});
    }
    pub fn bufferDataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "bufferDataType", DataType, .{});
    }
    pub fn bufferStructType(self_: *@This()) ?*StructType {
        return objc.msgSend(self_, "bufferStructType", ?*StructType, .{});
    }
    pub fn bufferPointerType(self_: *@This()) ?*PointerType {
        return objc.msgSend(self_, "bufferPointerType", ?*PointerType, .{});
    }
    pub fn threadgroupMemoryAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadgroupMemoryAlignment", ns.UInteger, .{});
    }
    pub fn threadgroupMemoryDataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadgroupMemoryDataSize", ns.UInteger, .{});
    }
    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn textureDataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "textureDataType", DataType, .{});
    }
    pub fn isDepthTexture(self_: *@This()) bool {
        return objc.msgSend(self_, "isDepthTexture", bool, .{});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
};

pub const Binding = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn @"type"(self_: *@This()) BindingType {
        return objc.msgSend(self_, "type", BindingType, .{});
    }
    pub fn access(self_: *@This()) BindingAccess {
        return objc.msgSend(self_, "access", BindingAccess, .{});
    }
    pub fn index(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "index", ns.UInteger, .{});
    }
    pub fn isUsed(self_: *@This()) bool {
        return objc.msgSend(self_, "isUsed", bool, .{});
    }
    pub fn isArgument(self_: *@This()) bool {
        return objc.msgSend(self_, "isArgument", bool, .{});
    }
};

pub const BufferBinding = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Binding});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn bufferAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferAlignment", ns.UInteger, .{});
    }
    pub fn bufferDataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferDataSize", ns.UInteger, .{});
    }
    pub fn bufferDataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "bufferDataType", DataType, .{});
    }
    pub fn bufferStructType(self_: *@This()) ?*StructType {
        return objc.msgSend(self_, "bufferStructType", ?*StructType, .{});
    }
    pub fn bufferPointerType(self_: *@This()) ?*PointerType {
        return objc.msgSend(self_, "bufferPointerType", ?*PointerType, .{});
    }
};

pub const ThreadgroupBinding = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Binding});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn threadgroupMemoryAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadgroupMemoryAlignment", ns.UInteger, .{});
    }
    pub fn threadgroupMemoryDataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadgroupMemoryDataSize", ns.UInteger, .{});
    }
};

pub const TextureBinding = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Binding});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn textureDataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "textureDataType", DataType, .{});
    }
    pub fn isDepthTexture(self_: *@This()) bool {
        return objc.msgSend(self_, "isDepthTexture", bool, .{});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
};

pub const ObjectPayloadBinding = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Binding});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn objectPayloadAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "objectPayloadAlignment", ns.UInteger, .{});
    }
    pub fn objectPayloadDataSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "objectPayloadDataSize", ns.UInteger, .{});
    }
};

pub const ArgumentEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setArgumentBuffer_offset(self_: *@This(), argumentBuffer_: ?*Buffer, offset_: ns.UInteger) void {
        return objc.msgSend(self_, "setArgumentBuffer:offset:", void, .{ argumentBuffer_, offset_ });
    }
    pub fn setArgumentBuffer_startOffset_arrayElement(self_: *@This(), argumentBuffer_: ?*Buffer, startOffset_: ns.UInteger, arrayElement_: ns.UInteger) void {
        return objc.msgSend(self_, "setArgumentBuffer:startOffset:arrayElement:", void, .{ argumentBuffer_, startOffset_, arrayElement_ });
    }
    pub fn setBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn constantDataAtIndex(self_: *@This(), index_: ns.UInteger) *anyopaque {
        return objc.msgSend(self_, "constantDataAtIndex:", *anyopaque, .{index_});
    }
    pub fn setRenderPipelineState_atIndex(self_: *@This(), pipeline_: ?*RenderPipelineState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setRenderPipelineState:atIndex:", void, .{ pipeline_, index_ });
    }
    pub fn setRenderPipelineStates_withRange(self_: *@This(), pipelines_: *?*const RenderPipelineState, range_: ns.Range) void {
        return objc.msgSend(self_, "setRenderPipelineStates:withRange:", void, .{ pipelines_, range_ });
    }
    pub fn setComputePipelineState_atIndex(self_: *@This(), pipeline_: ?*ComputePipelineState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setComputePipelineState:atIndex:", void, .{ pipeline_, index_ });
    }
    pub fn setComputePipelineStates_withRange(self_: *@This(), pipelines_: *?*const ComputePipelineState, range_: ns.Range) void {
        return objc.msgSend(self_, "setComputePipelineStates:withRange:", void, .{ pipelines_, range_ });
    }
    pub fn setIndirectCommandBuffer_atIndex(self_: *@This(), indirectCommandBuffer_: ?*IndirectCommandBuffer, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setIndirectCommandBuffer:atIndex:", void, .{ indirectCommandBuffer_, index_ });
    }
    pub fn setIndirectCommandBuffers_withRange(self_: *@This(), buffers_: *?*const IndirectCommandBuffer, range_: ns.Range) void {
        return objc.msgSend(self_, "setIndirectCommandBuffers:withRange:", void, .{ buffers_, range_ });
    }
    pub fn setAccelerationStructure_atIndex(self_: *@This(), accelerationStructure_: ?*AccelerationStructure, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setAccelerationStructure:atIndex:", void, .{ accelerationStructure_, index_ });
    }
    pub fn newArgumentEncoderForBufferAtIndex(self_: *@This(), index_: ns.UInteger) ?*ArgumentEncoder {
        return objc.msgSend(self_, "newArgumentEncoderForBufferAtIndex:", ?*ArgumentEncoder, .{index_});
    }
    pub fn setVisibleFunctionTable_atIndex(self_: *@This(), visibleFunctionTable_: ?*VisibleFunctionTable, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVisibleFunctionTable:atIndex:", void, .{ visibleFunctionTable_, index_ });
    }
    pub fn setVisibleFunctionTables_withRange(self_: *@This(), visibleFunctionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setVisibleFunctionTables:withRange:", void, .{ visibleFunctionTables_, range_ });
    }
    pub fn setIntersectionFunctionTable_atIndex(self_: *@This(), intersectionFunctionTable_: ?*IntersectionFunctionTable, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setIntersectionFunctionTable:atIndex:", void, .{ intersectionFunctionTable_, index_ });
    }
    pub fn setIntersectionFunctionTables_withRange(self_: *@This(), intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setIntersectionFunctionTables:withRange:", void, .{ intersectionFunctionTables_, range_ });
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn encodedLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "encodedLength", ns.UInteger, .{});
    }
    pub fn alignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "alignment", ns.UInteger, .{});
    }
};

pub const BinaryArchiveDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBinaryArchiveDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn url(self_: *@This()) ?*ns.URL {
        return objc.msgSend(self_, "url", ?*ns.URL, .{});
    }
    pub fn setUrl(self_: *@This(), url_: ?*ns.URL) void {
        return objc.msgSend(self_, "setUrl:", void, .{url_});
    }
};

pub const BinaryArchive = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn addComputePipelineFunctionsWithDescriptor_error(self_: *@This(), descriptor_: *ComputePipelineDescriptor, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "addComputePipelineFunctionsWithDescriptor:error:", bool, .{ descriptor_, error_ });
    }
    pub fn addRenderPipelineFunctionsWithDescriptor_error(self_: *@This(), descriptor_: *RenderPipelineDescriptor, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "addRenderPipelineFunctionsWithDescriptor:error:", bool, .{ descriptor_, error_ });
    }
    pub fn addTileRenderPipelineFunctionsWithDescriptor_error(self_: *@This(), descriptor_: *TileRenderPipelineDescriptor, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "addTileRenderPipelineFunctionsWithDescriptor:error:", bool, .{ descriptor_, error_ });
    }
    pub fn serializeToURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "serializeToURL:error:", bool, .{ url_, error_ });
    }
    pub fn addFunctionWithDescriptor_library_error(self_: *@This(), descriptor_: *FunctionDescriptor, library_: *Library, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "addFunctionWithDescriptor:library:error:", bool, .{ descriptor_, library_, error_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
};

pub const BlitCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn synchronizeResource(self_: *@This(), resource_: *Resource) void {
        return objc.msgSend(self_, "synchronizeResource:", void, .{resource_});
    }
    pub fn synchronizeTexture_slice_level(self_: *@This(), texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
        return objc.msgSend(self_, "synchronizeTexture:slice:level:", void, .{ texture_, slice_, level_ });
    }
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *@This(), sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
        return objc.msgSend(self_, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_ });
    }
    pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *@This(), sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
        return objc.msgSend(self_, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ sourceBuffer_, sourceOffset_, sourceBytesPerRow_, sourceBytesPerImage_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_ });
    }
    pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options(self_: *@This(), sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin, options_: BlitOption) void {
        return objc.msgSend(self_, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", void, .{ sourceBuffer_, sourceOffset_, sourceBytesPerRow_, sourceBytesPerImage_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_, options_ });
    }
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage(self_: *@This(), sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, destinationBytesPerRow_: ns.UInteger, destinationBytesPerImage_: ns.UInteger) void {
        return objc.msgSend(self_, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", void, .{ sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationBuffer_, destinationOffset_, destinationBytesPerRow_, destinationBytesPerImage_ });
    }
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options(self_: *@This(), sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, destinationBytesPerRow_: ns.UInteger, destinationBytesPerImage_: ns.UInteger, options_: BlitOption) void {
        return objc.msgSend(self_, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", void, .{ sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationBuffer_, destinationOffset_, destinationBytesPerRow_, destinationBytesPerImage_, options_ });
    }
    pub fn generateMipmapsForTexture(self_: *@This(), texture_: *Texture) void {
        return objc.msgSend(self_, "generateMipmapsForTexture:", void, .{texture_});
    }
    pub fn fillBuffer_range_value(self_: *@This(), buffer_: *Buffer, range_: ns.Range, value_: u8) void {
        return objc.msgSend(self_, "fillBuffer:range:value:", void, .{ buffer_, range_, value_ });
    }
    pub fn copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount(self_: *@This(), sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, sliceCount_: ns.UInteger, levelCount_: ns.UInteger) void {
        return objc.msgSend(self_, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", void, .{ sourceTexture_, sourceSlice_, sourceLevel_, destinationTexture_, destinationSlice_, destinationLevel_, sliceCount_, levelCount_ });
    }
    pub fn copyFromTexture_toTexture(self_: *@This(), sourceTexture_: *Texture, destinationTexture_: *Texture) void {
        return objc.msgSend(self_, "copyFromTexture:toTexture:", void, .{ sourceTexture_, destinationTexture_ });
    }
    pub fn copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size(self_: *@This(), sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, size_: ns.UInteger) void {
        return objc.msgSend(self_, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", void, .{ sourceBuffer_, sourceOffset_, destinationBuffer_, destinationOffset_, size_ });
    }
    pub fn updateFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "updateFence:", void, .{fence_});
    }
    pub fn waitForFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "waitForFence:", void, .{fence_});
    }
    pub fn getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset(self_: *@This(), texture_: *Texture, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger, resetCounters_: bool, countersBuffer_: *Buffer, countersBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", void, .{ texture_, region_, mipLevel_, slice_, resetCounters_, countersBuffer_, countersBufferOffset_ });
    }
    pub fn resetTextureAccessCounters_region_mipLevel_slice(self_: *@This(), texture_: *Texture, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger) void {
        return objc.msgSend(self_, "resetTextureAccessCounters:region:mipLevel:slice:", void, .{ texture_, region_, mipLevel_, slice_ });
    }
    pub fn optimizeContentsForGPUAccess(self_: *@This(), texture_: *Texture) void {
        return objc.msgSend(self_, "optimizeContentsForGPUAccess:", void, .{texture_});
    }
    pub fn optimizeContentsForGPUAccess_slice_level(self_: *@This(), texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
        return objc.msgSend(self_, "optimizeContentsForGPUAccess:slice:level:", void, .{ texture_, slice_, level_ });
    }
    pub fn optimizeContentsForCPUAccess(self_: *@This(), texture_: *Texture) void {
        return objc.msgSend(self_, "optimizeContentsForCPUAccess:", void, .{texture_});
    }
    pub fn optimizeContentsForCPUAccess_slice_level(self_: *@This(), texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
        return objc.msgSend(self_, "optimizeContentsForCPUAccess:slice:level:", void, .{ texture_, slice_, level_ });
    }
    pub fn resetCommandsInBuffer_withRange(self_: *@This(), buffer_: *IndirectCommandBuffer, range_: ns.Range) void {
        return objc.msgSend(self_, "resetCommandsInBuffer:withRange:", void, .{ buffer_, range_ });
    }
    pub fn copyIndirectCommandBuffer_sourceRange_destination_destinationIndex(self_: *@This(), source_: *IndirectCommandBuffer, sourceRange_: ns.Range, destination_: *IndirectCommandBuffer, destinationIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", void, .{ source_, sourceRange_, destination_, destinationIndex_ });
    }
    pub fn optimizeIndirectCommandBuffer_withRange(self_: *@This(), indirectCommandBuffer_: *IndirectCommandBuffer, range_: ns.Range) void {
        return objc.msgSend(self_, "optimizeIndirectCommandBuffer:withRange:", void, .{ indirectCommandBuffer_, range_ });
    }
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *@This(), sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
        return objc.msgSend(self_, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sampleBuffer_, sampleIndex_, barrier_ });
    }
    pub fn resolveCounters_inRange_destinationBuffer_destinationOffset(self_: *@This(), sampleBuffer_: *CounterSampleBuffer, range_: ns.Range, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "resolveCounters:inRange:destinationBuffer:destinationOffset:", void, .{ sampleBuffer_, range_, destinationBuffer_, destinationOffset_ });
    }
};

pub const BlitPassSampleBufferAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBlitPassSampleBufferAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sampleBuffer(self_: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    pub fn setSampleBuffer(self_: *@This(), sampleBuffer_: ?*CounterSampleBuffer) void {
        return objc.msgSend(self_, "setSampleBuffer:", void, .{sampleBuffer_});
    }
    pub fn startOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfEncoderSampleIndex(self_: *@This(), startOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfEncoderSampleIndex:", void, .{startOfEncoderSampleIndex_});
    }
    pub fn endOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfEncoderSampleIndex(self_: *@This(), endOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfEncoderSampleIndex:", void, .{endOfEncoderSampleIndex_});
    }
};

pub const BlitPassSampleBufferAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBlitPassSampleBufferAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *BlitPassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *BlitPassSampleBufferAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*BlitPassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const BlitPassDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBlitPassDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn blitPassDescriptor() *BlitPassDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "blitPassDescriptor", *BlitPassDescriptor, .{});
    }
    pub fn sampleBufferAttachments(self_: *@This()) *BlitPassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self_, "sampleBufferAttachments", *BlitPassSampleBufferAttachmentDescriptorArray, .{});
    }
};

pub const Buffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn contents(self_: *@This()) *anyopaque {
        return objc.msgSend(self_, "contents", *anyopaque, .{});
    }
    pub fn didModifyRange(self_: *@This(), range_: ns.Range) void {
        return objc.msgSend(self_, "didModifyRange:", void, .{range_});
    }
    pub fn newTextureWithDescriptor_offset_bytesPerRow(self_: *@This(), descriptor_: *TextureDescriptor, offset_: ns.UInteger, bytesPerRow_: ns.UInteger) ?*Texture {
        return objc.msgSend(self_, "newTextureWithDescriptor:offset:bytesPerRow:", ?*Texture, .{ descriptor_, offset_, bytesPerRow_ });
    }
    pub fn addDebugMarker_range(self_: *@This(), marker_: *ns.String, range_: ns.Range) void {
        return objc.msgSend(self_, "addDebugMarker:range:", void, .{ marker_, range_ });
    }
    pub fn removeAllDebugMarkers(self_: *@This()) void {
        return objc.msgSend(self_, "removeAllDebugMarkers", void, .{});
    }
    pub fn newRemoteBufferViewForDevice(self_: *@This(), device_: *Device) ?*Buffer {
        return objc.msgSend(self_, "newRemoteBufferViewForDevice:", ?*Buffer, .{device_});
    }
    pub fn length(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "length", ns.UInteger, .{});
    }
    pub fn remoteStorageBuffer(self_: *@This()) *Buffer {
        return objc.msgSend(self_, "remoteStorageBuffer", *Buffer, .{});
    }
    pub fn gpuAddress(self_: *@This()) u64 {
        return objc.msgSend(self_, "gpuAddress", u64, .{});
    }
};

pub const CaptureDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLCaptureDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn captureObject(self_: *@This()) ?*objc.Id {
        return objc.msgSend(self_, "captureObject", ?*objc.Id, .{});
    }
    pub fn setCaptureObject(self_: *@This(), captureObject_: ?*objc.Id) void {
        return objc.msgSend(self_, "setCaptureObject:", void, .{captureObject_});
    }
    pub fn destination(self_: *@This()) CaptureDestination {
        return objc.msgSend(self_, "destination", CaptureDestination, .{});
    }
    pub fn setDestination(self_: *@This(), destination_: CaptureDestination) void {
        return objc.msgSend(self_, "setDestination:", void, .{destination_});
    }
    pub fn outputURL(self_: *@This()) ?*ns.URL {
        return objc.msgSend(self_, "outputURL", ?*ns.URL, .{});
    }
    pub fn setOutputURL(self_: *@This(), outputURL_: ?*ns.URL) void {
        return objc.msgSend(self_, "setOutputURL:", void, .{outputURL_});
    }
};

pub const CaptureManager = opaque {
    pub const InternalInfo = objc.ExternClass("MTLCaptureManager", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sharedCaptureManager() *CaptureManager {
        return objc.msgSend(@This().InternalInfo.class(), "sharedCaptureManager", *CaptureManager, .{});
    }
    pub fn newCaptureScopeWithDevice(self_: *@This(), device_: *Device) *CaptureScope {
        return objc.msgSend(self_, "newCaptureScopeWithDevice:", *CaptureScope, .{device_});
    }
    pub fn newCaptureScopeWithCommandQueue(self_: *@This(), commandQueue_: *CommandQueue) *CaptureScope {
        return objc.msgSend(self_, "newCaptureScopeWithCommandQueue:", *CaptureScope, .{commandQueue_});
    }
    pub fn supportsDestination(self_: *@This(), destination_: CaptureDestination) bool {
        return objc.msgSend(self_, "supportsDestination:", bool, .{destination_});
    }
    pub fn startCaptureWithDescriptor_error(self_: *@This(), descriptor_: *CaptureDescriptor, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "startCaptureWithDescriptor:error:", bool, .{ descriptor_, error_ });
    }
    pub fn startCaptureWithDevice(self_: *@This(), device_: *Device) void {
        return objc.msgSend(self_, "startCaptureWithDevice:", void, .{device_});
    }
    pub fn startCaptureWithCommandQueue(self_: *@This(), commandQueue_: *CommandQueue) void {
        return objc.msgSend(self_, "startCaptureWithCommandQueue:", void, .{commandQueue_});
    }
    pub fn startCaptureWithScope(self_: *@This(), captureScope_: *CaptureScope) void {
        return objc.msgSend(self_, "startCaptureWithScope:", void, .{captureScope_});
    }
    pub fn stopCapture(self_: *@This()) void {
        return objc.msgSend(self_, "stopCapture", void, .{});
    }
    pub fn defaultCaptureScope(self_: *@This()) ?*CaptureScope {
        return objc.msgSend(self_, "defaultCaptureScope", ?*CaptureScope, .{});
    }
    pub fn setDefaultCaptureScope(self_: *@This(), defaultCaptureScope_: ?*CaptureScope) void {
        return objc.msgSend(self_, "setDefaultCaptureScope:", void, .{defaultCaptureScope_});
    }
    pub fn isCapturing(self_: *@This()) bool {
        return objc.msgSend(self_, "isCapturing", bool, .{});
    }
};

pub const CaptureScope = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn beginScope(self_: *@This()) void {
        return objc.msgSend(self_, "beginScope", void, .{});
    }
    pub fn endScope(self_: *@This()) void {
        return objc.msgSend(self_, "endScope", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn commandQueue(self_: *@This()) ?*CommandQueue {
        return objc.msgSend(self_, "commandQueue", ?*CommandQueue, .{});
    }
};

pub const CommandBufferDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLCommandBufferDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn retainedReferences(self_: *@This()) bool {
        return objc.msgSend(self_, "retainedReferences", bool, .{});
    }
    pub fn setRetainedReferences(self_: *@This(), retainedReferences_: bool) void {
        return objc.msgSend(self_, "setRetainedReferences:", void, .{retainedReferences_});
    }
    pub fn errorOptions(self_: *@This()) CommandBufferErrorOption {
        return objc.msgSend(self_, "errorOptions", CommandBufferErrorOption, .{});
    }
    pub fn setErrorOptions(self_: *@This(), errorOptions_: CommandBufferErrorOption) void {
        return objc.msgSend(self_, "setErrorOptions:", void, .{errorOptions_});
    }
};

pub const CommandBufferEncoderInfo = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn label(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "label", *ns.String, .{});
    }
    pub fn debugSignposts(self_: *@This()) *ns.Array(*ns.String) {
        return objc.msgSend(self_, "debugSignposts", *ns.Array(*ns.String), .{});
    }
    pub fn errorState(self_: *@This()) CommandEncoderErrorState {
        return objc.msgSend(self_, "errorState", CommandEncoderErrorState, .{});
    }
};

pub const CommandBuffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn enqueue(self_: *@This()) void {
        return objc.msgSend(self_, "enqueue", void, .{});
    }
    pub fn commit(self_: *@This()) void {
        return objc.msgSend(self_, "commit", void, .{});
    }
    pub fn addScheduledHandler(self_: *@This(), block_: *ns.Block(fn (*CommandBuffer) void)) void {
        return objc.msgSend(self_, "addScheduledHandler:", void, .{block_});
    }
    pub fn presentDrawable(self_: *@This(), drawable_: *Drawable) void {
        return objc.msgSend(self_, "presentDrawable:", void, .{drawable_});
    }
    pub fn presentDrawable_atTime(self_: *@This(), drawable_: *Drawable, presentationTime_: cf.TimeInterval) void {
        return objc.msgSend(self_, "presentDrawable:atTime:", void, .{ drawable_, presentationTime_ });
    }
    pub fn presentDrawable_afterMinimumDuration(self_: *@This(), drawable_: *Drawable, duration_: cf.TimeInterval) void {
        return objc.msgSend(self_, "presentDrawable:afterMinimumDuration:", void, .{ drawable_, duration_ });
    }
    pub fn waitUntilScheduled(self_: *@This()) void {
        return objc.msgSend(self_, "waitUntilScheduled", void, .{});
    }
    pub fn addCompletedHandler(self_: *@This(), block_: *ns.Block(fn (*CommandBuffer) void)) void {
        return objc.msgSend(self_, "addCompletedHandler:", void, .{block_});
    }
    pub fn waitUntilCompleted(self_: *@This()) void {
        return objc.msgSend(self_, "waitUntilCompleted", void, .{});
    }
    pub fn blitCommandEncoder(self_: *@This()) ?*BlitCommandEncoder {
        return objc.msgSend(self_, "blitCommandEncoder", ?*BlitCommandEncoder, .{});
    }
    pub fn renderCommandEncoderWithDescriptor(self_: *@This(), renderPassDescriptor_: *RenderPassDescriptor) ?*RenderCommandEncoder {
        return objc.msgSend(self_, "renderCommandEncoderWithDescriptor:", ?*RenderCommandEncoder, .{renderPassDescriptor_});
    }
    pub fn computeCommandEncoderWithDescriptor(self_: *@This(), computePassDescriptor_: *ComputePassDescriptor) ?*ComputeCommandEncoder {
        return objc.msgSend(self_, "computeCommandEncoderWithDescriptor:", ?*ComputeCommandEncoder, .{computePassDescriptor_});
    }
    pub fn blitCommandEncoderWithDescriptor(self_: *@This(), blitPassDescriptor_: *BlitPassDescriptor) ?*BlitCommandEncoder {
        return objc.msgSend(self_, "blitCommandEncoderWithDescriptor:", ?*BlitCommandEncoder, .{blitPassDescriptor_});
    }
    pub fn computeCommandEncoder(self_: *@This()) ?*ComputeCommandEncoder {
        return objc.msgSend(self_, "computeCommandEncoder", ?*ComputeCommandEncoder, .{});
    }
    pub fn computeCommandEncoderWithDispatchType(self_: *@This(), dispatchType_: DispatchType) ?*ComputeCommandEncoder {
        return objc.msgSend(self_, "computeCommandEncoderWithDispatchType:", ?*ComputeCommandEncoder, .{dispatchType_});
    }
    pub fn encodeWaitForEvent_value(self_: *@This(), event_: *Event, value_: u64) void {
        return objc.msgSend(self_, "encodeWaitForEvent:value:", void, .{ event_, value_ });
    }
    pub fn encodeSignalEvent_value(self_: *@This(), event_: *Event, value_: u64) void {
        return objc.msgSend(self_, "encodeSignalEvent:value:", void, .{ event_, value_ });
    }
    pub fn parallelRenderCommandEncoderWithDescriptor(self_: *@This(), renderPassDescriptor_: *RenderPassDescriptor) ?*ParallelRenderCommandEncoder {
        return objc.msgSend(self_, "parallelRenderCommandEncoderWithDescriptor:", ?*ParallelRenderCommandEncoder, .{renderPassDescriptor_});
    }
    pub fn resourceStateCommandEncoder(self_: *@This()) ?*ResourceStateCommandEncoder {
        return objc.msgSend(self_, "resourceStateCommandEncoder", ?*ResourceStateCommandEncoder, .{});
    }
    pub fn resourceStateCommandEncoderWithDescriptor(self_: *@This(), resourceStatePassDescriptor_: *ResourceStatePassDescriptor) ?*ResourceStateCommandEncoder {
        return objc.msgSend(self_, "resourceStateCommandEncoderWithDescriptor:", ?*ResourceStateCommandEncoder, .{resourceStatePassDescriptor_});
    }
    pub fn accelerationStructureCommandEncoder(self_: *@This()) ?*AccelerationStructureCommandEncoder {
        return objc.msgSend(self_, "accelerationStructureCommandEncoder", ?*AccelerationStructureCommandEncoder, .{});
    }
    pub fn accelerationStructureCommandEncoderWithDescriptor(self_: *@This(), descriptor_: *AccelerationStructurePassDescriptor) *AccelerationStructureCommandEncoder {
        return objc.msgSend(self_, "accelerationStructureCommandEncoderWithDescriptor:", *AccelerationStructureCommandEncoder, .{descriptor_});
    }
    pub fn pushDebugGroup(self_: *@This(), string_: *ns.String) void {
        return objc.msgSend(self_, "pushDebugGroup:", void, .{string_});
    }
    pub fn popDebugGroup(self_: *@This()) void {
        return objc.msgSend(self_, "popDebugGroup", void, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn commandQueue(self_: *@This()) *CommandQueue {
        return objc.msgSend(self_, "commandQueue", *CommandQueue, .{});
    }
    pub fn retainedReferences(self_: *@This()) bool {
        return objc.msgSend(self_, "retainedReferences", bool, .{});
    }
    pub fn errorOptions(self_: *@This()) CommandBufferErrorOption {
        return objc.msgSend(self_, "errorOptions", CommandBufferErrorOption, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn kernelStartTime(self_: *@This()) cf.TimeInterval {
        return objc.msgSend(self_, "kernelStartTime", cf.TimeInterval, .{});
    }
    pub fn kernelEndTime(self_: *@This()) cf.TimeInterval {
        return objc.msgSend(self_, "kernelEndTime", cf.TimeInterval, .{});
    }
    pub fn logs(self_: *@This()) *LogContainer {
        return objc.msgSend(self_, "logs", *LogContainer, .{});
    }
    pub fn GPUStartTime(self_: *@This()) cf.TimeInterval {
        return objc.msgSend(self_, "GPUStartTime", cf.TimeInterval, .{});
    }
    pub fn GPUEndTime(self_: *@This()) cf.TimeInterval {
        return objc.msgSend(self_, "GPUEndTime", cf.TimeInterval, .{});
    }
    pub fn status(self_: *@This()) CommandBufferStatus {
        return objc.msgSend(self_, "status", CommandBufferStatus, .{});
    }
    pub fn @"error"(self_: *@This()) ?*ns.Error {
        return objc.msgSend(self_, "error", ?*ns.Error, .{});
    }
};

pub const CommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn endEncoding(self_: *@This()) void {
        return objc.msgSend(self_, "endEncoding", void, .{});
    }
    pub fn insertDebugSignpost(self_: *@This(), string_: *ns.String) void {
        return objc.msgSend(self_, "insertDebugSignpost:", void, .{string_});
    }
    pub fn pushDebugGroup(self_: *@This(), string_: *ns.String) void {
        return objc.msgSend(self_, "pushDebugGroup:", void, .{string_});
    }
    pub fn popDebugGroup(self_: *@This()) void {
        return objc.msgSend(self_, "popDebugGroup", void, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const CommandQueue = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn commandBuffer(self_: *@This()) ?*CommandBuffer {
        return objc.msgSend(self_, "commandBuffer", ?*CommandBuffer, .{});
    }
    pub fn commandBufferWithDescriptor(self_: *@This(), descriptor_: *CommandBufferDescriptor) ?*CommandBuffer {
        return objc.msgSend(self_, "commandBufferWithDescriptor:", ?*CommandBuffer, .{descriptor_});
    }
    pub fn commandBufferWithUnretainedReferences(self_: *@This()) ?*CommandBuffer {
        return objc.msgSend(self_, "commandBufferWithUnretainedReferences", ?*CommandBuffer, .{});
    }
    pub fn insertDebugCaptureBoundary(self_: *@This()) void {
        return objc.msgSend(self_, "insertDebugCaptureBoundary", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
};

pub const ComputeCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setComputePipelineState(self_: *@This(), state_: *ComputePipelineState) void {
        return objc.msgSend(self_, "setComputePipelineState:", void, .{state_});
    }
    pub fn setBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setBuffer_offset_attributeStride_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBuffer:offset:attributeStride:atIndex:", void, .{ buffer_, offset_, stride_, index_ });
    }
    pub fn setBuffers_offsets_attributeStrides_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, strides_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setBuffers:offsets:attributeStrides:withRange:", void, .{ buffers_, offsets_, strides_, range_ });
    }
    pub fn setBufferOffset_attributeStride_atIndex(self_: *@This(), offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBufferOffset:attributeStride:atIndex:", void, .{ offset_, stride_, index_ });
    }
    pub fn setBytes_length_attributeStride_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBytes:length:attributeStride:atIndex:", void, .{ bytes_, length_, stride_, index_ });
    }
    pub fn setVisibleFunctionTable_atBufferIndex(self_: *@This(), visibleFunctionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setVisibleFunctionTable:atBufferIndex:", void, .{ visibleFunctionTable_, bufferIndex_ });
    }
    pub fn setVisibleFunctionTables_withBufferRange(self_: *@This(), visibleFunctionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setVisibleFunctionTables:withBufferRange:", void, .{ visibleFunctionTables_, range_ });
    }
    pub fn setIntersectionFunctionTable_atBufferIndex(self_: *@This(), intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setIntersectionFunctionTable:atBufferIndex:", void, .{ intersectionFunctionTable_, bufferIndex_ });
    }
    pub fn setIntersectionFunctionTables_withBufferRange(self_: *@This(), intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setIntersectionFunctionTables:withBufferRange:", void, .{ intersectionFunctionTables_, range_ });
    }
    pub fn setAccelerationStructure_atBufferIndex(self_: *@This(), accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setAccelerationStructure:atBufferIndex:", void, .{ accelerationStructure_, bufferIndex_ });
    }
    pub fn setTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn setThreadgroupMemoryLength_atIndex(self_: *@This(), length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setThreadgroupMemoryLength:atIndex:", void, .{ length_, index_ });
    }
    pub fn setImageblockWidth_height(self_: *@This(), width_: ns.UInteger, height_: ns.UInteger) void {
        return objc.msgSend(self_, "setImageblockWidth:height:", void, .{ width_, height_ });
    }
    pub fn setStageInRegion(self_: *@This(), region_: Region) void {
        return objc.msgSend(self_, "setStageInRegion:", void, .{region_});
    }
    pub fn setStageInRegionWithIndirectBuffer_indirectBufferOffset(self_: *@This(), indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", void, .{ indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn dispatchThreadgroups_threadsPerThreadgroup(self_: *@This(), threadgroupsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
        return objc.msgSend(self_, "dispatchThreadgroups:threadsPerThreadgroup:", void, .{ threadgroupsPerGrid_, threadsPerThreadgroup_ });
    }
    pub fn dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup(self_: *@This(), indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger, threadsPerThreadgroup_: Size) void {
        return objc.msgSend(self_, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", void, .{ indirectBuffer_, indirectBufferOffset_, threadsPerThreadgroup_ });
    }
    pub fn dispatchThreads_threadsPerThreadgroup(self_: *@This(), threadsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
        return objc.msgSend(self_, "dispatchThreads:threadsPerThreadgroup:", void, .{ threadsPerGrid_, threadsPerThreadgroup_ });
    }
    pub fn updateFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "updateFence:", void, .{fence_});
    }
    pub fn waitForFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "waitForFence:", void, .{fence_});
    }
    pub fn useResource_usage(self_: *@This(), resource_: *Resource, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResource:usage:", void, .{ resource_, usage_ });
    }
    pub fn useResources_count_usage(self_: *@This(), resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResources:count:usage:", void, .{ resources_, count_, usage_ });
    }
    pub fn useHeap(self_: *@This(), heap_: *Heap) void {
        return objc.msgSend(self_, "useHeap:", void, .{heap_});
    }
    pub fn useHeaps_count(self_: *@This(), heaps_: **const Heap, count_: ns.UInteger) void {
        return objc.msgSend(self_, "useHeaps:count:", void, .{ heaps_, count_ });
    }
    pub fn executeCommandsInBuffer_withRange(self_: *@This(), indirectCommandBuffer_: *IndirectCommandBuffer, executionRange_: ns.Range) void {
        return objc.msgSend(self_, "executeCommandsInBuffer:withRange:", void, .{ indirectCommandBuffer_, executionRange_ });
    }
    pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset(self_: *@This(), indirectCommandbuffer_: *IndirectCommandBuffer, indirectRangeBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", void, .{ indirectCommandbuffer_, indirectRangeBuffer_, indirectBufferOffset_ });
    }
    pub fn memoryBarrierWithScope(self_: *@This(), scope_: BarrierScope) void {
        return objc.msgSend(self_, "memoryBarrierWithScope:", void, .{scope_});
    }
    pub fn memoryBarrierWithResources_count(self_: *@This(), resources_: **const Resource, count_: ns.UInteger) void {
        return objc.msgSend(self_, "memoryBarrierWithResources:count:", void, .{ resources_, count_ });
    }
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *@This(), sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
        return objc.msgSend(self_, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sampleBuffer_, sampleIndex_, barrier_ });
    }
    pub fn dispatchType(self_: *@This()) DispatchType {
        return objc.msgSend(self_, "dispatchType", DispatchType, .{});
    }
};

pub const ComputePassSampleBufferAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLComputePassSampleBufferAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sampleBuffer(self_: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    pub fn setSampleBuffer(self_: *@This(), sampleBuffer_: ?*CounterSampleBuffer) void {
        return objc.msgSend(self_, "setSampleBuffer:", void, .{sampleBuffer_});
    }
    pub fn startOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfEncoderSampleIndex(self_: *@This(), startOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfEncoderSampleIndex:", void, .{startOfEncoderSampleIndex_});
    }
    pub fn endOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfEncoderSampleIndex(self_: *@This(), endOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfEncoderSampleIndex:", void, .{endOfEncoderSampleIndex_});
    }
};

pub const ComputePassSampleBufferAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLComputePassSampleBufferAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *ComputePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *ComputePassSampleBufferAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*ComputePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const ComputePassDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLComputePassDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn computePassDescriptor() *ComputePassDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "computePassDescriptor", *ComputePassDescriptor, .{});
    }
    pub fn dispatchType(self_: *@This()) DispatchType {
        return objc.msgSend(self_, "dispatchType", DispatchType, .{});
    }
    pub fn setDispatchType(self_: *@This(), dispatchType_: DispatchType) void {
        return objc.msgSend(self_, "setDispatchType:", void, .{dispatchType_});
    }
    pub fn sampleBufferAttachments(self_: *@This()) *ComputePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self_, "sampleBufferAttachments", *ComputePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

pub const ComputePipelineReflection = opaque {
    pub const InternalInfo = objc.ExternClass("MTLComputePipelineReflection", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn bindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "bindings", *ns.Array(*Binding), .{});
    }
    pub fn arguments(self_: *@This()) *ns.Array(*Argument) {
        return objc.msgSend(self_, "arguments", *ns.Array(*Argument), .{});
    }
};

pub const ComputePipelineDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLComputePipelineDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn computeFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "computeFunction", ?*Function, .{});
    }
    pub fn setComputeFunction(self_: *@This(), computeFunction_: ?*Function) void {
        return objc.msgSend(self_, "setComputeFunction:", void, .{computeFunction_});
    }
    pub fn threadGroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This()) bool {
        return objc.msgSend(self_, "threadGroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    pub fn setThreadGroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This(), threadGroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
        return objc.msgSend(self_, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", void, .{threadGroupSizeIsMultipleOfThreadExecutionWidth_});
    }
    pub fn maxTotalThreadsPerThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerThreadgroup", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadsPerThreadgroup(self_: *@This(), maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadsPerThreadgroup:", void, .{maxTotalThreadsPerThreadgroup_});
    }
    pub fn stageInputDescriptor(self_: *@This()) ?*StageInputOutputDescriptor {
        return objc.msgSend(self_, "stageInputDescriptor", ?*StageInputOutputDescriptor, .{});
    }
    pub fn setStageInputDescriptor(self_: *@This(), stageInputDescriptor_: ?*StageInputOutputDescriptor) void {
        return objc.msgSend(self_, "setStageInputDescriptor:", void, .{stageInputDescriptor_});
    }
    pub fn buffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "buffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn supportIndirectCommandBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportIndirectCommandBuffers", bool, .{});
    }
    pub fn setSupportIndirectCommandBuffers(self_: *@This(), supportIndirectCommandBuffers_: bool) void {
        return objc.msgSend(self_, "setSupportIndirectCommandBuffers:", void, .{supportIndirectCommandBuffers_});
    }
    pub fn insertLibraries(self_: *@This()) ?*ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "insertLibraries", ?*ns.Array(*DynamicLibrary), .{});
    }
    pub fn setInsertLibraries(self_: *@This(), insertLibraries_: ?*ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setInsertLibraries:", void, .{insertLibraries_});
    }
    pub fn preloadedLibraries(self_: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "preloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    pub fn setPreloadedLibraries(self_: *@This(), preloadedLibraries_: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setPreloadedLibraries:", void, .{preloadedLibraries_});
    }
    pub fn binaryArchives(self_: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self_, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    pub fn setBinaryArchives(self_: *@This(), binaryArchives_: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self_, "setBinaryArchives:", void, .{binaryArchives_});
    }
    pub fn linkedFunctions(self_: *@This()) ?*LinkedFunctions {
        return objc.msgSend(self_, "linkedFunctions", ?*LinkedFunctions, .{});
    }
    pub fn setLinkedFunctions(self_: *@This(), linkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setLinkedFunctions:", void, .{linkedFunctions_});
    }
    pub fn supportAddingBinaryFunctions(self_: *@This()) bool {
        return objc.msgSend(self_, "supportAddingBinaryFunctions", bool, .{});
    }
    pub fn setSupportAddingBinaryFunctions(self_: *@This(), supportAddingBinaryFunctions_: bool) void {
        return objc.msgSend(self_, "setSupportAddingBinaryFunctions:", void, .{supportAddingBinaryFunctions_});
    }
    pub fn maxCallStackDepth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxCallStackDepth", ns.UInteger, .{});
    }
    pub fn setMaxCallStackDepth(self_: *@This(), maxCallStackDepth_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxCallStackDepth:", void, .{maxCallStackDepth_});
    }
};

pub const ComputePipelineState = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn imageblockMemoryLengthForDimensions(self_: *@This(), imageblockDimensions_: Size) ns.UInteger {
        return objc.msgSend(self_, "imageblockMemoryLengthForDimensions:", ns.UInteger, .{imageblockDimensions_});
    }
    pub fn functionHandleWithFunction(self_: *@This(), function_: *Function) ?*FunctionHandle {
        return objc.msgSend(self_, "functionHandleWithFunction:", ?*FunctionHandle, .{function_});
    }
    pub fn newComputePipelineStateWithAdditionalBinaryFunctions_error(self_: *@This(), functions_: *ns.Array(*Function), error_: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self_, "newComputePipelineStateWithAdditionalBinaryFunctions:error:", ?*ComputePipelineState, .{ functions_, error_ });
    }
    pub fn newVisibleFunctionTableWithDescriptor(self_: *@This(), descriptor_: *VisibleFunctionTableDescriptor) ?*VisibleFunctionTable {
        return objc.msgSend(self_, "newVisibleFunctionTableWithDescriptor:", ?*VisibleFunctionTable, .{descriptor_});
    }
    pub fn newIntersectionFunctionTableWithDescriptor(self_: *@This(), descriptor_: *IntersectionFunctionTableDescriptor) ?*IntersectionFunctionTable {
        return objc.msgSend(self_, "newIntersectionFunctionTableWithDescriptor:", ?*IntersectionFunctionTable, .{descriptor_});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn maxTotalThreadsPerThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerThreadgroup", ns.UInteger, .{});
    }
    pub fn threadExecutionWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadExecutionWidth", ns.UInteger, .{});
    }
    pub fn staticThreadgroupMemoryLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "staticThreadgroupMemoryLength", ns.UInteger, .{});
    }
    pub fn supportIndirectCommandBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportIndirectCommandBuffers", bool, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const Counter = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
};

pub const CounterSet = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn counters(self_: *@This()) *ns.Array(*Counter) {
        return objc.msgSend(self_, "counters", *ns.Array(*Counter), .{});
    }
};

pub const CounterSampleBufferDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLCounterSampleBufferDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn counterSet(self_: *@This()) ?*CounterSet {
        return objc.msgSend(self_, "counterSet", ?*CounterSet, .{});
    }
    pub fn setCounterSet(self_: *@This(), counterSet_: ?*CounterSet) void {
        return objc.msgSend(self_, "setCounterSet:", void, .{counterSet_});
    }
    pub fn label(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "label", *ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: *ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn storageMode(self_: *@This()) StorageMode {
        return objc.msgSend(self_, "storageMode", StorageMode, .{});
    }
    pub fn setStorageMode(self_: *@This(), storageMode_: StorageMode) void {
        return objc.msgSend(self_, "setStorageMode:", void, .{storageMode_});
    }
    pub fn sampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sampleCount", ns.UInteger, .{});
    }
    pub fn setSampleCount(self_: *@This(), sampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setSampleCount:", void, .{sampleCount_});
    }
};

pub const CounterSampleBuffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn resolveCounterRange(self_: *@This(), range_: ns.Range) ?*ns.Data {
        return objc.msgSend(self_, "resolveCounterRange:", ?*ns.Data, .{range_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "label", *ns.String, .{});
    }
    pub fn sampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sampleCount", ns.UInteger, .{});
    }
};

pub const StencilDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLStencilDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn stencilCompareFunction(self_: *@This()) CompareFunction {
        return objc.msgSend(self_, "stencilCompareFunction", CompareFunction, .{});
    }
    pub fn setStencilCompareFunction(self_: *@This(), stencilCompareFunction_: CompareFunction) void {
        return objc.msgSend(self_, "setStencilCompareFunction:", void, .{stencilCompareFunction_});
    }
    pub fn stencilFailureOperation(self_: *@This()) StencilOperation {
        return objc.msgSend(self_, "stencilFailureOperation", StencilOperation, .{});
    }
    pub fn setStencilFailureOperation(self_: *@This(), stencilFailureOperation_: StencilOperation) void {
        return objc.msgSend(self_, "setStencilFailureOperation:", void, .{stencilFailureOperation_});
    }
    pub fn depthFailureOperation(self_: *@This()) StencilOperation {
        return objc.msgSend(self_, "depthFailureOperation", StencilOperation, .{});
    }
    pub fn setDepthFailureOperation(self_: *@This(), depthFailureOperation_: StencilOperation) void {
        return objc.msgSend(self_, "setDepthFailureOperation:", void, .{depthFailureOperation_});
    }
    pub fn depthStencilPassOperation(self_: *@This()) StencilOperation {
        return objc.msgSend(self_, "depthStencilPassOperation", StencilOperation, .{});
    }
    pub fn setDepthStencilPassOperation(self_: *@This(), depthStencilPassOperation_: StencilOperation) void {
        return objc.msgSend(self_, "setDepthStencilPassOperation:", void, .{depthStencilPassOperation_});
    }
    pub fn readMask(self_: *@This()) u32 {
        return objc.msgSend(self_, "readMask", u32, .{});
    }
    pub fn setReadMask(self_: *@This(), readMask_: u32) void {
        return objc.msgSend(self_, "setReadMask:", void, .{readMask_});
    }
    pub fn writeMask(self_: *@This()) u32 {
        return objc.msgSend(self_, "writeMask", u32, .{});
    }
    pub fn setWriteMask(self_: *@This(), writeMask_: u32) void {
        return objc.msgSend(self_, "setWriteMask:", void, .{writeMask_});
    }
};

pub const DepthStencilDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLDepthStencilDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn depthCompareFunction(self_: *@This()) CompareFunction {
        return objc.msgSend(self_, "depthCompareFunction", CompareFunction, .{});
    }
    pub fn setDepthCompareFunction(self_: *@This(), depthCompareFunction_: CompareFunction) void {
        return objc.msgSend(self_, "setDepthCompareFunction:", void, .{depthCompareFunction_});
    }
    pub fn isDepthWriteEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isDepthWriteEnabled", bool, .{});
    }
    pub fn setDepthWriteEnabled(self_: *@This(), depthWriteEnabled_: bool) void {
        return objc.msgSend(self_, "setDepthWriteEnabled:", void, .{depthWriteEnabled_});
    }
    pub fn frontFaceStencil(self_: *@This()) *StencilDescriptor {
        return objc.msgSend(self_, "frontFaceStencil", *StencilDescriptor, .{});
    }
    pub fn setFrontFaceStencil(self_: *@This(), frontFaceStencil_: ?*StencilDescriptor) void {
        return objc.msgSend(self_, "setFrontFaceStencil:", void, .{frontFaceStencil_});
    }
    pub fn backFaceStencil(self_: *@This()) *StencilDescriptor {
        return objc.msgSend(self_, "backFaceStencil", *StencilDescriptor, .{});
    }
    pub fn setBackFaceStencil(self_: *@This(), backFaceStencil_: ?*StencilDescriptor) void {
        return objc.msgSend(self_, "setBackFaceStencil:", void, .{backFaceStencil_});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const DepthStencilState = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
};

pub const Architecture = opaque {
    pub const InternalInfo = objc.ExternClass("MTLArchitecture", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
};

pub const ArgumentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLArgumentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn argumentDescriptor() *ArgumentDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "argumentDescriptor", *ArgumentDescriptor, .{});
    }
    pub fn dataType(self_: *@This()) DataType {
        return objc.msgSend(self_, "dataType", DataType, .{});
    }
    pub fn setDataType(self_: *@This(), dataType_: DataType) void {
        return objc.msgSend(self_, "setDataType:", void, .{dataType_});
    }
    pub fn index(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "index", ns.UInteger, .{});
    }
    pub fn setIndex(self_: *@This(), index_: ns.UInteger) void {
        return objc.msgSend(self_, "setIndex:", void, .{index_});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
    pub fn setArrayLength(self_: *@This(), arrayLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setArrayLength:", void, .{arrayLength_});
    }
    pub fn access(self_: *@This()) BindingAccess {
        return objc.msgSend(self_, "access", BindingAccess, .{});
    }
    pub fn setAccess(self_: *@This(), access_: BindingAccess) void {
        return objc.msgSend(self_, "setAccess:", void, .{access_});
    }
    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn setTextureType(self_: *@This(), textureType_: TextureType) void {
        return objc.msgSend(self_, "setTextureType:", void, .{textureType_});
    }
    pub fn constantBlockAlignment(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "constantBlockAlignment", ns.UInteger, .{});
    }
    pub fn setConstantBlockAlignment(self_: *@This(), constantBlockAlignment_: ns.UInteger) void {
        return objc.msgSend(self_, "setConstantBlockAlignment:", void, .{constantBlockAlignment_});
    }
};

pub const Device = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn newCommandQueue(self_: *@This()) ?*CommandQueue {
        return objc.msgSend(self_, "newCommandQueue", ?*CommandQueue, .{});
    }
    pub fn newCommandQueueWithMaxCommandBufferCount(self_: *@This(), maxCommandBufferCount_: ns.UInteger) ?*CommandQueue {
        return objc.msgSend(self_, "newCommandQueueWithMaxCommandBufferCount:", ?*CommandQueue, .{maxCommandBufferCount_});
    }
    pub fn heapTextureSizeAndAlignWithDescriptor(self_: *@This(), desc_: *TextureDescriptor) SizeAndAlign {
        return objc.msgSend(self_, "heapTextureSizeAndAlignWithDescriptor:", SizeAndAlign, .{desc_});
    }
    pub fn heapBufferSizeAndAlignWithLength_options(self_: *@This(), length_: ns.UInteger, options_: ResourceOptions) SizeAndAlign {
        return objc.msgSend(self_, "heapBufferSizeAndAlignWithLength:options:", SizeAndAlign, .{ length_, options_ });
    }
    pub fn newHeapWithDescriptor(self_: *@This(), descriptor_: *HeapDescriptor) ?*Heap {
        return objc.msgSend(self_, "newHeapWithDescriptor:", ?*Heap, .{descriptor_});
    }
    pub fn newBufferWithLength_options(self_: *@This(), length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
        return objc.msgSend(self_, "newBufferWithLength:options:", ?*Buffer, .{ length_, options_ });
    }
    pub fn newBufferWithBytes_length_options(self_: *@This(), pointer_: *const anyopaque, length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
        return objc.msgSend(self_, "newBufferWithBytes:length:options:", ?*Buffer, .{ pointer_, length_, options_ });
    }
    pub fn newBufferWithBytesNoCopy_length_options_deallocator(self_: *@This(), pointer_: *anyopaque, length_: ns.UInteger, options_: ResourceOptions, deallocator_: *ns.Block(fn (*anyopaque, ns.UInteger) void)) ?*Buffer {
        return objc.msgSend(self_, "newBufferWithBytesNoCopy:length:options:deallocator:", ?*Buffer, .{ pointer_, length_, options_, deallocator_ });
    }
    pub fn newDepthStencilStateWithDescriptor(self_: *@This(), descriptor_: *DepthStencilDescriptor) ?*DepthStencilState {
        return objc.msgSend(self_, "newDepthStencilStateWithDescriptor:", ?*DepthStencilState, .{descriptor_});
    }
    pub fn newTextureWithDescriptor(self_: *@This(), descriptor_: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self_, "newTextureWithDescriptor:", ?*Texture, .{descriptor_});
    }
    pub fn newTextureWithDescriptor_iosurface_plane(self_: *@This(), descriptor_: *TextureDescriptor, iosurface_: IOSurfaceRef, plane_: ns.UInteger) ?*Texture {
        return objc.msgSend(self_, "newTextureWithDescriptor:iosurface:plane:", ?*Texture, .{ descriptor_, iosurface_, plane_ });
    }
    pub fn newSharedTextureWithDescriptor(self_: *@This(), descriptor_: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self_, "newSharedTextureWithDescriptor:", ?*Texture, .{descriptor_});
    }
    pub fn newSharedTextureWithHandle(self_: *@This(), sharedHandle_: *SharedTextureHandle) ?*Texture {
        return objc.msgSend(self_, "newSharedTextureWithHandle:", ?*Texture, .{sharedHandle_});
    }
    pub fn newSamplerStateWithDescriptor(self_: *@This(), descriptor_: *SamplerDescriptor) ?*SamplerState {
        return objc.msgSend(self_, "newSamplerStateWithDescriptor:", ?*SamplerState, .{descriptor_});
    }
    pub fn newDefaultLibrary(self_: *@This()) ?*Library {
        return objc.msgSend(self_, "newDefaultLibrary", ?*Library, .{});
    }
    pub fn newDefaultLibraryWithBundle_error(self_: *@This(), bundle_: *ns.Bundle, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newDefaultLibraryWithBundle:error:", ?*Library, .{ bundle_, error_ });
    }
    pub fn newLibraryWithFile_error(self_: *@This(), filepath_: *ns.String, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newLibraryWithFile:error:", ?*Library, .{ filepath_, error_ });
    }
    pub fn newLibraryWithURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newLibraryWithURL:error:", ?*Library, .{ url_, error_ });
    }
    pub fn newLibraryWithData_error(self_: *@This(), data_: dispatch_data_t, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newLibraryWithData:error:", ?*Library, .{ data_, error_ });
    }
    pub fn newLibraryWithSource_options_error(self_: *@This(), source_: *ns.String, options_: ?*CompileOptions, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newLibraryWithSource:options:error:", ?*Library, .{ source_, options_, error_ });
    }
    pub fn newLibraryWithSource_options_completionHandler(self_: *@This(), source_: *ns.String, options_: ?*CompileOptions, completionHandler_: *ns.Block(fn (?*Library, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newLibraryWithSource:options:completionHandler:", void, .{ source_, options_, completionHandler_ });
    }
    pub fn newLibraryWithStitchedDescriptor_error(self_: *@This(), descriptor_: *StitchedLibraryDescriptor, error_: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self_, "newLibraryWithStitchedDescriptor:error:", ?*Library, .{ descriptor_, error_ });
    }
    pub fn newLibraryWithStitchedDescriptor_completionHandler(self_: *@This(), descriptor_: *StitchedLibraryDescriptor, completionHandler_: *ns.Block(fn (?*Library, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newLibraryWithStitchedDescriptor:completionHandler:", void, .{ descriptor_, completionHandler_ });
    }
    pub fn newRenderPipelineStateWithDescriptor_error(self_: *@This(), descriptor_: *RenderPipelineDescriptor, error_: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self_, "newRenderPipelineStateWithDescriptor:error:", ?*RenderPipelineState, .{ descriptor_, error_ });
    }
    pub fn newRenderPipelineStateWithDescriptor_options_reflection_error(self_: *@This(), descriptor_: *RenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self_, "newRenderPipelineStateWithDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor_, options_, reflection_, error_ });
    }
    pub fn newRenderPipelineStateWithDescriptor_completionHandler(self_: *@This(), descriptor_: *RenderPipelineDescriptor, completionHandler_: *ns.Block(fn (?*RenderPipelineState, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newRenderPipelineStateWithDescriptor:completionHandler:", void, .{ descriptor_, completionHandler_ });
    }
    pub fn newRenderPipelineStateWithDescriptor_options_completionHandler(self_: *@This(), descriptor_: *RenderPipelineDescriptor, options_: PipelineOption, completionHandler_: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newRenderPipelineStateWithDescriptor:options:completionHandler:", void, .{ descriptor_, options_, completionHandler_ });
    }
    pub fn newComputePipelineStateWithFunction_error(self_: *@This(), computeFunction_: *Function, error_: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self_, "newComputePipelineStateWithFunction:error:", ?*ComputePipelineState, .{ computeFunction_, error_ });
    }
    pub fn newComputePipelineStateWithFunction_options_reflection_error(self_: *@This(), computeFunction_: *Function, options_: PipelineOption, reflection_: ?*AutoreleasedComputePipelineReflection, error_: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self_, "newComputePipelineStateWithFunction:options:reflection:error:", ?*ComputePipelineState, .{ computeFunction_, options_, reflection_, error_ });
    }
    pub fn newComputePipelineStateWithFunction_completionHandler(self_: *@This(), computeFunction_: *Function, completionHandler_: *ns.Block(fn (?*ComputePipelineState, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newComputePipelineStateWithFunction:completionHandler:", void, .{ computeFunction_, completionHandler_ });
    }
    pub fn newComputePipelineStateWithFunction_options_completionHandler(self_: *@This(), computeFunction_: *Function, options_: PipelineOption, completionHandler_: *ns.Block(fn (?*ComputePipelineState, *ComputePipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newComputePipelineStateWithFunction:options:completionHandler:", void, .{ computeFunction_, options_, completionHandler_ });
    }
    pub fn newComputePipelineStateWithDescriptor_options_reflection_error(self_: *@This(), descriptor_: *ComputePipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedComputePipelineReflection, error_: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self_, "newComputePipelineStateWithDescriptor:options:reflection:error:", ?*ComputePipelineState, .{ descriptor_, options_, reflection_, error_ });
    }
    pub fn newComputePipelineStateWithDescriptor_options_completionHandler(self_: *@This(), descriptor_: *ComputePipelineDescriptor, options_: PipelineOption, completionHandler_: *ns.Block(fn (?*ComputePipelineState, *ComputePipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newComputePipelineStateWithDescriptor:options:completionHandler:", void, .{ descriptor_, options_, completionHandler_ });
    }
    pub fn newFence(self_: *@This()) ?*Fence {
        return objc.msgSend(self_, "newFence", ?*Fence, .{});
    }
    pub fn supportsFeatureSet(self_: *@This(), featureSet_: FeatureSet) bool {
        return objc.msgSend(self_, "supportsFeatureSet:", bool, .{featureSet_});
    }
    pub fn supportsFamily(self_: *@This(), gpuFamily_: GPUFamily) bool {
        return objc.msgSend(self_, "supportsFamily:", bool, .{gpuFamily_});
    }
    pub fn supportsTextureSampleCount(self_: *@This(), sampleCount_: ns.UInteger) bool {
        return objc.msgSend(self_, "supportsTextureSampleCount:", bool, .{sampleCount_});
    }
    pub fn minimumLinearTextureAlignmentForPixelFormat(self_: *@This(), format_: PixelFormat) ns.UInteger {
        return objc.msgSend(self_, "minimumLinearTextureAlignmentForPixelFormat:", ns.UInteger, .{format_});
    }
    pub fn minimumTextureBufferAlignmentForPixelFormat(self_: *@This(), format_: PixelFormat) ns.UInteger {
        return objc.msgSend(self_, "minimumTextureBufferAlignmentForPixelFormat:", ns.UInteger, .{format_});
    }
    pub fn newRenderPipelineStateWithTileDescriptor_options_reflection_error(self_: *@This(), descriptor_: *TileRenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self_, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor_, options_, reflection_, error_ });
    }
    pub fn newRenderPipelineStateWithTileDescriptor_options_completionHandler(self_: *@This(), descriptor_: *TileRenderPipelineDescriptor, options_: PipelineOption, completionHandler_: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", void, .{ descriptor_, options_, completionHandler_ });
    }
    pub fn newRenderPipelineStateWithMeshDescriptor_options_reflection_error(self_: *@This(), descriptor_: *MeshRenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self_, "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor_, options_, reflection_, error_ });
    }
    pub fn newRenderPipelineStateWithMeshDescriptor_options_completionHandler(self_: *@This(), descriptor_: *MeshRenderPipelineDescriptor, options_: PipelineOption, completionHandler_: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", void, .{ descriptor_, options_, completionHandler_ });
    }
    pub fn getDefaultSamplePositions_count(self_: *@This(), positions_: *SamplePosition, count_: ns.UInteger) void {
        return objc.msgSend(self_, "getDefaultSamplePositions:count:", void, .{ positions_, count_ });
    }
    pub fn newArgumentEncoderWithArguments(self_: *@This(), arguments_: *ns.Array(*ArgumentDescriptor)) ?*ArgumentEncoder {
        return objc.msgSend(self_, "newArgumentEncoderWithArguments:", ?*ArgumentEncoder, .{arguments_});
    }
    pub fn supportsRasterizationRateMapWithLayerCount(self_: *@This(), layerCount_: ns.UInteger) bool {
        return objc.msgSend(self_, "supportsRasterizationRateMapWithLayerCount:", bool, .{layerCount_});
    }
    pub fn newRasterizationRateMapWithDescriptor(self_: *@This(), descriptor_: *RasterizationRateMapDescriptor) ?*RasterizationRateMap {
        return objc.msgSend(self_, "newRasterizationRateMapWithDescriptor:", ?*RasterizationRateMap, .{descriptor_});
    }
    pub fn newIndirectCommandBufferWithDescriptor_maxCommandCount_options(self_: *@This(), descriptor_: *IndirectCommandBufferDescriptor, maxCount_: ns.UInteger, options_: ResourceOptions) ?*IndirectCommandBuffer {
        return objc.msgSend(self_, "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", ?*IndirectCommandBuffer, .{ descriptor_, maxCount_, options_ });
    }
    pub fn newEvent(self_: *@This()) ?*Event {
        return objc.msgSend(self_, "newEvent", ?*Event, .{});
    }
    pub fn newSharedEvent(self_: *@This()) ?*SharedEvent {
        return objc.msgSend(self_, "newSharedEvent", ?*SharedEvent, .{});
    }
    pub fn newSharedEventWithHandle(self_: *@This(), sharedEventHandle_: *SharedEventHandle) ?*SharedEvent {
        return objc.msgSend(self_, "newSharedEventWithHandle:", ?*SharedEvent, .{sharedEventHandle_});
    }
    pub fn newIOHandleWithURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) ?*IOFileHandle {
        return objc.msgSend(self_, "newIOHandleWithURL:error:", ?*IOFileHandle, .{ url_, error_ });
    }
    pub fn newIOCommandQueueWithDescriptor_error(self_: *@This(), descriptor_: *IOCommandQueueDescriptor, error_: ?*?*ns.Error) ?*IOCommandQueue {
        return objc.msgSend(self_, "newIOCommandQueueWithDescriptor:error:", ?*IOCommandQueue, .{ descriptor_, error_ });
    }
    pub fn newIOHandleWithURL_compressionMethod_error(self_: *@This(), url_: *ns.URL, compressionMethod_: IOCompressionMethod, error_: ?*?*ns.Error) ?*IOFileHandle {
        return objc.msgSend(self_, "newIOHandleWithURL:compressionMethod:error:", ?*IOFileHandle, .{ url_, compressionMethod_, error_ });
    }
    pub fn newIOFileHandleWithURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) ?*IOFileHandle {
        return objc.msgSend(self_, "newIOFileHandleWithURL:error:", ?*IOFileHandle, .{ url_, error_ });
    }
    pub fn newIOFileHandleWithURL_compressionMethod_error(self_: *@This(), url_: *ns.URL, compressionMethod_: IOCompressionMethod, error_: ?*?*ns.Error) ?*IOFileHandle {
        return objc.msgSend(self_, "newIOFileHandleWithURL:compressionMethod:error:", ?*IOFileHandle, .{ url_, compressionMethod_, error_ });
    }
    pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount(self_: *@This(), textureType_: TextureType, pixelFormat_: PixelFormat, sampleCount_: ns.UInteger) Size {
        return objc.msgSend(self_, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", Size, .{ textureType_, pixelFormat_, sampleCount_ });
    }
    pub fn convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions(self_: *@This(), pixelRegions_: *const Region, tileRegions_: *Region, tileSize_: Size, mode_: SparseTextureRegionAlignmentMode, numRegions_: ns.UInteger) void {
        return objc.msgSend(self_, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:", void, .{ pixelRegions_, tileRegions_, tileSize_, mode_, numRegions_ });
    }
    pub fn convertSparseTileRegions_toPixelRegions_withTileSize_numRegions(self_: *@This(), tileRegions_: *const Region, pixelRegions_: *Region, tileSize_: Size, numRegions_: ns.UInteger) void {
        return objc.msgSend(self_, "convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:", void, .{ tileRegions_, pixelRegions_, tileSize_, numRegions_ });
    }
    pub fn sparseTileSizeInBytesForSparsePageSize(self_: *@This(), sparsePageSize_: SparsePageSize) ns.UInteger {
        return objc.msgSend(self_, "sparseTileSizeInBytesForSparsePageSize:", ns.UInteger, .{sparsePageSize_});
    }
    pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize(self_: *@This(), textureType_: TextureType, pixelFormat_: PixelFormat, sampleCount_: ns.UInteger, sparsePageSize_: SparsePageSize) Size {
        return objc.msgSend(self_, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:", Size, .{ textureType_, pixelFormat_, sampleCount_, sparsePageSize_ });
    }
    pub fn newCounterSampleBufferWithDescriptor_error(self_: *@This(), descriptor_: *CounterSampleBufferDescriptor, error_: ?*?*ns.Error) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "newCounterSampleBufferWithDescriptor:error:", ?*CounterSampleBuffer, .{ descriptor_, error_ });
    }
    pub fn sampleTimestamps_gpuTimestamp(self_: *@This(), cpuTimestamp_: *Timestamp, gpuTimestamp_: *Timestamp) void {
        return objc.msgSend(self_, "sampleTimestamps:gpuTimestamp:", void, .{ cpuTimestamp_, gpuTimestamp_ });
    }
    pub fn newArgumentEncoderWithBufferBinding(self_: *@This(), bufferBinding_: *BufferBinding) *ArgumentEncoder {
        return objc.msgSend(self_, "newArgumentEncoderWithBufferBinding:", *ArgumentEncoder, .{bufferBinding_});
    }
    pub fn supportsCounterSampling(self_: *@This(), samplingPoint_: CounterSamplingPoint) bool {
        return objc.msgSend(self_, "supportsCounterSampling:", bool, .{samplingPoint_});
    }
    pub fn supportsVertexAmplificationCount(self_: *@This(), count_: ns.UInteger) bool {
        return objc.msgSend(self_, "supportsVertexAmplificationCount:", bool, .{count_});
    }
    pub fn newDynamicLibrary_error(self_: *@This(), library_: *Library, error_: ?*?*ns.Error) ?*DynamicLibrary {
        return objc.msgSend(self_, "newDynamicLibrary:error:", ?*DynamicLibrary, .{ library_, error_ });
    }
    pub fn newDynamicLibraryWithURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) ?*DynamicLibrary {
        return objc.msgSend(self_, "newDynamicLibraryWithURL:error:", ?*DynamicLibrary, .{ url_, error_ });
    }
    pub fn newBinaryArchiveWithDescriptor_error(self_: *@This(), descriptor_: *BinaryArchiveDescriptor, error_: ?*?*ns.Error) ?*BinaryArchive {
        return objc.msgSend(self_, "newBinaryArchiveWithDescriptor:error:", ?*BinaryArchive, .{ descriptor_, error_ });
    }
    pub fn accelerationStructureSizesWithDescriptor(self_: *@This(), descriptor_: *AccelerationStructureDescriptor) AccelerationStructureSizes {
        return objc.msgSend(self_, "accelerationStructureSizesWithDescriptor:", AccelerationStructureSizes, .{descriptor_});
    }
    pub fn newAccelerationStructureWithSize(self_: *@This(), size_: ns.UInteger) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithSize:", ?*AccelerationStructure, .{size_});
    }
    pub fn newAccelerationStructureWithDescriptor(self_: *@This(), descriptor_: *AccelerationStructureDescriptor) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithDescriptor:", ?*AccelerationStructure, .{descriptor_});
    }
    pub fn heapAccelerationStructureSizeAndAlignWithSize(self_: *@This(), size_: ns.UInteger) SizeAndAlign {
        return objc.msgSend(self_, "heapAccelerationStructureSizeAndAlignWithSize:", SizeAndAlign, .{size_});
    }
    pub fn heapAccelerationStructureSizeAndAlignWithDescriptor(self_: *@This(), descriptor_: *AccelerationStructureDescriptor) SizeAndAlign {
        return objc.msgSend(self_, "heapAccelerationStructureSizeAndAlignWithDescriptor:", SizeAndAlign, .{descriptor_});
    }
    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn registryID(self_: *@This()) u64 {
        return objc.msgSend(self_, "registryID", u64, .{});
    }
    pub fn architecture(self_: *@This()) *Architecture {
        return objc.msgSend(self_, "architecture", *Architecture, .{});
    }
    pub fn maxThreadsPerThreadgroup(self_: *@This()) Size {
        return objc.msgSend(self_, "maxThreadsPerThreadgroup", Size, .{});
    }
    pub fn isLowPower(self_: *@This()) bool {
        return objc.msgSend(self_, "isLowPower", bool, .{});
    }
    pub fn isHeadless(self_: *@This()) bool {
        return objc.msgSend(self_, "isHeadless", bool, .{});
    }
    pub fn isRemovable(self_: *@This()) bool {
        return objc.msgSend(self_, "isRemovable", bool, .{});
    }
    pub fn hasUnifiedMemory(self_: *@This()) bool {
        return objc.msgSend(self_, "hasUnifiedMemory", bool, .{});
    }
    pub fn recommendedMaxWorkingSetSize(self_: *@This()) u64 {
        return objc.msgSend(self_, "recommendedMaxWorkingSetSize", u64, .{});
    }
    pub fn location(self_: *@This()) DeviceLocation {
        return objc.msgSend(self_, "location", DeviceLocation, .{});
    }
    pub fn locationNumber(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "locationNumber", ns.UInteger, .{});
    }
    pub fn maxTransferRate(self_: *@This()) u64 {
        return objc.msgSend(self_, "maxTransferRate", u64, .{});
    }
    pub fn isDepth24Stencil8PixelFormatSupported(self_: *@This()) bool {
        return objc.msgSend(self_, "isDepth24Stencil8PixelFormatSupported", bool, .{});
    }
    pub fn readWriteTextureSupport(self_: *@This()) ReadWriteTextureTier {
        return objc.msgSend(self_, "readWriteTextureSupport", ReadWriteTextureTier, .{});
    }
    pub fn argumentBuffersSupport(self_: *@This()) ArgumentBuffersTier {
        return objc.msgSend(self_, "argumentBuffersSupport", ArgumentBuffersTier, .{});
    }
    pub fn areRasterOrderGroupsSupported(self_: *@This()) bool {
        return objc.msgSend(self_, "areRasterOrderGroupsSupported", bool, .{});
    }
    pub fn supports32BitFloatFiltering(self_: *@This()) bool {
        return objc.msgSend(self_, "supports32BitFloatFiltering", bool, .{});
    }
    pub fn supports32BitMSAA(self_: *@This()) bool {
        return objc.msgSend(self_, "supports32BitMSAA", bool, .{});
    }
    pub fn supportsQueryTextureLOD(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsQueryTextureLOD", bool, .{});
    }
    pub fn supportsBCTextureCompression(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsBCTextureCompression", bool, .{});
    }
    pub fn supportsPullModelInterpolation(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsPullModelInterpolation", bool, .{});
    }
    pub fn areBarycentricCoordsSupported(self_: *@This()) bool {
        return objc.msgSend(self_, "areBarycentricCoordsSupported", bool, .{});
    }
    pub fn supportsShaderBarycentricCoordinates(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsShaderBarycentricCoordinates", bool, .{});
    }
    pub fn currentAllocatedSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "currentAllocatedSize", ns.UInteger, .{});
    }
    pub fn maxThreadgroupMemoryLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxThreadgroupMemoryLength", ns.UInteger, .{});
    }
    pub fn maxArgumentBufferSamplerCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxArgumentBufferSamplerCount", ns.UInteger, .{});
    }
    pub fn areProgrammableSamplePositionsSupported(self_: *@This()) bool {
        return objc.msgSend(self_, "areProgrammableSamplePositionsSupported", bool, .{});
    }
    pub fn peerGroupID(self_: *@This()) u64 {
        return objc.msgSend(self_, "peerGroupID", u64, .{});
    }
    pub fn peerIndex(self_: *@This()) u32 {
        return objc.msgSend(self_, "peerIndex", u32, .{});
    }
    pub fn peerCount(self_: *@This()) u32 {
        return objc.msgSend(self_, "peerCount", u32, .{});
    }
    pub fn sparseTileSizeInBytes(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sparseTileSizeInBytes", ns.UInteger, .{});
    }
    pub fn maxBufferLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxBufferLength", ns.UInteger, .{});
    }
    pub fn counterSets(self_: *@This()) ?*ns.Array(*CounterSet) {
        return objc.msgSend(self_, "counterSets", ?*ns.Array(*CounterSet), .{});
    }
    pub fn supportsDynamicLibraries(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsDynamicLibraries", bool, .{});
    }
    pub fn supportsRenderDynamicLibraries(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsRenderDynamicLibraries", bool, .{});
    }
    pub fn supportsRaytracing(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsRaytracing", bool, .{});
    }
    pub fn supportsFunctionPointers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsFunctionPointers", bool, .{});
    }
    pub fn supportsFunctionPointersFromRender(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsFunctionPointersFromRender", bool, .{});
    }
    pub fn supportsRaytracingFromRender(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsRaytracingFromRender", bool, .{});
    }
    pub fn supportsPrimitiveMotionBlur(self_: *@This()) bool {
        return objc.msgSend(self_, "supportsPrimitiveMotionBlur", bool, .{});
    }
    pub fn shouldMaximizeConcurrentCompilation(self_: *@This()) bool {
        return objc.msgSend(self_, "shouldMaximizeConcurrentCompilation", bool, .{});
    }
    pub fn setShouldMaximizeConcurrentCompilation(self_: *@This(), shouldMaximizeConcurrentCompilation_: bool) void {
        return objc.msgSend(self_, "setShouldMaximizeConcurrentCompilation:", void, .{shouldMaximizeConcurrentCompilation_});
    }
    pub fn maximumConcurrentCompilationTaskCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maximumConcurrentCompilationTaskCount", ns.UInteger, .{});
    }
};

pub const Drawable = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn present(self_: *@This()) void {
        return objc.msgSend(self_, "present", void, .{});
    }
    pub fn presentAtTime(self_: *@This(), presentationTime_: cf.TimeInterval) void {
        return objc.msgSend(self_, "presentAtTime:", void, .{presentationTime_});
    }
    pub fn presentAfterMinimumDuration(self_: *@This(), duration_: cf.TimeInterval) void {
        return objc.msgSend(self_, "presentAfterMinimumDuration:", void, .{duration_});
    }
    pub fn addPresentedHandler(self_: *@This(), block_: *ns.Block(fn (*Drawable) void)) void {
        return objc.msgSend(self_, "addPresentedHandler:", void, .{block_});
    }
    pub fn presentedTime(self_: *@This()) cf.TimeInterval {
        return objc.msgSend(self_, "presentedTime", cf.TimeInterval, .{});
    }
    pub fn drawableID(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "drawableID", ns.UInteger, .{});
    }
};

pub const DynamicLibrary = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn serializeToURL_error(self_: *@This(), url_: *ns.URL, error_: ?*?*ns.Error) bool {
        return objc.msgSend(self_, "serializeToURL:error:", bool, .{ url_, error_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn installName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "installName", *ns.String, .{});
    }
};

pub const Event = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn device(self_: *@This()) ?*Device {
        return objc.msgSend(self_, "device", ?*Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const SharedEventListener = opaque {
    pub const InternalInfo = objc.ExternClass("MTLSharedEventListener", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithDispatchQueue(self_: *@This(), dispatchQueue_: dispatch_queue_t) *@This() {
        return objc.msgSend(self_, "initWithDispatchQueue:", *@This(), .{dispatchQueue_});
    }
    pub fn dispatchQueue(self_: *@This()) dispatch_queue_t {
        return objc.msgSend(self_, "dispatchQueue", dispatch_queue_t, .{});
    }
};

pub const SharedEvent = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Event});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn notifyListener_atValue_block(self_: *@This(), listener_: *SharedEventListener, value_: u64, block_: *ns.Block(fn (*SharedEvent, u64) void)) void {
        return objc.msgSend(self_, "notifyListener:atValue:block:", void, .{ listener_, value_, block_ });
    }
    pub fn newSharedEventHandle(self_: *@This()) *SharedEventHandle {
        return objc.msgSend(self_, "newSharedEventHandle", *SharedEventHandle, .{});
    }
    pub fn signaledValue(self_: *@This()) u64 {
        return objc.msgSend(self_, "signaledValue", u64, .{});
    }
    pub fn setSignaledValue(self_: *@This(), signaledValue_: u64) void {
        return objc.msgSend(self_, "setSignaledValue:", void, .{signaledValue_});
    }
};

pub const SharedEventHandle = opaque {
    pub const InternalInfo = objc.ExternClass("MTLSharedEventHandle", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
};

pub const Fence = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const FunctionConstantValues = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionConstantValues", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn setConstantValue_type_atIndex(self_: *@This(), value_: *const anyopaque, type_: DataType, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setConstantValue:type:atIndex:", void, .{ value_, type_, index_ });
    }
    pub fn setConstantValues_type_withRange(self_: *@This(), values_: *const anyopaque, type_: DataType, range_: ns.Range) void {
        return objc.msgSend(self_, "setConstantValues:type:withRange:", void, .{ values_, type_, range_ });
    }
    pub fn setConstantValue_type_withName(self_: *@This(), value_: *const anyopaque, type_: DataType, name_: *ns.String) void {
        return objc.msgSend(self_, "setConstantValue:type:withName:", void, .{ value_, type_, name_ });
    }
    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
};

pub const FunctionDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn functionDescriptor() *FunctionDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "functionDescriptor", *FunctionDescriptor, .{});
    }
    pub fn name(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "name", ?*ns.String, .{});
    }
    pub fn setName(self_: *@This(), name_: ?*ns.String) void {
        return objc.msgSend(self_, "setName:", void, .{name_});
    }
    pub fn specializedName(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "specializedName", ?*ns.String, .{});
    }
    pub fn setSpecializedName(self_: *@This(), specializedName_: ?*ns.String) void {
        return objc.msgSend(self_, "setSpecializedName:", void, .{specializedName_});
    }
    pub fn constantValues(self_: *@This()) ?*FunctionConstantValues {
        return objc.msgSend(self_, "constantValues", ?*FunctionConstantValues, .{});
    }
    pub fn setConstantValues(self_: *@This(), constantValues_: ?*FunctionConstantValues) void {
        return objc.msgSend(self_, "setConstantValues:", void, .{constantValues_});
    }
    pub fn options(self_: *@This()) FunctionOptions {
        return objc.msgSend(self_, "options", FunctionOptions, .{});
    }
    pub fn setOptions(self_: *@This(), options_: FunctionOptions) void {
        return objc.msgSend(self_, "setOptions:", void, .{options_});
    }
    pub fn binaryArchives(self_: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self_, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    pub fn setBinaryArchives(self_: *@This(), binaryArchives_: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self_, "setBinaryArchives:", void, .{binaryArchives_});
    }
};

pub const IntersectionFunctionDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLIntersectionFunctionDescriptor", @This(), FunctionDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

pub const FunctionHandle = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn functionType(self_: *@This()) FunctionType {
        return objc.msgSend(self_, "functionType", FunctionType, .{});
    }
    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
};

pub const LogContainer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
};

pub const FunctionLogDebugLocation = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn functionName(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "functionName", ?*ns.String, .{});
    }
    pub fn URL(self_: *@This()) ?*ns.URL {
        return objc.msgSend(self_, "URL", ?*ns.URL, .{});
    }
    pub fn line(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "line", ns.UInteger, .{});
    }
    pub fn column(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "column", ns.UInteger, .{});
    }
};

pub const FunctionLog = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn @"type"(self_: *@This()) FunctionLogType {
        return objc.msgSend(self_, "type", FunctionLogType, .{});
    }
    pub fn encoderLabel(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "encoderLabel", ?*ns.String, .{});
    }
    pub fn function(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "function", ?*Function, .{});
    }
    pub fn debugLocation(self_: *@This()) ?*FunctionLogDebugLocation {
        return objc.msgSend(self_, "debugLocation", ?*FunctionLogDebugLocation, .{});
    }
};

pub const FunctionStitchingAttribute = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
};

pub const FunctionStitchingAttributeAlwaysInline = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionStitchingAttributeAlwaysInline", @This(), ns.ObjectInterface, &.{FunctionStitchingAttribute});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

pub const FunctionStitchingNode = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
};

pub const FunctionStitchingInputNode = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionStitchingInputNode", @This(), ns.ObjectInterface, &.{FunctionStitchingNode});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithArgumentIndex(self_: *@This(), argument_: ns.UInteger) *@This() {
        return objc.msgSend(self_, "initWithArgumentIndex:", *@This(), .{argument_});
    }
    pub fn argumentIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "argumentIndex", ns.UInteger, .{});
    }
    pub fn setArgumentIndex(self_: *@This(), argumentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setArgumentIndex:", void, .{argumentIndex_});
    }
};

pub const FunctionStitchingFunctionNode = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionStitchingFunctionNode", @This(), ns.ObjectInterface, &.{FunctionStitchingNode});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithName_arguments_controlDependencies(self_: *@This(), name_: *ns.String, arguments_: *ns.Array(*FunctionStitchingNode), controlDependencies_: *ns.Array(*FunctionStitchingFunctionNode)) *@This() {
        return objc.msgSend(self_, "initWithName:arguments:controlDependencies:", *@This(), .{ name_, arguments_, controlDependencies_ });
    }
    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn setName(self_: *@This(), name_: *ns.String) void {
        return objc.msgSend(self_, "setName:", void, .{name_});
    }
    pub fn arguments(self_: *@This()) *ns.Array(*FunctionStitchingNode) {
        return objc.msgSend(self_, "arguments", *ns.Array(*FunctionStitchingNode), .{});
    }
    pub fn setArguments(self_: *@This(), arguments_: *ns.Array(*FunctionStitchingNode)) void {
        return objc.msgSend(self_, "setArguments:", void, .{arguments_});
    }
    pub fn controlDependencies(self_: *@This()) *ns.Array(*FunctionStitchingFunctionNode) {
        return objc.msgSend(self_, "controlDependencies", *ns.Array(*FunctionStitchingFunctionNode), .{});
    }
    pub fn setControlDependencies(self_: *@This(), controlDependencies_: *ns.Array(*FunctionStitchingFunctionNode)) void {
        return objc.msgSend(self_, "setControlDependencies:", void, .{controlDependencies_});
    }
};

pub const FunctionStitchingGraph = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionStitchingGraph", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithFunctionName_nodes_outputNode_attributes(self_: *@This(), functionName_: *ns.String, nodes_: *ns.Array(*FunctionStitchingFunctionNode), outputNode_: ?*FunctionStitchingFunctionNode, attributes_: *ns.Array(*FunctionStitchingAttribute)) *@This() {
        return objc.msgSend(self_, "initWithFunctionName:nodes:outputNode:attributes:", *@This(), .{ functionName_, nodes_, outputNode_, attributes_ });
    }
    pub fn functionName(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "functionName", *ns.String, .{});
    }
    pub fn setFunctionName(self_: *@This(), functionName_: *ns.String) void {
        return objc.msgSend(self_, "setFunctionName:", void, .{functionName_});
    }
    pub fn nodes(self_: *@This()) *ns.Array(*FunctionStitchingFunctionNode) {
        return objc.msgSend(self_, "nodes", *ns.Array(*FunctionStitchingFunctionNode), .{});
    }
    pub fn setNodes(self_: *@This(), nodes_: *ns.Array(*FunctionStitchingFunctionNode)) void {
        return objc.msgSend(self_, "setNodes:", void, .{nodes_});
    }
    pub fn outputNode(self_: *@This()) ?*FunctionStitchingFunctionNode {
        return objc.msgSend(self_, "outputNode", ?*FunctionStitchingFunctionNode, .{});
    }
    pub fn setOutputNode(self_: *@This(), outputNode_: ?*FunctionStitchingFunctionNode) void {
        return objc.msgSend(self_, "setOutputNode:", void, .{outputNode_});
    }
    pub fn attributes(self_: *@This()) *ns.Array(*FunctionStitchingAttribute) {
        return objc.msgSend(self_, "attributes", *ns.Array(*FunctionStitchingAttribute), .{});
    }
    pub fn setAttributes(self_: *@This(), attributes_: *ns.Array(*FunctionStitchingAttribute)) void {
        return objc.msgSend(self_, "setAttributes:", void, .{attributes_});
    }
};

pub const StitchedLibraryDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLStitchedLibraryDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn functionGraphs(self_: *@This()) *ns.Array(*FunctionStitchingGraph) {
        return objc.msgSend(self_, "functionGraphs", *ns.Array(*FunctionStitchingGraph), .{});
    }
    pub fn setFunctionGraphs(self_: *@This(), functionGraphs_: *ns.Array(*FunctionStitchingGraph)) void {
        return objc.msgSend(self_, "setFunctionGraphs:", void, .{functionGraphs_});
    }
    pub fn functions(self_: *@This()) *ns.Array(*Function) {
        return objc.msgSend(self_, "functions", *ns.Array(*Function), .{});
    }
    pub fn setFunctions(self_: *@This(), functions_: *ns.Array(*Function)) void {
        return objc.msgSend(self_, "setFunctions:", void, .{functions_});
    }
};

pub const HeapDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLHeapDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn size(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "size", ns.UInteger, .{});
    }
    pub fn setSize(self_: *@This(), size_: ns.UInteger) void {
        return objc.msgSend(self_, "setSize:", void, .{size_});
    }
    pub fn storageMode(self_: *@This()) StorageMode {
        return objc.msgSend(self_, "storageMode", StorageMode, .{});
    }
    pub fn setStorageMode(self_: *@This(), storageMode_: StorageMode) void {
        return objc.msgSend(self_, "setStorageMode:", void, .{storageMode_});
    }
    pub fn cpuCacheMode(self_: *@This()) CPUCacheMode {
        return objc.msgSend(self_, "cpuCacheMode", CPUCacheMode, .{});
    }
    pub fn setCpuCacheMode(self_: *@This(), cpuCacheMode_: CPUCacheMode) void {
        return objc.msgSend(self_, "setCpuCacheMode:", void, .{cpuCacheMode_});
    }
    pub fn sparsePageSize(self_: *@This()) SparsePageSize {
        return objc.msgSend(self_, "sparsePageSize", SparsePageSize, .{});
    }
    pub fn setSparsePageSize(self_: *@This(), sparsePageSize_: SparsePageSize) void {
        return objc.msgSend(self_, "setSparsePageSize:", void, .{sparsePageSize_});
    }
    pub fn hazardTrackingMode(self_: *@This()) HazardTrackingMode {
        return objc.msgSend(self_, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    pub fn setHazardTrackingMode(self_: *@This(), hazardTrackingMode_: HazardTrackingMode) void {
        return objc.msgSend(self_, "setHazardTrackingMode:", void, .{hazardTrackingMode_});
    }
    pub fn resourceOptions(self_: *@This()) ResourceOptions {
        return objc.msgSend(self_, "resourceOptions", ResourceOptions, .{});
    }
    pub fn setResourceOptions(self_: *@This(), resourceOptions_: ResourceOptions) void {
        return objc.msgSend(self_, "setResourceOptions:", void, .{resourceOptions_});
    }
    pub fn @"type"(self_: *@This()) HeapType {
        return objc.msgSend(self_, "type", HeapType, .{});
    }
    pub fn setType(self_: *@This(), type_: HeapType) void {
        return objc.msgSend(self_, "setType:", void, .{type_});
    }
};

pub const Heap = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn maxAvailableSizeWithAlignment(self_: *@This(), alignment_: ns.UInteger) ns.UInteger {
        return objc.msgSend(self_, "maxAvailableSizeWithAlignment:", ns.UInteger, .{alignment_});
    }
    pub fn newBufferWithLength_options(self_: *@This(), length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
        return objc.msgSend(self_, "newBufferWithLength:options:", ?*Buffer, .{ length_, options_ });
    }
    pub fn newTextureWithDescriptor(self_: *@This(), descriptor_: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self_, "newTextureWithDescriptor:", ?*Texture, .{descriptor_});
    }
    pub fn setPurgeableState(self_: *@This(), state_: PurgeableState) PurgeableState {
        return objc.msgSend(self_, "setPurgeableState:", PurgeableState, .{state_});
    }
    pub fn newBufferWithLength_options_offset(self_: *@This(), length_: ns.UInteger, options_: ResourceOptions, offset_: ns.UInteger) ?*Buffer {
        return objc.msgSend(self_, "newBufferWithLength:options:offset:", ?*Buffer, .{ length_, options_, offset_ });
    }
    pub fn newTextureWithDescriptor_offset(self_: *@This(), descriptor_: *TextureDescriptor, offset_: ns.UInteger) ?*Texture {
        return objc.msgSend(self_, "newTextureWithDescriptor:offset:", ?*Texture, .{ descriptor_, offset_ });
    }
    pub fn newAccelerationStructureWithSize(self_: *@This(), size_: ns.UInteger) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithSize:", ?*AccelerationStructure, .{size_});
    }
    pub fn newAccelerationStructureWithDescriptor(self_: *@This(), descriptor_: *AccelerationStructureDescriptor) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithDescriptor:", ?*AccelerationStructure, .{descriptor_});
    }
    pub fn newAccelerationStructureWithSize_offset(self_: *@This(), size_: ns.UInteger, offset_: ns.UInteger) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithSize:offset:", ?*AccelerationStructure, .{ size_, offset_ });
    }
    pub fn newAccelerationStructureWithDescriptor_offset(self_: *@This(), descriptor_: *AccelerationStructureDescriptor, offset_: ns.UInteger) ?*AccelerationStructure {
        return objc.msgSend(self_, "newAccelerationStructureWithDescriptor:offset:", ?*AccelerationStructure, .{ descriptor_, offset_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn storageMode(self_: *@This()) StorageMode {
        return objc.msgSend(self_, "storageMode", StorageMode, .{});
    }
    pub fn cpuCacheMode(self_: *@This()) CPUCacheMode {
        return objc.msgSend(self_, "cpuCacheMode", CPUCacheMode, .{});
    }
    pub fn hazardTrackingMode(self_: *@This()) HazardTrackingMode {
        return objc.msgSend(self_, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    pub fn resourceOptions(self_: *@This()) ResourceOptions {
        return objc.msgSend(self_, "resourceOptions", ResourceOptions, .{});
    }
    pub fn size(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "size", ns.UInteger, .{});
    }
    pub fn usedSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "usedSize", ns.UInteger, .{});
    }
    pub fn currentAllocatedSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "currentAllocatedSize", ns.UInteger, .{});
    }
    pub fn @"type"(self_: *@This()) HeapType {
        return objc.msgSend(self_, "type", HeapType, .{});
    }
};

pub const IndirectCommandBufferDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLIndirectCommandBufferDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn commandTypes(self_: *@This()) IndirectCommandType {
        return objc.msgSend(self_, "commandTypes", IndirectCommandType, .{});
    }
    pub fn setCommandTypes(self_: *@This(), commandTypes_: IndirectCommandType) void {
        return objc.msgSend(self_, "setCommandTypes:", void, .{commandTypes_});
    }
    pub fn inheritPipelineState(self_: *@This()) bool {
        return objc.msgSend(self_, "inheritPipelineState", bool, .{});
    }
    pub fn setInheritPipelineState(self_: *@This(), inheritPipelineState_: bool) void {
        return objc.msgSend(self_, "setInheritPipelineState:", void, .{inheritPipelineState_});
    }
    pub fn inheritBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "inheritBuffers", bool, .{});
    }
    pub fn setInheritBuffers(self_: *@This(), inheritBuffers_: bool) void {
        return objc.msgSend(self_, "setInheritBuffers:", void, .{inheritBuffers_});
    }
    pub fn maxVertexBufferBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxVertexBufferBindCount", ns.UInteger, .{});
    }
    pub fn setMaxVertexBufferBindCount(self_: *@This(), maxVertexBufferBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxVertexBufferBindCount:", void, .{maxVertexBufferBindCount_});
    }
    pub fn maxFragmentBufferBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxFragmentBufferBindCount", ns.UInteger, .{});
    }
    pub fn setMaxFragmentBufferBindCount(self_: *@This(), maxFragmentBufferBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxFragmentBufferBindCount:", void, .{maxFragmentBufferBindCount_});
    }
    pub fn maxKernelBufferBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxKernelBufferBindCount", ns.UInteger, .{});
    }
    pub fn setMaxKernelBufferBindCount(self_: *@This(), maxKernelBufferBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxKernelBufferBindCount:", void, .{maxKernelBufferBindCount_});
    }
    pub fn maxKernelThreadgroupMemoryBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxKernelThreadgroupMemoryBindCount", ns.UInteger, .{});
    }
    pub fn setMaxKernelThreadgroupMemoryBindCount(self_: *@This(), maxKernelThreadgroupMemoryBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxKernelThreadgroupMemoryBindCount:", void, .{maxKernelThreadgroupMemoryBindCount_});
    }
    pub fn maxObjectBufferBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxObjectBufferBindCount", ns.UInteger, .{});
    }
    pub fn setMaxObjectBufferBindCount(self_: *@This(), maxObjectBufferBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxObjectBufferBindCount:", void, .{maxObjectBufferBindCount_});
    }
    pub fn maxMeshBufferBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxMeshBufferBindCount", ns.UInteger, .{});
    }
    pub fn setMaxMeshBufferBindCount(self_: *@This(), maxMeshBufferBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxMeshBufferBindCount:", void, .{maxMeshBufferBindCount_});
    }
    pub fn maxObjectThreadgroupMemoryBindCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxObjectThreadgroupMemoryBindCount", ns.UInteger, .{});
    }
    pub fn setMaxObjectThreadgroupMemoryBindCount(self_: *@This(), maxObjectThreadgroupMemoryBindCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxObjectThreadgroupMemoryBindCount:", void, .{maxObjectThreadgroupMemoryBindCount_});
    }
    pub fn supportRayTracing(self_: *@This()) bool {
        return objc.msgSend(self_, "supportRayTracing", bool, .{});
    }
    pub fn setSupportRayTracing(self_: *@This(), supportRayTracing_: bool) void {
        return objc.msgSend(self_, "setSupportRayTracing:", void, .{supportRayTracing_});
    }
    pub fn supportDynamicAttributeStride(self_: *@This()) bool {
        return objc.msgSend(self_, "supportDynamicAttributeStride", bool, .{});
    }
    pub fn setSupportDynamicAttributeStride(self_: *@This(), supportDynamicAttributeStride_: bool) void {
        return objc.msgSend(self_, "setSupportDynamicAttributeStride:", void, .{supportDynamicAttributeStride_});
    }
};

pub const IndirectCommandBuffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn resetWithRange(self_: *@This(), range_: ns.Range) void {
        return objc.msgSend(self_, "resetWithRange:", void, .{range_});
    }
    pub fn indirectRenderCommandAtIndex(self_: *@This(), commandIndex_: ns.UInteger) *IndirectRenderCommand {
        return objc.msgSend(self_, "indirectRenderCommandAtIndex:", *IndirectRenderCommand, .{commandIndex_});
    }
    pub fn indirectComputeCommandAtIndex(self_: *@This(), commandIndex_: ns.UInteger) *IndirectComputeCommand {
        return objc.msgSend(self_, "indirectComputeCommandAtIndex:", *IndirectComputeCommand, .{commandIndex_});
    }
    pub fn size(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "size", ns.UInteger, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const IndirectRenderCommand = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setRenderPipelineState(self_: *@This(), pipelineState_: *RenderPipelineState) void {
        return objc.msgSend(self_, "setRenderPipelineState:", void, .{pipelineState_});
    }
    pub fn setVertexBuffer_offset_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setFragmentBuffer_offset_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setVertexBuffer_offset_attributeStride_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBuffer:offset:attributeStride:atIndex:", void, .{ buffer_, offset_, stride_, index_ });
    }
    pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger, buffer_: *Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", void, .{ numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, instanceCount_, baseInstance_, buffer_, offset_, instanceStride_ });
    }
    pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger, buffer_: *Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", void, .{ numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, instanceCount_, baseInstance_, buffer_, offset_, instanceStride_ });
    }
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance(self_: *@This(), primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", void, .{ primitiveType_, vertexStart_, vertexCount_, instanceCount_, baseInstance_ });
    }
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance(self_: *@This(), primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseVertex_: ns.Integer, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", void, .{ primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_, baseVertex_, baseInstance_ });
    }
    pub fn setObjectThreadgroupMemoryLength_atIndex(self_: *@This(), length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectThreadgroupMemoryLength:atIndex:", void, .{ length_, index_ });
    }
    pub fn setObjectBuffer_offset_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setMeshBuffer_offset_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *@This(), threadgroupsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
        return objc.msgSend(self_, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadgroupsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_ });
    }
    pub fn drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *@This(), threadsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
        return objc.msgSend(self_, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_ });
    }
    pub fn setBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "setBarrier", void, .{});
    }
    pub fn clearBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "clearBarrier", void, .{});
    }
    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
};

pub const IndirectComputeCommand = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setComputePipelineState(self_: *@This(), pipelineState_: *ComputePipelineState) void {
        return objc.msgSend(self_, "setComputePipelineState:", void, .{pipelineState_});
    }
    pub fn setKernelBuffer_offset_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setKernelBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setKernelBuffer_offset_attributeStride_atIndex(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setKernelBuffer:offset:attributeStride:atIndex:", void, .{ buffer_, offset_, stride_, index_ });
    }
    pub fn concurrentDispatchThreadgroups_threadsPerThreadgroup(self_: *@This(), threadgroupsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
        return objc.msgSend(self_, "concurrentDispatchThreadgroups:threadsPerThreadgroup:", void, .{ threadgroupsPerGrid_, threadsPerThreadgroup_ });
    }
    pub fn concurrentDispatchThreads_threadsPerThreadgroup(self_: *@This(), threadsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
        return objc.msgSend(self_, "concurrentDispatchThreads:threadsPerThreadgroup:", void, .{ threadsPerGrid_, threadsPerThreadgroup_ });
    }
    pub fn setBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "setBarrier", void, .{});
    }
    pub fn clearBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "clearBarrier", void, .{});
    }
    pub fn setImageblockWidth_height(self_: *@This(), width_: ns.UInteger, height_: ns.UInteger) void {
        return objc.msgSend(self_, "setImageblockWidth:height:", void, .{ width_, height_ });
    }
    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn setThreadgroupMemoryLength_atIndex(self_: *@This(), length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setThreadgroupMemoryLength:atIndex:", void, .{ length_, index_ });
    }
    pub fn setStageInRegion(self_: *@This(), region_: Region) void {
        return objc.msgSend(self_, "setStageInRegion:", void, .{region_});
    }
};

pub const IntersectionFunctionTableDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLIntersectionFunctionTableDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn intersectionFunctionTableDescriptor() *IntersectionFunctionTableDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "intersectionFunctionTableDescriptor", *IntersectionFunctionTableDescriptor, .{});
    }
    pub fn functionCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "functionCount", ns.UInteger, .{});
    }
    pub fn setFunctionCount(self_: *@This(), functionCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setFunctionCount:", void, .{functionCount_});
    }
};

pub const IntersectionFunctionTable = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setFunction_atIndex(self_: *@This(), function_: ?*FunctionHandle, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFunction:atIndex:", void, .{ function_, index_ });
    }
    pub fn setFunctions_withRange(self_: *@This(), functions_: *?*const FunctionHandle, range_: ns.Range) void {
        return objc.msgSend(self_, "setFunctions:withRange:", void, .{ functions_, range_ });
    }
    pub fn setOpaqueTriangleIntersectionFunctionWithSignature_atIndex(self_: *@This(), signature_: IntersectionFunctionSignature, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:", void, .{ signature_, index_ });
    }
    pub fn setOpaqueTriangleIntersectionFunctionWithSignature_withRange(self_: *@This(), signature_: IntersectionFunctionSignature, range_: ns.Range) void {
        return objc.msgSend(self_, "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", void, .{ signature_, range_ });
    }
    pub fn setOpaqueCurveIntersectionFunctionWithSignature_atIndex(self_: *@This(), signature_: IntersectionFunctionSignature, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setOpaqueCurveIntersectionFunctionWithSignature:atIndex:", void, .{ signature_, index_ });
    }
    pub fn setOpaqueCurveIntersectionFunctionWithSignature_withRange(self_: *@This(), signature_: IntersectionFunctionSignature, range_: ns.Range) void {
        return objc.msgSend(self_, "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", void, .{ signature_, range_ });
    }
    pub fn setVisibleFunctionTable_atBufferIndex(self_: *@This(), functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setVisibleFunctionTable:atBufferIndex:", void, .{ functionTable_, bufferIndex_ });
    }
    pub fn setVisibleFunctionTables_withBufferRange(self_: *@This(), functionTables_: *?*const VisibleFunctionTable, bufferRange_: ns.Range) void {
        return objc.msgSend(self_, "setVisibleFunctionTables:withBufferRange:", void, .{ functionTables_, bufferRange_ });
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const IOCommandBuffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn addCompletedHandler(self_: *@This(), block_: *ns.Block(fn (*IOCommandBuffer) void)) void {
        return objc.msgSend(self_, "addCompletedHandler:", void, .{block_});
    }
    pub fn loadBytes_size_sourceHandle_sourceHandleOffset(self_: *@This(), pointer_: *anyopaque, size_: ns.UInteger, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "loadBytes:size:sourceHandle:sourceHandleOffset:", void, .{ pointer_, size_, sourceHandle_, sourceHandleOffset_ });
    }
    pub fn loadBuffer_offset_size_sourceHandle_sourceHandleOffset(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger, size_: ns.UInteger, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "loadBuffer:offset:size:sourceHandle:sourceHandleOffset:", void, .{ buffer_, offset_, size_, sourceHandle_, sourceHandleOffset_ });
    }
    pub fn loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset(self_: *@This(), texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger, size_: Size, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, destinationOrigin_: Origin, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", void, .{ texture_, slice_, level_, size_, sourceBytesPerRow_, sourceBytesPerImage_, destinationOrigin_, sourceHandle_, sourceHandleOffset_ });
    }
    pub fn copyStatusToBuffer_offset(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger) void {
        return objc.msgSend(self_, "copyStatusToBuffer:offset:", void, .{ buffer_, offset_ });
    }
    pub fn commit(self_: *@This()) void {
        return objc.msgSend(self_, "commit", void, .{});
    }
    pub fn waitUntilCompleted(self_: *@This()) void {
        return objc.msgSend(self_, "waitUntilCompleted", void, .{});
    }
    pub fn tryCancel(self_: *@This()) void {
        return objc.msgSend(self_, "tryCancel", void, .{});
    }
    pub fn addBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "addBarrier", void, .{});
    }
    pub fn pushDebugGroup(self_: *@This(), string_: *ns.String) void {
        return objc.msgSend(self_, "pushDebugGroup:", void, .{string_});
    }
    pub fn popDebugGroup(self_: *@This()) void {
        return objc.msgSend(self_, "popDebugGroup", void, .{});
    }
    pub fn enqueue(self_: *@This()) void {
        return objc.msgSend(self_, "enqueue", void, .{});
    }
    pub fn waitForEvent_value(self_: *@This(), event_: *SharedEvent, value_: u64) void {
        return objc.msgSend(self_, "waitForEvent:value:", void, .{ event_, value_ });
    }
    pub fn signalEvent_value(self_: *@This(), event_: *SharedEvent, value_: u64) void {
        return objc.msgSend(self_, "signalEvent:value:", void, .{ event_, value_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn status(self_: *@This()) IOStatus {
        return objc.msgSend(self_, "status", IOStatus, .{});
    }
    pub fn @"error"(self_: *@This()) ?*ns.Error {
        return objc.msgSend(self_, "error", ?*ns.Error, .{});
    }
};

pub const IOCommandQueue = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn enqueueBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "enqueueBarrier", void, .{});
    }
    pub fn commandBuffer(self_: *@This()) *IOCommandBuffer {
        return objc.msgSend(self_, "commandBuffer", *IOCommandBuffer, .{});
    }
    pub fn commandBufferWithUnretainedReferences(self_: *@This()) *IOCommandBuffer {
        return objc.msgSend(self_, "commandBufferWithUnretainedReferences", *IOCommandBuffer, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const IOScratchBuffer = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn buffer(self_: *@This()) *Buffer {
        return objc.msgSend(self_, "buffer", *Buffer, .{});
    }
};

pub const IOScratchBufferAllocator = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn newScratchBufferWithMinimumSize(self_: *@This(), minimumSize_: ns.UInteger) ?*IOScratchBuffer {
        return objc.msgSend(self_, "newScratchBufferWithMinimumSize:", ?*IOScratchBuffer, .{minimumSize_});
    }
};

pub const IOCommandQueueDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLIOCommandQueueDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn maxCommandBufferCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxCommandBufferCount", ns.UInteger, .{});
    }
    pub fn setMaxCommandBufferCount(self_: *@This(), maxCommandBufferCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxCommandBufferCount:", void, .{maxCommandBufferCount_});
    }
    pub fn priority(self_: *@This()) IOPriority {
        return objc.msgSend(self_, "priority", IOPriority, .{});
    }
    pub fn setPriority(self_: *@This(), priority_: IOPriority) void {
        return objc.msgSend(self_, "setPriority:", void, .{priority_});
    }
    pub fn @"type"(self_: *@This()) IOCommandQueueType {
        return objc.msgSend(self_, "type", IOCommandQueueType, .{});
    }
    pub fn setType(self_: *@This(), type_: IOCommandQueueType) void {
        return objc.msgSend(self_, "setType:", void, .{type_});
    }
    pub fn maxCommandsInFlight(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxCommandsInFlight", ns.UInteger, .{});
    }
    pub fn setMaxCommandsInFlight(self_: *@This(), maxCommandsInFlight_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxCommandsInFlight:", void, .{maxCommandsInFlight_});
    }
    pub fn scratchBufferAllocator(self_: *@This()) ?*IOScratchBufferAllocator {
        return objc.msgSend(self_, "scratchBufferAllocator", ?*IOScratchBufferAllocator, .{});
    }
    pub fn setScratchBufferAllocator(self_: *@This(), scratchBufferAllocator_: ?*IOScratchBufferAllocator) void {
        return objc.msgSend(self_, "setScratchBufferAllocator:", void, .{scratchBufferAllocator_});
    }
};

pub const IOFileHandle = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const VertexAttribute = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexAttribute", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn attributeIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "attributeIndex", ns.UInteger, .{});
    }
    pub fn attributeType(self_: *@This()) DataType {
        return objc.msgSend(self_, "attributeType", DataType, .{});
    }
    pub fn isActive(self_: *@This()) bool {
        return objc.msgSend(self_, "isActive", bool, .{});
    }
    pub fn isPatchData(self_: *@This()) bool {
        return objc.msgSend(self_, "isPatchData", bool, .{});
    }
    pub fn isPatchControlPointData(self_: *@This()) bool {
        return objc.msgSend(self_, "isPatchControlPointData", bool, .{});
    }
};

pub const Attribute = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAttribute", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn attributeIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "attributeIndex", ns.UInteger, .{});
    }
    pub fn attributeType(self_: *@This()) DataType {
        return objc.msgSend(self_, "attributeType", DataType, .{});
    }
    pub fn isActive(self_: *@This()) bool {
        return objc.msgSend(self_, "isActive", bool, .{});
    }
    pub fn isPatchData(self_: *@This()) bool {
        return objc.msgSend(self_, "isPatchData", bool, .{});
    }
    pub fn isPatchControlPointData(self_: *@This()) bool {
        return objc.msgSend(self_, "isPatchControlPointData", bool, .{});
    }
};

pub const FunctionConstant = opaque {
    pub const InternalInfo = objc.ExternClass("MTLFunctionConstant", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn @"type"(self_: *@This()) DataType {
        return objc.msgSend(self_, "type", DataType, .{});
    }
    pub fn index(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "index", ns.UInteger, .{});
    }
    pub fn required(self_: *@This()) bool {
        return objc.msgSend(self_, "required", bool, .{});
    }
};

pub const Function = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn newArgumentEncoderWithBufferIndex(self_: *@This(), bufferIndex_: ns.UInteger) *ArgumentEncoder {
        return objc.msgSend(self_, "newArgumentEncoderWithBufferIndex:", *ArgumentEncoder, .{bufferIndex_});
    }
    pub fn newArgumentEncoderWithBufferIndex_reflection(self_: *@This(), bufferIndex_: ns.UInteger, reflection_: ?*AutoreleasedArgument) *ArgumentEncoder {
        return objc.msgSend(self_, "newArgumentEncoderWithBufferIndex:reflection:", *ArgumentEncoder, .{ bufferIndex_, reflection_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn functionType(self_: *@This()) FunctionType {
        return objc.msgSend(self_, "functionType", FunctionType, .{});
    }
    pub fn patchType(self_: *@This()) PatchType {
        return objc.msgSend(self_, "patchType", PatchType, .{});
    }
    pub fn patchControlPointCount(self_: *@This()) ns.Integer {
        return objc.msgSend(self_, "patchControlPointCount", ns.Integer, .{});
    }
    pub fn vertexAttributes(self_: *@This()) ?*ns.Array(*VertexAttribute) {
        return objc.msgSend(self_, "vertexAttributes", ?*ns.Array(*VertexAttribute), .{});
    }
    pub fn stageInputAttributes(self_: *@This()) ?*ns.Array(*Attribute) {
        return objc.msgSend(self_, "stageInputAttributes", ?*ns.Array(*Attribute), .{});
    }
    pub fn name(self_: *@This()) *ns.String {
        return objc.msgSend(self_, "name", *ns.String, .{});
    }
    pub fn functionConstantsDictionary(self_: *@This()) *ns.Dictionary(*ns.String, *FunctionConstant) {
        return objc.msgSend(self_, "functionConstantsDictionary", *ns.Dictionary(*ns.String, *FunctionConstant), .{});
    }
    pub fn options(self_: *@This()) FunctionOptions {
        return objc.msgSend(self_, "options", FunctionOptions, .{});
    }
};

pub const CompileOptions = opaque {
    pub const InternalInfo = objc.ExternClass("MTLCompileOptions", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn preprocessorMacros(self_: *@This()) ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol) {
        return objc.msgSend(self_, "preprocessorMacros", ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol), .{});
    }
    pub fn setPreprocessorMacros(self_: *@This(), preprocessorMacros_: ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol)) void {
        return objc.msgSend(self_, "setPreprocessorMacros:", void, .{preprocessorMacros_});
    }
    pub fn fastMathEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "fastMathEnabled", bool, .{});
    }
    pub fn setFastMathEnabled(self_: *@This(), fastMathEnabled_: bool) void {
        return objc.msgSend(self_, "setFastMathEnabled:", void, .{fastMathEnabled_});
    }
    pub fn languageVersion(self_: *@This()) LanguageVersion {
        return objc.msgSend(self_, "languageVersion", LanguageVersion, .{});
    }
    pub fn setLanguageVersion(self_: *@This(), languageVersion_: LanguageVersion) void {
        return objc.msgSend(self_, "setLanguageVersion:", void, .{languageVersion_});
    }
    pub fn libraryType(self_: *@This()) LibraryType {
        return objc.msgSend(self_, "libraryType", LibraryType, .{});
    }
    pub fn setLibraryType(self_: *@This(), libraryType_: LibraryType) void {
        return objc.msgSend(self_, "setLibraryType:", void, .{libraryType_});
    }
    pub fn installName(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "installName", ?*ns.String, .{});
    }
    pub fn setInstallName(self_: *@This(), installName_: ?*ns.String) void {
        return objc.msgSend(self_, "setInstallName:", void, .{installName_});
    }
    pub fn libraries(self_: *@This()) ?*ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "libraries", ?*ns.Array(*DynamicLibrary), .{});
    }
    pub fn setLibraries(self_: *@This(), libraries_: ?*ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setLibraries:", void, .{libraries_});
    }
    pub fn preserveInvariance(self_: *@This()) bool {
        return objc.msgSend(self_, "preserveInvariance", bool, .{});
    }
    pub fn setPreserveInvariance(self_: *@This(), preserveInvariance_: bool) void {
        return objc.msgSend(self_, "setPreserveInvariance:", void, .{preserveInvariance_});
    }
    pub fn optimizationLevel(self_: *@This()) LibraryOptimizationLevel {
        return objc.msgSend(self_, "optimizationLevel", LibraryOptimizationLevel, .{});
    }
    pub fn setOptimizationLevel(self_: *@This(), optimizationLevel_: LibraryOptimizationLevel) void {
        return objc.msgSend(self_, "setOptimizationLevel:", void, .{optimizationLevel_});
    }
    pub fn compileSymbolVisibility(self_: *@This()) CompileSymbolVisibility {
        return objc.msgSend(self_, "compileSymbolVisibility", CompileSymbolVisibility, .{});
    }
    pub fn setCompileSymbolVisibility(self_: *@This(), compileSymbolVisibility_: CompileSymbolVisibility) void {
        return objc.msgSend(self_, "setCompileSymbolVisibility:", void, .{compileSymbolVisibility_});
    }
    pub fn allowReferencingUndefinedSymbols(self_: *@This()) bool {
        return objc.msgSend(self_, "allowReferencingUndefinedSymbols", bool, .{});
    }
    pub fn setAllowReferencingUndefinedSymbols(self_: *@This(), allowReferencingUndefinedSymbols_: bool) void {
        return objc.msgSend(self_, "setAllowReferencingUndefinedSymbols:", void, .{allowReferencingUndefinedSymbols_});
    }
    pub fn maxTotalThreadsPerThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerThreadgroup", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadsPerThreadgroup(self_: *@This(), maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadsPerThreadgroup:", void, .{maxTotalThreadsPerThreadgroup_});
    }
};

pub const Library = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn newFunctionWithName(self_: *@This(), functionName_: *ns.String) ?*Function {
        return objc.msgSend(self_, "newFunctionWithName:", ?*Function, .{functionName_});
    }
    pub fn newFunctionWithName_constantValues_error(self_: *@This(), name_: *ns.String, constantValues_: *FunctionConstantValues, error_: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self_, "newFunctionWithName:constantValues:error:", ?*Function, .{ name_, constantValues_, error_ });
    }
    pub fn newFunctionWithName_constantValues_completionHandler(self_: *@This(), name_: *ns.String, constantValues_: *FunctionConstantValues, completionHandler_: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newFunctionWithName:constantValues:completionHandler:", void, .{ name_, constantValues_, completionHandler_ });
    }
    pub fn newFunctionWithDescriptor_completionHandler(self_: *@This(), descriptor_: *FunctionDescriptor, completionHandler_: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newFunctionWithDescriptor:completionHandler:", void, .{ descriptor_, completionHandler_ });
    }
    pub fn newFunctionWithDescriptor_error(self_: *@This(), descriptor_: *FunctionDescriptor, error_: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self_, "newFunctionWithDescriptor:error:", ?*Function, .{ descriptor_, error_ });
    }
    pub fn newIntersectionFunctionWithDescriptor_completionHandler(self_: *@This(), descriptor_: *IntersectionFunctionDescriptor, completionHandler_: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self_, "newIntersectionFunctionWithDescriptor:completionHandler:", void, .{ descriptor_, completionHandler_ });
    }
    pub fn newIntersectionFunctionWithDescriptor_error(self_: *@This(), descriptor_: *IntersectionFunctionDescriptor, error_: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self_, "newIntersectionFunctionWithDescriptor:error:", ?*Function, .{ descriptor_, error_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn functionNames(self_: *@This()) *ns.Array(*ns.String) {
        return objc.msgSend(self_, "functionNames", *ns.Array(*ns.String), .{});
    }
    pub fn @"type"(self_: *@This()) LibraryType {
        return objc.msgSend(self_, "type", LibraryType, .{});
    }
    pub fn installName(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "installName", ?*ns.String, .{});
    }
};

pub const LinkedFunctions = opaque {
    pub const InternalInfo = objc.ExternClass("MTLLinkedFunctions", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn linkedFunctions() *LinkedFunctions {
        return objc.msgSend(@This().InternalInfo.class(), "linkedFunctions", *LinkedFunctions, .{});
    }
    pub fn functions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "functions", ?*ns.Array(*Function), .{});
    }
    pub fn setFunctions(self_: *@This(), functions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setFunctions:", void, .{functions_});
    }
    pub fn binaryFunctions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "binaryFunctions", ?*ns.Array(*Function), .{});
    }
    pub fn setBinaryFunctions(self_: *@This(), binaryFunctions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setBinaryFunctions:", void, .{binaryFunctions_});
    }
    pub fn groups(self_: *@This()) ?*ns.Dictionary(*ns.String, *ns.Array(*Function)) {
        return objc.msgSend(self_, "groups", ?*ns.Dictionary(*ns.String, *ns.Array(*Function)), .{});
    }
    pub fn setGroups(self_: *@This(), groups_: ?*ns.Dictionary(*ns.String, *ns.Array(*Function))) void {
        return objc.msgSend(self_, "setGroups:", void, .{groups_});
    }
    pub fn privateFunctions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "privateFunctions", ?*ns.Array(*Function), .{});
    }
    pub fn setPrivateFunctions(self_: *@This(), privateFunctions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setPrivateFunctions:", void, .{privateFunctions_});
    }
};

pub const ParallelRenderCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn renderCommandEncoder(self_: *@This()) ?*RenderCommandEncoder {
        return objc.msgSend(self_, "renderCommandEncoder", ?*RenderCommandEncoder, .{});
    }
    pub fn setColorStoreAction_atIndex(self_: *@This(), storeAction_: StoreAction, colorAttachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setColorStoreAction:atIndex:", void, .{ storeAction_, colorAttachmentIndex_ });
    }
    pub fn setDepthStoreAction(self_: *@This(), storeAction_: StoreAction) void {
        return objc.msgSend(self_, "setDepthStoreAction:", void, .{storeAction_});
    }
    pub fn setStencilStoreAction(self_: *@This(), storeAction_: StoreAction) void {
        return objc.msgSend(self_, "setStencilStoreAction:", void, .{storeAction_});
    }
    pub fn setColorStoreActionOptions_atIndex(self_: *@This(), storeActionOptions_: StoreActionOptions, colorAttachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setColorStoreActionOptions:atIndex:", void, .{ storeActionOptions_, colorAttachmentIndex_ });
    }
    pub fn setDepthStoreActionOptions(self_: *@This(), storeActionOptions_: StoreActionOptions) void {
        return objc.msgSend(self_, "setDepthStoreActionOptions:", void, .{storeActionOptions_});
    }
    pub fn setStencilStoreActionOptions(self_: *@This(), storeActionOptions_: StoreActionOptions) void {
        return objc.msgSend(self_, "setStencilStoreActionOptions:", void, .{storeActionOptions_});
    }
};

pub const PipelineBufferDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLPipelineBufferDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn mutability(self_: *@This()) Mutability {
        return objc.msgSend(self_, "mutability", Mutability, .{});
    }
    pub fn setMutability(self_: *@This(), mutability_: Mutability) void {
        return objc.msgSend(self_, "setMutability:", void, .{mutability_});
    }
};

pub const PipelineBufferDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLPipelineBufferDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), bufferIndex_: ns.UInteger) *PipelineBufferDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *PipelineBufferDescriptor, .{bufferIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), buffer_: ?*PipelineBufferDescriptor, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ buffer_, bufferIndex_ });
    }
};

pub const RasterizationRateSampleArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRasterizationRateSampleArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), index_: ns.UInteger) *ns.Number {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *ns.Number, .{index_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), value_: *ns.Number, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ value_, index_ });
    }
};

pub const RasterizationRateLayerDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRasterizationRateLayerDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithSampleCount(self_: *@This(), sampleCount_: Size) *@This() {
        return objc.msgSend(self_, "initWithSampleCount:", *@This(), .{sampleCount_});
    }
    pub fn initWithSampleCount_horizontal_vertical(self_: *@This(), sampleCount_: Size, horizontal_: *const f32, vertical_: *const f32) *@This() {
        return objc.msgSend(self_, "initWithSampleCount:horizontal:vertical:", *@This(), .{ sampleCount_, horizontal_, vertical_ });
    }
    pub fn sampleCount(self_: *@This()) Size {
        return objc.msgSend(self_, "sampleCount", Size, .{});
    }
    pub fn maxSampleCount(self_: *@This()) Size {
        return objc.msgSend(self_, "maxSampleCount", Size, .{});
    }
    pub fn horizontalSampleStorage(self_: *@This()) *f32 {
        return objc.msgSend(self_, "horizontalSampleStorage", *f32, .{});
    }
    pub fn verticalSampleStorage(self_: *@This()) *f32 {
        return objc.msgSend(self_, "verticalSampleStorage", *f32, .{});
    }
    pub fn horizontal(self_: *@This()) *RasterizationRateSampleArray {
        return objc.msgSend(self_, "horizontal", *RasterizationRateSampleArray, .{});
    }
    pub fn vertical(self_: *@This()) *RasterizationRateSampleArray {
        return objc.msgSend(self_, "vertical", *RasterizationRateSampleArray, .{});
    }
    pub fn setSampleCount(self_: *@This(), sampleCount_: Size) void {
        return objc.msgSend(self_, "setSampleCount:", void, .{sampleCount_});
    }
};

pub const RasterizationRateLayerArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRasterizationRateLayerArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), layerIndex_: ns.UInteger) ?*RasterizationRateLayerDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", ?*RasterizationRateLayerDescriptor, .{layerIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), layer_: ?*RasterizationRateLayerDescriptor, layerIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ layer_, layerIndex_ });
    }
};

pub const RasterizationRateMapDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRasterizationRateMapDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn rasterizationRateMapDescriptorWithScreenSize(screenSize_: Size) *RasterizationRateMapDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:", *RasterizationRateMapDescriptor, .{screenSize_});
    }
    pub fn rasterizationRateMapDescriptorWithScreenSize_layer(screenSize_: Size, layer_: *RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:layer:", *RasterizationRateMapDescriptor, .{ screenSize_, layer_ });
    }
    pub fn rasterizationRateMapDescriptorWithScreenSize_layerCount_layers(screenSize_: Size, layerCount_: ns.UInteger, layers_: **const RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:", *RasterizationRateMapDescriptor, .{ screenSize_, layerCount_, layers_ });
    }
    pub fn layerAtIndex(self_: *@This(), layerIndex_: ns.UInteger) ?*RasterizationRateLayerDescriptor {
        return objc.msgSend(self_, "layerAtIndex:", ?*RasterizationRateLayerDescriptor, .{layerIndex_});
    }
    pub fn setLayer_atIndex(self_: *@This(), layer_: ?*RasterizationRateLayerDescriptor, layerIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setLayer:atIndex:", void, .{ layer_, layerIndex_ });
    }
    pub fn layers(self_: *@This()) *RasterizationRateLayerArray {
        return objc.msgSend(self_, "layers", *RasterizationRateLayerArray, .{});
    }
    pub fn screenSize(self_: *@This()) Size {
        return objc.msgSend(self_, "screenSize", Size, .{});
    }
    pub fn setScreenSize(self_: *@This(), screenSize_: Size) void {
        return objc.msgSend(self_, "setScreenSize:", void, .{screenSize_});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn layerCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "layerCount", ns.UInteger, .{});
    }
};

pub const RasterizationRateMap = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn copyParameterDataToBuffer_offset(self_: *@This(), buffer_: *Buffer, offset_: ns.UInteger) void {
        return objc.msgSend(self_, "copyParameterDataToBuffer:offset:", void, .{ buffer_, offset_ });
    }
    pub fn physicalSizeForLayer(self_: *@This(), layerIndex_: ns.UInteger) Size {
        return objc.msgSend(self_, "physicalSizeForLayer:", Size, .{layerIndex_});
    }
    pub fn mapScreenToPhysicalCoordinates_forLayer(self_: *@This(), screenCoordinates_: Coordinate2D, layerIndex_: ns.UInteger) Coordinate2D {
        return objc.msgSend(self_, "mapScreenToPhysicalCoordinates:forLayer:", Coordinate2D, .{ screenCoordinates_, layerIndex_ });
    }
    pub fn mapPhysicalToScreenCoordinates_forLayer(self_: *@This(), physicalCoordinates_: Coordinate2D, layerIndex_: ns.UInteger) Coordinate2D {
        return objc.msgSend(self_, "mapPhysicalToScreenCoordinates:forLayer:", Coordinate2D, .{ physicalCoordinates_, layerIndex_ });
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn screenSize(self_: *@This()) Size {
        return objc.msgSend(self_, "screenSize", Size, .{});
    }
    pub fn physicalGranularity(self_: *@This()) Size {
        return objc.msgSend(self_, "physicalGranularity", Size, .{});
    }
    pub fn layerCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "layerCount", ns.UInteger, .{});
    }
    pub fn parameterBufferSizeAndAlign(self_: *@This()) SizeAndAlign {
        return objc.msgSend(self_, "parameterBufferSizeAndAlign", SizeAndAlign, .{});
    }
};

pub const RenderCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setRenderPipelineState(self_: *@This(), pipelineState_: *RenderPipelineState) void {
        return objc.msgSend(self_, "setRenderPipelineState:", void, .{pipelineState_});
    }
    pub fn setVertexBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setVertexBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setVertexBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setVertexBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setVertexBuffer_offset_attributeStride_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBuffer:offset:attributeStride:atIndex:", void, .{ buffer_, offset_, stride_, index_ });
    }
    pub fn setVertexBuffers_offsets_attributeStrides_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, strides_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexBuffers:offsets:attributeStrides:withRange:", void, .{ buffers_, offsets_, strides_, range_ });
    }
    pub fn setVertexBufferOffset_attributeStride_atIndex(self_: *@This(), offset_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBufferOffset:attributeStride:atIndex:", void, .{ offset_, stride_, index_ });
    }
    pub fn setVertexBytes_length_attributeStride_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, stride_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexBytes:length:attributeStride:atIndex:", void, .{ bytes_, length_, stride_, index_ });
    }
    pub fn setVertexTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setVertexTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setVertexSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setVertexSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn setVertexVisibleFunctionTable_atBufferIndex(self_: *@This(), functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexVisibleFunctionTable:atBufferIndex:", void, .{ functionTable_, bufferIndex_ });
    }
    pub fn setVertexVisibleFunctionTables_withBufferRange(self_: *@This(), functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexVisibleFunctionTables:withBufferRange:", void, .{ functionTables_, range_ });
    }
    pub fn setVertexIntersectionFunctionTable_atBufferIndex(self_: *@This(), intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexIntersectionFunctionTable:atBufferIndex:", void, .{ intersectionFunctionTable_, bufferIndex_ });
    }
    pub fn setVertexIntersectionFunctionTables_withBufferRange(self_: *@This(), intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setVertexIntersectionFunctionTables:withBufferRange:", void, .{ intersectionFunctionTables_, range_ });
    }
    pub fn setVertexAccelerationStructure_atBufferIndex(self_: *@This(), accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setVertexAccelerationStructure:atBufferIndex:", void, .{ accelerationStructure_, bufferIndex_ });
    }
    pub fn setViewport(self_: *@This(), viewport_: Viewport) void {
        return objc.msgSend(self_, "setViewport:", void, .{viewport_});
    }
    pub fn setViewports_count(self_: *@This(), viewports_: *const Viewport, count_: ns.UInteger) void {
        return objc.msgSend(self_, "setViewports:count:", void, .{ viewports_, count_ });
    }
    pub fn setFrontFacingWinding(self_: *@This(), frontFacingWinding_: Winding) void {
        return objc.msgSend(self_, "setFrontFacingWinding:", void, .{frontFacingWinding_});
    }
    pub fn setVertexAmplificationCount_viewMappings(self_: *@This(), count_: ns.UInteger, viewMappings_: ?*const VertexAmplificationViewMapping) void {
        return objc.msgSend(self_, "setVertexAmplificationCount:viewMappings:", void, .{ count_, viewMappings_ });
    }
    pub fn setCullMode(self_: *@This(), cullMode_: CullMode) void {
        return objc.msgSend(self_, "setCullMode:", void, .{cullMode_});
    }
    pub fn setDepthClipMode(self_: *@This(), depthClipMode_: DepthClipMode) void {
        return objc.msgSend(self_, "setDepthClipMode:", void, .{depthClipMode_});
    }
    pub fn setDepthBias_slopeScale_clamp(self_: *@This(), depthBias_: f32, slopeScale_: f32, clamp_: f32) void {
        return objc.msgSend(self_, "setDepthBias:slopeScale:clamp:", void, .{ depthBias_, slopeScale_, clamp_ });
    }
    pub fn setScissorRect(self_: *@This(), rect_: ScissorRect) void {
        return objc.msgSend(self_, "setScissorRect:", void, .{rect_});
    }
    pub fn setScissorRects_count(self_: *@This(), scissorRects_: *const ScissorRect, count_: ns.UInteger) void {
        return objc.msgSend(self_, "setScissorRects:count:", void, .{ scissorRects_, count_ });
    }
    pub fn setTriangleFillMode(self_: *@This(), fillMode_: TriangleFillMode) void {
        return objc.msgSend(self_, "setTriangleFillMode:", void, .{fillMode_});
    }
    pub fn setFragmentBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setFragmentBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setFragmentBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setFragmentBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setFragmentTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setFragmentTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setFragmentSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setFragmentSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn setFragmentVisibleFunctionTable_atBufferIndex(self_: *@This(), functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentVisibleFunctionTable:atBufferIndex:", void, .{ functionTable_, bufferIndex_ });
    }
    pub fn setFragmentVisibleFunctionTables_withBufferRange(self_: *@This(), functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentVisibleFunctionTables:withBufferRange:", void, .{ functionTables_, range_ });
    }
    pub fn setFragmentIntersectionFunctionTable_atBufferIndex(self_: *@This(), intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentIntersectionFunctionTable:atBufferIndex:", void, .{ intersectionFunctionTable_, bufferIndex_ });
    }
    pub fn setFragmentIntersectionFunctionTables_withBufferRange(self_: *@This(), intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setFragmentIntersectionFunctionTables:withBufferRange:", void, .{ intersectionFunctionTables_, range_ });
    }
    pub fn setFragmentAccelerationStructure_atBufferIndex(self_: *@This(), accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setFragmentAccelerationStructure:atBufferIndex:", void, .{ accelerationStructure_, bufferIndex_ });
    }
    pub fn setBlendColorRed_green_blue_alpha(self_: *@This(), red_: f32, green_: f32, blue_: f32, alpha_: f32) void {
        return objc.msgSend(self_, "setBlendColorRed:green:blue:alpha:", void, .{ red_, green_, blue_, alpha_ });
    }
    pub fn setDepthStencilState(self_: *@This(), depthStencilState_: ?*DepthStencilState) void {
        return objc.msgSend(self_, "setDepthStencilState:", void, .{depthStencilState_});
    }
    pub fn setStencilReferenceValue(self_: *@This(), referenceValue_: u32) void {
        return objc.msgSend(self_, "setStencilReferenceValue:", void, .{referenceValue_});
    }
    pub fn setStencilFrontReferenceValue_backReferenceValue(self_: *@This(), frontReferenceValue_: u32, backReferenceValue_: u32) void {
        return objc.msgSend(self_, "setStencilFrontReferenceValue:backReferenceValue:", void, .{ frontReferenceValue_, backReferenceValue_ });
    }
    pub fn setVisibilityResultMode_offset(self_: *@This(), mode_: VisibilityResultMode, offset_: ns.UInteger) void {
        return objc.msgSend(self_, "setVisibilityResultMode:offset:", void, .{ mode_, offset_ });
    }
    pub fn setColorStoreAction_atIndex(self_: *@This(), storeAction_: StoreAction, colorAttachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setColorStoreAction:atIndex:", void, .{ storeAction_, colorAttachmentIndex_ });
    }
    pub fn setDepthStoreAction(self_: *@This(), storeAction_: StoreAction) void {
        return objc.msgSend(self_, "setDepthStoreAction:", void, .{storeAction_});
    }
    pub fn setStencilStoreAction(self_: *@This(), storeAction_: StoreAction) void {
        return objc.msgSend(self_, "setStencilStoreAction:", void, .{storeAction_});
    }
    pub fn setColorStoreActionOptions_atIndex(self_: *@This(), storeActionOptions_: StoreActionOptions, colorAttachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setColorStoreActionOptions:atIndex:", void, .{ storeActionOptions_, colorAttachmentIndex_ });
    }
    pub fn setDepthStoreActionOptions(self_: *@This(), storeActionOptions_: StoreActionOptions) void {
        return objc.msgSend(self_, "setDepthStoreActionOptions:", void, .{storeActionOptions_});
    }
    pub fn setStencilStoreActionOptions(self_: *@This(), storeActionOptions_: StoreActionOptions) void {
        return objc.msgSend(self_, "setStencilStoreActionOptions:", void, .{storeActionOptions_});
    }
    pub fn setObjectBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setObjectBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setObjectBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setObjectBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setObjectBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setObjectTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setObjectTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setObjectTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setObjectSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setObjectSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setObjectSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn setObjectThreadgroupMemoryLength_atIndex(self_: *@This(), length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObjectThreadgroupMemoryLength:atIndex:", void, .{ length_, index_ });
    }
    pub fn setMeshBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setMeshBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setMeshBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setMeshBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setMeshBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setMeshTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setMeshTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setMeshTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setMeshSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setMeshSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setMeshSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *@This(), threadgroupsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
        return objc.msgSend(self_, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadgroupsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_ });
    }
    pub fn drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *@This(), threadsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
        return objc.msgSend(self_, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_ });
    }
    pub fn drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *@This(), indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
        return objc.msgSend(self_, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ indirectBuffer_, indirectBufferOffset_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_ });
    }
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount(self_: *@This(), primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPrimitives:vertexStart:vertexCount:instanceCount:", void, .{ primitiveType_, vertexStart_, vertexCount_, instanceCount_ });
    }
    pub fn drawPrimitives_vertexStart_vertexCount(self_: *@This(), primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPrimitives:vertexStart:vertexCount:", void, .{ primitiveType_, vertexStart_, vertexCount_ });
    }
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount(self_: *@This(), primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", void, .{ primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_ });
    }
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset(self_: *@This(), primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", void, .{ primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_ });
    }
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance(self_: *@This(), primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", void, .{ primitiveType_, vertexStart_, vertexCount_, instanceCount_, baseInstance_ });
    }
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance(self_: *@This(), primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseVertex_: ns.Integer, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", void, .{ primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_, baseVertex_, baseInstance_ });
    }
    pub fn drawPrimitives_indirectBuffer_indirectBufferOffset(self_: *@This(), primitiveType_: PrimitiveType, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPrimitives:indirectBuffer:indirectBufferOffset:", void, .{ primitiveType_, indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *@This(), primitiveType_: PrimitiveType, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ primitiveType_, indexType_, indexBuffer_, indexBufferOffset_, indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn textureBarrier(self_: *@This()) void {
        return objc.msgSend(self_, "textureBarrier", void, .{});
    }
    pub fn updateFence_afterStages(self_: *@This(), fence_: *Fence, stages_: RenderStages) void {
        return objc.msgSend(self_, "updateFence:afterStages:", void, .{ fence_, stages_ });
    }
    pub fn waitForFence_beforeStages(self_: *@This(), fence_: *Fence, stages_: RenderStages) void {
        return objc.msgSend(self_, "waitForFence:beforeStages:", void, .{ fence_, stages_ });
    }
    pub fn setTessellationFactorBuffer_offset_instanceStride(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
        return objc.msgSend(self_, "setTessellationFactorBuffer:offset:instanceStride:", void, .{ buffer_, offset_, instanceStride_ });
    }
    pub fn setTessellationFactorScale(self_: *@This(), scale_: f32) void {
        return objc.msgSend(self_, "setTessellationFactorScale:", void, .{scale_});
    }
    pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", void, .{ numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, instanceCount_, baseInstance_ });
    }
    pub fn drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ numberOfPatchControlPoints_, patchIndexBuffer_, patchIndexBufferOffset_, indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", void, .{ numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, instanceCount_, baseInstance_ });
    }
    pub fn drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *@This(), numberOfPatchControlPoints_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ numberOfPatchControlPoints_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn setTileBytes_length_atIndex(self_: *@This(), bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileBytes:length:atIndex:", void, .{ bytes_, length_, index_ });
    }
    pub fn setTileBuffer_offset_atIndex(self_: *@This(), buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileBuffer:offset:atIndex:", void, .{ buffer_, offset_, index_ });
    }
    pub fn setTileBufferOffset_atIndex(self_: *@This(), offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileBufferOffset:atIndex:", void, .{ offset_, index_ });
    }
    pub fn setTileBuffers_offsets_withRange(self_: *@This(), buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileBuffers:offsets:withRange:", void, .{ buffers_, offsets_, range_ });
    }
    pub fn setTileTexture_atIndex(self_: *@This(), texture_: ?*Texture, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileTexture:atIndex:", void, .{ texture_, index_ });
    }
    pub fn setTileTextures_withRange(self_: *@This(), textures_: *?*const Texture, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileTextures:withRange:", void, .{ textures_, range_ });
    }
    pub fn setTileSamplerState_atIndex(self_: *@This(), sampler_: ?*SamplerState, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileSamplerState:atIndex:", void, .{ sampler_, index_ });
    }
    pub fn setTileSamplerStates_withRange(self_: *@This(), samplers_: *?*const SamplerState, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileSamplerStates:withRange:", void, .{ samplers_, range_ });
    }
    pub fn setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *@This(), sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler_, lodMinClamp_, lodMaxClamp_, index_ });
    }
    pub fn setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *@This(), samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers_, lodMinClamps_, lodMaxClamps_, range_ });
    }
    pub fn setTileVisibleFunctionTable_atBufferIndex(self_: *@This(), functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileVisibleFunctionTable:atBufferIndex:", void, .{ functionTable_, bufferIndex_ });
    }
    pub fn setTileVisibleFunctionTables_withBufferRange(self_: *@This(), functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileVisibleFunctionTables:withBufferRange:", void, .{ functionTables_, range_ });
    }
    pub fn setTileIntersectionFunctionTable_atBufferIndex(self_: *@This(), intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileIntersectionFunctionTable:atBufferIndex:", void, .{ intersectionFunctionTable_, bufferIndex_ });
    }
    pub fn setTileIntersectionFunctionTables_withBufferRange(self_: *@This(), intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
        return objc.msgSend(self_, "setTileIntersectionFunctionTables:withBufferRange:", void, .{ intersectionFunctionTables_, range_ });
    }
    pub fn setTileAccelerationStructure_atBufferIndex(self_: *@This(), accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileAccelerationStructure:atBufferIndex:", void, .{ accelerationStructure_, bufferIndex_ });
    }
    pub fn dispatchThreadsPerTile(self_: *@This(), threadsPerTile_: Size) void {
        return objc.msgSend(self_, "dispatchThreadsPerTile:", void, .{threadsPerTile_});
    }
    pub fn setThreadgroupMemoryLength_offset_atIndex(self_: *@This(), length_: ns.UInteger, offset_: ns.UInteger, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setThreadgroupMemoryLength:offset:atIndex:", void, .{ length_, offset_, index_ });
    }
    pub fn useResource_usage(self_: *@This(), resource_: *Resource, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResource:usage:", void, .{ resource_, usage_ });
    }
    pub fn useResources_count_usage(self_: *@This(), resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
        return objc.msgSend(self_, "useResources:count:usage:", void, .{ resources_, count_, usage_ });
    }
    pub fn useResource_usage_stages(self_: *@This(), resource_: *Resource, usage_: ResourceUsage, stages_: RenderStages) void {
        return objc.msgSend(self_, "useResource:usage:stages:", void, .{ resource_, usage_, stages_ });
    }
    pub fn useResources_count_usage_stages(self_: *@This(), resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage, stages_: RenderStages) void {
        return objc.msgSend(self_, "useResources:count:usage:stages:", void, .{ resources_, count_, usage_, stages_ });
    }
    pub fn useHeap(self_: *@This(), heap_: *Heap) void {
        return objc.msgSend(self_, "useHeap:", void, .{heap_});
    }
    pub fn useHeaps_count(self_: *@This(), heaps_: **const Heap, count_: ns.UInteger) void {
        return objc.msgSend(self_, "useHeaps:count:", void, .{ heaps_, count_ });
    }
    pub fn useHeap_stages(self_: *@This(), heap_: *Heap, stages_: RenderStages) void {
        return objc.msgSend(self_, "useHeap:stages:", void, .{ heap_, stages_ });
    }
    pub fn useHeaps_count_stages(self_: *@This(), heaps_: **const Heap, count_: ns.UInteger, stages_: RenderStages) void {
        return objc.msgSend(self_, "useHeaps:count:stages:", void, .{ heaps_, count_, stages_ });
    }
    pub fn executeCommandsInBuffer_withRange(self_: *@This(), indirectCommandBuffer_: *IndirectCommandBuffer, executionRange_: ns.Range) void {
        return objc.msgSend(self_, "executeCommandsInBuffer:withRange:", void, .{ indirectCommandBuffer_, executionRange_ });
    }
    pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset(self_: *@This(), indirectCommandbuffer_: *IndirectCommandBuffer, indirectRangeBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", void, .{ indirectCommandbuffer_, indirectRangeBuffer_, indirectBufferOffset_ });
    }
    pub fn memoryBarrierWithScope_afterStages_beforeStages(self_: *@This(), scope_: BarrierScope, after_: RenderStages, before_: RenderStages) void {
        return objc.msgSend(self_, "memoryBarrierWithScope:afterStages:beforeStages:", void, .{ scope_, after_, before_ });
    }
    pub fn memoryBarrierWithResources_count_afterStages_beforeStages(self_: *@This(), resources_: **const Resource, count_: ns.UInteger, after_: RenderStages, before_: RenderStages) void {
        return objc.msgSend(self_, "memoryBarrierWithResources:count:afterStages:beforeStages:", void, .{ resources_, count_, after_, before_ });
    }
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *@This(), sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
        return objc.msgSend(self_, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sampleBuffer_, sampleIndex_, barrier_ });
    }
    pub fn tileWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "tileWidth", ns.UInteger, .{});
    }
    pub fn tileHeight(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "tileHeight", ns.UInteger, .{});
    }
};

pub const RenderPassAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn texture(self_: *@This()) ?*Texture {
        return objc.msgSend(self_, "texture", ?*Texture, .{});
    }
    pub fn setTexture(self_: *@This(), texture_: ?*Texture) void {
        return objc.msgSend(self_, "setTexture:", void, .{texture_});
    }
    pub fn level(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "level", ns.UInteger, .{});
    }
    pub fn setLevel(self_: *@This(), level_: ns.UInteger) void {
        return objc.msgSend(self_, "setLevel:", void, .{level_});
    }
    pub fn slice(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "slice", ns.UInteger, .{});
    }
    pub fn setSlice(self_: *@This(), slice_: ns.UInteger) void {
        return objc.msgSend(self_, "setSlice:", void, .{slice_});
    }
    pub fn depthPlane(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "depthPlane", ns.UInteger, .{});
    }
    pub fn setDepthPlane(self_: *@This(), depthPlane_: ns.UInteger) void {
        return objc.msgSend(self_, "setDepthPlane:", void, .{depthPlane_});
    }
    pub fn resolveTexture(self_: *@This()) ?*Texture {
        return objc.msgSend(self_, "resolveTexture", ?*Texture, .{});
    }
    pub fn setResolveTexture(self_: *@This(), resolveTexture_: ?*Texture) void {
        return objc.msgSend(self_, "setResolveTexture:", void, .{resolveTexture_});
    }
    pub fn resolveLevel(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "resolveLevel", ns.UInteger, .{});
    }
    pub fn setResolveLevel(self_: *@This(), resolveLevel_: ns.UInteger) void {
        return objc.msgSend(self_, "setResolveLevel:", void, .{resolveLevel_});
    }
    pub fn resolveSlice(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "resolveSlice", ns.UInteger, .{});
    }
    pub fn setResolveSlice(self_: *@This(), resolveSlice_: ns.UInteger) void {
        return objc.msgSend(self_, "setResolveSlice:", void, .{resolveSlice_});
    }
    pub fn resolveDepthPlane(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "resolveDepthPlane", ns.UInteger, .{});
    }
    pub fn setResolveDepthPlane(self_: *@This(), resolveDepthPlane_: ns.UInteger) void {
        return objc.msgSend(self_, "setResolveDepthPlane:", void, .{resolveDepthPlane_});
    }
    pub fn loadAction(self_: *@This()) LoadAction {
        return objc.msgSend(self_, "loadAction", LoadAction, .{});
    }
    pub fn setLoadAction(self_: *@This(), loadAction_: LoadAction) void {
        return objc.msgSend(self_, "setLoadAction:", void, .{loadAction_});
    }
    pub fn storeAction(self_: *@This()) StoreAction {
        return objc.msgSend(self_, "storeAction", StoreAction, .{});
    }
    pub fn setStoreAction(self_: *@This(), storeAction_: StoreAction) void {
        return objc.msgSend(self_, "setStoreAction:", void, .{storeAction_});
    }
    pub fn storeActionOptions(self_: *@This()) StoreActionOptions {
        return objc.msgSend(self_, "storeActionOptions", StoreActionOptions, .{});
    }
    pub fn setStoreActionOptions(self_: *@This(), storeActionOptions_: StoreActionOptions) void {
        return objc.msgSend(self_, "setStoreActionOptions:", void, .{storeActionOptions_});
    }
};

pub const RenderPassColorAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassColorAttachmentDescriptor", @This(), RenderPassAttachmentDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn clearColor(self_: *@This()) ClearColor {
        return objc.msgSend(self_, "clearColor", ClearColor, .{});
    }
    pub fn setClearColor(self_: *@This(), clearColor_: ClearColor) void {
        return objc.msgSend(self_, "setClearColor:", void, .{clearColor_});
    }
};

pub const RenderPassDepthAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassDepthAttachmentDescriptor", @This(), RenderPassAttachmentDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn clearDepth(self_: *@This()) f64 {
        return objc.msgSend(self_, "clearDepth", f64, .{});
    }
    pub fn setClearDepth(self_: *@This(), clearDepth_: f64) void {
        return objc.msgSend(self_, "setClearDepth:", void, .{clearDepth_});
    }
    pub fn depthResolveFilter(self_: *@This()) MultisampleDepthResolveFilter {
        return objc.msgSend(self_, "depthResolveFilter", MultisampleDepthResolveFilter, .{});
    }
    pub fn setDepthResolveFilter(self_: *@This(), depthResolveFilter_: MultisampleDepthResolveFilter) void {
        return objc.msgSend(self_, "setDepthResolveFilter:", void, .{depthResolveFilter_});
    }
};

pub const RenderPassStencilAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassStencilAttachmentDescriptor", @This(), RenderPassAttachmentDescriptor, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn clearStencil(self_: *@This()) u32 {
        return objc.msgSend(self_, "clearStencil", u32, .{});
    }
    pub fn setClearStencil(self_: *@This(), clearStencil_: u32) void {
        return objc.msgSend(self_, "setClearStencil:", void, .{clearStencil_});
    }
    pub fn stencilResolveFilter(self_: *@This()) MultisampleStencilResolveFilter {
        return objc.msgSend(self_, "stencilResolveFilter", MultisampleStencilResolveFilter, .{});
    }
    pub fn setStencilResolveFilter(self_: *@This(), stencilResolveFilter_: MultisampleStencilResolveFilter) void {
        return objc.msgSend(self_, "setStencilResolveFilter:", void, .{stencilResolveFilter_});
    }
};

pub const RenderPassColorAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassColorAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *RenderPassColorAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *RenderPassColorAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*RenderPassColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const RenderPassSampleBufferAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassSampleBufferAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sampleBuffer(self_: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    pub fn setSampleBuffer(self_: *@This(), sampleBuffer_: ?*CounterSampleBuffer) void {
        return objc.msgSend(self_, "setSampleBuffer:", void, .{sampleBuffer_});
    }
    pub fn startOfVertexSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfVertexSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfVertexSampleIndex(self_: *@This(), startOfVertexSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfVertexSampleIndex:", void, .{startOfVertexSampleIndex_});
    }
    pub fn endOfVertexSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfVertexSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfVertexSampleIndex(self_: *@This(), endOfVertexSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfVertexSampleIndex:", void, .{endOfVertexSampleIndex_});
    }
    pub fn startOfFragmentSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfFragmentSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfFragmentSampleIndex(self_: *@This(), startOfFragmentSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfFragmentSampleIndex:", void, .{startOfFragmentSampleIndex_});
    }
    pub fn endOfFragmentSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfFragmentSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfFragmentSampleIndex(self_: *@This(), endOfFragmentSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfFragmentSampleIndex:", void, .{endOfFragmentSampleIndex_});
    }
};

pub const RenderPassSampleBufferAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassSampleBufferAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *RenderPassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *RenderPassSampleBufferAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*RenderPassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const RenderPassDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPassDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn renderPassDescriptor() *RenderPassDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "renderPassDescriptor", *RenderPassDescriptor, .{});
    }
    pub fn setSamplePositions_count(self_: *@This(), positions_: ?*const SamplePosition, count_: ns.UInteger) void {
        return objc.msgSend(self_, "setSamplePositions:count:", void, .{ positions_, count_ });
    }
    pub fn getSamplePositions_count(self_: *@This(), positions_: ?*SamplePosition, count_: ns.UInteger) ns.UInteger {
        return objc.msgSend(self_, "getSamplePositions:count:", ns.UInteger, .{ positions_, count_ });
    }
    pub fn colorAttachments(self_: *@This()) *RenderPassColorAttachmentDescriptorArray {
        return objc.msgSend(self_, "colorAttachments", *RenderPassColorAttachmentDescriptorArray, .{});
    }
    pub fn depthAttachment(self_: *@This()) *RenderPassDepthAttachmentDescriptor {
        return objc.msgSend(self_, "depthAttachment", *RenderPassDepthAttachmentDescriptor, .{});
    }
    pub fn setDepthAttachment(self_: *@This(), depthAttachment_: ?*RenderPassDepthAttachmentDescriptor) void {
        return objc.msgSend(self_, "setDepthAttachment:", void, .{depthAttachment_});
    }
    pub fn stencilAttachment(self_: *@This()) *RenderPassStencilAttachmentDescriptor {
        return objc.msgSend(self_, "stencilAttachment", *RenderPassStencilAttachmentDescriptor, .{});
    }
    pub fn setStencilAttachment(self_: *@This(), stencilAttachment_: ?*RenderPassStencilAttachmentDescriptor) void {
        return objc.msgSend(self_, "setStencilAttachment:", void, .{stencilAttachment_});
    }
    pub fn visibilityResultBuffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "visibilityResultBuffer", ?*Buffer, .{});
    }
    pub fn setVisibilityResultBuffer(self_: *@This(), visibilityResultBuffer_: ?*Buffer) void {
        return objc.msgSend(self_, "setVisibilityResultBuffer:", void, .{visibilityResultBuffer_});
    }
    pub fn renderTargetArrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "renderTargetArrayLength", ns.UInteger, .{});
    }
    pub fn setRenderTargetArrayLength(self_: *@This(), renderTargetArrayLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setRenderTargetArrayLength:", void, .{renderTargetArrayLength_});
    }
    pub fn imageblockSampleLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "imageblockSampleLength", ns.UInteger, .{});
    }
    pub fn setImageblockSampleLength(self_: *@This(), imageblockSampleLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setImageblockSampleLength:", void, .{imageblockSampleLength_});
    }
    pub fn threadgroupMemoryLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "threadgroupMemoryLength", ns.UInteger, .{});
    }
    pub fn setThreadgroupMemoryLength(self_: *@This(), threadgroupMemoryLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setThreadgroupMemoryLength:", void, .{threadgroupMemoryLength_});
    }
    pub fn tileWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "tileWidth", ns.UInteger, .{});
    }
    pub fn setTileWidth(self_: *@This(), tileWidth_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileWidth:", void, .{tileWidth_});
    }
    pub fn tileHeight(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "tileHeight", ns.UInteger, .{});
    }
    pub fn setTileHeight(self_: *@This(), tileHeight_: ns.UInteger) void {
        return objc.msgSend(self_, "setTileHeight:", void, .{tileHeight_});
    }
    pub fn defaultRasterSampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "defaultRasterSampleCount", ns.UInteger, .{});
    }
    pub fn setDefaultRasterSampleCount(self_: *@This(), defaultRasterSampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setDefaultRasterSampleCount:", void, .{defaultRasterSampleCount_});
    }
    pub fn renderTargetWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "renderTargetWidth", ns.UInteger, .{});
    }
    pub fn setRenderTargetWidth(self_: *@This(), renderTargetWidth_: ns.UInteger) void {
        return objc.msgSend(self_, "setRenderTargetWidth:", void, .{renderTargetWidth_});
    }
    pub fn renderTargetHeight(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "renderTargetHeight", ns.UInteger, .{});
    }
    pub fn setRenderTargetHeight(self_: *@This(), renderTargetHeight_: ns.UInteger) void {
        return objc.msgSend(self_, "setRenderTargetHeight:", void, .{renderTargetHeight_});
    }
    pub fn rasterizationRateMap(self_: *@This()) ?*RasterizationRateMap {
        return objc.msgSend(self_, "rasterizationRateMap", ?*RasterizationRateMap, .{});
    }
    pub fn setRasterizationRateMap(self_: *@This(), rasterizationRateMap_: ?*RasterizationRateMap) void {
        return objc.msgSend(self_, "setRasterizationRateMap:", void, .{rasterizationRateMap_});
    }
    pub fn sampleBufferAttachments(self_: *@This()) *RenderPassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self_, "sampleBufferAttachments", *RenderPassSampleBufferAttachmentDescriptorArray, .{});
    }
};

pub const RenderPipelineColorAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPipelineColorAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn pixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "pixelFormat", PixelFormat, .{});
    }
    pub fn setPixelFormat(self_: *@This(), pixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setPixelFormat:", void, .{pixelFormat_});
    }
    pub fn isBlendingEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isBlendingEnabled", bool, .{});
    }
    pub fn setBlendingEnabled(self_: *@This(), blendingEnabled_: bool) void {
        return objc.msgSend(self_, "setBlendingEnabled:", void, .{blendingEnabled_});
    }
    pub fn sourceRGBBlendFactor(self_: *@This()) BlendFactor {
        return objc.msgSend(self_, "sourceRGBBlendFactor", BlendFactor, .{});
    }
    pub fn setSourceRGBBlendFactor(self_: *@This(), sourceRGBBlendFactor_: BlendFactor) void {
        return objc.msgSend(self_, "setSourceRGBBlendFactor:", void, .{sourceRGBBlendFactor_});
    }
    pub fn destinationRGBBlendFactor(self_: *@This()) BlendFactor {
        return objc.msgSend(self_, "destinationRGBBlendFactor", BlendFactor, .{});
    }
    pub fn setDestinationRGBBlendFactor(self_: *@This(), destinationRGBBlendFactor_: BlendFactor) void {
        return objc.msgSend(self_, "setDestinationRGBBlendFactor:", void, .{destinationRGBBlendFactor_});
    }
    pub fn rgbBlendOperation(self_: *@This()) BlendOperation {
        return objc.msgSend(self_, "rgbBlendOperation", BlendOperation, .{});
    }
    pub fn setRgbBlendOperation(self_: *@This(), rgbBlendOperation_: BlendOperation) void {
        return objc.msgSend(self_, "setRgbBlendOperation:", void, .{rgbBlendOperation_});
    }
    pub fn sourceAlphaBlendFactor(self_: *@This()) BlendFactor {
        return objc.msgSend(self_, "sourceAlphaBlendFactor", BlendFactor, .{});
    }
    pub fn setSourceAlphaBlendFactor(self_: *@This(), sourceAlphaBlendFactor_: BlendFactor) void {
        return objc.msgSend(self_, "setSourceAlphaBlendFactor:", void, .{sourceAlphaBlendFactor_});
    }
    pub fn destinationAlphaBlendFactor(self_: *@This()) BlendFactor {
        return objc.msgSend(self_, "destinationAlphaBlendFactor", BlendFactor, .{});
    }
    pub fn setDestinationAlphaBlendFactor(self_: *@This(), destinationAlphaBlendFactor_: BlendFactor) void {
        return objc.msgSend(self_, "setDestinationAlphaBlendFactor:", void, .{destinationAlphaBlendFactor_});
    }
    pub fn alphaBlendOperation(self_: *@This()) BlendOperation {
        return objc.msgSend(self_, "alphaBlendOperation", BlendOperation, .{});
    }
    pub fn setAlphaBlendOperation(self_: *@This(), alphaBlendOperation_: BlendOperation) void {
        return objc.msgSend(self_, "setAlphaBlendOperation:", void, .{alphaBlendOperation_});
    }
    pub fn writeMask(self_: *@This()) ColorWriteMask {
        return objc.msgSend(self_, "writeMask", ColorWriteMask, .{});
    }
    pub fn setWriteMask(self_: *@This(), writeMask_: ColorWriteMask) void {
        return objc.msgSend(self_, "setWriteMask:", void, .{writeMask_});
    }
};

pub const RenderPipelineReflection = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPipelineReflection", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn vertexBindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "vertexBindings", *ns.Array(*Binding), .{});
    }
    pub fn fragmentBindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "fragmentBindings", *ns.Array(*Binding), .{});
    }
    pub fn tileBindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "tileBindings", *ns.Array(*Binding), .{});
    }
    pub fn objectBindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "objectBindings", *ns.Array(*Binding), .{});
    }
    pub fn meshBindings(self_: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self_, "meshBindings", *ns.Array(*Binding), .{});
    }
    pub fn vertexArguments(self_: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self_, "vertexArguments", ?*ns.Array(*Argument), .{});
    }
    pub fn fragmentArguments(self_: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self_, "fragmentArguments", ?*ns.Array(*Argument), .{});
    }
    pub fn tileArguments(self_: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self_, "tileArguments", ?*ns.Array(*Argument), .{});
    }
};

pub const RenderPipelineDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPipelineDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn vertexFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "vertexFunction", ?*Function, .{});
    }
    pub fn setVertexFunction(self_: *@This(), vertexFunction_: ?*Function) void {
        return objc.msgSend(self_, "setVertexFunction:", void, .{vertexFunction_});
    }
    pub fn fragmentFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "fragmentFunction", ?*Function, .{});
    }
    pub fn setFragmentFunction(self_: *@This(), fragmentFunction_: ?*Function) void {
        return objc.msgSend(self_, "setFragmentFunction:", void, .{fragmentFunction_});
    }
    pub fn vertexDescriptor(self_: *@This()) ?*VertexDescriptor {
        return objc.msgSend(self_, "vertexDescriptor", ?*VertexDescriptor, .{});
    }
    pub fn setVertexDescriptor(self_: *@This(), vertexDescriptor_: ?*VertexDescriptor) void {
        return objc.msgSend(self_, "setVertexDescriptor:", void, .{vertexDescriptor_});
    }
    pub fn sampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sampleCount", ns.UInteger, .{});
    }
    pub fn setSampleCount(self_: *@This(), sampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setSampleCount:", void, .{sampleCount_});
    }
    pub fn rasterSampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "rasterSampleCount", ns.UInteger, .{});
    }
    pub fn setRasterSampleCount(self_: *@This(), rasterSampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setRasterSampleCount:", void, .{rasterSampleCount_});
    }
    pub fn isAlphaToCoverageEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isAlphaToCoverageEnabled", bool, .{});
    }
    pub fn setAlphaToCoverageEnabled(self_: *@This(), alphaToCoverageEnabled_: bool) void {
        return objc.msgSend(self_, "setAlphaToCoverageEnabled:", void, .{alphaToCoverageEnabled_});
    }
    pub fn isAlphaToOneEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isAlphaToOneEnabled", bool, .{});
    }
    pub fn setAlphaToOneEnabled(self_: *@This(), alphaToOneEnabled_: bool) void {
        return objc.msgSend(self_, "setAlphaToOneEnabled:", void, .{alphaToOneEnabled_});
    }
    pub fn isRasterizationEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isRasterizationEnabled", bool, .{});
    }
    pub fn setRasterizationEnabled(self_: *@This(), rasterizationEnabled_: bool) void {
        return objc.msgSend(self_, "setRasterizationEnabled:", void, .{rasterizationEnabled_});
    }
    pub fn maxVertexAmplificationCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxVertexAmplificationCount", ns.UInteger, .{});
    }
    pub fn setMaxVertexAmplificationCount(self_: *@This(), maxVertexAmplificationCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxVertexAmplificationCount:", void, .{maxVertexAmplificationCount_});
    }
    pub fn colorAttachments(self_: *@This()) *RenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self_, "colorAttachments", *RenderPipelineColorAttachmentDescriptorArray, .{});
    }
    pub fn depthAttachmentPixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "depthAttachmentPixelFormat", PixelFormat, .{});
    }
    pub fn setDepthAttachmentPixelFormat(self_: *@This(), depthAttachmentPixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setDepthAttachmentPixelFormat:", void, .{depthAttachmentPixelFormat_});
    }
    pub fn stencilAttachmentPixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "stencilAttachmentPixelFormat", PixelFormat, .{});
    }
    pub fn setStencilAttachmentPixelFormat(self_: *@This(), stencilAttachmentPixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setStencilAttachmentPixelFormat:", void, .{stencilAttachmentPixelFormat_});
    }
    pub fn inputPrimitiveTopology(self_: *@This()) PrimitiveTopologyClass {
        return objc.msgSend(self_, "inputPrimitiveTopology", PrimitiveTopologyClass, .{});
    }
    pub fn setInputPrimitiveTopology(self_: *@This(), inputPrimitiveTopology_: PrimitiveTopologyClass) void {
        return objc.msgSend(self_, "setInputPrimitiveTopology:", void, .{inputPrimitiveTopology_});
    }
    pub fn tessellationPartitionMode(self_: *@This()) TessellationPartitionMode {
        return objc.msgSend(self_, "tessellationPartitionMode", TessellationPartitionMode, .{});
    }
    pub fn setTessellationPartitionMode(self_: *@This(), tessellationPartitionMode_: TessellationPartitionMode) void {
        return objc.msgSend(self_, "setTessellationPartitionMode:", void, .{tessellationPartitionMode_});
    }
    pub fn maxTessellationFactor(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTessellationFactor", ns.UInteger, .{});
    }
    pub fn setMaxTessellationFactor(self_: *@This(), maxTessellationFactor_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTessellationFactor:", void, .{maxTessellationFactor_});
    }
    pub fn isTessellationFactorScaleEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isTessellationFactorScaleEnabled", bool, .{});
    }
    pub fn setTessellationFactorScaleEnabled(self_: *@This(), tessellationFactorScaleEnabled_: bool) void {
        return objc.msgSend(self_, "setTessellationFactorScaleEnabled:", void, .{tessellationFactorScaleEnabled_});
    }
    pub fn tessellationFactorFormat(self_: *@This()) TessellationFactorFormat {
        return objc.msgSend(self_, "tessellationFactorFormat", TessellationFactorFormat, .{});
    }
    pub fn setTessellationFactorFormat(self_: *@This(), tessellationFactorFormat_: TessellationFactorFormat) void {
        return objc.msgSend(self_, "setTessellationFactorFormat:", void, .{tessellationFactorFormat_});
    }
    pub fn tessellationControlPointIndexType(self_: *@This()) TessellationControlPointIndexType {
        return objc.msgSend(self_, "tessellationControlPointIndexType", TessellationControlPointIndexType, .{});
    }
    pub fn setTessellationControlPointIndexType(self_: *@This(), tessellationControlPointIndexType_: TessellationControlPointIndexType) void {
        return objc.msgSend(self_, "setTessellationControlPointIndexType:", void, .{tessellationControlPointIndexType_});
    }
    pub fn tessellationFactorStepFunction(self_: *@This()) TessellationFactorStepFunction {
        return objc.msgSend(self_, "tessellationFactorStepFunction", TessellationFactorStepFunction, .{});
    }
    pub fn setTessellationFactorStepFunction(self_: *@This(), tessellationFactorStepFunction_: TessellationFactorStepFunction) void {
        return objc.msgSend(self_, "setTessellationFactorStepFunction:", void, .{tessellationFactorStepFunction_});
    }
    pub fn tessellationOutputWindingOrder(self_: *@This()) Winding {
        return objc.msgSend(self_, "tessellationOutputWindingOrder", Winding, .{});
    }
    pub fn setTessellationOutputWindingOrder(self_: *@This(), tessellationOutputWindingOrder_: Winding) void {
        return objc.msgSend(self_, "setTessellationOutputWindingOrder:", void, .{tessellationOutputWindingOrder_});
    }
    pub fn vertexBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "vertexBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn fragmentBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "fragmentBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn supportIndirectCommandBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportIndirectCommandBuffers", bool, .{});
    }
    pub fn setSupportIndirectCommandBuffers(self_: *@This(), supportIndirectCommandBuffers_: bool) void {
        return objc.msgSend(self_, "setSupportIndirectCommandBuffers:", void, .{supportIndirectCommandBuffers_});
    }
    pub fn binaryArchives(self_: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self_, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    pub fn setBinaryArchives(self_: *@This(), binaryArchives_: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self_, "setBinaryArchives:", void, .{binaryArchives_});
    }
    pub fn vertexPreloadedLibraries(self_: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "vertexPreloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    pub fn setVertexPreloadedLibraries(self_: *@This(), vertexPreloadedLibraries_: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setVertexPreloadedLibraries:", void, .{vertexPreloadedLibraries_});
    }
    pub fn fragmentPreloadedLibraries(self_: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "fragmentPreloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    pub fn setFragmentPreloadedLibraries(self_: *@This(), fragmentPreloadedLibraries_: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setFragmentPreloadedLibraries:", void, .{fragmentPreloadedLibraries_});
    }
    pub fn vertexLinkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "vertexLinkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setVertexLinkedFunctions(self_: *@This(), vertexLinkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setVertexLinkedFunctions:", void, .{vertexLinkedFunctions_});
    }
    pub fn fragmentLinkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "fragmentLinkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setFragmentLinkedFunctions(self_: *@This(), fragmentLinkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setFragmentLinkedFunctions:", void, .{fragmentLinkedFunctions_});
    }
    pub fn supportAddingVertexBinaryFunctions(self_: *@This()) bool {
        return objc.msgSend(self_, "supportAddingVertexBinaryFunctions", bool, .{});
    }
    pub fn setSupportAddingVertexBinaryFunctions(self_: *@This(), supportAddingVertexBinaryFunctions_: bool) void {
        return objc.msgSend(self_, "setSupportAddingVertexBinaryFunctions:", void, .{supportAddingVertexBinaryFunctions_});
    }
    pub fn supportAddingFragmentBinaryFunctions(self_: *@This()) bool {
        return objc.msgSend(self_, "supportAddingFragmentBinaryFunctions", bool, .{});
    }
    pub fn setSupportAddingFragmentBinaryFunctions(self_: *@This(), supportAddingFragmentBinaryFunctions_: bool) void {
        return objc.msgSend(self_, "setSupportAddingFragmentBinaryFunctions:", void, .{supportAddingFragmentBinaryFunctions_});
    }
    pub fn maxVertexCallStackDepth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxVertexCallStackDepth", ns.UInteger, .{});
    }
    pub fn setMaxVertexCallStackDepth(self_: *@This(), maxVertexCallStackDepth_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxVertexCallStackDepth:", void, .{maxVertexCallStackDepth_});
    }
    pub fn maxFragmentCallStackDepth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxFragmentCallStackDepth", ns.UInteger, .{});
    }
    pub fn setMaxFragmentCallStackDepth(self_: *@This(), maxFragmentCallStackDepth_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxFragmentCallStackDepth:", void, .{maxFragmentCallStackDepth_});
    }
};

pub const RenderPipelineFunctionsDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPipelineFunctionsDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn vertexAdditionalBinaryFunctions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "vertexAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    pub fn setVertexAdditionalBinaryFunctions(self_: *@This(), vertexAdditionalBinaryFunctions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setVertexAdditionalBinaryFunctions:", void, .{vertexAdditionalBinaryFunctions_});
    }
    pub fn fragmentAdditionalBinaryFunctions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "fragmentAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    pub fn setFragmentAdditionalBinaryFunctions(self_: *@This(), fragmentAdditionalBinaryFunctions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setFragmentAdditionalBinaryFunctions:", void, .{fragmentAdditionalBinaryFunctions_});
    }
    pub fn tileAdditionalBinaryFunctions(self_: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self_, "tileAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    pub fn setTileAdditionalBinaryFunctions(self_: *@This(), tileAdditionalBinaryFunctions_: ?*ns.Array(*Function)) void {
        return objc.msgSend(self_, "setTileAdditionalBinaryFunctions:", void, .{tileAdditionalBinaryFunctions_});
    }
};

pub const RenderPipelineState = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn imageblockMemoryLengthForDimensions(self_: *@This(), imageblockDimensions_: Size) ns.UInteger {
        return objc.msgSend(self_, "imageblockMemoryLengthForDimensions:", ns.UInteger, .{imageblockDimensions_});
    }
    pub fn functionHandleWithFunction_stage(self_: *@This(), function_: *Function, stage_: RenderStages) ?*FunctionHandle {
        return objc.msgSend(self_, "functionHandleWithFunction:stage:", ?*FunctionHandle, .{ function_, stage_ });
    }
    pub fn newVisibleFunctionTableWithDescriptor_stage(self_: *@This(), descriptor_: *VisibleFunctionTableDescriptor, stage_: RenderStages) ?*VisibleFunctionTable {
        return objc.msgSend(self_, "newVisibleFunctionTableWithDescriptor:stage:", ?*VisibleFunctionTable, .{ descriptor_, stage_ });
    }
    pub fn newIntersectionFunctionTableWithDescriptor_stage(self_: *@This(), descriptor_: *IntersectionFunctionTableDescriptor, stage_: RenderStages) ?*IntersectionFunctionTable {
        return objc.msgSend(self_, "newIntersectionFunctionTableWithDescriptor:stage:", ?*IntersectionFunctionTable, .{ descriptor_, stage_ });
    }
    pub fn newRenderPipelineStateWithAdditionalBinaryFunctions_error(self_: *@This(), additionalBinaryFunctions_: *RenderPipelineFunctionsDescriptor, error_: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self_, "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", ?*RenderPipelineState, .{ additionalBinaryFunctions_, error_ });
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn maxTotalThreadsPerThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerThreadgroup", ns.UInteger, .{});
    }
    pub fn threadgroupSizeMatchesTileSize(self_: *@This()) bool {
        return objc.msgSend(self_, "threadgroupSizeMatchesTileSize", bool, .{});
    }
    pub fn imageblockSampleLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "imageblockSampleLength", ns.UInteger, .{});
    }
    pub fn supportIndirectCommandBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportIndirectCommandBuffers", bool, .{});
    }
    pub fn maxTotalThreadsPerObjectThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerObjectThreadgroup", ns.UInteger, .{});
    }
    pub fn maxTotalThreadsPerMeshThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerMeshThreadgroup", ns.UInteger, .{});
    }
    pub fn objectThreadExecutionWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "objectThreadExecutionWidth", ns.UInteger, .{});
    }
    pub fn meshThreadExecutionWidth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "meshThreadExecutionWidth", ns.UInteger, .{});
    }
    pub fn maxTotalThreadgroupsPerMeshGrid(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadgroupsPerMeshGrid", ns.UInteger, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const RenderPipelineColorAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLRenderPipelineColorAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *RenderPipelineColorAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *RenderPipelineColorAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*RenderPipelineColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const TileRenderPipelineColorAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLTileRenderPipelineColorAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn pixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "pixelFormat", PixelFormat, .{});
    }
    pub fn setPixelFormat(self_: *@This(), pixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setPixelFormat:", void, .{pixelFormat_});
    }
};

pub const TileRenderPipelineColorAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLTileRenderPipelineColorAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *TileRenderPipelineColorAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *TileRenderPipelineColorAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: *TileRenderPipelineColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const TileRenderPipelineDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLTileRenderPipelineDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn tileFunction(self_: *@This()) *Function {
        return objc.msgSend(self_, "tileFunction", *Function, .{});
    }
    pub fn setTileFunction(self_: *@This(), tileFunction_: *Function) void {
        return objc.msgSend(self_, "setTileFunction:", void, .{tileFunction_});
    }
    pub fn rasterSampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "rasterSampleCount", ns.UInteger, .{});
    }
    pub fn setRasterSampleCount(self_: *@This(), rasterSampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setRasterSampleCount:", void, .{rasterSampleCount_});
    }
    pub fn colorAttachments(self_: *@This()) *TileRenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self_, "colorAttachments", *TileRenderPipelineColorAttachmentDescriptorArray, .{});
    }
    pub fn threadgroupSizeMatchesTileSize(self_: *@This()) bool {
        return objc.msgSend(self_, "threadgroupSizeMatchesTileSize", bool, .{});
    }
    pub fn setThreadgroupSizeMatchesTileSize(self_: *@This(), threadgroupSizeMatchesTileSize_: bool) void {
        return objc.msgSend(self_, "setThreadgroupSizeMatchesTileSize:", void, .{threadgroupSizeMatchesTileSize_});
    }
    pub fn tileBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "tileBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn maxTotalThreadsPerThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerThreadgroup", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadsPerThreadgroup(self_: *@This(), maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadsPerThreadgroup:", void, .{maxTotalThreadsPerThreadgroup_});
    }
    pub fn binaryArchives(self_: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self_, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    pub fn setBinaryArchives(self_: *@This(), binaryArchives_: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self_, "setBinaryArchives:", void, .{binaryArchives_});
    }
    pub fn preloadedLibraries(self_: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self_, "preloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    pub fn setPreloadedLibraries(self_: *@This(), preloadedLibraries_: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self_, "setPreloadedLibraries:", void, .{preloadedLibraries_});
    }
    pub fn linkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "linkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setLinkedFunctions(self_: *@This(), linkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setLinkedFunctions:", void, .{linkedFunctions_});
    }
    pub fn supportAddingBinaryFunctions(self_: *@This()) bool {
        return objc.msgSend(self_, "supportAddingBinaryFunctions", bool, .{});
    }
    pub fn setSupportAddingBinaryFunctions(self_: *@This(), supportAddingBinaryFunctions_: bool) void {
        return objc.msgSend(self_, "setSupportAddingBinaryFunctions:", void, .{supportAddingBinaryFunctions_});
    }
    pub fn maxCallStackDepth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxCallStackDepth", ns.UInteger, .{});
    }
    pub fn setMaxCallStackDepth(self_: *@This(), maxCallStackDepth_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxCallStackDepth:", void, .{maxCallStackDepth_});
    }
};

pub const MeshRenderPipelineDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLMeshRenderPipelineDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn objectFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "objectFunction", ?*Function, .{});
    }
    pub fn setObjectFunction(self_: *@This(), objectFunction_: ?*Function) void {
        return objc.msgSend(self_, "setObjectFunction:", void, .{objectFunction_});
    }
    pub fn meshFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "meshFunction", ?*Function, .{});
    }
    pub fn setMeshFunction(self_: *@This(), meshFunction_: ?*Function) void {
        return objc.msgSend(self_, "setMeshFunction:", void, .{meshFunction_});
    }
    pub fn fragmentFunction(self_: *@This()) ?*Function {
        return objc.msgSend(self_, "fragmentFunction", ?*Function, .{});
    }
    pub fn setFragmentFunction(self_: *@This(), fragmentFunction_: ?*Function) void {
        return objc.msgSend(self_, "setFragmentFunction:", void, .{fragmentFunction_});
    }
    pub fn maxTotalThreadsPerObjectThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerObjectThreadgroup", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadsPerObjectThreadgroup(self_: *@This(), maxTotalThreadsPerObjectThreadgroup_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadsPerObjectThreadgroup:", void, .{maxTotalThreadsPerObjectThreadgroup_});
    }
    pub fn maxTotalThreadsPerMeshThreadgroup(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadsPerMeshThreadgroup", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadsPerMeshThreadgroup(self_: *@This(), maxTotalThreadsPerMeshThreadgroup_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadsPerMeshThreadgroup:", void, .{maxTotalThreadsPerMeshThreadgroup_});
    }
    pub fn objectThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This()) bool {
        return objc.msgSend(self_, "objectThreadgroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    pub fn setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This(), objectThreadgroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
        return objc.msgSend(self_, "setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:", void, .{objectThreadgroupSizeIsMultipleOfThreadExecutionWidth_});
    }
    pub fn meshThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This()) bool {
        return objc.msgSend(self_, "meshThreadgroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    pub fn setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *@This(), meshThreadgroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
        return objc.msgSend(self_, "setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:", void, .{meshThreadgroupSizeIsMultipleOfThreadExecutionWidth_});
    }
    pub fn payloadMemoryLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "payloadMemoryLength", ns.UInteger, .{});
    }
    pub fn setPayloadMemoryLength(self_: *@This(), payloadMemoryLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setPayloadMemoryLength:", void, .{payloadMemoryLength_});
    }
    pub fn maxTotalThreadgroupsPerMeshGrid(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxTotalThreadgroupsPerMeshGrid", ns.UInteger, .{});
    }
    pub fn setMaxTotalThreadgroupsPerMeshGrid(self_: *@This(), maxTotalThreadgroupsPerMeshGrid_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxTotalThreadgroupsPerMeshGrid:", void, .{maxTotalThreadgroupsPerMeshGrid_});
    }
    pub fn objectBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "objectBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn meshBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "meshBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn fragmentBuffers(self_: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self_, "fragmentBuffers", *PipelineBufferDescriptorArray, .{});
    }
    pub fn rasterSampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "rasterSampleCount", ns.UInteger, .{});
    }
    pub fn setRasterSampleCount(self_: *@This(), rasterSampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setRasterSampleCount:", void, .{rasterSampleCount_});
    }
    pub fn isAlphaToCoverageEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isAlphaToCoverageEnabled", bool, .{});
    }
    pub fn setAlphaToCoverageEnabled(self_: *@This(), alphaToCoverageEnabled_: bool) void {
        return objc.msgSend(self_, "setAlphaToCoverageEnabled:", void, .{alphaToCoverageEnabled_});
    }
    pub fn isAlphaToOneEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isAlphaToOneEnabled", bool, .{});
    }
    pub fn setAlphaToOneEnabled(self_: *@This(), alphaToOneEnabled_: bool) void {
        return objc.msgSend(self_, "setAlphaToOneEnabled:", void, .{alphaToOneEnabled_});
    }
    pub fn isRasterizationEnabled(self_: *@This()) bool {
        return objc.msgSend(self_, "isRasterizationEnabled", bool, .{});
    }
    pub fn setRasterizationEnabled(self_: *@This(), rasterizationEnabled_: bool) void {
        return objc.msgSend(self_, "setRasterizationEnabled:", void, .{rasterizationEnabled_});
    }
    pub fn maxVertexAmplificationCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxVertexAmplificationCount", ns.UInteger, .{});
    }
    pub fn setMaxVertexAmplificationCount(self_: *@This(), maxVertexAmplificationCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxVertexAmplificationCount:", void, .{maxVertexAmplificationCount_});
    }
    pub fn colorAttachments(self_: *@This()) *RenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self_, "colorAttachments", *RenderPipelineColorAttachmentDescriptorArray, .{});
    }
    pub fn depthAttachmentPixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "depthAttachmentPixelFormat", PixelFormat, .{});
    }
    pub fn setDepthAttachmentPixelFormat(self_: *@This(), depthAttachmentPixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setDepthAttachmentPixelFormat:", void, .{depthAttachmentPixelFormat_});
    }
    pub fn stencilAttachmentPixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "stencilAttachmentPixelFormat", PixelFormat, .{});
    }
    pub fn setStencilAttachmentPixelFormat(self_: *@This(), stencilAttachmentPixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setStencilAttachmentPixelFormat:", void, .{stencilAttachmentPixelFormat_});
    }
    pub fn supportIndirectCommandBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportIndirectCommandBuffers", bool, .{});
    }
    pub fn setSupportIndirectCommandBuffers(self_: *@This(), supportIndirectCommandBuffers_: bool) void {
        return objc.msgSend(self_, "setSupportIndirectCommandBuffers:", void, .{supportIndirectCommandBuffers_});
    }
    pub fn objectLinkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "objectLinkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setObjectLinkedFunctions(self_: *@This(), objectLinkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setObjectLinkedFunctions:", void, .{objectLinkedFunctions_});
    }
    pub fn meshLinkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "meshLinkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setMeshLinkedFunctions(self_: *@This(), meshLinkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setMeshLinkedFunctions:", void, .{meshLinkedFunctions_});
    }
    pub fn fragmentLinkedFunctions(self_: *@This()) *LinkedFunctions {
        return objc.msgSend(self_, "fragmentLinkedFunctions", *LinkedFunctions, .{});
    }
    pub fn setFragmentLinkedFunctions(self_: *@This(), fragmentLinkedFunctions_: ?*LinkedFunctions) void {
        return objc.msgSend(self_, "setFragmentLinkedFunctions:", void, .{fragmentLinkedFunctions_});
    }
};

pub const Resource = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setPurgeableState(self_: *@This(), state_: PurgeableState) PurgeableState {
        return objc.msgSend(self_, "setPurgeableState:", PurgeableState, .{state_});
    }
    pub fn makeAliasable(self_: *@This()) void {
        return objc.msgSend(self_, "makeAliasable", void, .{});
    }
    pub fn isAliasable(self_: *@This()) bool {
        return objc.msgSend(self_, "isAliasable", bool, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn cpuCacheMode(self_: *@This()) CPUCacheMode {
        return objc.msgSend(self_, "cpuCacheMode", CPUCacheMode, .{});
    }
    pub fn storageMode(self_: *@This()) StorageMode {
        return objc.msgSend(self_, "storageMode", StorageMode, .{});
    }
    pub fn hazardTrackingMode(self_: *@This()) HazardTrackingMode {
        return objc.msgSend(self_, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    pub fn resourceOptions(self_: *@This()) ResourceOptions {
        return objc.msgSend(self_, "resourceOptions", ResourceOptions, .{});
    }
    pub fn heap(self_: *@This()) ?*Heap {
        return objc.msgSend(self_, "heap", ?*Heap, .{});
    }
    pub fn heapOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "heapOffset", ns.UInteger, .{});
    }
    pub fn allocatedSize(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "allocatedSize", ns.UInteger, .{});
    }
};

pub const ResourceStateCommandEncoder = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{CommandEncoder});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn updateTextureMappings_mode_regions_mipLevels_slices_numRegions(self_: *@This(), texture_: *Texture, mode_: SparseTextureMappingMode, regions_: *const Region, mipLevels_: *const ns.UInteger, slices_: *const ns.UInteger, numRegions_: ns.UInteger) void {
        return objc.msgSend(self_, "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", void, .{ texture_, mode_, regions_, mipLevels_, slices_, numRegions_ });
    }
    pub fn updateTextureMapping_mode_region_mipLevel_slice(self_: *@This(), texture_: *Texture, mode_: SparseTextureMappingMode, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger) void {
        return objc.msgSend(self_, "updateTextureMapping:mode:region:mipLevel:slice:", void, .{ texture_, mode_, region_, mipLevel_, slice_ });
    }
    pub fn updateTextureMapping_mode_indirectBuffer_indirectBufferOffset(self_: *@This(), texture_: *Texture, mode_: SparseTextureMappingMode, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
        return objc.msgSend(self_, "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", void, .{ texture_, mode_, indirectBuffer_, indirectBufferOffset_ });
    }
    pub fn updateFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "updateFence:", void, .{fence_});
    }
    pub fn waitForFence(self_: *@This(), fence_: *Fence) void {
        return objc.msgSend(self_, "waitForFence:", void, .{fence_});
    }
    pub fn moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *@This(), sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
        return objc.msgSend(self_, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_ });
    }
};

pub const ResourceStatePassSampleBufferAttachmentDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLResourceStatePassSampleBufferAttachmentDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn sampleBuffer(self_: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self_, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    pub fn setSampleBuffer(self_: *@This(), sampleBuffer_: ?*CounterSampleBuffer) void {
        return objc.msgSend(self_, "setSampleBuffer:", void, .{sampleBuffer_});
    }
    pub fn startOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "startOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setStartOfEncoderSampleIndex(self_: *@This(), startOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setStartOfEncoderSampleIndex:", void, .{startOfEncoderSampleIndex_});
    }
    pub fn endOfEncoderSampleIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "endOfEncoderSampleIndex", ns.UInteger, .{});
    }
    pub fn setEndOfEncoderSampleIndex(self_: *@This(), endOfEncoderSampleIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setEndOfEncoderSampleIndex:", void, .{endOfEncoderSampleIndex_});
    }
};

pub const ResourceStatePassSampleBufferAttachmentDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLResourceStatePassSampleBufferAttachmentDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), attachmentIndex_: ns.UInteger) *ResourceStatePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *ResourceStatePassSampleBufferAttachmentDescriptor, .{attachmentIndex_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attachment_: ?*ResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attachment_, attachmentIndex_ });
    }
};

pub const ResourceStatePassDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLResourceStatePassDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn resourceStatePassDescriptor() *ResourceStatePassDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "resourceStatePassDescriptor", *ResourceStatePassDescriptor, .{});
    }
    pub fn sampleBufferAttachments(self_: *@This()) *ResourceStatePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self_, "sampleBufferAttachments", *ResourceStatePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

pub const SamplerDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLSamplerDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn minFilter(self_: *@This()) SamplerMinMagFilter {
        return objc.msgSend(self_, "minFilter", SamplerMinMagFilter, .{});
    }
    pub fn setMinFilter(self_: *@This(), minFilter_: SamplerMinMagFilter) void {
        return objc.msgSend(self_, "setMinFilter:", void, .{minFilter_});
    }
    pub fn magFilter(self_: *@This()) SamplerMinMagFilter {
        return objc.msgSend(self_, "magFilter", SamplerMinMagFilter, .{});
    }
    pub fn setMagFilter(self_: *@This(), magFilter_: SamplerMinMagFilter) void {
        return objc.msgSend(self_, "setMagFilter:", void, .{magFilter_});
    }
    pub fn mipFilter(self_: *@This()) SamplerMipFilter {
        return objc.msgSend(self_, "mipFilter", SamplerMipFilter, .{});
    }
    pub fn setMipFilter(self_: *@This(), mipFilter_: SamplerMipFilter) void {
        return objc.msgSend(self_, "setMipFilter:", void, .{mipFilter_});
    }
    pub fn maxAnisotropy(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "maxAnisotropy", ns.UInteger, .{});
    }
    pub fn setMaxAnisotropy(self_: *@This(), maxAnisotropy_: ns.UInteger) void {
        return objc.msgSend(self_, "setMaxAnisotropy:", void, .{maxAnisotropy_});
    }
    pub fn sAddressMode(self_: *@This()) SamplerAddressMode {
        return objc.msgSend(self_, "sAddressMode", SamplerAddressMode, .{});
    }
    pub fn setSAddressMode(self_: *@This(), sAddressMode_: SamplerAddressMode) void {
        return objc.msgSend(self_, "setSAddressMode:", void, .{sAddressMode_});
    }
    pub fn tAddressMode(self_: *@This()) SamplerAddressMode {
        return objc.msgSend(self_, "tAddressMode", SamplerAddressMode, .{});
    }
    pub fn setTAddressMode(self_: *@This(), tAddressMode_: SamplerAddressMode) void {
        return objc.msgSend(self_, "setTAddressMode:", void, .{tAddressMode_});
    }
    pub fn rAddressMode(self_: *@This()) SamplerAddressMode {
        return objc.msgSend(self_, "rAddressMode", SamplerAddressMode, .{});
    }
    pub fn setRAddressMode(self_: *@This(), rAddressMode_: SamplerAddressMode) void {
        return objc.msgSend(self_, "setRAddressMode:", void, .{rAddressMode_});
    }
    pub fn borderColor(self_: *@This()) SamplerBorderColor {
        return objc.msgSend(self_, "borderColor", SamplerBorderColor, .{});
    }
    pub fn setBorderColor(self_: *@This(), borderColor_: SamplerBorderColor) void {
        return objc.msgSend(self_, "setBorderColor:", void, .{borderColor_});
    }
    pub fn normalizedCoordinates(self_: *@This()) bool {
        return objc.msgSend(self_, "normalizedCoordinates", bool, .{});
    }
    pub fn setNormalizedCoordinates(self_: *@This(), normalizedCoordinates_: bool) void {
        return objc.msgSend(self_, "setNormalizedCoordinates:", void, .{normalizedCoordinates_});
    }
    pub fn lodMinClamp(self_: *@This()) f32 {
        return objc.msgSend(self_, "lodMinClamp", f32, .{});
    }
    pub fn setLodMinClamp(self_: *@This(), lodMinClamp_: f32) void {
        return objc.msgSend(self_, "setLodMinClamp:", void, .{lodMinClamp_});
    }
    pub fn lodMaxClamp(self_: *@This()) f32 {
        return objc.msgSend(self_, "lodMaxClamp", f32, .{});
    }
    pub fn setLodMaxClamp(self_: *@This(), lodMaxClamp_: f32) void {
        return objc.msgSend(self_, "setLodMaxClamp:", void, .{lodMaxClamp_});
    }
    pub fn lodAverage(self_: *@This()) bool {
        return objc.msgSend(self_, "lodAverage", bool, .{});
    }
    pub fn setLodAverage(self_: *@This(), lodAverage_: bool) void {
        return objc.msgSend(self_, "setLodAverage:", void, .{lodAverage_});
    }
    pub fn compareFunction(self_: *@This()) CompareFunction {
        return objc.msgSend(self_, "compareFunction", CompareFunction, .{});
    }
    pub fn setCompareFunction(self_: *@This(), compareFunction_: CompareFunction) void {
        return objc.msgSend(self_, "setCompareFunction:", void, .{compareFunction_});
    }
    pub fn supportArgumentBuffers(self_: *@This()) bool {
        return objc.msgSend(self_, "supportArgumentBuffers", bool, .{});
    }
    pub fn setSupportArgumentBuffers(self_: *@This(), supportArgumentBuffers_: bool) void {
        return objc.msgSend(self_, "setSupportArgumentBuffers:", void, .{supportArgumentBuffers_});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn setLabel(self_: *@This(), label_: ?*ns.String) void {
        return objc.msgSend(self_, "setLabel:", void, .{label_});
    }
};

pub const SamplerState = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};

pub const BufferLayoutDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBufferLayoutDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn stride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "stride", ns.UInteger, .{});
    }
    pub fn setStride(self_: *@This(), stride_: ns.UInteger) void {
        return objc.msgSend(self_, "setStride:", void, .{stride_});
    }
    pub fn stepFunction(self_: *@This()) StepFunction {
        return objc.msgSend(self_, "stepFunction", StepFunction, .{});
    }
    pub fn setStepFunction(self_: *@This(), stepFunction_: StepFunction) void {
        return objc.msgSend(self_, "setStepFunction:", void, .{stepFunction_});
    }
    pub fn stepRate(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "stepRate", ns.UInteger, .{});
    }
    pub fn setStepRate(self_: *@This(), stepRate_: ns.UInteger) void {
        return objc.msgSend(self_, "setStepRate:", void, .{stepRate_});
    }
};

pub const BufferLayoutDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLBufferLayoutDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), index_: ns.UInteger) *BufferLayoutDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *BufferLayoutDescriptor, .{index_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), bufferDesc_: ?*BufferLayoutDescriptor, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ bufferDesc_, index_ });
    }
};

pub const AttributeDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAttributeDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn format(self_: *@This()) AttributeFormat {
        return objc.msgSend(self_, "format", AttributeFormat, .{});
    }
    pub fn setFormat(self_: *@This(), format_: AttributeFormat) void {
        return objc.msgSend(self_, "setFormat:", void, .{format_});
    }
    pub fn offset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "offset", ns.UInteger, .{});
    }
    pub fn setOffset(self_: *@This(), offset_: ns.UInteger) void {
        return objc.msgSend(self_, "setOffset:", void, .{offset_});
    }
    pub fn bufferIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferIndex", ns.UInteger, .{});
    }
    pub fn setBufferIndex(self_: *@This(), bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setBufferIndex:", void, .{bufferIndex_});
    }
};

pub const AttributeDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLAttributeDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), index_: ns.UInteger) *AttributeDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *AttributeDescriptor, .{index_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attributeDesc_: ?*AttributeDescriptor, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attributeDesc_, index_ });
    }
};

pub const StageInputOutputDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLStageInputOutputDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn stageInputOutputDescriptor() *StageInputOutputDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "stageInputOutputDescriptor", *StageInputOutputDescriptor, .{});
    }
    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn layouts(self_: *@This()) *BufferLayoutDescriptorArray {
        return objc.msgSend(self_, "layouts", *BufferLayoutDescriptorArray, .{});
    }
    pub fn attributes(self_: *@This()) *AttributeDescriptorArray {
        return objc.msgSend(self_, "attributes", *AttributeDescriptorArray, .{});
    }
    pub fn indexType(self_: *@This()) IndexType {
        return objc.msgSend(self_, "indexType", IndexType, .{});
    }
    pub fn setIndexType(self_: *@This(), indexType_: IndexType) void {
        return objc.msgSend(self_, "setIndexType:", void, .{indexType_});
    }
    pub fn indexBufferIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "indexBufferIndex", ns.UInteger, .{});
    }
    pub fn setIndexBufferIndex(self_: *@This(), indexBufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setIndexBufferIndex:", void, .{indexBufferIndex_});
    }
};

pub const SharedTextureHandle = opaque {
    pub const InternalInfo = objc.ExternClass("MTLSharedTextureHandle", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn device(self_: *@This()) *Device {
        return objc.msgSend(self_, "device", *Device, .{});
    }
    pub fn label(self_: *@This()) ?*ns.String {
        return objc.msgSend(self_, "label", ?*ns.String, .{});
    }
};

pub const TextureDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLTextureDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn texture2DDescriptorWithPixelFormat_width_height_mipmapped(pixelFormat_: PixelFormat, width_: ns.UInteger, height_: ns.UInteger, mipmapped_: bool) *TextureDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *TextureDescriptor, .{ pixelFormat_, width_, height_, mipmapped_ });
    }
    pub fn textureCubeDescriptorWithPixelFormat_size_mipmapped(pixelFormat_: PixelFormat, size_: ns.UInteger, mipmapped_: bool) *TextureDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "textureCubeDescriptorWithPixelFormat:size:mipmapped:", *TextureDescriptor, .{ pixelFormat_, size_, mipmapped_ });
    }
    pub fn textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage(pixelFormat_: PixelFormat, width_: ns.UInteger, resourceOptions_: ResourceOptions, usage_: TextureUsage) *TextureDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:", *TextureDescriptor, .{ pixelFormat_, width_, resourceOptions_, usage_ });
    }
    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn setTextureType(self_: *@This(), textureType_: TextureType) void {
        return objc.msgSend(self_, "setTextureType:", void, .{textureType_});
    }
    pub fn pixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "pixelFormat", PixelFormat, .{});
    }
    pub fn setPixelFormat(self_: *@This(), pixelFormat_: PixelFormat) void {
        return objc.msgSend(self_, "setPixelFormat:", void, .{pixelFormat_});
    }
    pub fn width(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "width", ns.UInteger, .{});
    }
    pub fn setWidth(self_: *@This(), width_: ns.UInteger) void {
        return objc.msgSend(self_, "setWidth:", void, .{width_});
    }
    pub fn height(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "height", ns.UInteger, .{});
    }
    pub fn setHeight(self_: *@This(), height_: ns.UInteger) void {
        return objc.msgSend(self_, "setHeight:", void, .{height_});
    }
    pub fn depth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "depth", ns.UInteger, .{});
    }
    pub fn setDepth(self_: *@This(), depth_: ns.UInteger) void {
        return objc.msgSend(self_, "setDepth:", void, .{depth_});
    }
    pub fn mipmapLevelCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "mipmapLevelCount", ns.UInteger, .{});
    }
    pub fn setMipmapLevelCount(self_: *@This(), mipmapLevelCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setMipmapLevelCount:", void, .{mipmapLevelCount_});
    }
    pub fn sampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sampleCount", ns.UInteger, .{});
    }
    pub fn setSampleCount(self_: *@This(), sampleCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setSampleCount:", void, .{sampleCount_});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
    pub fn setArrayLength(self_: *@This(), arrayLength_: ns.UInteger) void {
        return objc.msgSend(self_, "setArrayLength:", void, .{arrayLength_});
    }
    pub fn resourceOptions(self_: *@This()) ResourceOptions {
        return objc.msgSend(self_, "resourceOptions", ResourceOptions, .{});
    }
    pub fn setResourceOptions(self_: *@This(), resourceOptions_: ResourceOptions) void {
        return objc.msgSend(self_, "setResourceOptions:", void, .{resourceOptions_});
    }
    pub fn cpuCacheMode(self_: *@This()) CPUCacheMode {
        return objc.msgSend(self_, "cpuCacheMode", CPUCacheMode, .{});
    }
    pub fn setCpuCacheMode(self_: *@This(), cpuCacheMode_: CPUCacheMode) void {
        return objc.msgSend(self_, "setCpuCacheMode:", void, .{cpuCacheMode_});
    }
    pub fn storageMode(self_: *@This()) StorageMode {
        return objc.msgSend(self_, "storageMode", StorageMode, .{});
    }
    pub fn setStorageMode(self_: *@This(), storageMode_: StorageMode) void {
        return objc.msgSend(self_, "setStorageMode:", void, .{storageMode_});
    }
    pub fn hazardTrackingMode(self_: *@This()) HazardTrackingMode {
        return objc.msgSend(self_, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    pub fn setHazardTrackingMode(self_: *@This(), hazardTrackingMode_: HazardTrackingMode) void {
        return objc.msgSend(self_, "setHazardTrackingMode:", void, .{hazardTrackingMode_});
    }
    pub fn usage(self_: *@This()) TextureUsage {
        return objc.msgSend(self_, "usage", TextureUsage, .{});
    }
    pub fn setUsage(self_: *@This(), usage_: TextureUsage) void {
        return objc.msgSend(self_, "setUsage:", void, .{usage_});
    }
    pub fn allowGPUOptimizedContents(self_: *@This()) bool {
        return objc.msgSend(self_, "allowGPUOptimizedContents", bool, .{});
    }
    pub fn setAllowGPUOptimizedContents(self_: *@This(), allowGPUOptimizedContents_: bool) void {
        return objc.msgSend(self_, "setAllowGPUOptimizedContents:", void, .{allowGPUOptimizedContents_});
    }
    pub fn compressionType(self_: *@This()) TextureCompressionType {
        return objc.msgSend(self_, "compressionType", TextureCompressionType, .{});
    }
    pub fn setCompressionType(self_: *@This(), compressionType_: TextureCompressionType) void {
        return objc.msgSend(self_, "setCompressionType:", void, .{compressionType_});
    }
    pub fn swizzle(self_: *@This()) TextureSwizzleChannels {
        return objc.msgSend(self_, "swizzle", TextureSwizzleChannels, .{});
    }
    pub fn setSwizzle(self_: *@This(), swizzle_: TextureSwizzleChannels) void {
        return objc.msgSend(self_, "setSwizzle:", void, .{swizzle_});
    }
};

pub const Texture = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice(self_: *@This(), pixelBytes_: *anyopaque, bytesPerRow_: ns.UInteger, bytesPerImage_: ns.UInteger, region_: Region, level_: ns.UInteger, slice_: ns.UInteger) void {
        return objc.msgSend(self_, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", void, .{ pixelBytes_, bytesPerRow_, bytesPerImage_, region_, level_, slice_ });
    }
    pub fn replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage(self_: *@This(), region_: Region, level_: ns.UInteger, slice_: ns.UInteger, pixelBytes_: *const anyopaque, bytesPerRow_: ns.UInteger, bytesPerImage_: ns.UInteger) void {
        return objc.msgSend(self_, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", void, .{ region_, level_, slice_, pixelBytes_, bytesPerRow_, bytesPerImage_ });
    }
    pub fn getBytes_bytesPerRow_fromRegion_mipmapLevel(self_: *@This(), pixelBytes_: *anyopaque, bytesPerRow_: ns.UInteger, region_: Region, level_: ns.UInteger) void {
        return objc.msgSend(self_, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", void, .{ pixelBytes_, bytesPerRow_, region_, level_ });
    }
    pub fn replaceRegion_mipmapLevel_withBytes_bytesPerRow(self_: *@This(), region_: Region, level_: ns.UInteger, pixelBytes_: *const anyopaque, bytesPerRow_: ns.UInteger) void {
        return objc.msgSend(self_, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", void, .{ region_, level_, pixelBytes_, bytesPerRow_ });
    }
    pub fn newTextureViewWithPixelFormat(self_: *@This(), pixelFormat_: PixelFormat) ?*Texture {
        return objc.msgSend(self_, "newTextureViewWithPixelFormat:", ?*Texture, .{pixelFormat_});
    }
    pub fn newTextureViewWithPixelFormat_textureType_levels_slices(self_: *@This(), pixelFormat_: PixelFormat, textureType_: TextureType, levelRange_: ns.Range, sliceRange_: ns.Range) ?*Texture {
        return objc.msgSend(self_, "newTextureViewWithPixelFormat:textureType:levels:slices:", ?*Texture, .{ pixelFormat_, textureType_, levelRange_, sliceRange_ });
    }
    pub fn newSharedTextureHandle(self_: *@This()) ?*SharedTextureHandle {
        return objc.msgSend(self_, "newSharedTextureHandle", ?*SharedTextureHandle, .{});
    }
    pub fn newRemoteTextureViewForDevice(self_: *@This(), device_: *Device) ?*Texture {
        return objc.msgSend(self_, "newRemoteTextureViewForDevice:", ?*Texture, .{device_});
    }
    pub fn newTextureViewWithPixelFormat_textureType_levels_slices_swizzle(self_: *@This(), pixelFormat_: PixelFormat, textureType_: TextureType, levelRange_: ns.Range, sliceRange_: ns.Range, swizzle_: TextureSwizzleChannels) ?*Texture {
        return objc.msgSend(self_, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", ?*Texture, .{ pixelFormat_, textureType_, levelRange_, sliceRange_, swizzle_ });
    }
    pub fn rootResource(self_: *@This()) ?*Resource {
        return objc.msgSend(self_, "rootResource", ?*Resource, .{});
    }
    pub fn parentTexture(self_: *@This()) ?*Texture {
        return objc.msgSend(self_, "parentTexture", ?*Texture, .{});
    }
    pub fn parentRelativeLevel(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "parentRelativeLevel", ns.UInteger, .{});
    }
    pub fn parentRelativeSlice(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "parentRelativeSlice", ns.UInteger, .{});
    }
    pub fn buffer(self_: *@This()) ?*Buffer {
        return objc.msgSend(self_, "buffer", ?*Buffer, .{});
    }
    pub fn bufferOffset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferOffset", ns.UInteger, .{});
    }
    pub fn bufferBytesPerRow(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferBytesPerRow", ns.UInteger, .{});
    }
    pub fn iosurface(self_: *@This()) IOSurfaceRef {
        return objc.msgSend(self_, "iosurface", IOSurfaceRef, .{});
    }
    pub fn iosurfacePlane(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "iosurfacePlane", ns.UInteger, .{});
    }
    pub fn textureType(self_: *@This()) TextureType {
        return objc.msgSend(self_, "textureType", TextureType, .{});
    }
    pub fn pixelFormat(self_: *@This()) PixelFormat {
        return objc.msgSend(self_, "pixelFormat", PixelFormat, .{});
    }
    pub fn width(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "width", ns.UInteger, .{});
    }
    pub fn height(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "height", ns.UInteger, .{});
    }
    pub fn depth(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "depth", ns.UInteger, .{});
    }
    pub fn mipmapLevelCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "mipmapLevelCount", ns.UInteger, .{});
    }
    pub fn sampleCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "sampleCount", ns.UInteger, .{});
    }
    pub fn arrayLength(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "arrayLength", ns.UInteger, .{});
    }
    pub fn usage(self_: *@This()) TextureUsage {
        return objc.msgSend(self_, "usage", TextureUsage, .{});
    }
    pub fn isShareable(self_: *@This()) bool {
        return objc.msgSend(self_, "isShareable", bool, .{});
    }
    pub fn isFramebufferOnly(self_: *@This()) bool {
        return objc.msgSend(self_, "isFramebufferOnly", bool, .{});
    }
    pub fn firstMipmapInTail(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "firstMipmapInTail", ns.UInteger, .{});
    }
    pub fn tailSizeInBytes(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "tailSizeInBytes", ns.UInteger, .{});
    }
    pub fn isSparse(self_: *@This()) bool {
        return objc.msgSend(self_, "isSparse", bool, .{});
    }
    pub fn allowGPUOptimizedContents(self_: *@This()) bool {
        return objc.msgSend(self_, "allowGPUOptimizedContents", bool, .{});
    }
    pub fn compressionType(self_: *@This()) TextureCompressionType {
        return objc.msgSend(self_, "compressionType", TextureCompressionType, .{});
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
    pub fn remoteStorageTexture(self_: *@This()) *Texture {
        return objc.msgSend(self_, "remoteStorageTexture", *Texture, .{});
    }
    pub fn swizzle(self_: *@This()) TextureSwizzleChannels {
        return objc.msgSend(self_, "swizzle", TextureSwizzleChannels, .{});
    }
};

pub const VertexBufferLayoutDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexBufferLayoutDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn stride(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "stride", ns.UInteger, .{});
    }
    pub fn setStride(self_: *@This(), stride_: ns.UInteger) void {
        return objc.msgSend(self_, "setStride:", void, .{stride_});
    }
    pub fn stepFunction(self_: *@This()) VertexStepFunction {
        return objc.msgSend(self_, "stepFunction", VertexStepFunction, .{});
    }
    pub fn setStepFunction(self_: *@This(), stepFunction_: VertexStepFunction) void {
        return objc.msgSend(self_, "setStepFunction:", void, .{stepFunction_});
    }
    pub fn stepRate(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "stepRate", ns.UInteger, .{});
    }
    pub fn setStepRate(self_: *@This(), stepRate_: ns.UInteger) void {
        return objc.msgSend(self_, "setStepRate:", void, .{stepRate_});
    }
};

pub const VertexBufferLayoutDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexBufferLayoutDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), index_: ns.UInteger) *VertexBufferLayoutDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *VertexBufferLayoutDescriptor, .{index_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), bufferDesc_: ?*VertexBufferLayoutDescriptor, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ bufferDesc_, index_ });
    }
};

pub const VertexAttributeDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexAttributeDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn format(self_: *@This()) VertexFormat {
        return objc.msgSend(self_, "format", VertexFormat, .{});
    }
    pub fn setFormat(self_: *@This(), format_: VertexFormat) void {
        return objc.msgSend(self_, "setFormat:", void, .{format_});
    }
    pub fn offset(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "offset", ns.UInteger, .{});
    }
    pub fn setOffset(self_: *@This(), offset_: ns.UInteger) void {
        return objc.msgSend(self_, "setOffset:", void, .{offset_});
    }
    pub fn bufferIndex(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "bufferIndex", ns.UInteger, .{});
    }
    pub fn setBufferIndex(self_: *@This(), bufferIndex_: ns.UInteger) void {
        return objc.msgSend(self_, "setBufferIndex:", void, .{bufferIndex_});
    }
};

pub const VertexAttributeDescriptorArray = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexAttributeDescriptorArray", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn objectAtIndexedSubscript(self_: *@This(), index_: ns.UInteger) *VertexAttributeDescriptor {
        return objc.msgSend(self_, "objectAtIndexedSubscript:", *VertexAttributeDescriptor, .{index_});
    }
    pub fn setObject_atIndexedSubscript(self_: *@This(), attributeDesc_: ?*VertexAttributeDescriptor, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setObject:atIndexedSubscript:", void, .{ attributeDesc_, index_ });
    }
};

pub const VertexDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVertexDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn vertexDescriptor() *VertexDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "vertexDescriptor", *VertexDescriptor, .{});
    }
    pub fn reset(self_: *@This()) void {
        return objc.msgSend(self_, "reset", void, .{});
    }
    pub fn layouts(self_: *@This()) *VertexBufferLayoutDescriptorArray {
        return objc.msgSend(self_, "layouts", *VertexBufferLayoutDescriptorArray, .{});
    }
    pub fn attributes(self_: *@This()) *VertexAttributeDescriptorArray {
        return objc.msgSend(self_, "attributes", *VertexAttributeDescriptorArray, .{});
    }
};

pub const VisibleFunctionTableDescriptor = opaque {
    pub const InternalInfo = objc.ExternClass("MTLVisibleFunctionTableDescriptor", @This(), ns.ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn visibleFunctionTableDescriptor() *VisibleFunctionTableDescriptor {
        return objc.msgSend(@This().InternalInfo.class(), "visibleFunctionTableDescriptor", *VisibleFunctionTableDescriptor, .{});
    }
    pub fn functionCount(self_: *@This()) ns.UInteger {
        return objc.msgSend(self_, "functionCount", ns.UInteger, .{});
    }
    pub fn setFunctionCount(self_: *@This(), functionCount_: ns.UInteger) void {
        return objc.msgSend(self_, "setFunctionCount:", void, .{functionCount_});
    }
};

pub const VisibleFunctionTable = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{Resource});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn setFunction_atIndex(self_: *@This(), function_: ?*FunctionHandle, index_: ns.UInteger) void {
        return objc.msgSend(self_, "setFunction:atIndex:", void, .{ function_, index_ });
    }
    pub fn setFunctions_withRange(self_: *@This(), functions_: *?*const FunctionHandle, range_: ns.Range) void {
        return objc.msgSend(self_, "setFunctions:withRange:", void, .{ functions_, range_ });
    }
    pub fn gpuResourceID(self_: *@This()) ResourceID {
        return objc.msgSend(self_, "gpuResourceID", ResourceID, .{});
    }
};
