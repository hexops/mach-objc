const c = @import("../c.zig");
const cf = @import("../core_foundation/cf.zig");
const ns = @import("../foundation/ns.zig");

// ------------------------------------------------------------------------------------------------
// Opaque types

pub const dispatch_data_t = *opaque {};
pub const dispatch_queue_t = *opaque {};
pub const IOSurfaceRef = *opaque {};

// ------------------------------------------------------------------------------------------------
// Blocks

extern const _NSConcreteStackBlock: *anyopaque;
extern fn _Block_copy(block: *const anyopaque) callconv(.C) *anyopaque;
extern fn _Block_release(block: *const anyopaque) callconv(.C) void;

const BlockDescriptor = extern struct {
    reserved: c_ulong,
    size: c_ulong,
};

const BlockLiteral = extern struct {
    isa: *anyopaque,
    flags: c_int,
    reserved: c_int,
    invoke: *const fn () callconv(.C) void,
    descriptor: *const BlockDescriptor,
};

const block_descriptor = BlockDescriptor{ .reserved = 0, .size = @sizeOf(BlockLiteral) };

// TODO - variable capture
pub fn Block(comptime FuncType: type) type {
    return opaque {
        const Self = @This();

        pub fn init(comptime invoke: FuncType) *Self {
            const block = BlockLiteral{
                .isa = _NSConcreteStackBlock,
                .flags = 0,
                .reserved = 0,
                .invoke = @as(*const fn () callconv(.C) void, @ptrCast(invoke)),
                .descriptor = &block_descriptor,
            };
            return _Block_copy(&block);
        }
    };
}

// ------------------------------------------------------------------------------------------------
// Types

// MTLCommandBuffer.hpp
pub const CommandBufferHandler = *Block(*const fn (*anyopaque, *CommandBuffer) callconv(.C) void);

// MTLCounters.hpp
pub const CommonCounter = *ns.String;
pub const CommonCounterSet = *ns.String;

// MTLDevice.hpp
pub const DeviceNotificationName = *ns.String;
pub const DeviceNotificationHandlerBlock = *Block(fn (*anyopaque, *Device, DeviceNotificationName) callconv(.C) void);
pub const NewLibraryCompletionHandler = *Block(fn (*anyopaque, *Library, *ns.Error) callconv(.C) void);
pub const NewRenderPipelineStateCompletionHandler = *Block(fn (*anyopaque, *RenderPipelineState, *ns.Error) callconv(.C) void);
pub const NewRenderPipelineStateWithReflectionCompletionHandler = *Block(fn (*anyopaque, *RenderPipelineState, *RenderPipelineReflection, *ns.Error) callconv(.C) void);
pub const NewComputePipelineStateCompletionHandler = *Block(fn (*anyopaque, *ComputePipelineState, *ns.Error) callconv(.C) void);
pub const NewComputePipelineStateWithReflectionCompletionHandler = *Block(fn (*anyopaque, *ComputePipelineState, *ComputePipelineReflection, *ns.Error) callconv(.C) void);
pub const AutoreleasedComputePipelineReflection = *ComputePipelineReflection;
pub const AutoreleasedRenderPipelineReflection = *RenderPipelineReflection;
pub const Timestamp = u64;

// MTLIOCommandBuffer.hpp
pub const IOCommandBufferHandler = *Block(fn (*anyopaque, *IOCommandBuffer) callconv(.C) void);

// MTLDrawable.hpp
pub const DrawablePresentedHandler = *Block(fn (*anyopaque, *Drawable) callconv(.C) void);

// MTLEvent.hpp
pub const SharedEventNotificationBlock = *Block(fn (*anyopaque, *SharedEvent, u64) callconv(.C) void);

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

pub const ArgumentAccess = ns.UInteger;
pub const ArgumentAccessReadOnly: ArgumentAccess = 0;
pub const ArgumentAccessReadWrite: ArgumentAccess = 1;
pub const ArgumentAccessWriteOnly: ArgumentAccess = 2;

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

pub const IntersectionFunctionSignature = ns.UInteger;
pub const IntersectionFunctionSignatureNone: IntersectionFunctionSignature = 0;
pub const IntersectionFunctionSignatureInstancing: IntersectionFunctionSignature = 1;
pub const IntersectionFunctionSignatureTriangleData: IntersectionFunctionSignature = 2;
pub const IntersectionFunctionSignatureWorldSpaceData: IntersectionFunctionSignature = 4;
pub const IntersectionFunctionSignatureInstanceMotion: IntersectionFunctionSignature = 8;
pub const IntersectionFunctionSignaturePrimitiveMotion: IntersectionFunctionSignature = 16;
pub const IntersectionFunctionSignatureExtendedLimits: IntersectionFunctionSignature = 32;

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

pub const VertexStepFunction = ns.UInteger;
pub const VertexStepFunctionConstant: VertexStepFunction = 0;
pub const VertexStepFunctionPerVertex: VertexStepFunction = 1;
pub const VertexStepFunctionPerInstance: VertexStepFunction = 2;
pub const VertexStepFunctionPerPatch: VertexStepFunction = 3;
pub const VertexStepFunctionPerPatchControlPoint: VertexStepFunction = 4;

pub const AccelerationStructureDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn usage(self_: *T) AccelerationStructureUsage {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AccelerationStructureUsage, @ptrCast(&c.objc_msgSend))(self_, sel_usage);
            }
            pub fn setUsage(self_: *T, usage_: AccelerationStructureUsage) void {
                return @as(*const fn (*T, *c.objc_selector, AccelerationStructureUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setUsage_, usage_);
            }
        };
    }
};

pub const AccelerationStructureGeometryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureGeometryDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureGeometryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn intersectionFunctionTableOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_intersectionFunctionTableOffset);
            }
            pub fn setIntersectionFunctionTableOffset(self_: *T, intersectionFunctionTableOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIntersectionFunctionTableOffset_, intersectionFunctionTableOffset_);
            }
            pub fn @"opaque"(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_opaque);
            }
            pub fn setOpaque(self_: *T, opaque_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOpaque_, opaque_);
            }
            pub fn allowDuplicateIntersectionFunctionInvocation(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowDuplicateIntersectionFunctionInvocation);
            }
            pub fn setAllowDuplicateIntersectionFunctionInvocation(self_: *T, allowDuplicateIntersectionFunctionInvocation_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAllowDuplicateIntersectionFunctionInvocation_, allowDuplicateIntersectionFunctionInvocation_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn primitiveDataBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_primitiveDataBuffer);
            }
            pub fn setPrimitiveDataBuffer(self_: *T, primitiveDataBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPrimitiveDataBuffer_, primitiveDataBuffer_);
            }
            pub fn primitiveDataBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_primitiveDataBufferOffset);
            }
            pub fn setPrimitiveDataBufferOffset(self_: *T, primitiveDataBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPrimitiveDataBufferOffset_, primitiveDataBufferOffset_);
            }
            pub fn primitiveDataStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_primitiveDataStride);
            }
            pub fn setPrimitiveDataStride(self_: *T, primitiveDataStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPrimitiveDataStride_, primitiveDataStride_);
            }
            pub fn primitiveDataElementSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_primitiveDataElementSize);
            }
            pub fn setPrimitiveDataElementSize(self_: *T, primitiveDataElementSize_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPrimitiveDataElementSize_, primitiveDataElementSize_);
            }
        };
    }
};

pub const PrimitiveAccelerationStructureDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_PrimitiveAccelerationStructureDescriptor;
    }
    pub usingnamespace Methods(PrimitiveAccelerationStructureDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            // pub fn geometryDescriptors(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_geometryDescriptors);
            // }
            // pub fn setGeometryDescriptors(self_: *T, geometryDescriptors_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setGeometryDescriptors_, geometryDescriptors_);
            // }
            pub fn motionStartBorderMode(self_: *T) MotionBorderMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) MotionBorderMode, @ptrCast(&c.objc_msgSend))(self_, sel_motionStartBorderMode);
            }
            pub fn setMotionStartBorderMode(self_: *T, motionStartBorderMode_: MotionBorderMode) void {
                return @as(*const fn (*T, *c.objc_selector, MotionBorderMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionStartBorderMode_, motionStartBorderMode_);
            }
            pub fn motionEndBorderMode(self_: *T) MotionBorderMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) MotionBorderMode, @ptrCast(&c.objc_msgSend))(self_, sel_motionEndBorderMode);
            }
            pub fn setMotionEndBorderMode(self_: *T, motionEndBorderMode_: MotionBorderMode) void {
                return @as(*const fn (*T, *c.objc_selector, MotionBorderMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionEndBorderMode_, motionEndBorderMode_);
            }
            pub fn motionStartTime(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_motionStartTime);
            }
            pub fn setMotionStartTime(self_: *T, motionStartTime_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionStartTime_, motionStartTime_);
            }
            pub fn motionEndTime(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_motionEndTime);
            }
            pub fn setMotionEndTime(self_: *T, motionEndTime_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionEndTime_, motionEndTime_);
            }
            pub fn motionKeyframeCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_motionKeyframeCount);
            }
            pub fn setMotionKeyframeCount(self_: *T, motionKeyframeCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionKeyframeCount_, motionKeyframeCount_);
            }
        };
    }
};

pub const AccelerationStructureTriangleGeometryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureTriangleGeometryDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureTriangleGeometryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureGeometryDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            pub fn vertexBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_vertexBuffer);
            }
            pub fn setVertexBuffer(self_: *T, vertexBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBuffer_, vertexBuffer_);
            }
            pub fn vertexBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_vertexBufferOffset);
            }
            pub fn setVertexBufferOffset(self_: *T, vertexBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBufferOffset_, vertexBufferOffset_);
            }
            pub fn vertexFormat(self_: *T) AttributeFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AttributeFormat, @ptrCast(&c.objc_msgSend))(self_, sel_vertexFormat);
            }
            pub fn setVertexFormat(self_: *T, vertexFormat_: AttributeFormat) void {
                return @as(*const fn (*T, *c.objc_selector, AttributeFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexFormat_, vertexFormat_);
            }
            pub fn vertexStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_vertexStride);
            }
            pub fn setVertexStride(self_: *T, vertexStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexStride_, vertexStride_);
            }
            pub fn indexBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_indexBuffer);
            }
            pub fn setIndexBuffer(self_: *T, indexBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexBuffer_, indexBuffer_);
            }
            pub fn indexBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_indexBufferOffset);
            }
            pub fn setIndexBufferOffset(self_: *T, indexBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexBufferOffset_, indexBufferOffset_);
            }
            pub fn indexType(self_: *T) IndexType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IndexType, @ptrCast(&c.objc_msgSend))(self_, sel_indexType);
            }
            pub fn setIndexType(self_: *T, indexType_: IndexType) void {
                return @as(*const fn (*T, *c.objc_selector, IndexType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexType_, indexType_);
            }
            pub fn triangleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_triangleCount);
            }
            pub fn setTriangleCount(self_: *T, triangleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTriangleCount_, triangleCount_);
            }
            pub fn transformationMatrixBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_transformationMatrixBuffer);
            }
            pub fn setTransformationMatrixBuffer(self_: *T, transformationMatrixBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTransformationMatrixBuffer_, transformationMatrixBuffer_);
            }
            pub fn transformationMatrixBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_transformationMatrixBufferOffset);
            }
            pub fn setTransformationMatrixBufferOffset(self_: *T, transformationMatrixBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset_);
            }
        };
    }
};

pub const AccelerationStructureBoundingBoxGeometryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureBoundingBoxGeometryDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureBoundingBoxGeometryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureGeometryDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            pub fn boundingBoxBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxBuffer);
            }
            pub fn setBoundingBoxBuffer(self_: *T, boundingBoxBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxBuffer_, boundingBoxBuffer_);
            }
            pub fn boundingBoxBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxBufferOffset);
            }
            pub fn setBoundingBoxBufferOffset(self_: *T, boundingBoxBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxBufferOffset_, boundingBoxBufferOffset_);
            }
            pub fn boundingBoxStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxStride);
            }
            pub fn setBoundingBoxStride(self_: *T, boundingBoxStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxStride_, boundingBoxStride_);
            }
            pub fn boundingBoxCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxCount);
            }
            pub fn setBoundingBoxCount(self_: *T, boundingBoxCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxCount_, boundingBoxCount_);
            }
        };
    }
};

pub const MotionKeyframeData = opaque {
    pub fn class() *c.objc_class {
        return class_MotionKeyframeData;
    }
    pub usingnamespace Methods(MotionKeyframeData);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn data() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_data);
            }
            pub fn buffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_buffer);
            }
            pub fn setBuffer(self_: *T, buffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffer_, buffer_);
            }
            pub fn offset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_offset);
            }
            pub fn setOffset(self_: *T, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOffset_, offset_);
            }
        };
    }
};

pub const AccelerationStructureMotionTriangleGeometryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureMotionTriangleGeometryDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureMotionTriangleGeometryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureGeometryDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            // pub fn vertexBuffers(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexBuffers);
            // }
            // pub fn setVertexBuffers(self_: *T, vertexBuffers_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBuffers_, vertexBuffers_);
            // }
            pub fn vertexFormat(self_: *T) AttributeFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AttributeFormat, @ptrCast(&c.objc_msgSend))(self_, sel_vertexFormat);
            }
            pub fn setVertexFormat(self_: *T, vertexFormat_: AttributeFormat) void {
                return @as(*const fn (*T, *c.objc_selector, AttributeFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexFormat_, vertexFormat_);
            }
            pub fn vertexStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_vertexStride);
            }
            pub fn setVertexStride(self_: *T, vertexStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexStride_, vertexStride_);
            }
            pub fn indexBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_indexBuffer);
            }
            pub fn setIndexBuffer(self_: *T, indexBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexBuffer_, indexBuffer_);
            }
            pub fn indexBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_indexBufferOffset);
            }
            pub fn setIndexBufferOffset(self_: *T, indexBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexBufferOffset_, indexBufferOffset_);
            }
            pub fn indexType(self_: *T) IndexType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IndexType, @ptrCast(&c.objc_msgSend))(self_, sel_indexType);
            }
            pub fn setIndexType(self_: *T, indexType_: IndexType) void {
                return @as(*const fn (*T, *c.objc_selector, IndexType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexType_, indexType_);
            }
            pub fn triangleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_triangleCount);
            }
            pub fn setTriangleCount(self_: *T, triangleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTriangleCount_, triangleCount_);
            }
            pub fn transformationMatrixBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_transformationMatrixBuffer);
            }
            pub fn setTransformationMatrixBuffer(self_: *T, transformationMatrixBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTransformationMatrixBuffer_, transformationMatrixBuffer_);
            }
            pub fn transformationMatrixBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_transformationMatrixBufferOffset);
            }
            pub fn setTransformationMatrixBufferOffset(self_: *T, transformationMatrixBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset_);
            }
        };
    }
};

pub const AccelerationStructureMotionBoundingBoxGeometryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructureMotionBoundingBoxGeometryDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructureMotionBoundingBoxGeometryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureGeometryDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            // pub fn boundingBoxBuffers(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxBuffers);
            // }
            // pub fn setBoundingBoxBuffers(self_: *T, boundingBoxBuffers_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxBuffers_, boundingBoxBuffers_);
            // }
            pub fn boundingBoxStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxStride);
            }
            pub fn setBoundingBoxStride(self_: *T, boundingBoxStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxStride_, boundingBoxStride_);
            }
            pub fn boundingBoxCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_boundingBoxCount);
            }
            pub fn setBoundingBoxCount(self_: *T, boundingBoxCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBoundingBoxCount_, boundingBoxCount_);
            }
        };
    }
};

pub const InstanceAccelerationStructureDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_InstanceAccelerationStructureDescriptor;
    }
    pub usingnamespace Methods(InstanceAccelerationStructureDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace AccelerationStructureDescriptor.Methods(T);

            pub fn descriptor() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_descriptor);
            }
            pub fn instanceDescriptorBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_instanceDescriptorBuffer);
            }
            pub fn setInstanceDescriptorBuffer(self_: *T, instanceDescriptorBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstanceDescriptorBuffer_, instanceDescriptorBuffer_);
            }
            pub fn instanceDescriptorBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_instanceDescriptorBufferOffset);
            }
            pub fn setInstanceDescriptorBufferOffset(self_: *T, instanceDescriptorBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstanceDescriptorBufferOffset_, instanceDescriptorBufferOffset_);
            }
            pub fn instanceDescriptorStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_instanceDescriptorStride);
            }
            pub fn setInstanceDescriptorStride(self_: *T, instanceDescriptorStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstanceDescriptorStride_, instanceDescriptorStride_);
            }
            pub fn instanceCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_instanceCount);
            }
            pub fn setInstanceCount(self_: *T, instanceCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstanceCount_, instanceCount_);
            }
            // pub fn instancedAccelerationStructures(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_instancedAccelerationStructures);
            // }
            // pub fn setInstancedAccelerationStructures(self_: *T, instancedAccelerationStructures_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstancedAccelerationStructures_, instancedAccelerationStructures_);
            // }
            pub fn instanceDescriptorType(self_: *T) AccelerationStructureInstanceDescriptorType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AccelerationStructureInstanceDescriptorType, @ptrCast(&c.objc_msgSend))(self_, sel_instanceDescriptorType);
            }
            pub fn setInstanceDescriptorType(self_: *T, instanceDescriptorType_: AccelerationStructureInstanceDescriptorType) void {
                return @as(*const fn (*T, *c.objc_selector, AccelerationStructureInstanceDescriptorType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstanceDescriptorType_, instanceDescriptorType_);
            }
            pub fn motionTransformBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_motionTransformBuffer);
            }
            pub fn setMotionTransformBuffer(self_: *T, motionTransformBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionTransformBuffer_, motionTransformBuffer_);
            }
            pub fn motionTransformBufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_motionTransformBufferOffset);
            }
            pub fn setMotionTransformBufferOffset(self_: *T, motionTransformBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionTransformBufferOffset_, motionTransformBufferOffset_);
            }
            pub fn motionTransformCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_motionTransformCount);
            }
            pub fn setMotionTransformCount(self_: *T, motionTransformCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMotionTransformCount_, motionTransformCount_);
            }
        };
    }
};

pub const AccelerationStructure = opaque {
    pub usingnamespace Methods(AccelerationStructure);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn size(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_size);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const AccelerationStructureCommandEncoder = opaque {
    pub usingnamespace Methods(AccelerationStructureCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset(self_: *T, accelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, scratchBuffer_: *Buffer, scratchBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *AccelerationStructureDescriptor, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_, accelerationStructure_, descriptor_, scratchBuffer_, scratchBufferOffset_);
            }
            pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset(self_: *T, sourceAccelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, destinationAccelerationStructure_: ?*AccelerationStructure, scratchBuffer_: ?*Buffer, scratchBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *AccelerationStructureDescriptor, ?*AccelerationStructure, ?*Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_, sourceAccelerationStructure_, descriptor_, destinationAccelerationStructure_, scratchBuffer_, scratchBufferOffset_);
            }
            pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options(self_: *T, sourceAccelerationStructure_: *AccelerationStructure, descriptor_: *AccelerationStructureDescriptor, destinationAccelerationStructure_: ?*AccelerationStructure, scratchBuffer_: ?*Buffer, scratchBufferOffset_: ns.UInteger, options_: AccelerationStructureRefitOptions) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *AccelerationStructureDescriptor, ?*AccelerationStructure, ?*Buffer, ns.UInteger, AccelerationStructureRefitOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_, sourceAccelerationStructure_, descriptor_, destinationAccelerationStructure_, scratchBuffer_, scratchBufferOffset_, options_);
            }
            pub fn copyAccelerationStructure_toAccelerationStructure(self_: *T, sourceAccelerationStructure_: *AccelerationStructure, destinationAccelerationStructure_: *AccelerationStructure) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *AccelerationStructure) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure_, destinationAccelerationStructure_);
            }
            pub fn writeCompactedAccelerationStructureSize_toBuffer_offset(self_: *T, accelerationStructure_: *AccelerationStructure, buffer_: *Buffer, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_writeCompactedAccelerationStructureSize_toBuffer_offset_, accelerationStructure_, buffer_, offset_);
            }
            pub fn writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType(self_: *T, accelerationStructure_: *AccelerationStructure, buffer_: *Buffer, offset_: ns.UInteger, sizeDataType_: DataType) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *Buffer, ns.UInteger, DataType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_, accelerationStructure_, buffer_, offset_, sizeDataType_);
            }
            pub fn copyAndCompactAccelerationStructure_toAccelerationStructure(self_: *T, sourceAccelerationStructure_: *AccelerationStructure, destinationAccelerationStructure_: *AccelerationStructure) void {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructure, *AccelerationStructure) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyAndCompactAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure_, destinationAccelerationStructure_);
            }
            pub fn updateFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateFence_, fence_);
            }
            pub fn waitForFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForFence_, fence_);
            }
            pub fn useResource_usage(self_: *T, resource_: *Resource, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, *Resource, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResource_usage_, resource_, usage_);
            }
            pub fn useResources_count_usage(self_: *T, resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResources_count_usage_, resources_, count_, usage_);
            }
            pub fn useHeap(self_: *T, heap_: *Heap) void {
                return @as(*const fn (*T, *c.objc_selector, *Heap) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeap_, heap_);
            }
            pub fn useHeaps_count(self_: *T, heaps_: **const Heap, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, **const Heap, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeaps_count_, heaps_, count_);
            }
            pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *T, sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBuffer, ns.UInteger, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer_, sampleIndex_, barrier_);
            }
        };
    }
};

pub const AccelerationStructurePassSampleBufferAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructurePassSampleBufferAttachmentDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructurePassSampleBufferAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn sampleBuffer(self_: *T) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBuffer);
            }
            pub fn setSampleBuffer(self_: *T, sampleBuffer_: ?*CounterSampleBuffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSampleBuffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleBuffer_, sampleBuffer_);
            }
            pub fn startOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfEncoderSampleIndex);
            }
            pub fn setStartOfEncoderSampleIndex(self_: *T, startOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex_);
            }
            pub fn endOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfEncoderSampleIndex);
            }
            pub fn setEndOfEncoderSampleIndex(self_: *T, endOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex_);
            }
        };
    }
};

pub const AccelerationStructurePassSampleBufferAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructurePassSampleBufferAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(AccelerationStructurePassSampleBufferAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *AccelerationStructurePassSampleBufferAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *AccelerationStructurePassSampleBufferAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*AccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructurePassSampleBufferAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const AccelerationStructurePassDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AccelerationStructurePassDescriptor;
    }
    pub usingnamespace Methods(AccelerationStructurePassDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn accelerationStructurePassDescriptor() *AccelerationStructurePassDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *AccelerationStructurePassDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_accelerationStructurePassDescriptor);
            }
            pub fn sampleBufferAttachments(self_: *T) *AccelerationStructurePassSampleBufferAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AccelerationStructurePassSampleBufferAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBufferAttachments);
            }
        };
    }
};

pub const Type = opaque {
    pub fn class() *c.objc_class {
        return class_Type;
    }
    pub usingnamespace Methods(Type);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn dataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_dataType);
            }
        };
    }
};

pub const StructMember = opaque {
    pub fn class() *c.objc_class {
        return class_StructMember;
    }
    pub usingnamespace Methods(StructMember);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn structType(self_: *T) ?*StructType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StructType, @ptrCast(&c.objc_msgSend))(self_, sel_structType);
            }
            pub fn arrayType(self_: *T) ?*ArrayType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ArrayType, @ptrCast(&c.objc_msgSend))(self_, sel_arrayType);
            }
            pub fn textureReferenceType(self_: *T) ?*TextureReferenceType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*TextureReferenceType, @ptrCast(&c.objc_msgSend))(self_, sel_textureReferenceType);
            }
            pub fn pointerType(self_: *T) ?*PointerType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*PointerType, @ptrCast(&c.objc_msgSend))(self_, sel_pointerType);
            }
            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn offset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_offset);
            }
            pub fn dataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_dataType);
            }
            pub fn argumentIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_argumentIndex);
            }
        };
    }
};

pub const StructType = opaque {
    pub fn class() *c.objc_class {
        return class_StructType;
    }
    pub usingnamespace Methods(StructType);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Type.Methods(T);

            pub fn memberByName(self_: *T, name_: *ns.String) ?*StructMember {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) ?*StructMember, @ptrCast(&c.objc_msgSend))(self_, sel_memberByName_, name_);
            }
            // pub fn members(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_members);
            // }
        };
    }
};

pub const ArrayType = opaque {
    pub fn class() *c.objc_class {
        return class_ArrayType;
    }
    pub usingnamespace Methods(ArrayType);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Type.Methods(T);

            pub fn elementStructType(self_: *T) ?*StructType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StructType, @ptrCast(&c.objc_msgSend))(self_, sel_elementStructType);
            }
            pub fn elementArrayType(self_: *T) ?*ArrayType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ArrayType, @ptrCast(&c.objc_msgSend))(self_, sel_elementArrayType);
            }
            pub fn elementTextureReferenceType(self_: *T) ?*TextureReferenceType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*TextureReferenceType, @ptrCast(&c.objc_msgSend))(self_, sel_elementTextureReferenceType);
            }
            pub fn elementPointerType(self_: *T) ?*PointerType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*PointerType, @ptrCast(&c.objc_msgSend))(self_, sel_elementPointerType);
            }
            pub fn elementType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_elementType);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
            pub fn stride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_stride);
            }
            pub fn argumentIndexStride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_argumentIndexStride);
            }
        };
    }
};

pub const PointerType = opaque {
    pub fn class() *c.objc_class {
        return class_PointerType;
    }
    pub usingnamespace Methods(PointerType);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Type.Methods(T);

            pub fn elementStructType(self_: *T) ?*StructType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StructType, @ptrCast(&c.objc_msgSend))(self_, sel_elementStructType);
            }
            pub fn elementArrayType(self_: *T) ?*ArrayType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ArrayType, @ptrCast(&c.objc_msgSend))(self_, sel_elementArrayType);
            }
            pub fn elementType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_elementType);
            }
            pub fn access(self_: *T) ArgumentAccess {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentAccess, @ptrCast(&c.objc_msgSend))(self_, sel_access);
            }
            pub fn alignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_alignment);
            }
            pub fn dataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_dataSize);
            }
            pub fn elementIsArgumentBuffer(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_elementIsArgumentBuffer);
            }
        };
    }
};

pub const TextureReferenceType = opaque {
    pub fn class() *c.objc_class {
        return class_TextureReferenceType;
    }
    pub usingnamespace Methods(TextureReferenceType);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Type.Methods(T);

            pub fn textureDataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_textureDataType);
            }
            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn access(self_: *T) ArgumentAccess {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentAccess, @ptrCast(&c.objc_msgSend))(self_, sel_access);
            }
            pub fn isDepthTexture(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isDepthTexture);
            }
        };
    }
};

pub const Argument = opaque {
    pub fn class() *c.objc_class {
        return class_Argument;
    }
    pub usingnamespace Methods(Argument);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn @"type"(self_: *T) ArgumentType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn access(self_: *T) ArgumentAccess {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentAccess, @ptrCast(&c.objc_msgSend))(self_, sel_access);
            }
            pub fn index(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_index);
            }
            pub fn isActive(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isActive);
            }
            pub fn bufferAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferAlignment);
            }
            pub fn bufferDataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferDataSize);
            }
            pub fn bufferDataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferDataType);
            }
            pub fn bufferStructType(self_: *T) ?*StructType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StructType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferStructType);
            }
            pub fn bufferPointerType(self_: *T) ?*PointerType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*PointerType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferPointerType);
            }
            pub fn threadgroupMemoryAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupMemoryAlignment);
            }
            pub fn threadgroupMemoryDataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupMemoryDataSize);
            }
            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn textureDataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_textureDataType);
            }
            pub fn isDepthTexture(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isDepthTexture);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
        };
    }
};

pub const Binding = opaque {
    pub usingnamespace Methods(Binding);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn @"type"(self_: *T) BindingType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BindingType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn access(self_: *T) ArgumentAccess {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentAccess, @ptrCast(&c.objc_msgSend))(self_, sel_access);
            }
            pub fn index(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_index);
            }
            pub fn isUsed(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isUsed);
            }
            pub fn isArgument(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isArgument);
            }
        };
    }
};

pub const BufferBinding = opaque {
    pub usingnamespace Methods(BufferBinding);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Binding.Methods(T);

            pub fn bufferAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferAlignment);
            }
            pub fn bufferDataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferDataSize);
            }
            pub fn bufferDataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferDataType);
            }
            pub fn bufferStructType(self_: *T) ?*StructType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StructType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferStructType);
            }
            pub fn bufferPointerType(self_: *T) ?*PointerType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*PointerType, @ptrCast(&c.objc_msgSend))(self_, sel_bufferPointerType);
            }
        };
    }
};

pub const ThreadgroupBinding = opaque {
    pub usingnamespace Methods(ThreadgroupBinding);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Binding.Methods(T);

            pub fn threadgroupMemoryAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupMemoryAlignment);
            }
            pub fn threadgroupMemoryDataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupMemoryDataSize);
            }
        };
    }
};

pub const TextureBinding = opaque {
    pub usingnamespace Methods(TextureBinding);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Binding.Methods(T);

            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn textureDataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_textureDataType);
            }
            pub fn isDepthTexture(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isDepthTexture);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
        };
    }
};

pub const ObjectPayloadBinding = opaque {
    pub usingnamespace Methods(ObjectPayloadBinding);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Binding.Methods(T);

            pub fn objectPayloadAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_objectPayloadAlignment);
            }
            pub fn objectPayloadDataSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_objectPayloadDataSize);
            }
        };
    }
};

pub const ArgumentEncoder = opaque {
    pub usingnamespace Methods(ArgumentEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn setArgumentBuffer_offset(self_: *T, argumentBuffer_: ?*Buffer, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArgumentBuffer_offset_, argumentBuffer_, offset_);
            }
            pub fn setArgumentBuffer_startOffset_arrayElement(self_: *T, argumentBuffer_: ?*Buffer, startOffset_: ns.UInteger, arrayElement_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArgumentBuffer_startOffset_arrayElement_, argumentBuffer_, startOffset_, arrayElement_);
            }
            pub fn setBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTexture_atIndex_, texture_, index_);
            }
            pub fn setTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTextures_withRange_, textures_, range_);
            }
            pub fn setSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerStates_withRange_, samplers_, range_);
            }
            pub fn constantDataAtIndex(self_: *T, index_: ns.UInteger) *anyopaque {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *anyopaque, @ptrCast(&c.objc_msgSend))(self_, sel_constantDataAtIndex_, index_);
            }
            pub fn setRenderPipelineState_atIndex(self_: *T, pipeline_: ?*RenderPipelineState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPipelineState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderPipelineState_atIndex_, pipeline_, index_);
            }
            pub fn setRenderPipelineStates_withRange(self_: *T, pipelines_: *?*const RenderPipelineState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const RenderPipelineState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderPipelineStates_withRange_, pipelines_, range_);
            }
            pub fn setComputePipelineState_atIndex(self_: *T, pipeline_: ?*ComputePipelineState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ComputePipelineState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setComputePipelineState_atIndex_, pipeline_, index_);
            }
            pub fn setComputePipelineStates_withRange(self_: *T, pipelines_: *?*const ComputePipelineState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const ComputePipelineState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setComputePipelineStates_withRange_, pipelines_, range_);
            }
            pub fn setIndirectCommandBuffer_atIndex(self_: *T, indirectCommandBuffer_: ?*IndirectCommandBuffer, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IndirectCommandBuffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndirectCommandBuffer_atIndex_, indirectCommandBuffer_, index_);
            }
            pub fn setIndirectCommandBuffers_withRange(self_: *T, buffers_: *?*const IndirectCommandBuffer, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IndirectCommandBuffer, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndirectCommandBuffers_withRange_, buffers_, range_);
            }
            pub fn setAccelerationStructure_atIndex(self_: *T, accelerationStructure_: ?*AccelerationStructure, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructure, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAccelerationStructure_atIndex_, accelerationStructure_, index_);
            }
            pub fn newArgumentEncoderForBufferAtIndex(self_: *T, index_: ns.UInteger) ?*ArgumentEncoder {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*ArgumentEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_newArgumentEncoderForBufferAtIndex_, index_);
            }
            pub fn setVisibleFunctionTable_atIndex(self_: *T, visibleFunctionTable_: ?*VisibleFunctionTable, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTable_atIndex_, visibleFunctionTable_, index_);
            }
            pub fn setVisibleFunctionTables_withRange(self_: *T, visibleFunctionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTables_withRange_, visibleFunctionTables_, range_);
            }
            pub fn setIntersectionFunctionTable_atIndex(self_: *T, intersectionFunctionTable_: ?*IntersectionFunctionTable, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IntersectionFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIntersectionFunctionTable_atIndex_, intersectionFunctionTable_, index_);
            }
            pub fn setIntersectionFunctionTables_withRange(self_: *T, intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IntersectionFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIntersectionFunctionTables_withRange_, intersectionFunctionTables_, range_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn encodedLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_encodedLength);
            }
            pub fn alignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_alignment);
            }
        };
    }
};

pub const BinaryArchiveDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_BinaryArchiveDescriptor;
    }
    pub usingnamespace Methods(BinaryArchiveDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn url(self_: *T) ?*ns.URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.URL, @ptrCast(&c.objc_msgSend))(self_, sel_url);
            }
            pub fn setUrl(self_: *T, url_: ?*ns.URL) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.URL) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setUrl_, url_);
            }
        };
    }
};

pub const BinaryArchive = opaque {
    pub usingnamespace Methods(BinaryArchive);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn addComputePipelineFunctionsWithDescriptor_error(self_: *T, descriptor_: *ComputePipelineDescriptor, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *ComputePipelineDescriptor, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_addComputePipelineFunctionsWithDescriptor_error_, descriptor_, error_);
            }
            pub fn addRenderPipelineFunctionsWithDescriptor_error(self_: *T, descriptor_: *RenderPipelineDescriptor, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineDescriptor, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_addRenderPipelineFunctionsWithDescriptor_error_, descriptor_, error_);
            }
            pub fn addTileRenderPipelineFunctionsWithDescriptor_error(self_: *T, descriptor_: *TileRenderPipelineDescriptor, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *TileRenderPipelineDescriptor, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_addTileRenderPipelineFunctionsWithDescriptor_error_, descriptor_, error_);
            }
            pub fn serializeToURL_error(self_: *T, url_: *ns.URL, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_serializeToURL_error_, url_, error_);
            }
            pub fn addFunctionWithDescriptor_library_error(self_: *T, descriptor_: *FunctionDescriptor, library_: *Library, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *FunctionDescriptor, *Library, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_addFunctionWithDescriptor_library_error_, descriptor_, library_, error_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
        };
    }
};

pub const BlitCommandEncoder = opaque {
    pub usingnamespace Methods(BlitCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn synchronizeResource(self_: *T, resource_: *Resource) void {
                return @as(*const fn (*T, *c.objc_selector, *Resource) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_synchronizeResource_, resource_);
            }
            pub fn synchronizeTexture_slice_level(self_: *T, texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_synchronizeTexture_slice_level_, texture_, slice_, level_);
            }
            pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *T, sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, Origin, Size, *Texture, ns.UInteger, ns.UInteger, Origin) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_);
            }
            pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *T, sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger, Size, *Texture, ns.UInteger, ns.UInteger, Origin) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceBuffer_, sourceOffset_, sourceBytesPerRow_, sourceBytesPerImage_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_);
            }
            pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options(self_: *T, sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin, options_: BlitOption) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger, Size, *Texture, ns.UInteger, ns.UInteger, Origin, BlitOption) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, sourceBuffer_, sourceOffset_, sourceBytesPerRow_, sourceBytesPerImage_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_, options_);
            }
            pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage(self_: *T, sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, destinationBytesPerRow_: ns.UInteger, destinationBytesPerImage_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, Origin, Size, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationBuffer_, destinationOffset_, destinationBytesPerRow_, destinationBytesPerImage_);
            }
            pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options(self_: *T, sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, destinationBytesPerRow_: ns.UInteger, destinationBytesPerImage_: ns.UInteger, options_: BlitOption) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, Origin, Size, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger, BlitOption) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationBuffer_, destinationOffset_, destinationBytesPerRow_, destinationBytesPerImage_, options_);
            }
            pub fn generateMipmapsForTexture(self_: *T, texture_: *Texture) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_generateMipmapsForTexture_, texture_);
            }
            pub fn fillBuffer_range_value(self_: *T, buffer_: *Buffer, range_: ns.Range, value_: u8) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.Range, u8) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_fillBuffer_range_value_, buffer_, range_, value_);
            }
            pub fn copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount(self_: *T, sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, sliceCount_: ns.UInteger, levelCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, *Texture, ns.UInteger, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, sourceTexture_, sourceSlice_, sourceLevel_, destinationTexture_, destinationSlice_, destinationLevel_, sliceCount_, levelCount_);
            }
            pub fn copyFromTexture_toTexture(self_: *T, sourceTexture_: *Texture, destinationTexture_: *Texture) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, *Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromTexture_toTexture_, sourceTexture_, destinationTexture_);
            }
            pub fn copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size(self_: *T, sourceBuffer_: *Buffer, sourceOffset_: ns.UInteger, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger, size_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, sourceBuffer_, sourceOffset_, destinationBuffer_, destinationOffset_, size_);
            }
            pub fn updateFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateFence_, fence_);
            }
            pub fn waitForFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForFence_, fence_);
            }
            pub fn getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset(self_: *T, texture_: *Texture, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger, resetCounters_: bool, countersBuffer_: *Buffer, countersBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, Region, ns.UInteger, ns.UInteger, bool, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_, texture_, region_, mipLevel_, slice_, resetCounters_, countersBuffer_, countersBufferOffset_);
            }
            pub fn resetTextureAccessCounters_region_mipLevel_slice(self_: *T, texture_: *Texture, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, Region, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_resetTextureAccessCounters_region_mipLevel_slice_, texture_, region_, mipLevel_, slice_);
            }
            pub fn optimizeContentsForGPUAccess(self_: *T, texture_: *Texture) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_optimizeContentsForGPUAccess_, texture_);
            }
            pub fn optimizeContentsForGPUAccess_slice_level(self_: *T, texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_optimizeContentsForGPUAccess_slice_level_, texture_, slice_, level_);
            }
            pub fn optimizeContentsForCPUAccess(self_: *T, texture_: *Texture) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_optimizeContentsForCPUAccess_, texture_);
            }
            pub fn optimizeContentsForCPUAccess_slice_level(self_: *T, texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_optimizeContentsForCPUAccess_slice_level_, texture_, slice_, level_);
            }
            pub fn resetCommandsInBuffer_withRange(self_: *T, buffer_: *IndirectCommandBuffer, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_resetCommandsInBuffer_withRange_, buffer_, range_);
            }
            pub fn copyIndirectCommandBuffer_sourceRange_destination_destinationIndex(self_: *T, source_: *IndirectCommandBuffer, sourceRange_: ns.Range, destination_: *IndirectCommandBuffer, destinationIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, ns.Range, *IndirectCommandBuffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, source_, sourceRange_, destination_, destinationIndex_);
            }
            pub fn optimizeIndirectCommandBuffer_withRange(self_: *T, indirectCommandBuffer_: *IndirectCommandBuffer, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_optimizeIndirectCommandBuffer_withRange_, indirectCommandBuffer_, range_);
            }
            pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *T, sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBuffer, ns.UInteger, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer_, sampleIndex_, barrier_);
            }
            pub fn resolveCounters_inRange_destinationBuffer_destinationOffset(self_: *T, sampleBuffer_: *CounterSampleBuffer, range_: ns.Range, destinationBuffer_: *Buffer, destinationOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBuffer, ns.Range, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_resolveCounters_inRange_destinationBuffer_destinationOffset_, sampleBuffer_, range_, destinationBuffer_, destinationOffset_);
            }
        };
    }
};

pub const BlitPassSampleBufferAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_BlitPassSampleBufferAttachmentDescriptor;
    }
    pub usingnamespace Methods(BlitPassSampleBufferAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn sampleBuffer(self_: *T) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBuffer);
            }
            pub fn setSampleBuffer(self_: *T, sampleBuffer_: ?*CounterSampleBuffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSampleBuffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleBuffer_, sampleBuffer_);
            }
            pub fn startOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfEncoderSampleIndex);
            }
            pub fn setStartOfEncoderSampleIndex(self_: *T, startOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex_);
            }
            pub fn endOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfEncoderSampleIndex);
            }
            pub fn setEndOfEncoderSampleIndex(self_: *T, endOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex_);
            }
        };
    }
};

pub const BlitPassSampleBufferAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_BlitPassSampleBufferAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(BlitPassSampleBufferAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *BlitPassSampleBufferAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *BlitPassSampleBufferAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*BlitPassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*BlitPassSampleBufferAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const BlitPassDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_BlitPassDescriptor;
    }
    pub usingnamespace Methods(BlitPassDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn blitPassDescriptor() *BlitPassDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *BlitPassDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_blitPassDescriptor);
            }
            pub fn sampleBufferAttachments(self_: *T) *BlitPassSampleBufferAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *BlitPassSampleBufferAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBufferAttachments);
            }
        };
    }
};

pub const Buffer = opaque {
    pub usingnamespace Methods(Buffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn contents(self_: *T) *anyopaque {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *anyopaque, @ptrCast(&c.objc_msgSend))(self_, sel_contents);
            }
            pub fn didModifyRange(self_: *T, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_didModifyRange_, range_);
            }
            pub fn newTextureWithDescriptor_offset_bytesPerRow(self_: *T, descriptor_: *TextureDescriptor, offset_: ns.UInteger, bytesPerRow_: ns.UInteger) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor, ns.UInteger, ns.UInteger) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureWithDescriptor_offset_bytesPerRow_, descriptor_, offset_, bytesPerRow_);
            }
            pub fn addDebugMarker_range(self_: *T, marker_: *ns.String, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addDebugMarker_range_, marker_, range_);
            }
            pub fn removeAllDebugMarkers(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_removeAllDebugMarkers);
            }
            pub fn newRemoteBufferViewForDevice(self_: *T, device_: *Device) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector, *Device) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newRemoteBufferViewForDevice_, device_);
            }
            pub fn length(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_length);
            }
            pub fn remoteStorageBuffer(self_: *T) *Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_remoteStorageBuffer);
            }
            pub fn gpuAddress(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_gpuAddress);
            }
        };
    }
};

pub const CaptureDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_CaptureDescriptor;
    }
    pub usingnamespace Methods(CaptureDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn captureObject(self_: *T) ?*c.objc_object {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*c.objc_object, @ptrCast(&c.objc_msgSend))(self_, sel_captureObject);
            }
            pub fn setCaptureObject(self_: *T, captureObject_: ?*c.objc_object) void {
                return @as(*const fn (*T, *c.objc_selector, ?*c.objc_object) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCaptureObject_, captureObject_);
            }
            pub fn destination(self_: *T) CaptureDestination {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CaptureDestination, @ptrCast(&c.objc_msgSend))(self_, sel_destination);
            }
            pub fn setDestination(self_: *T, destination_: CaptureDestination) void {
                return @as(*const fn (*T, *c.objc_selector, CaptureDestination) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDestination_, destination_);
            }
            pub fn outputURL(self_: *T) ?*ns.URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.URL, @ptrCast(&c.objc_msgSend))(self_, sel_outputURL);
            }
            pub fn setOutputURL(self_: *T, outputURL_: ?*ns.URL) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.URL) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOutputURL_, outputURL_);
            }
        };
    }
};

pub const CaptureManager = opaque {
    pub fn class() *c.objc_class {
        return class_CaptureManager;
    }
    pub usingnamespace Methods(CaptureManager);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn sharedCaptureManager() *CaptureManager {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *CaptureManager, @ptrCast(&c.objc_msgSend))(T.class(), sel_sharedCaptureManager);
            }
            // pub fn init(self_: *T) *T {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_init);
            // }
            pub fn newCaptureScopeWithDevice(self_: *T, device_: *Device) *CaptureScope {
                return @as(*const fn (*T, *c.objc_selector, *Device) callconv(.C) *CaptureScope, @ptrCast(&c.objc_msgSend))(self_, sel_newCaptureScopeWithDevice_, device_);
            }
            pub fn newCaptureScopeWithCommandQueue(self_: *T, commandQueue_: *CommandQueue) *CaptureScope {
                return @as(*const fn (*T, *c.objc_selector, *CommandQueue) callconv(.C) *CaptureScope, @ptrCast(&c.objc_msgSend))(self_, sel_newCaptureScopeWithCommandQueue_, commandQueue_);
            }
            pub fn supportsDestination(self_: *T, destination_: CaptureDestination) bool {
                return @as(*const fn (*T, *c.objc_selector, CaptureDestination) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsDestination_, destination_);
            }
            pub fn startCaptureWithDescriptor_error(self_: *T, descriptor_: *CaptureDescriptor, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *CaptureDescriptor, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_startCaptureWithDescriptor_error_, descriptor_, error_);
            }
            pub fn startCaptureWithDevice(self_: *T, device_: *Device) void {
                return @as(*const fn (*T, *c.objc_selector, *Device) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_startCaptureWithDevice_, device_);
            }
            pub fn startCaptureWithCommandQueue(self_: *T, commandQueue_: *CommandQueue) void {
                return @as(*const fn (*T, *c.objc_selector, *CommandQueue) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_startCaptureWithCommandQueue_, commandQueue_);
            }
            pub fn startCaptureWithScope(self_: *T, captureScope_: *CaptureScope) void {
                return @as(*const fn (*T, *c.objc_selector, *CaptureScope) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_startCaptureWithScope_, captureScope_);
            }
            pub fn stopCapture(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_stopCapture);
            }
            pub fn defaultCaptureScope(self_: *T) ?*CaptureScope {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CaptureScope, @ptrCast(&c.objc_msgSend))(self_, sel_defaultCaptureScope);
            }
            pub fn setDefaultCaptureScope(self_: *T, defaultCaptureScope_: ?*CaptureScope) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CaptureScope) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDefaultCaptureScope_, defaultCaptureScope_);
            }
            pub fn isCapturing(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isCapturing);
            }
        };
    }
};

pub const CaptureScope = opaque {
    pub usingnamespace Methods(CaptureScope);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn beginScope(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_beginScope);
            }
            pub fn endScope(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_endScope);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn commandQueue(self_: *T) ?*CommandQueue {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CommandQueue, @ptrCast(&c.objc_msgSend))(self_, sel_commandQueue);
            }
        };
    }
};

pub const CommandBufferDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_CommandBufferDescriptor;
    }
    pub usingnamespace Methods(CommandBufferDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn retainedReferences(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_retainedReferences);
            }
            pub fn setRetainedReferences(self_: *T, retainedReferences_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRetainedReferences_, retainedReferences_);
            }
            pub fn errorOptions(self_: *T) CommandBufferErrorOption {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CommandBufferErrorOption, @ptrCast(&c.objc_msgSend))(self_, sel_errorOptions);
            }
            pub fn setErrorOptions(self_: *T, errorOptions_: CommandBufferErrorOption) void {
                return @as(*const fn (*T, *c.objc_selector, CommandBufferErrorOption) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setErrorOptions_, errorOptions_);
            }
        };
    }
};

pub const CommandBufferEncoderInfo = opaque {
    pub usingnamespace Methods(CommandBufferEncoderInfo);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn label(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            // pub fn debugSignposts(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_debugSignposts);
            // }
            pub fn errorState(self_: *T) CommandEncoderErrorState {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CommandEncoderErrorState, @ptrCast(&c.objc_msgSend))(self_, sel_errorState);
            }
        };
    }
};

pub const CommandBuffer = opaque {
    pub usingnamespace Methods(CommandBuffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn enqueue(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_enqueue);
            }
            pub fn commit(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_commit);
            }
            pub fn addScheduledHandler(self_: *T, block_: CommandBufferHandler) void {
                return @as(*const fn (*T, *c.objc_selector, CommandBufferHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addScheduledHandler_, block_);
            }
            pub fn presentDrawable(self_: *T, drawable_: *Drawable) void {
                return @as(*const fn (*T, *c.objc_selector, *Drawable) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_presentDrawable_, drawable_);
            }
            pub fn presentDrawable_atTime(self_: *T, drawable_: *Drawable, presentationTime_: cf.TimeInterval) void {
                return @as(*const fn (*T, *c.objc_selector, *Drawable, cf.TimeInterval) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_presentDrawable_atTime_, drawable_, presentationTime_);
            }
            pub fn presentDrawable_afterMinimumDuration(self_: *T, drawable_: *Drawable, duration_: cf.TimeInterval) void {
                return @as(*const fn (*T, *c.objc_selector, *Drawable, cf.TimeInterval) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_presentDrawable_afterMinimumDuration_, drawable_, duration_);
            }
            pub fn waitUntilScheduled(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitUntilScheduled);
            }
            pub fn addCompletedHandler(self_: *T, block_: CommandBufferHandler) void {
                return @as(*const fn (*T, *c.objc_selector, CommandBufferHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addCompletedHandler_, block_);
            }
            pub fn waitUntilCompleted(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitUntilCompleted);
            }
            pub fn blitCommandEncoder(self_: *T) ?*BlitCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*BlitCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_blitCommandEncoder);
            }
            pub fn renderCommandEncoderWithDescriptor(self_: *T, renderPassDescriptor_: *RenderPassDescriptor) ?*RenderCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *RenderPassDescriptor) callconv(.C) ?*RenderCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_renderCommandEncoderWithDescriptor_, renderPassDescriptor_);
            }
            pub fn computeCommandEncoderWithDescriptor(self_: *T, computePassDescriptor_: *ComputePassDescriptor) ?*ComputeCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *ComputePassDescriptor) callconv(.C) ?*ComputeCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_computeCommandEncoderWithDescriptor_, computePassDescriptor_);
            }
            pub fn blitCommandEncoderWithDescriptor(self_: *T, blitPassDescriptor_: *BlitPassDescriptor) ?*BlitCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *BlitPassDescriptor) callconv(.C) ?*BlitCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_blitCommandEncoderWithDescriptor_, blitPassDescriptor_);
            }
            pub fn computeCommandEncoder(self_: *T) ?*ComputeCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ComputeCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_computeCommandEncoder);
            }
            pub fn computeCommandEncoderWithDispatchType(self_: *T, dispatchType_: DispatchType) ?*ComputeCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, DispatchType) callconv(.C) ?*ComputeCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_computeCommandEncoderWithDispatchType_, dispatchType_);
            }
            pub fn encodeWaitForEvent_value(self_: *T, event_: *Event, value_: u64) void {
                return @as(*const fn (*T, *c.objc_selector, *Event, u64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_encodeWaitForEvent_value_, event_, value_);
            }
            pub fn encodeSignalEvent_value(self_: *T, event_: *Event, value_: u64) void {
                return @as(*const fn (*T, *c.objc_selector, *Event, u64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_encodeSignalEvent_value_, event_, value_);
            }
            pub fn parallelRenderCommandEncoderWithDescriptor(self_: *T, renderPassDescriptor_: *RenderPassDescriptor) ?*ParallelRenderCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *RenderPassDescriptor) callconv(.C) ?*ParallelRenderCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_parallelRenderCommandEncoderWithDescriptor_, renderPassDescriptor_);
            }
            pub fn resourceStateCommandEncoder(self_: *T) ?*ResourceStateCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ResourceStateCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_resourceStateCommandEncoder);
            }
            pub fn resourceStateCommandEncoderWithDescriptor(self_: *T, resourceStatePassDescriptor_: *ResourceStatePassDescriptor) ?*ResourceStateCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *ResourceStatePassDescriptor) callconv(.C) ?*ResourceStateCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_resourceStateCommandEncoderWithDescriptor_, resourceStatePassDescriptor_);
            }
            pub fn accelerationStructureCommandEncoder(self_: *T) ?*AccelerationStructureCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*AccelerationStructureCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_accelerationStructureCommandEncoder);
            }
            pub fn accelerationStructureCommandEncoderWithDescriptor(self_: *T, descriptor_: *AccelerationStructurePassDescriptor) *AccelerationStructureCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructurePassDescriptor) callconv(.C) *AccelerationStructureCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_accelerationStructureCommandEncoderWithDescriptor_, descriptor_);
            }
            pub fn pushDebugGroup(self_: *T, string_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_pushDebugGroup_, string_);
            }
            pub fn popDebugGroup(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_popDebugGroup);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn commandQueue(self_: *T) *CommandQueue {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *CommandQueue, @ptrCast(&c.objc_msgSend))(self_, sel_commandQueue);
            }
            pub fn retainedReferences(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_retainedReferences);
            }
            pub fn errorOptions(self_: *T) CommandBufferErrorOption {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CommandBufferErrorOption, @ptrCast(&c.objc_msgSend))(self_, sel_errorOptions);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn kernelStartTime(self_: *T) cf.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cf.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_kernelStartTime);
            }
            pub fn kernelEndTime(self_: *T) cf.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cf.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_kernelEndTime);
            }
            pub fn logs(self_: *T) *LogContainer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *LogContainer, @ptrCast(&c.objc_msgSend))(self_, sel_logs);
            }
            pub fn GPUStartTime(self_: *T) cf.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cf.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_GPUStartTime);
            }
            pub fn GPUEndTime(self_: *T) cf.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cf.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_GPUEndTime);
            }
            pub fn status(self_: *T) CommandBufferStatus {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CommandBufferStatus, @ptrCast(&c.objc_msgSend))(self_, sel_status);
            }
            pub fn @"error"(self_: *T) ?*ns.Error {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.Error, @ptrCast(&c.objc_msgSend))(self_, sel_error);
            }
        };
    }
};

pub const CommandEncoder = opaque {
    pub usingnamespace Methods(CommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn endEncoding(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_endEncoding);
            }
            pub fn insertDebugSignpost(self_: *T, string_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_insertDebugSignpost_, string_);
            }
            pub fn pushDebugGroup(self_: *T, string_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_pushDebugGroup_, string_);
            }
            pub fn popDebugGroup(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_popDebugGroup);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const CommandQueue = opaque {
    pub usingnamespace Methods(CommandQueue);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn commandBuffer(self_: *T) ?*CommandBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_commandBuffer);
            }
            pub fn commandBufferWithDescriptor(self_: *T, descriptor_: *CommandBufferDescriptor) ?*CommandBuffer {
                return @as(*const fn (*T, *c.objc_selector, *CommandBufferDescriptor) callconv(.C) ?*CommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_commandBufferWithDescriptor_, descriptor_);
            }
            pub fn commandBufferWithUnretainedReferences(self_: *T) ?*CommandBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_commandBufferWithUnretainedReferences);
            }
            pub fn insertDebugCaptureBoundary(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_insertDebugCaptureBoundary);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
        };
    }
};

pub const ComputeCommandEncoder = opaque {
    pub usingnamespace Methods(ComputeCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn setComputePipelineState(self_: *T, state_: *ComputePipelineState) void {
                return @as(*const fn (*T, *c.objc_selector, *ComputePipelineState) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setComputePipelineState_, state_);
            }
            pub fn setBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setVisibleFunctionTable_atBufferIndex(self_: *T, visibleFunctionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTable_atBufferIndex_, visibleFunctionTable_, bufferIndex_);
            }
            pub fn setVisibleFunctionTables_withBufferRange(self_: *T, visibleFunctionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTables_withBufferRange_, visibleFunctionTables_, range_);
            }
            pub fn setIntersectionFunctionTable_atBufferIndex(self_: *T, intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IntersectionFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable_, bufferIndex_);
            }
            pub fn setIntersectionFunctionTables_withBufferRange(self_: *T, intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IntersectionFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables_, range_);
            }
            pub fn setAccelerationStructure_atBufferIndex(self_: *T, accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructure, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAccelerationStructure_atBufferIndex_, accelerationStructure_, bufferIndex_);
            }
            pub fn setTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTexture_atIndex_, texture_, index_);
            }
            pub fn setTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTextures_withRange_, textures_, range_);
            }
            pub fn setSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn setThreadgroupMemoryLength_atIndex(self_: *T, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadgroupMemoryLength_atIndex_, length_, index_);
            }
            pub fn setImageblockWidth_height(self_: *T, width_: ns.UInteger, height_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setImageblockWidth_height_, width_, height_);
            }
            pub fn setStageInRegion(self_: *T, region_: Region) void {
                return @as(*const fn (*T, *c.objc_selector, Region) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStageInRegion_, region_);
            }
            pub fn setStageInRegionWithIndirectBuffer_indirectBufferOffset(self_: *T, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStageInRegionWithIndirectBuffer_indirectBufferOffset_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn dispatchThreadgroups_threadsPerThreadgroup(self_: *T, threadgroupsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid_, threadsPerThreadgroup_);
            }
            pub fn dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup(self_: *T, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger, threadsPerThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_, indirectBuffer_, indirectBufferOffset_, threadsPerThreadgroup_);
            }
            pub fn dispatchThreads_threadsPerThreadgroup(self_: *T, threadsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchThreads_threadsPerThreadgroup_, threadsPerGrid_, threadsPerThreadgroup_);
            }
            pub fn updateFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateFence_, fence_);
            }
            pub fn waitForFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForFence_, fence_);
            }
            pub fn useResource_usage(self_: *T, resource_: *Resource, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, *Resource, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResource_usage_, resource_, usage_);
            }
            pub fn useResources_count_usage(self_: *T, resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResources_count_usage_, resources_, count_, usage_);
            }
            pub fn useHeap(self_: *T, heap_: *Heap) void {
                return @as(*const fn (*T, *c.objc_selector, *Heap) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeap_, heap_);
            }
            pub fn useHeaps_count(self_: *T, heaps_: **const Heap, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, **const Heap, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeaps_count_, heaps_, count_);
            }
            pub fn executeCommandsInBuffer_withRange(self_: *T, indirectCommandBuffer_: *IndirectCommandBuffer, executionRange_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_executeCommandsInBuffer_withRange_, indirectCommandBuffer_, executionRange_);
            }
            pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset(self_: *T, indirectCommandbuffer_: *IndirectCommandBuffer, indirectRangeBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer_, indirectRangeBuffer_, indirectBufferOffset_);
            }
            pub fn memoryBarrierWithScope(self_: *T, scope_: BarrierScope) void {
                return @as(*const fn (*T, *c.objc_selector, BarrierScope) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_memoryBarrierWithScope_, scope_);
            }
            pub fn memoryBarrierWithResources_count(self_: *T, resources_: **const Resource, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_memoryBarrierWithResources_count_, resources_, count_);
            }
            pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *T, sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBuffer, ns.UInteger, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer_, sampleIndex_, barrier_);
            }
            pub fn dispatchType(self_: *T) DispatchType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DispatchType, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchType);
            }
        };
    }
};

pub const ComputePassSampleBufferAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ComputePassSampleBufferAttachmentDescriptor;
    }
    pub usingnamespace Methods(ComputePassSampleBufferAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn sampleBuffer(self_: *T) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBuffer);
            }
            pub fn setSampleBuffer(self_: *T, sampleBuffer_: ?*CounterSampleBuffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSampleBuffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleBuffer_, sampleBuffer_);
            }
            pub fn startOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfEncoderSampleIndex);
            }
            pub fn setStartOfEncoderSampleIndex(self_: *T, startOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex_);
            }
            pub fn endOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfEncoderSampleIndex);
            }
            pub fn setEndOfEncoderSampleIndex(self_: *T, endOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex_);
            }
        };
    }
};

pub const ComputePassSampleBufferAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_ComputePassSampleBufferAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(ComputePassSampleBufferAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *ComputePassSampleBufferAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *ComputePassSampleBufferAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*ComputePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ComputePassSampleBufferAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const ComputePassDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ComputePassDescriptor;
    }
    pub usingnamespace Methods(ComputePassDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn computePassDescriptor() *ComputePassDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *ComputePassDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_computePassDescriptor);
            }
            pub fn dispatchType(self_: *T) DispatchType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DispatchType, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchType);
            }
            pub fn setDispatchType(self_: *T, dispatchType_: DispatchType) void {
                return @as(*const fn (*T, *c.objc_selector, DispatchType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDispatchType_, dispatchType_);
            }
            pub fn sampleBufferAttachments(self_: *T) *ComputePassSampleBufferAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ComputePassSampleBufferAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBufferAttachments);
            }
        };
    }
};

pub const ComputePipelineReflection = opaque {
    pub fn class() *c.objc_class {
        return class_ComputePipelineReflection;
    }
    pub usingnamespace Methods(ComputePipelineReflection);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            // pub fn bindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_bindings);
            // }
            // pub fn arguments(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_arguments);
            // }
        };
    }
};

pub const ComputePipelineDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ComputePipelineDescriptor;
    }
    pub usingnamespace Methods(ComputePipelineDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn computeFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_computeFunction);
            }
            pub fn setComputeFunction(self_: *T, computeFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setComputeFunction_, computeFunction_);
            }
            pub fn threadGroupSizeIsMultipleOfThreadExecutionWidth(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_threadGroupSizeIsMultipleOfThreadExecutionWidth);
            }
            pub fn setThreadGroupSizeIsMultipleOfThreadExecutionWidth(self_: *T, threadGroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, threadGroupSizeIsMultipleOfThreadExecutionWidth_);
            }
            pub fn maxTotalThreadsPerThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerThreadgroup);
            }
            pub fn setMaxTotalThreadsPerThreadgroup(self_: *T, maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup_);
            }
            pub fn stageInputDescriptor(self_: *T) ?*StageInputOutputDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*StageInputOutputDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_stageInputDescriptor);
            }
            pub fn setStageInputDescriptor(self_: *T, stageInputDescriptor_: ?*StageInputOutputDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*StageInputOutputDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStageInputDescriptor_, stageInputDescriptor_);
            }
            pub fn buffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_buffers);
            }
            pub fn supportIndirectCommandBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportIndirectCommandBuffers);
            }
            pub fn setSupportIndirectCommandBuffers(self_: *T, supportIndirectCommandBuffers_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers_);
            }
            // pub fn insertLibraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_insertLibraries);
            // }
            // pub fn setInsertLibraries(self_: *T, insertLibraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInsertLibraries_, insertLibraries_);
            // }
            // pub fn preloadedLibraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_preloadedLibraries);
            // }
            // pub fn setPreloadedLibraries(self_: *T, preloadedLibraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPreloadedLibraries_, preloadedLibraries_);
            // }
            // pub fn binaryArchives(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_binaryArchives);
            // }
            // pub fn setBinaryArchives(self_: *T, binaryArchives_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBinaryArchives_, binaryArchives_);
            // }
            pub fn linkedFunctions(self_: *T) ?*LinkedFunctions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*LinkedFunctions, @ptrCast(&c.objc_msgSend))(self_, sel_linkedFunctions);
            }
            pub fn setLinkedFunctions(self_: *T, linkedFunctions_: ?*LinkedFunctions) void {
                return @as(*const fn (*T, *c.objc_selector, ?*LinkedFunctions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLinkedFunctions_, linkedFunctions_);
            }
            pub fn supportAddingBinaryFunctions(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportAddingBinaryFunctions);
            }
            pub fn setSupportAddingBinaryFunctions(self_: *T, supportAddingBinaryFunctions_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions_);
            }
            pub fn maxCallStackDepth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxCallStackDepth);
            }
            pub fn setMaxCallStackDepth(self_: *T, maxCallStackDepth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxCallStackDepth_, maxCallStackDepth_);
            }
        };
    }
};

pub const ComputePipelineState = opaque {
    pub usingnamespace Methods(ComputePipelineState);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn imageblockMemoryLengthForDimensions(self_: *T, imageblockDimensions_: Size) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_imageblockMemoryLengthForDimensions_, imageblockDimensions_);
            }
            pub fn functionHandleWithFunction(self_: *T, function_: *Function) ?*FunctionHandle {
                return @as(*const fn (*T, *c.objc_selector, *Function) callconv(.C) ?*FunctionHandle, @ptrCast(&c.objc_msgSend))(self_, sel_functionHandleWithFunction_, function_);
            }
            // pub fn newComputePipelineStateWithAdditionalBinaryFunctions_error(self_: *T, functions_: ns.Array, error_: ?*?*ns.Error) ?*ComputePipelineState {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array, ?*?*ns.Error) callconv(.C) ?*ComputePipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithAdditionalBinaryFunctions_error_, functions_, error_);
            // }
            pub fn newVisibleFunctionTableWithDescriptor(self_: *T, descriptor_: *VisibleFunctionTableDescriptor) ?*VisibleFunctionTable {
                return @as(*const fn (*T, *c.objc_selector, *VisibleFunctionTableDescriptor) callconv(.C) ?*VisibleFunctionTable, @ptrCast(&c.objc_msgSend))(self_, sel_newVisibleFunctionTableWithDescriptor_, descriptor_);
            }
            pub fn newIntersectionFunctionTableWithDescriptor(self_: *T, descriptor_: *IntersectionFunctionTableDescriptor) ?*IntersectionFunctionTable {
                return @as(*const fn (*T, *c.objc_selector, *IntersectionFunctionTableDescriptor) callconv(.C) ?*IntersectionFunctionTable, @ptrCast(&c.objc_msgSend))(self_, sel_newIntersectionFunctionTableWithDescriptor_, descriptor_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn maxTotalThreadsPerThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerThreadgroup);
            }
            pub fn threadExecutionWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadExecutionWidth);
            }
            pub fn staticThreadgroupMemoryLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_staticThreadgroupMemoryLength);
            }
            pub fn supportIndirectCommandBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportIndirectCommandBuffers);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const Counter = opaque {
    pub usingnamespace Methods(Counter);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
        };
    }
};

pub const CounterSet = opaque {
    pub usingnamespace Methods(CounterSet);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            // pub fn counters(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_counters);
            // }
        };
    }
};

pub const CounterSampleBufferDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_CounterSampleBufferDescriptor;
    }
    pub usingnamespace Methods(CounterSampleBufferDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn counterSet(self_: *T) ?*CounterSet {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSet, @ptrCast(&c.objc_msgSend))(self_, sel_counterSet);
            }
            pub fn setCounterSet(self_: *T, counterSet_: ?*CounterSet) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSet) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCounterSet_, counterSet_);
            }
            pub fn label(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn storageMode(self_: *T) StorageMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StorageMode, @ptrCast(&c.objc_msgSend))(self_, sel_storageMode);
            }
            pub fn setStorageMode(self_: *T, storageMode_: StorageMode) void {
                return @as(*const fn (*T, *c.objc_selector, StorageMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStorageMode_, storageMode_);
            }
            pub fn sampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
            pub fn setSampleCount(self_: *T, sampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleCount_, sampleCount_);
            }
        };
    }
};

pub const CounterSampleBuffer = opaque {
    pub usingnamespace Methods(CounterSampleBuffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn resolveCounterRange(self_: *T, range_: ns.Range) ?*ns.Data {
                return @as(*const fn (*T, *c.objc_selector, ns.Range) callconv(.C) ?*ns.Data, @ptrCast(&c.objc_msgSend))(self_, sel_resolveCounterRange_, range_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn sampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
        };
    }
};

pub const StencilDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_StencilDescriptor;
    }
    pub usingnamespace Methods(StencilDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn stencilCompareFunction(self_: *T) CompareFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CompareFunction, @ptrCast(&c.objc_msgSend))(self_, sel_stencilCompareFunction);
            }
            pub fn setStencilCompareFunction(self_: *T, stencilCompareFunction_: CompareFunction) void {
                return @as(*const fn (*T, *c.objc_selector, CompareFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilCompareFunction_, stencilCompareFunction_);
            }
            pub fn stencilFailureOperation(self_: *T) StencilOperation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StencilOperation, @ptrCast(&c.objc_msgSend))(self_, sel_stencilFailureOperation);
            }
            pub fn setStencilFailureOperation(self_: *T, stencilFailureOperation_: StencilOperation) void {
                return @as(*const fn (*T, *c.objc_selector, StencilOperation) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilFailureOperation_, stencilFailureOperation_);
            }
            pub fn depthFailureOperation(self_: *T) StencilOperation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StencilOperation, @ptrCast(&c.objc_msgSend))(self_, sel_depthFailureOperation);
            }
            pub fn setDepthFailureOperation(self_: *T, depthFailureOperation_: StencilOperation) void {
                return @as(*const fn (*T, *c.objc_selector, StencilOperation) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthFailureOperation_, depthFailureOperation_);
            }
            pub fn depthStencilPassOperation(self_: *T) StencilOperation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StencilOperation, @ptrCast(&c.objc_msgSend))(self_, sel_depthStencilPassOperation);
            }
            pub fn setDepthStencilPassOperation(self_: *T, depthStencilPassOperation_: StencilOperation) void {
                return @as(*const fn (*T, *c.objc_selector, StencilOperation) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStencilPassOperation_, depthStencilPassOperation_);
            }
            pub fn readMask(self_: *T) u32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u32, @ptrCast(&c.objc_msgSend))(self_, sel_readMask);
            }
            pub fn setReadMask(self_: *T, readMask_: u32) void {
                return @as(*const fn (*T, *c.objc_selector, u32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setReadMask_, readMask_);
            }
            pub fn writeMask(self_: *T) u32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u32, @ptrCast(&c.objc_msgSend))(self_, sel_writeMask);
            }
            pub fn setWriteMask(self_: *T, writeMask_: u32) void {
                return @as(*const fn (*T, *c.objc_selector, u32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setWriteMask_, writeMask_);
            }
        };
    }
};

pub const DepthStencilDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_DepthStencilDescriptor;
    }
    pub usingnamespace Methods(DepthStencilDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn depthCompareFunction(self_: *T) CompareFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CompareFunction, @ptrCast(&c.objc_msgSend))(self_, sel_depthCompareFunction);
            }
            pub fn setDepthCompareFunction(self_: *T, depthCompareFunction_: CompareFunction) void {
                return @as(*const fn (*T, *c.objc_selector, CompareFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthCompareFunction_, depthCompareFunction_);
            }
            pub fn isDepthWriteEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isDepthWriteEnabled);
            }
            pub fn setDepthWriteEnabled(self_: *T, depthWriteEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthWriteEnabled_, depthWriteEnabled_);
            }
            pub fn frontFaceStencil(self_: *T) *StencilDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *StencilDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_frontFaceStencil);
            }
            pub fn setFrontFaceStencil(self_: *T, frontFaceStencil_: ?*StencilDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*StencilDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFrontFaceStencil_, frontFaceStencil_);
            }
            pub fn backFaceStencil(self_: *T) *StencilDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *StencilDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_backFaceStencil);
            }
            pub fn setBackFaceStencil(self_: *T, backFaceStencil_: ?*StencilDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*StencilDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBackFaceStencil_, backFaceStencil_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const DepthStencilState = opaque {
    pub usingnamespace Methods(DepthStencilState);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
        };
    }
};

pub const ArgumentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ArgumentDescriptor;
    }
    pub usingnamespace Methods(ArgumentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn argumentDescriptor() *ArgumentDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *ArgumentDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_argumentDescriptor);
            }
            pub fn dataType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_dataType);
            }
            pub fn setDataType(self_: *T, dataType_: DataType) void {
                return @as(*const fn (*T, *c.objc_selector, DataType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDataType_, dataType_);
            }
            pub fn index(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_index);
            }
            pub fn setIndex(self_: *T, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndex_, index_);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
            pub fn setArrayLength(self_: *T, arrayLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArrayLength_, arrayLength_);
            }
            pub fn access(self_: *T) ArgumentAccess {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentAccess, @ptrCast(&c.objc_msgSend))(self_, sel_access);
            }
            pub fn setAccess(self_: *T, access_: ArgumentAccess) void {
                return @as(*const fn (*T, *c.objc_selector, ArgumentAccess) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAccess_, access_);
            }
            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn setTextureType(self_: *T, textureType_: TextureType) void {
                return @as(*const fn (*T, *c.objc_selector, TextureType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTextureType_, textureType_);
            }
            pub fn constantBlockAlignment(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_constantBlockAlignment);
            }
            pub fn setConstantBlockAlignment(self_: *T, constantBlockAlignment_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setConstantBlockAlignment_, constantBlockAlignment_);
            }
        };
    }
};

pub const Device = opaque {
    pub usingnamespace Methods(Device);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn newCommandQueue(self_: *T) ?*CommandQueue {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CommandQueue, @ptrCast(&c.objc_msgSend))(self_, sel_newCommandQueue);
            }
            pub fn newCommandQueueWithMaxCommandBufferCount(self_: *T, maxCommandBufferCount_: ns.UInteger) ?*CommandQueue {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*CommandQueue, @ptrCast(&c.objc_msgSend))(self_, sel_newCommandQueueWithMaxCommandBufferCount_, maxCommandBufferCount_);
            }
            pub fn heapTextureSizeAndAlignWithDescriptor(self_: *T, desc_: *TextureDescriptor) SizeAndAlign {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor) callconv(.C) SizeAndAlign, @ptrCast(&c.objc_msgSend))(self_, sel_heapTextureSizeAndAlignWithDescriptor_, desc_);
            }
            pub fn heapBufferSizeAndAlignWithLength_options(self_: *T, length_: ns.UInteger, options_: ResourceOptions) SizeAndAlign {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ResourceOptions) callconv(.C) SizeAndAlign, @ptrCast(&c.objc_msgSend))(self_, sel_heapBufferSizeAndAlignWithLength_options_, length_, options_);
            }
            pub fn newHeapWithDescriptor(self_: *T, descriptor_: *HeapDescriptor) ?*Heap {
                return @as(*const fn (*T, *c.objc_selector, *HeapDescriptor) callconv(.C) ?*Heap, @ptrCast(&c.objc_msgSend))(self_, sel_newHeapWithDescriptor_, descriptor_);
            }
            pub fn newBufferWithLength_options(self_: *T, length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ResourceOptions) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newBufferWithLength_options_, length_, options_);
            }
            pub fn newBufferWithBytes_length_options(self_: *T, pointer_: *const anyopaque, length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ResourceOptions) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newBufferWithBytes_length_options_, pointer_, length_, options_);
            }
            // pub fn newBufferWithBytesNoCopy_length_options_deallocator(self_: *T, pointer_: *anyopaque, length_: ns.UInteger, options_: ResourceOptions, deallocator_: void) ?*Buffer {
            //     return @as(*const fn (*T, *c.objc_selector, *anyopaque, ns.UInteger, ResourceOptions, void) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newBufferWithBytesNoCopy_length_options_deallocator_, pointer_, length_, options_, deallocator_);
            // }
            pub fn newDepthStencilStateWithDescriptor(self_: *T, descriptor_: *DepthStencilDescriptor) ?*DepthStencilState {
                return @as(*const fn (*T, *c.objc_selector, *DepthStencilDescriptor) callconv(.C) ?*DepthStencilState, @ptrCast(&c.objc_msgSend))(self_, sel_newDepthStencilStateWithDescriptor_, descriptor_);
            }
            pub fn newTextureWithDescriptor(self_: *T, descriptor_: *TextureDescriptor) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureWithDescriptor_, descriptor_);
            }
            pub fn newTextureWithDescriptor_iosurface_plane(self_: *T, descriptor_: *TextureDescriptor, iosurface_: IOSurfaceRef, plane_: ns.UInteger) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor, IOSurfaceRef, ns.UInteger) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureWithDescriptor_iosurface_plane_, descriptor_, iosurface_, plane_);
            }
            pub fn newSharedTextureWithDescriptor(self_: *T, descriptor_: *TextureDescriptor) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedTextureWithDescriptor_, descriptor_);
            }
            pub fn newSharedTextureWithHandle(self_: *T, sharedHandle_: *SharedTextureHandle) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *SharedTextureHandle) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedTextureWithHandle_, sharedHandle_);
            }
            pub fn newSamplerStateWithDescriptor(self_: *T, descriptor_: *SamplerDescriptor) ?*SamplerState {
                return @as(*const fn (*T, *c.objc_selector, *SamplerDescriptor) callconv(.C) ?*SamplerState, @ptrCast(&c.objc_msgSend))(self_, sel_newSamplerStateWithDescriptor_, descriptor_);
            }
            pub fn newDefaultLibrary(self_: *T) ?*Library {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newDefaultLibrary);
            }
            pub fn newDefaultLibraryWithBundle_error(self_: *T, bundle_: *ns.Bundle, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, *ns.Bundle, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newDefaultLibraryWithBundle_error_, bundle_, error_);
            }
            pub fn newLibraryWithFile_error(self_: *T, filepath_: *ns.String, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, *ns.String, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithFile_error_, filepath_, error_);
            }
            pub fn newLibraryWithURL_error(self_: *T, url_: *ns.URL, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithURL_error_, url_, error_);
            }
            pub fn newLibraryWithData_error(self_: *T, data_: dispatch_data_t, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, dispatch_data_t, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithData_error_, data_, error_);
            }
            pub fn newLibraryWithSource_options_error(self_: *T, source_: *ns.String, options_: ?*CompileOptions, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, *ns.String, ?*CompileOptions, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithSource_options_error_, source_, options_, error_);
            }
            pub fn newLibraryWithSource_options_completionHandler(self_: *T, source_: *ns.String, options_: ?*CompileOptions, completionHandler_: NewLibraryCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String, ?*CompileOptions, NewLibraryCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithSource_options_completionHandler_, source_, options_, completionHandler_);
            }
            pub fn newLibraryWithStitchedDescriptor_error(self_: *T, descriptor_: *StitchedLibraryDescriptor, error_: ?*?*ns.Error) ?*Library {
                return @as(*const fn (*T, *c.objc_selector, *StitchedLibraryDescriptor, ?*?*ns.Error) callconv(.C) ?*Library, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithStitchedDescriptor_error_, descriptor_, error_);
            }
            pub fn newLibraryWithStitchedDescriptor_completionHandler(self_: *T, descriptor_: *StitchedLibraryDescriptor, completionHandler_: NewLibraryCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *StitchedLibraryDescriptor, NewLibraryCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newLibraryWithStitchedDescriptor_completionHandler_, descriptor_, completionHandler_);
            }
            pub fn newRenderPipelineStateWithDescriptor_error(self_: *T, descriptor_: *RenderPipelineDescriptor, error_: ?*?*ns.Error) ?*RenderPipelineState {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineDescriptor, ?*?*ns.Error) callconv(.C) ?*RenderPipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithDescriptor_error_, descriptor_, error_);
            }
            pub fn newRenderPipelineStateWithDescriptor_options_reflection_error(self_: *T, descriptor_: *RenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineDescriptor, PipelineOption, ?*AutoreleasedRenderPipelineReflection, ?*?*ns.Error) callconv(.C) ?*RenderPipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithDescriptor_options_reflection_error_, descriptor_, options_, reflection_, error_);
            }
            pub fn newRenderPipelineStateWithDescriptor_completionHandler(self_: *T, descriptor_: *RenderPipelineDescriptor, completionHandler_: NewRenderPipelineStateCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineDescriptor, NewRenderPipelineStateCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithDescriptor_completionHandler_, descriptor_, completionHandler_);
            }
            pub fn newRenderPipelineStateWithDescriptor_options_completionHandler(self_: *T, descriptor_: *RenderPipelineDescriptor, options_: PipelineOption, completionHandler_: NewRenderPipelineStateWithReflectionCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineDescriptor, PipelineOption, NewRenderPipelineStateWithReflectionCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithDescriptor_options_completionHandler_, descriptor_, options_, completionHandler_);
            }
            pub fn newComputePipelineStateWithFunction_error(self_: *T, computeFunction_: *Function, error_: ?*?*ns.Error) ?*ComputePipelineState {
                return @as(*const fn (*T, *c.objc_selector, *Function, ?*?*ns.Error) callconv(.C) ?*ComputePipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithFunction_error_, computeFunction_, error_);
            }
            pub fn newComputePipelineStateWithFunction_options_reflection_error(self_: *T, computeFunction_: *Function, options_: PipelineOption, reflection_: ?*AutoreleasedComputePipelineReflection, error_: ?*?*ns.Error) ?*ComputePipelineState {
                return @as(*const fn (*T, *c.objc_selector, *Function, PipelineOption, ?*AutoreleasedComputePipelineReflection, ?*?*ns.Error) callconv(.C) ?*ComputePipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithFunction_options_reflection_error_, computeFunction_, options_, reflection_, error_);
            }
            pub fn newComputePipelineStateWithFunction_completionHandler(self_: *T, computeFunction_: *Function, completionHandler_: NewComputePipelineStateCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *Function, NewComputePipelineStateCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithFunction_completionHandler_, computeFunction_, completionHandler_);
            }
            pub fn newComputePipelineStateWithFunction_options_completionHandler(self_: *T, computeFunction_: *Function, options_: PipelineOption, completionHandler_: NewComputePipelineStateWithReflectionCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *Function, PipelineOption, NewComputePipelineStateWithReflectionCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithFunction_options_completionHandler_, computeFunction_, options_, completionHandler_);
            }
            pub fn newComputePipelineStateWithDescriptor_options_reflection_error(self_: *T, descriptor_: *ComputePipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedComputePipelineReflection, error_: ?*?*ns.Error) ?*ComputePipelineState {
                return @as(*const fn (*T, *c.objc_selector, *ComputePipelineDescriptor, PipelineOption, ?*AutoreleasedComputePipelineReflection, ?*?*ns.Error) callconv(.C) ?*ComputePipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithDescriptor_options_reflection_error_, descriptor_, options_, reflection_, error_);
            }
            pub fn newComputePipelineStateWithDescriptor_options_completionHandler(self_: *T, descriptor_: *ComputePipelineDescriptor, options_: PipelineOption, completionHandler_: NewComputePipelineStateWithReflectionCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *ComputePipelineDescriptor, PipelineOption, NewComputePipelineStateWithReflectionCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newComputePipelineStateWithDescriptor_options_completionHandler_, descriptor_, options_, completionHandler_);
            }
            pub fn newFence(self_: *T) ?*Fence {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Fence, @ptrCast(&c.objc_msgSend))(self_, sel_newFence);
            }
            pub fn supportsFeatureSet(self_: *T, featureSet_: FeatureSet) bool {
                return @as(*const fn (*T, *c.objc_selector, FeatureSet) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsFeatureSet_, featureSet_);
            }
            pub fn supportsFamily(self_: *T, gpuFamily_: GPUFamily) bool {
                return @as(*const fn (*T, *c.objc_selector, GPUFamily) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsFamily_, gpuFamily_);
            }
            pub fn supportsTextureSampleCount(self_: *T, sampleCount_: ns.UInteger) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsTextureSampleCount_, sampleCount_);
            }
            pub fn minimumLinearTextureAlignmentForPixelFormat(self_: *T, format_: PixelFormat) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_minimumLinearTextureAlignmentForPixelFormat_, format_);
            }
            pub fn minimumTextureBufferAlignmentForPixelFormat(self_: *T, format_: PixelFormat) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_minimumTextureBufferAlignmentForPixelFormat_, format_);
            }
            pub fn newRenderPipelineStateWithTileDescriptor_options_reflection_error(self_: *T, descriptor_: *TileRenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
                return @as(*const fn (*T, *c.objc_selector, *TileRenderPipelineDescriptor, PipelineOption, ?*AutoreleasedRenderPipelineReflection, ?*?*ns.Error) callconv(.C) ?*RenderPipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithTileDescriptor_options_reflection_error_, descriptor_, options_, reflection_, error_);
            }
            pub fn newRenderPipelineStateWithTileDescriptor_options_completionHandler(self_: *T, descriptor_: *TileRenderPipelineDescriptor, options_: PipelineOption, completionHandler_: NewRenderPipelineStateWithReflectionCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *TileRenderPipelineDescriptor, PipelineOption, NewRenderPipelineStateWithReflectionCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithTileDescriptor_options_completionHandler_, descriptor_, options_, completionHandler_);
            }
            pub fn newRenderPipelineStateWithMeshDescriptor_options_reflection_error(self_: *T, descriptor_: *MeshRenderPipelineDescriptor, options_: PipelineOption, reflection_: ?*AutoreleasedRenderPipelineReflection, error_: ?*?*ns.Error) ?*RenderPipelineState {
                return @as(*const fn (*T, *c.objc_selector, *MeshRenderPipelineDescriptor, PipelineOption, ?*AutoreleasedRenderPipelineReflection, ?*?*ns.Error) callconv(.C) ?*RenderPipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithMeshDescriptor_options_reflection_error_, descriptor_, options_, reflection_, error_);
            }
            pub fn newRenderPipelineStateWithMeshDescriptor_options_completionHandler(self_: *T, descriptor_: *MeshRenderPipelineDescriptor, options_: PipelineOption, completionHandler_: NewRenderPipelineStateWithReflectionCompletionHandler) void {
                return @as(*const fn (*T, *c.objc_selector, *MeshRenderPipelineDescriptor, PipelineOption, NewRenderPipelineStateWithReflectionCompletionHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithMeshDescriptor_options_completionHandler_, descriptor_, options_, completionHandler_);
            }
            pub fn getDefaultSamplePositions_count(self_: *T, positions_: *SamplePosition, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *SamplePosition, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_getDefaultSamplePositions_count_, positions_, count_);
            }
            // pub fn newArgumentEncoderWithArguments(self_: *T, arguments_: ns.Array) ?*ArgumentEncoder {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) ?*ArgumentEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_newArgumentEncoderWithArguments_, arguments_);
            // }
            pub fn supportsRasterizationRateMapWithLayerCount(self_: *T, layerCount_: ns.UInteger) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsRasterizationRateMapWithLayerCount_, layerCount_);
            }
            pub fn newRasterizationRateMapWithDescriptor(self_: *T, descriptor_: *RasterizationRateMapDescriptor) ?*RasterizationRateMap {
                return @as(*const fn (*T, *c.objc_selector, *RasterizationRateMapDescriptor) callconv(.C) ?*RasterizationRateMap, @ptrCast(&c.objc_msgSend))(self_, sel_newRasterizationRateMapWithDescriptor_, descriptor_);
            }
            pub fn newIndirectCommandBufferWithDescriptor_maxCommandCount_options(self_: *T, descriptor_: *IndirectCommandBufferDescriptor, maxCount_: ns.UInteger, options_: ResourceOptions) ?*IndirectCommandBuffer {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBufferDescriptor, ns.UInteger, ResourceOptions) callconv(.C) ?*IndirectCommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_newIndirectCommandBufferWithDescriptor_maxCommandCount_options_, descriptor_, maxCount_, options_);
            }
            pub fn newEvent(self_: *T) ?*Event {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Event, @ptrCast(&c.objc_msgSend))(self_, sel_newEvent);
            }
            pub fn newSharedEvent(self_: *T) ?*SharedEvent {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*SharedEvent, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedEvent);
            }
            pub fn newSharedEventWithHandle(self_: *T, sharedEventHandle_: *SharedEventHandle) ?*SharedEvent {
                return @as(*const fn (*T, *c.objc_selector, *SharedEventHandle) callconv(.C) ?*SharedEvent, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedEventWithHandle_, sharedEventHandle_);
            }
            pub fn newIOHandleWithURL_error(self_: *T, url_: *ns.URL, error_: ?*?*ns.Error) ?*IOFileHandle {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, ?*?*ns.Error) callconv(.C) ?*IOFileHandle, @ptrCast(&c.objc_msgSend))(self_, sel_newIOHandleWithURL_error_, url_, error_);
            }
            pub fn newIOCommandQueueWithDescriptor_error(self_: *T, descriptor_: *IOCommandQueueDescriptor, error_: ?*?*ns.Error) ?*IOCommandQueue {
                return @as(*const fn (*T, *c.objc_selector, *IOCommandQueueDescriptor, ?*?*ns.Error) callconv(.C) ?*IOCommandQueue, @ptrCast(&c.objc_msgSend))(self_, sel_newIOCommandQueueWithDescriptor_error_, descriptor_, error_);
            }
            pub fn newIOHandleWithURL_compressionMethod_error(self_: *T, url_: *ns.URL, compressionMethod_: IOCompressionMethod, error_: ?*?*ns.Error) ?*IOFileHandle {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, IOCompressionMethod, ?*?*ns.Error) callconv(.C) ?*IOFileHandle, @ptrCast(&c.objc_msgSend))(self_, sel_newIOHandleWithURL_compressionMethod_error_, url_, compressionMethod_, error_);
            }
            pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount(self_: *T, textureType_: TextureType, pixelFormat_: PixelFormat, sampleCount_: ns.UInteger) Size {
                return @as(*const fn (*T, *c.objc_selector, TextureType, PixelFormat, ns.UInteger) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_, textureType_, pixelFormat_, sampleCount_);
            }
            pub fn convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions(self_: *T, pixelRegions_: *const Region, tileRegions_: *Region, tileSize_: Size, mode_: SparseTextureRegionAlignmentMode, numRegions_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const Region, *Region, Size, SparseTextureRegionAlignmentMode, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_, pixelRegions_, tileRegions_, tileSize_, mode_, numRegions_);
            }
            pub fn convertSparseTileRegions_toPixelRegions_withTileSize_numRegions(self_: *T, tileRegions_: *const Region, pixelRegions_: *Region, tileSize_: Size, numRegions_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const Region, *Region, Size, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_, tileRegions_, pixelRegions_, tileSize_, numRegions_);
            }
            pub fn sparseTileSizeInBytesForSparsePageSize(self_: *T, sparsePageSize_: SparsePageSize) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, SparsePageSize) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sparseTileSizeInBytesForSparsePageSize_, sparsePageSize_);
            }
            pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize(self_: *T, textureType_: TextureType, pixelFormat_: PixelFormat, sampleCount_: ns.UInteger, sparsePageSize_: SparsePageSize) Size {
                return @as(*const fn (*T, *c.objc_selector, TextureType, PixelFormat, ns.UInteger, SparsePageSize) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_, textureType_, pixelFormat_, sampleCount_, sparsePageSize_);
            }
            pub fn newCounterSampleBufferWithDescriptor_error(self_: *T, descriptor_: *CounterSampleBufferDescriptor, error_: ?*?*ns.Error) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBufferDescriptor, ?*?*ns.Error) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_newCounterSampleBufferWithDescriptor_error_, descriptor_, error_);
            }
            pub fn sampleTimestamps_gpuTimestamp(self_: *T, cpuTimestamp_: *Timestamp, gpuTimestamp_: *Timestamp) void {
                return @as(*const fn (*T, *c.objc_selector, *Timestamp, *Timestamp) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_sampleTimestamps_gpuTimestamp_, cpuTimestamp_, gpuTimestamp_);
            }
            pub fn newArgumentEncoderWithBufferBinding(self_: *T, bufferBinding_: *BufferBinding) *ArgumentEncoder {
                return @as(*const fn (*T, *c.objc_selector, *BufferBinding) callconv(.C) *ArgumentEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_newArgumentEncoderWithBufferBinding_, bufferBinding_);
            }
            pub fn supportsCounterSampling(self_: *T, samplingPoint_: CounterSamplingPoint) bool {
                return @as(*const fn (*T, *c.objc_selector, CounterSamplingPoint) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsCounterSampling_, samplingPoint_);
            }
            pub fn supportsVertexAmplificationCount(self_: *T, count_: ns.UInteger) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsVertexAmplificationCount_, count_);
            }
            pub fn newDynamicLibrary_error(self_: *T, library_: *Library, error_: ?*?*ns.Error) ?*DynamicLibrary {
                return @as(*const fn (*T, *c.objc_selector, *Library, ?*?*ns.Error) callconv(.C) ?*DynamicLibrary, @ptrCast(&c.objc_msgSend))(self_, sel_newDynamicLibrary_error_, library_, error_);
            }
            pub fn newDynamicLibraryWithURL_error(self_: *T, url_: *ns.URL, error_: ?*?*ns.Error) ?*DynamicLibrary {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, ?*?*ns.Error) callconv(.C) ?*DynamicLibrary, @ptrCast(&c.objc_msgSend))(self_, sel_newDynamicLibraryWithURL_error_, url_, error_);
            }
            pub fn newBinaryArchiveWithDescriptor_error(self_: *T, descriptor_: *BinaryArchiveDescriptor, error_: ?*?*ns.Error) ?*BinaryArchive {
                return @as(*const fn (*T, *c.objc_selector, *BinaryArchiveDescriptor, ?*?*ns.Error) callconv(.C) ?*BinaryArchive, @ptrCast(&c.objc_msgSend))(self_, sel_newBinaryArchiveWithDescriptor_error_, descriptor_, error_);
            }
            pub fn accelerationStructureSizesWithDescriptor(self_: *T, descriptor_: *AccelerationStructureDescriptor) AccelerationStructureSizes {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructureDescriptor) callconv(.C) AccelerationStructureSizes, @ptrCast(&c.objc_msgSend))(self_, sel_accelerationStructureSizesWithDescriptor_, descriptor_);
            }
            pub fn newAccelerationStructureWithSize(self_: *T, size_: ns.UInteger) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithSize_, size_);
            }
            pub fn newAccelerationStructureWithDescriptor(self_: *T, descriptor_: *AccelerationStructureDescriptor) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructureDescriptor) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithDescriptor_, descriptor_);
            }
            pub fn heapAccelerationStructureSizeAndAlignWithSize(self_: *T, size_: ns.UInteger) SizeAndAlign {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) SizeAndAlign, @ptrCast(&c.objc_msgSend))(self_, sel_heapAccelerationStructureSizeAndAlignWithSize_, size_);
            }
            pub fn heapAccelerationStructureSizeAndAlignWithDescriptor(self_: *T, descriptor_: *AccelerationStructureDescriptor) SizeAndAlign {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructureDescriptor) callconv(.C) SizeAndAlign, @ptrCast(&c.objc_msgSend))(self_, sel_heapAccelerationStructureSizeAndAlignWithDescriptor_, descriptor_);
            }
            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn registryID(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_registryID);
            }
            pub fn maxThreadsPerThreadgroup(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_maxThreadsPerThreadgroup);
            }
            pub fn isLowPower(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isLowPower);
            }
            pub fn isHeadless(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isHeadless);
            }
            pub fn isRemovable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isRemovable);
            }
            pub fn hasUnifiedMemory(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_hasUnifiedMemory);
            }
            pub fn recommendedMaxWorkingSetSize(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_recommendedMaxWorkingSetSize);
            }
            pub fn location(self_: *T) DeviceLocation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DeviceLocation, @ptrCast(&c.objc_msgSend))(self_, sel_location);
            }
            pub fn locationNumber(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_locationNumber);
            }
            pub fn maxTransferRate(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_maxTransferRate);
            }
            pub fn isDepth24Stencil8PixelFormatSupported(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isDepth24Stencil8PixelFormatSupported);
            }
            pub fn readWriteTextureSupport(self_: *T) ReadWriteTextureTier {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ReadWriteTextureTier, @ptrCast(&c.objc_msgSend))(self_, sel_readWriteTextureSupport);
            }
            pub fn argumentBuffersSupport(self_: *T) ArgumentBuffersTier {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ArgumentBuffersTier, @ptrCast(&c.objc_msgSend))(self_, sel_argumentBuffersSupport);
            }
            pub fn areRasterOrderGroupsSupported(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_areRasterOrderGroupsSupported);
            }
            pub fn supports32BitFloatFiltering(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supports32BitFloatFiltering);
            }
            pub fn supports32BitMSAA(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supports32BitMSAA);
            }
            pub fn supportsQueryTextureLOD(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsQueryTextureLOD);
            }
            pub fn supportsBCTextureCompression(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsBCTextureCompression);
            }
            pub fn supportsPullModelInterpolation(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsPullModelInterpolation);
            }
            pub fn areBarycentricCoordsSupported(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_areBarycentricCoordsSupported);
            }
            pub fn supportsShaderBarycentricCoordinates(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsShaderBarycentricCoordinates);
            }
            pub fn currentAllocatedSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_currentAllocatedSize);
            }
            pub fn maxThreadgroupMemoryLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxThreadgroupMemoryLength);
            }
            pub fn maxArgumentBufferSamplerCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxArgumentBufferSamplerCount);
            }
            pub fn areProgrammableSamplePositionsSupported(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_areProgrammableSamplePositionsSupported);
            }
            pub fn peerGroupID(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_peerGroupID);
            }
            pub fn peerIndex(self_: *T) u32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u32, @ptrCast(&c.objc_msgSend))(self_, sel_peerIndex);
            }
            pub fn peerCount(self_: *T) u32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u32, @ptrCast(&c.objc_msgSend))(self_, sel_peerCount);
            }
            pub fn sparseTileSizeInBytes(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sparseTileSizeInBytes);
            }
            pub fn maxBufferLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxBufferLength);
            }
            // pub fn counterSets(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_counterSets);
            // }
            pub fn supportsDynamicLibraries(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsDynamicLibraries);
            }
            pub fn supportsRenderDynamicLibraries(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsRenderDynamicLibraries);
            }
            pub fn supportsRaytracing(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsRaytracing);
            }
            pub fn supportsFunctionPointers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsFunctionPointers);
            }
            pub fn supportsFunctionPointersFromRender(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsFunctionPointersFromRender);
            }
            pub fn supportsRaytracingFromRender(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsRaytracingFromRender);
            }
            pub fn supportsPrimitiveMotionBlur(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportsPrimitiveMotionBlur);
            }
            pub fn shouldMaximizeConcurrentCompilation(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_shouldMaximizeConcurrentCompilation);
            }
            pub fn setShouldMaximizeConcurrentCompilation(self_: *T, shouldMaximizeConcurrentCompilation_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setShouldMaximizeConcurrentCompilation_, shouldMaximizeConcurrentCompilation_);
            }
            pub fn maximumConcurrentCompilationTaskCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maximumConcurrentCompilationTaskCount);
            }
        };
    }
};

pub const Drawable = opaque {
    pub usingnamespace Methods(Drawable);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn present(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_present);
            }
            pub fn presentAtTime(self_: *T, presentationTime_: cf.TimeInterval) void {
                return @as(*const fn (*T, *c.objc_selector, cf.TimeInterval) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_presentAtTime_, presentationTime_);
            }
            pub fn presentAfterMinimumDuration(self_: *T, duration_: cf.TimeInterval) void {
                return @as(*const fn (*T, *c.objc_selector, cf.TimeInterval) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_presentAfterMinimumDuration_, duration_);
            }
            pub fn addPresentedHandler(self_: *T, block_: DrawablePresentedHandler) void {
                return @as(*const fn (*T, *c.objc_selector, DrawablePresentedHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addPresentedHandler_, block_);
            }
            pub fn presentedTime(self_: *T) cf.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) cf.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_presentedTime);
            }
            pub fn drawableID(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_drawableID);
            }
        };
    }
};

pub const DynamicLibrary = opaque {
    pub usingnamespace Methods(DynamicLibrary);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn serializeToURL_error(self_: *T, url_: *ns.URL, error_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, *ns.URL, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_serializeToURL_error_, url_, error_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn installName(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_installName);
            }
        };
    }
};

pub const Event = opaque {
    pub usingnamespace Methods(Event);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn device(self_: *T) ?*Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const SharedEventListener = opaque {
    pub fn class() *c.objc_class {
        return class_SharedEventListener;
    }
    pub usingnamespace Methods(SharedEventListener);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            // pub fn init(self_: *T) *T {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_init);
            // }
            pub fn initWithDispatchQueue(self_: *T, dispatchQueue_: dispatch_queue_t) *T {
                return @as(*const fn (*T, *c.objc_selector, dispatch_queue_t) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithDispatchQueue_, dispatchQueue_);
            }
            pub fn dispatchQueue(self_: *T) dispatch_queue_t {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) dispatch_queue_t, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchQueue);
            }
        };
    }
};

pub const SharedEvent = opaque {
    pub usingnamespace Methods(SharedEvent);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Event.Methods(T);

            pub fn notifyListener_atValue_block(self_: *T, listener_: *SharedEventListener, value_: u64, block_: SharedEventNotificationBlock) void {
                return @as(*const fn (*T, *c.objc_selector, *SharedEventListener, u64, SharedEventNotificationBlock) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_notifyListener_atValue_block_, listener_, value_, block_);
            }
            pub fn newSharedEventHandle(self_: *T) *SharedEventHandle {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *SharedEventHandle, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedEventHandle);
            }
            pub fn signaledValue(self_: *T) u64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u64, @ptrCast(&c.objc_msgSend))(self_, sel_signaledValue);
            }
            pub fn setSignaledValue(self_: *T, signaledValue_: u64) void {
                return @as(*const fn (*T, *c.objc_selector, u64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSignaledValue_, signaledValue_);
            }
        };
    }
};

pub const SharedEventHandle = opaque {
    pub fn class() *c.objc_class {
        return class_SharedEventHandle;
    }
    pub usingnamespace Methods(SharedEventHandle);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.SecureCoding.Methods(T);

            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
        };
    }
};

pub const Fence = opaque {
    pub usingnamespace Methods(Fence);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const FunctionConstantValues = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionConstantValues;
    }
    pub usingnamespace Methods(FunctionConstantValues);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn setConstantValue_type_atIndex(self_: *T, value_: *const anyopaque, type_: DataType, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, DataType, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setConstantValue_type_atIndex_, value_, type_, index_);
            }
            pub fn setConstantValues_type_withRange(self_: *T, values_: *const anyopaque, type_: DataType, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, DataType, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setConstantValues_type_withRange_, values_, type_, range_);
            }
            pub fn setConstantValue_type_withName(self_: *T, value_: *const anyopaque, type_: DataType, name_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, DataType, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setConstantValue_type_withName_, value_, type_, name_);
            }
            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
        };
    }
};

pub const FunctionDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionDescriptor;
    }
    pub usingnamespace Methods(FunctionDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn functionDescriptor() *FunctionDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *FunctionDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_functionDescriptor);
            }
            pub fn name(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn setName(self_: *T, name_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setName_, name_);
            }
            pub fn specializedName(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_specializedName);
            }
            pub fn setSpecializedName(self_: *T, specializedName_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSpecializedName_, specializedName_);
            }
            pub fn constantValues(self_: *T) ?*FunctionConstantValues {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*FunctionConstantValues, @ptrCast(&c.objc_msgSend))(self_, sel_constantValues);
            }
            pub fn setConstantValues(self_: *T, constantValues_: ?*FunctionConstantValues) void {
                return @as(*const fn (*T, *c.objc_selector, ?*FunctionConstantValues) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setConstantValues_, constantValues_);
            }
            pub fn options(self_: *T) FunctionOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) FunctionOptions, @ptrCast(&c.objc_msgSend))(self_, sel_options);
            }
            pub fn setOptions(self_: *T, options_: FunctionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, FunctionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOptions_, options_);
            }
            // pub fn binaryArchives(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_binaryArchives);
            // }
            // pub fn setBinaryArchives(self_: *T, binaryArchives_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBinaryArchives_, binaryArchives_);
            // }
        };
    }
};

pub const IntersectionFunctionDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_IntersectionFunctionDescriptor;
    }
    pub usingnamespace Methods(IntersectionFunctionDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace FunctionDescriptor.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);
        };
    }
};

pub const FunctionHandle = opaque {
    pub usingnamespace Methods(FunctionHandle);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn functionType(self_: *T) FunctionType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) FunctionType, @ptrCast(&c.objc_msgSend))(self_, sel_functionType);
            }
            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
        };
    }
};

pub const LogContainer = opaque {
    pub usingnamespace Methods(LogContainer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.FastEnumeration.Methods(T);
        };
    }
};

pub const FunctionLogDebugLocation = opaque {
    pub usingnamespace Methods(FunctionLogDebugLocation);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn functionName(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_functionName);
            }
            pub fn URL(self_: *T) ?*ns.URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.URL, @ptrCast(&c.objc_msgSend))(self_, sel_URL);
            }
            pub fn line(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_line);
            }
            pub fn column(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_column);
            }
        };
    }
};

pub const FunctionLog = opaque {
    pub usingnamespace Methods(FunctionLog);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn @"type"(self_: *T) FunctionLogType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) FunctionLogType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn encoderLabel(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_encoderLabel);
            }
            pub fn function(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_function);
            }
            pub fn debugLocation(self_: *T) ?*FunctionLogDebugLocation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*FunctionLogDebugLocation, @ptrCast(&c.objc_msgSend))(self_, sel_debugLocation);
            }
        };
    }
};

pub const FunctionStitchingAttribute = opaque {
    pub usingnamespace Methods(FunctionStitchingAttribute);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);
        };
    }
};

pub const FunctionStitchingAttributeAlwaysInline = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionStitchingAttributeAlwaysInline;
    }
    pub usingnamespace Methods(FunctionStitchingAttributeAlwaysInline);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace FunctionStitchingAttribute.Methods(T);
        };
    }
};

pub const FunctionStitchingNode = opaque {
    pub usingnamespace Methods(FunctionStitchingNode);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);
        };
    }
};

pub const FunctionStitchingInputNode = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionStitchingInputNode;
    }
    pub usingnamespace Methods(FunctionStitchingInputNode);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace FunctionStitchingNode.Methods(T);

            pub fn initWithArgumentIndex(self_: *T, argument_: ns.UInteger) *T {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithArgumentIndex_, argument_);
            }
            pub fn argumentIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_argumentIndex);
            }
            pub fn setArgumentIndex(self_: *T, argumentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArgumentIndex_, argumentIndex_);
            }
        };
    }
};

pub const FunctionStitchingFunctionNode = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionStitchingFunctionNode;
    }
    pub usingnamespace Methods(FunctionStitchingFunctionNode);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace FunctionStitchingNode.Methods(T);

            // pub fn initWithName_arguments_controlDependencies(self_: *T, name_: *ns.String, arguments_: ns.Array, controlDependencies_: ns.Array) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *ns.String, ns.Array, ns.Array) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithName_arguments_controlDependencies_, name_, arguments_, controlDependencies_);
            // }
            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn setName(self_: *T, name_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setName_, name_);
            }
            // pub fn arguments(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_arguments);
            // }
            // pub fn setArguments(self_: *T, arguments_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArguments_, arguments_);
            // }
            // pub fn controlDependencies(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_controlDependencies);
            // }
            // pub fn setControlDependencies(self_: *T, controlDependencies_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setControlDependencies_, controlDependencies_);
            // }
        };
    }
};

pub const FunctionStitchingGraph = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionStitchingGraph;
    }
    pub usingnamespace Methods(FunctionStitchingGraph);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            // pub fn initWithFunctionName_nodes_outputNode_attributes(self_: *T, functionName_: *ns.String, nodes_: ns.Array, outputNode_: ?*FunctionStitchingFunctionNode, attributes_: ns.Array) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *ns.String, ns.Array, ?*FunctionStitchingFunctionNode, ns.Array) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithFunctionName_nodes_outputNode_attributes_, functionName_, nodes_, outputNode_, attributes_);
            // }
            pub fn functionName(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_functionName);
            }
            pub fn setFunctionName(self_: *T, functionName_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctionName_, functionName_);
            }
            // pub fn nodes(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_nodes);
            // }
            // pub fn setNodes(self_: *T, nodes_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setNodes_, nodes_);
            // }
            pub fn outputNode(self_: *T) ?*FunctionStitchingFunctionNode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*FunctionStitchingFunctionNode, @ptrCast(&c.objc_msgSend))(self_, sel_outputNode);
            }
            pub fn setOutputNode(self_: *T, outputNode_: ?*FunctionStitchingFunctionNode) void {
                return @as(*const fn (*T, *c.objc_selector, ?*FunctionStitchingFunctionNode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOutputNode_, outputNode_);
            }
            // pub fn attributes(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_attributes);
            // }
            // pub fn setAttributes(self_: *T, attributes_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAttributes_, attributes_);
            // }
        };
    }
};

pub const StitchedLibraryDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_StitchedLibraryDescriptor;
    }
    pub usingnamespace Methods(StitchedLibraryDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            // pub fn functionGraphs(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_functionGraphs);
            // }
            // pub fn setFunctionGraphs(self_: *T, functionGraphs_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctionGraphs_, functionGraphs_);
            // }
            // pub fn functions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_functions);
            // }
            // pub fn setFunctions(self_: *T, functions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctions_, functions_);
            // }
        };
    }
};

pub const HeapDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_HeapDescriptor;
    }
    pub usingnamespace Methods(HeapDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn size(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_size);
            }
            pub fn setSize(self_: *T, size_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSize_, size_);
            }
            pub fn storageMode(self_: *T) StorageMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StorageMode, @ptrCast(&c.objc_msgSend))(self_, sel_storageMode);
            }
            pub fn setStorageMode(self_: *T, storageMode_: StorageMode) void {
                return @as(*const fn (*T, *c.objc_selector, StorageMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStorageMode_, storageMode_);
            }
            pub fn cpuCacheMode(self_: *T) CPUCacheMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CPUCacheMode, @ptrCast(&c.objc_msgSend))(self_, sel_cpuCacheMode);
            }
            pub fn setCpuCacheMode(self_: *T, cpuCacheMode_: CPUCacheMode) void {
                return @as(*const fn (*T, *c.objc_selector, CPUCacheMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCpuCacheMode_, cpuCacheMode_);
            }
            pub fn sparsePageSize(self_: *T) SparsePageSize {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SparsePageSize, @ptrCast(&c.objc_msgSend))(self_, sel_sparsePageSize);
            }
            pub fn setSparsePageSize(self_: *T, sparsePageSize_: SparsePageSize) void {
                return @as(*const fn (*T, *c.objc_selector, SparsePageSize) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSparsePageSize_, sparsePageSize_);
            }
            pub fn hazardTrackingMode(self_: *T) HazardTrackingMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HazardTrackingMode, @ptrCast(&c.objc_msgSend))(self_, sel_hazardTrackingMode);
            }
            pub fn setHazardTrackingMode(self_: *T, hazardTrackingMode_: HazardTrackingMode) void {
                return @as(*const fn (*T, *c.objc_selector, HazardTrackingMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setHazardTrackingMode_, hazardTrackingMode_);
            }
            pub fn resourceOptions(self_: *T) ResourceOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceOptions, @ptrCast(&c.objc_msgSend))(self_, sel_resourceOptions);
            }
            pub fn setResourceOptions(self_: *T, resourceOptions_: ResourceOptions) void {
                return @as(*const fn (*T, *c.objc_selector, ResourceOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResourceOptions_, resourceOptions_);
            }
            pub fn @"type"(self_: *T) HeapType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HeapType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn setType(self_: *T, type_: HeapType) void {
                return @as(*const fn (*T, *c.objc_selector, HeapType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setType_, type_);
            }
        };
    }
};

pub const Heap = opaque {
    pub usingnamespace Methods(Heap);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn maxAvailableSizeWithAlignment(self_: *T, alignment_: ns.UInteger) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxAvailableSizeWithAlignment_, alignment_);
            }
            pub fn newBufferWithLength_options(self_: *T, length_: ns.UInteger, options_: ResourceOptions) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ResourceOptions) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newBufferWithLength_options_, length_, options_);
            }
            pub fn newTextureWithDescriptor(self_: *T, desc_: *TextureDescriptor) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureWithDescriptor_, desc_);
            }
            pub fn setPurgeableState(self_: *T, state_: PurgeableState) PurgeableState {
                return @as(*const fn (*T, *c.objc_selector, PurgeableState) callconv(.C) PurgeableState, @ptrCast(&c.objc_msgSend))(self_, sel_setPurgeableState_, state_);
            }
            pub fn newBufferWithLength_options_offset(self_: *T, length_: ns.UInteger, options_: ResourceOptions, offset_: ns.UInteger) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ResourceOptions, ns.UInteger) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_newBufferWithLength_options_offset_, length_, options_, offset_);
            }
            pub fn newTextureWithDescriptor_offset(self_: *T, descriptor_: *TextureDescriptor, offset_: ns.UInteger) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *TextureDescriptor, ns.UInteger) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureWithDescriptor_offset_, descriptor_, offset_);
            }
            pub fn newAccelerationStructureWithSize(self_: *T, size_: ns.UInteger) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithSize_, size_);
            }
            pub fn newAccelerationStructureWithDescriptor(self_: *T, descriptor_: *AccelerationStructureDescriptor) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructureDescriptor) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithDescriptor_, descriptor_);
            }
            pub fn newAccelerationStructureWithSize_offset(self_: *T, size_: ns.UInteger, offset_: ns.UInteger) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithSize_offset_, size_, offset_);
            }
            pub fn newAccelerationStructureWithDescriptor_offset(self_: *T, descriptor_: *AccelerationStructureDescriptor, offset_: ns.UInteger) ?*AccelerationStructure {
                return @as(*const fn (*T, *c.objc_selector, *AccelerationStructureDescriptor, ns.UInteger) callconv(.C) ?*AccelerationStructure, @ptrCast(&c.objc_msgSend))(self_, sel_newAccelerationStructureWithDescriptor_offset_, descriptor_, offset_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn storageMode(self_: *T) StorageMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StorageMode, @ptrCast(&c.objc_msgSend))(self_, sel_storageMode);
            }
            pub fn cpuCacheMode(self_: *T) CPUCacheMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CPUCacheMode, @ptrCast(&c.objc_msgSend))(self_, sel_cpuCacheMode);
            }
            pub fn hazardTrackingMode(self_: *T) HazardTrackingMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HazardTrackingMode, @ptrCast(&c.objc_msgSend))(self_, sel_hazardTrackingMode);
            }
            pub fn resourceOptions(self_: *T) ResourceOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceOptions, @ptrCast(&c.objc_msgSend))(self_, sel_resourceOptions);
            }
            pub fn size(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_size);
            }
            pub fn usedSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_usedSize);
            }
            pub fn currentAllocatedSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_currentAllocatedSize);
            }
            pub fn @"type"(self_: *T) HeapType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HeapType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
        };
    }
};

pub const IndirectCommandBufferDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_IndirectCommandBufferDescriptor;
    }
    pub usingnamespace Methods(IndirectCommandBufferDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn commandTypes(self_: *T) IndirectCommandType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IndirectCommandType, @ptrCast(&c.objc_msgSend))(self_, sel_commandTypes);
            }
            pub fn setCommandTypes(self_: *T, commandTypes_: IndirectCommandType) void {
                return @as(*const fn (*T, *c.objc_selector, IndirectCommandType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCommandTypes_, commandTypes_);
            }
            pub fn inheritPipelineState(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_inheritPipelineState);
            }
            pub fn setInheritPipelineState(self_: *T, inheritPipelineState_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInheritPipelineState_, inheritPipelineState_);
            }
            pub fn inheritBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_inheritBuffers);
            }
            pub fn setInheritBuffers(self_: *T, inheritBuffers_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInheritBuffers_, inheritBuffers_);
            }
            pub fn maxVertexBufferBindCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxVertexBufferBindCount);
            }
            pub fn setMaxVertexBufferBindCount(self_: *T, maxVertexBufferBindCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxVertexBufferBindCount_, maxVertexBufferBindCount_);
            }
            pub fn maxFragmentBufferBindCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxFragmentBufferBindCount);
            }
            pub fn setMaxFragmentBufferBindCount(self_: *T, maxFragmentBufferBindCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxFragmentBufferBindCount_, maxFragmentBufferBindCount_);
            }
            pub fn maxKernelBufferBindCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxKernelBufferBindCount);
            }
            pub fn setMaxKernelBufferBindCount(self_: *T, maxKernelBufferBindCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxKernelBufferBindCount_, maxKernelBufferBindCount_);
            }
            pub fn supportRayTracing(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportRayTracing);
            }
            pub fn setSupportRayTracing(self_: *T, supportRayTracing_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportRayTracing_, supportRayTracing_);
            }
        };
    }
};

pub const IndirectCommandBuffer = opaque {
    pub usingnamespace Methods(IndirectCommandBuffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn resetWithRange(self_: *T, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_resetWithRange_, range_);
            }
            pub fn indirectRenderCommandAtIndex(self_: *T, commandIndex_: ns.UInteger) *IndirectRenderCommand {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *IndirectRenderCommand, @ptrCast(&c.objc_msgSend))(self_, sel_indirectRenderCommandAtIndex_, commandIndex_);
            }
            pub fn indirectComputeCommandAtIndex(self_: *T, commandIndex_: ns.UInteger) *IndirectComputeCommand {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *IndirectComputeCommand, @ptrCast(&c.objc_msgSend))(self_, sel_indirectComputeCommandAtIndex_, commandIndex_);
            }
            pub fn size(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_size);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const IndirectRenderCommand = opaque {
    pub usingnamespace Methods(IndirectRenderCommand);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn setRenderPipelineState(self_: *T, pipelineState_: *RenderPipelineState) void {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineState) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderPipelineState_, pipelineState_);
            }
            pub fn setVertexBuffer_offset_atIndex(self_: *T, buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setFragmentBuffer_offset_atIndex(self_: *T, buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger, buffer_: *Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger, ns.UInteger, ?*Buffer, ns.UInteger, ns.UInteger, ns.UInteger, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, instanceCount_, baseInstance_, buffer_, offset_, instanceStride_);
            }
            pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger, buffer_: *Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger, ns.UInteger, ?*Buffer, ns.UInteger, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, instanceCount_, baseInstance_, buffer_, offset_, instanceStride_);
            }
            pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance(self_: *T, primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType_, vertexStart_, vertexCount_, instanceCount_, baseInstance_);
            }
            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance(self_: *T, primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseVertex_: ns.Integer, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, IndexType, *Buffer, ns.UInteger, ns.UInteger, ns.Integer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_, baseVertex_, baseInstance_);
            }
            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
        };
    }
};

pub const IndirectComputeCommand = opaque {
    pub usingnamespace Methods(IndirectComputeCommand);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn setComputePipelineState(self_: *T, pipelineState_: *ComputePipelineState) void {
                return @as(*const fn (*T, *c.objc_selector, *ComputePipelineState) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setComputePipelineState_, pipelineState_);
            }
            pub fn setKernelBuffer_offset_atIndex(self_: *T, buffer_: *Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setKernelBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn concurrentDispatchThreadgroups_threadsPerThreadgroup(self_: *T, threadgroupsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_concurrentDispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid_, threadsPerThreadgroup_);
            }
            pub fn concurrentDispatchThreads_threadsPerThreadgroup(self_: *T, threadsPerGrid_: Size, threadsPerThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_concurrentDispatchThreads_threadsPerThreadgroup_, threadsPerGrid_, threadsPerThreadgroup_);
            }
            pub fn setBarrier(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBarrier);
            }
            pub fn clearBarrier(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_clearBarrier);
            }
            pub fn setImageblockWidth_height(self_: *T, width_: ns.UInteger, height_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setImageblockWidth_height_, width_, height_);
            }
            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn setThreadgroupMemoryLength_atIndex(self_: *T, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadgroupMemoryLength_atIndex_, length_, index_);
            }
            pub fn setStageInRegion(self_: *T, region_: Region) void {
                return @as(*const fn (*T, *c.objc_selector, Region) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStageInRegion_, region_);
            }
        };
    }
};

pub const IntersectionFunctionTableDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_IntersectionFunctionTableDescriptor;
    }
    pub usingnamespace Methods(IntersectionFunctionTableDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn intersectionFunctionTableDescriptor() *IntersectionFunctionTableDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *IntersectionFunctionTableDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_intersectionFunctionTableDescriptor);
            }
            pub fn functionCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_functionCount);
            }
            pub fn setFunctionCount(self_: *T, functionCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctionCount_, functionCount_);
            }
        };
    }
};

pub const IntersectionFunctionTable = opaque {
    pub usingnamespace Methods(IntersectionFunctionTable);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn setBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setFunction_atIndex(self_: *T, function_: ?*FunctionHandle, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*FunctionHandle, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunction_atIndex_, function_, index_);
            }
            pub fn setFunctions_withRange(self_: *T, functions_: *?*const FunctionHandle, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const FunctionHandle, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctions_withRange_, functions_, range_);
            }
            pub fn setOpaqueTriangleIntersectionFunctionWithSignature_atIndex(self_: *T, signature_: IntersectionFunctionSignature, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, IntersectionFunctionSignature, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_, signature_, index_);
            }
            pub fn setOpaqueTriangleIntersectionFunctionWithSignature_withRange(self_: *T, signature_: IntersectionFunctionSignature, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, IntersectionFunctionSignature, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOpaqueTriangleIntersectionFunctionWithSignature_withRange_, signature_, range_);
            }
            pub fn setVisibleFunctionTable_atBufferIndex(self_: *T, functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTable_atBufferIndex_, functionTable_, bufferIndex_);
            }
            pub fn setVisibleFunctionTables_withBufferRange(self_: *T, functionTables_: *?*const VisibleFunctionTable, bufferRange_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibleFunctionTables_withBufferRange_, functionTables_, bufferRange_);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const IOCommandBuffer = opaque {
    pub usingnamespace Methods(IOCommandBuffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn addCompletedHandler(self_: *T, block_: IOCommandBufferHandler) void {
                return @as(*const fn (*T, *c.objc_selector, IOCommandBufferHandler) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addCompletedHandler_, block_);
            }
            pub fn loadBytes_size_sourceHandle_sourceHandleOffset(self_: *T, pointer_: *anyopaque, size_: ns.UInteger, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *anyopaque, ns.UInteger, *IOFileHandle, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_loadBytes_size_sourceHandle_sourceHandleOffset_, pointer_, size_, sourceHandle_, sourceHandleOffset_);
            }
            pub fn loadBuffer_offset_size_sourceHandle_sourceHandleOffset(self_: *T, buffer_: *Buffer, offset_: ns.UInteger, size_: ns.UInteger, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, ns.UInteger, *IOFileHandle, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, buffer_, offset_, size_, sourceHandle_, sourceHandleOffset_);
            }
            pub fn loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset(self_: *T, texture_: *Texture, slice_: ns.UInteger, level_: ns.UInteger, size_: Size, sourceBytesPerRow_: ns.UInteger, sourceBytesPerImage_: ns.UInteger, destinationOrigin_: Origin, sourceHandle_: *IOFileHandle, sourceHandleOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, Size, ns.UInteger, ns.UInteger, Origin, *IOFileHandle, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, texture_, slice_, level_, size_, sourceBytesPerRow_, sourceBytesPerImage_, destinationOrigin_, sourceHandle_, sourceHandleOffset_);
            }
            pub fn copyStatusToBuffer_offset(self_: *T, buffer_: *Buffer, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyStatusToBuffer_offset_, buffer_, offset_);
            }
            pub fn commit(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_commit);
            }
            pub fn waitUntilCompleted(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitUntilCompleted);
            }
            pub fn tryCancel(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_tryCancel);
            }
            pub fn addBarrier(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addBarrier);
            }
            pub fn pushDebugGroup(self_: *T, string_: *ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_pushDebugGroup_, string_);
            }
            pub fn popDebugGroup(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_popDebugGroup);
            }
            pub fn enqueue(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_enqueue);
            }
            pub fn waitForEvent_value(self_: *T, event_: *SharedEvent, value_: u64) void {
                return @as(*const fn (*T, *c.objc_selector, *SharedEvent, u64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForEvent_value_, event_, value_);
            }
            pub fn signalEvent_value(self_: *T, event_: *SharedEvent, value_: u64) void {
                return @as(*const fn (*T, *c.objc_selector, *SharedEvent, u64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_signalEvent_value_, event_, value_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn status(self_: *T) IOStatus {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IOStatus, @ptrCast(&c.objc_msgSend))(self_, sel_status);
            }
            pub fn @"error"(self_: *T) ?*ns.Error {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.Error, @ptrCast(&c.objc_msgSend))(self_, sel_error);
            }
        };
    }
};

pub const IOCommandQueue = opaque {
    pub usingnamespace Methods(IOCommandQueue);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn enqueueBarrier(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_enqueueBarrier);
            }
            pub fn commandBuffer(self_: *T) *IOCommandBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *IOCommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_commandBuffer);
            }
            pub fn commandBufferWithUnretainedReferences(self_: *T) *IOCommandBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *IOCommandBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_commandBufferWithUnretainedReferences);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const IOScratchBuffer = opaque {
    pub usingnamespace Methods(IOScratchBuffer);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn buffer(self_: *T) *Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_buffer);
            }
        };
    }
};

pub const IOScratchBufferAllocator = opaque {
    pub usingnamespace Methods(IOScratchBufferAllocator);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn newScratchBufferWithMinimumSize(self_: *T, minimumSize_: ns.UInteger) ?*IOScratchBuffer {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*IOScratchBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_newScratchBufferWithMinimumSize_, minimumSize_);
            }
        };
    }
};

pub const IOCommandQueueDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_IOCommandQueueDescriptor;
    }
    pub usingnamespace Methods(IOCommandQueueDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn maxCommandBufferCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxCommandBufferCount);
            }
            pub fn setMaxCommandBufferCount(self_: *T, maxCommandBufferCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxCommandBufferCount_, maxCommandBufferCount_);
            }
            pub fn priority(self_: *T) IOPriority {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IOPriority, @ptrCast(&c.objc_msgSend))(self_, sel_priority);
            }
            pub fn setPriority(self_: *T, priority_: IOPriority) void {
                return @as(*const fn (*T, *c.objc_selector, IOPriority) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPriority_, priority_);
            }
            pub fn @"type"(self_: *T) IOCommandQueueType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IOCommandQueueType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn setType(self_: *T, type_: IOCommandQueueType) void {
                return @as(*const fn (*T, *c.objc_selector, IOCommandQueueType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setType_, type_);
            }
            pub fn maxCommandsInFlight(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxCommandsInFlight);
            }
            pub fn setMaxCommandsInFlight(self_: *T, maxCommandsInFlight_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxCommandsInFlight_, maxCommandsInFlight_);
            }
            pub fn scratchBufferAllocator(self_: *T) ?*IOScratchBufferAllocator {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*IOScratchBufferAllocator, @ptrCast(&c.objc_msgSend))(self_, sel_scratchBufferAllocator);
            }
            pub fn setScratchBufferAllocator(self_: *T, scratchBufferAllocator_: ?*IOScratchBufferAllocator) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IOScratchBufferAllocator) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setScratchBufferAllocator_, scratchBufferAllocator_);
            }
        };
    }
};

pub const IOFileHandle = opaque {
    pub usingnamespace Methods(IOFileHandle);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const VertexAttribute = opaque {
    pub fn class() *c.objc_class {
        return class_VertexAttribute;
    }
    pub usingnamespace Methods(VertexAttribute);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn attributeIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_attributeIndex);
            }
            pub fn attributeType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_attributeType);
            }
            pub fn isActive(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isActive);
            }
            pub fn isPatchData(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isPatchData);
            }
            pub fn isPatchControlPointData(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isPatchControlPointData);
            }
        };
    }
};

pub const Attribute = opaque {
    pub fn class() *c.objc_class {
        return class_Attribute;
    }
    pub usingnamespace Methods(Attribute);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn attributeIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_attributeIndex);
            }
            pub fn attributeType(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_attributeType);
            }
            pub fn isActive(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isActive);
            }
            pub fn isPatchData(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isPatchData);
            }
            pub fn isPatchControlPointData(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isPatchControlPointData);
            }
        };
    }
};

pub const FunctionConstant = opaque {
    pub fn class() *c.objc_class {
        return class_FunctionConstant;
    }
    pub usingnamespace Methods(FunctionConstant);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn @"type"(self_: *T) DataType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) DataType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn index(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_index);
            }
            pub fn required(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_required);
            }
        };
    }
};

pub const Function = opaque {
    pub usingnamespace Methods(Function);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn newArgumentEncoderWithBufferIndex(self_: *T, bufferIndex_: ns.UInteger) *ArgumentEncoder {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *ArgumentEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_newArgumentEncoderWithBufferIndex_, bufferIndex_);
            }
            pub fn newArgumentEncoderWithBufferIndex_reflection(self_: *T, bufferIndex_: ns.UInteger, reflection_: ?*AutoreleasedArgument) *ArgumentEncoder {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ?*AutoreleasedArgument) callconv(.C) *ArgumentEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_newArgumentEncoderWithBufferIndex_reflection_, bufferIndex_, reflection_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn functionType(self_: *T) FunctionType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) FunctionType, @ptrCast(&c.objc_msgSend))(self_, sel_functionType);
            }
            pub fn patchType(self_: *T) PatchType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PatchType, @ptrCast(&c.objc_msgSend))(self_, sel_patchType);
            }
            pub fn patchControlPointCount(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_patchControlPointCount);
            }
            // pub fn vertexAttributes(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexAttributes);
            // }
            // pub fn stageInputAttributes(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_stageInputAttributes);
            // }
            pub fn name(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            // pub fn functionConstantsDictionary(self_: *T) ns.Dictionary {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Dictionary, @ptrCast(&c.objc_msgSend))(self_, sel_functionConstantsDictionary);
            // }
            pub fn options(self_: *T) FunctionOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) FunctionOptions, @ptrCast(&c.objc_msgSend))(self_, sel_options);
            }
        };
    }
};

pub const CompileOptions = opaque {
    pub fn class() *c.objc_class {
        return class_CompileOptions;
    }
    pub usingnamespace Methods(CompileOptions);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            // pub fn preprocessorMacros(self_: *T) ns.Dictionary {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Dictionary, @ptrCast(&c.objc_msgSend))(self_, sel_preprocessorMacros);
            // }
            // pub fn setPreprocessorMacros(self_: *T, preprocessorMacros_: ns.Dictionary) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Dictionary) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPreprocessorMacros_, preprocessorMacros_);
            // }
            pub fn fastMathEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_fastMathEnabled);
            }
            pub fn setFastMathEnabled(self_: *T, fastMathEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFastMathEnabled_, fastMathEnabled_);
            }
            pub fn languageVersion(self_: *T) LanguageVersion {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) LanguageVersion, @ptrCast(&c.objc_msgSend))(self_, sel_languageVersion);
            }
            pub fn setLanguageVersion(self_: *T, languageVersion_: LanguageVersion) void {
                return @as(*const fn (*T, *c.objc_selector, LanguageVersion) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLanguageVersion_, languageVersion_);
            }
            pub fn libraryType(self_: *T) LibraryType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) LibraryType, @ptrCast(&c.objc_msgSend))(self_, sel_libraryType);
            }
            pub fn setLibraryType(self_: *T, libraryType_: LibraryType) void {
                return @as(*const fn (*T, *c.objc_selector, LibraryType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLibraryType_, libraryType_);
            }
            pub fn installName(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_installName);
            }
            pub fn setInstallName(self_: *T, installName_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInstallName_, installName_);
            }
            // pub fn libraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_libraries);
            // }
            // pub fn setLibraries(self_: *T, libraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLibraries_, libraries_);
            // }
            pub fn preserveInvariance(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_preserveInvariance);
            }
            pub fn setPreserveInvariance(self_: *T, preserveInvariance_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPreserveInvariance_, preserveInvariance_);
            }
            pub fn optimizationLevel(self_: *T) LibraryOptimizationLevel {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) LibraryOptimizationLevel, @ptrCast(&c.objc_msgSend))(self_, sel_optimizationLevel);
            }
            pub fn setOptimizationLevel(self_: *T, optimizationLevel_: LibraryOptimizationLevel) void {
                return @as(*const fn (*T, *c.objc_selector, LibraryOptimizationLevel) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOptimizationLevel_, optimizationLevel_);
            }
            pub fn compileSymbolVisibility(self_: *T) CompileSymbolVisibility {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CompileSymbolVisibility, @ptrCast(&c.objc_msgSend))(self_, sel_compileSymbolVisibility);
            }
            pub fn setCompileSymbolVisibility(self_: *T, compileSymbolVisibility_: CompileSymbolVisibility) void {
                return @as(*const fn (*T, *c.objc_selector, CompileSymbolVisibility) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCompileSymbolVisibility_, compileSymbolVisibility_);
            }
            pub fn allowReferencingUndefinedSymbols(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowReferencingUndefinedSymbols);
            }
            pub fn setAllowReferencingUndefinedSymbols(self_: *T, allowReferencingUndefinedSymbols_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAllowReferencingUndefinedSymbols_, allowReferencingUndefinedSymbols_);
            }
            pub fn maxTotalThreadsPerThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerThreadgroup);
            }
            pub fn setMaxTotalThreadsPerThreadgroup(self_: *T, maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup_);
            }
        };
    }
};

pub const Library = opaque {
    pub usingnamespace Methods(Library);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn newFunctionWithName(self_: *T, functionName_: *ns.String) ?*Function {
                return @as(*const fn (*T, *c.objc_selector, *ns.String) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_newFunctionWithName_, functionName_);
            }
            pub fn newFunctionWithName_constantValues_error(self_: *T, name_: *ns.String, constantValues_: *FunctionConstantValues, error_: ?*?*ns.Error) ?*Function {
                return @as(*const fn (*T, *c.objc_selector, *ns.String, *FunctionConstantValues, ?*?*ns.Error) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_newFunctionWithName_constantValues_error_, name_, constantValues_, error_);
            }
            // pub fn newFunctionWithName_constantValues_completionHandler(self_: *T, name_: *ns.String, constantValues_: *FunctionConstantValues, completionHandler_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, *ns.String, *FunctionConstantValues, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newFunctionWithName_constantValues_completionHandler_, name_, constantValues_, completionHandler_);
            // }
            // pub fn newFunctionWithDescriptor_completionHandler(self_: *T, descriptor_: *FunctionDescriptor, completionHandler_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, *FunctionDescriptor, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newFunctionWithDescriptor_completionHandler_, descriptor_, completionHandler_);
            // }
            pub fn newFunctionWithDescriptor_error(self_: *T, descriptor_: *FunctionDescriptor, error_: ?*?*ns.Error) ?*Function {
                return @as(*const fn (*T, *c.objc_selector, *FunctionDescriptor, ?*?*ns.Error) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_newFunctionWithDescriptor_error_, descriptor_, error_);
            }
            // pub fn newIntersectionFunctionWithDescriptor_completionHandler(self_: *T, descriptor_: *IntersectionFunctionDescriptor, completionHandler_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, *IntersectionFunctionDescriptor, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_newIntersectionFunctionWithDescriptor_completionHandler_, descriptor_, completionHandler_);
            // }
            pub fn newIntersectionFunctionWithDescriptor_error(self_: *T, descriptor_: *IntersectionFunctionDescriptor, error_: ?*?*ns.Error) ?*Function {
                return @as(*const fn (*T, *c.objc_selector, *IntersectionFunctionDescriptor, ?*?*ns.Error) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_newIntersectionFunctionWithDescriptor_error_, descriptor_, error_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            // pub fn functionNames(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_functionNames);
            // }
            pub fn @"type"(self_: *T) LibraryType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) LibraryType, @ptrCast(&c.objc_msgSend))(self_, sel_type);
            }
            pub fn installName(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_installName);
            }
        };
    }
};

pub const LinkedFunctions = opaque {
    pub fn class() *c.objc_class {
        return class_LinkedFunctions;
    }
    pub usingnamespace Methods(LinkedFunctions);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn linkedFunctions() *LinkedFunctions {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *LinkedFunctions, @ptrCast(&c.objc_msgSend))(T.class(), sel_linkedFunctions);
            }
            // pub fn functions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_functions);
            // }
            // pub fn setFunctions(self_: *T, functions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctions_, functions_);
            // }
            // pub fn binaryFunctions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_binaryFunctions);
            // }
            // pub fn setBinaryFunctions(self_: *T, binaryFunctions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBinaryFunctions_, binaryFunctions_);
            // }
            // pub fn groups(self_: *T) ns.Dictionary {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Dictionary, @ptrCast(&c.objc_msgSend))(self_, sel_groups);
            // }
            // pub fn setGroups(self_: *T, groups_: ns.Dictionary) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Dictionary) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setGroups_, groups_);
            // }
            // pub fn privateFunctions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_privateFunctions);
            // }
            // pub fn setPrivateFunctions(self_: *T, privateFunctions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPrivateFunctions_, privateFunctions_);
            // }
        };
    }
};

pub const ParallelRenderCommandEncoder = opaque {
    pub usingnamespace Methods(ParallelRenderCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn renderCommandEncoder(self_: *T) ?*RenderCommandEncoder {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*RenderCommandEncoder, @ptrCast(&c.objc_msgSend))(self_, sel_renderCommandEncoder);
            }
            pub fn setColorStoreAction_atIndex(self_: *T, storeAction_: StoreAction, colorAttachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setColorStoreAction_atIndex_, storeAction_, colorAttachmentIndex_);
            }
            pub fn setDepthStoreAction(self_: *T, storeAction_: StoreAction) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStoreAction_, storeAction_);
            }
            pub fn setStencilStoreAction(self_: *T, storeAction_: StoreAction) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilStoreAction_, storeAction_);
            }
            pub fn setColorStoreActionOptions_atIndex(self_: *T, storeActionOptions_: StoreActionOptions, colorAttachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setColorStoreActionOptions_atIndex_, storeActionOptions_, colorAttachmentIndex_);
            }
            pub fn setDepthStoreActionOptions(self_: *T, storeActionOptions_: StoreActionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStoreActionOptions_, storeActionOptions_);
            }
            pub fn setStencilStoreActionOptions(self_: *T, storeActionOptions_: StoreActionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilStoreActionOptions_, storeActionOptions_);
            }
        };
    }
};

pub const PipelineBufferDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_PipelineBufferDescriptor;
    }
    pub usingnamespace Methods(PipelineBufferDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn mutability(self_: *T) Mutability {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Mutability, @ptrCast(&c.objc_msgSend))(self_, sel_mutability);
            }
            pub fn setMutability(self_: *T, mutability_: Mutability) void {
                return @as(*const fn (*T, *c.objc_selector, Mutability) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMutability_, mutability_);
            }
        };
    }
};

pub const PipelineBufferDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_PipelineBufferDescriptorArray;
    }
    pub usingnamespace Methods(PipelineBufferDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, bufferIndex_: ns.UInteger) *PipelineBufferDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *PipelineBufferDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, bufferIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, buffer_: ?*PipelineBufferDescriptor, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*PipelineBufferDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, buffer_, bufferIndex_);
            }
        };
    }
};

pub const RasterizationRateSampleArray = opaque {
    pub fn class() *c.objc_class {
        return class_RasterizationRateSampleArray;
    }
    pub usingnamespace Methods(RasterizationRateSampleArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, index_: ns.UInteger) *ns.Number {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *ns.Number, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, index_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, value_: *ns.Number, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *ns.Number, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, value_, index_);
            }
        };
    }
};

pub const RasterizationRateLayerDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RasterizationRateLayerDescriptor;
    }
    pub usingnamespace Methods(RasterizationRateLayerDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            // pub fn init(self_: *T) *T {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_init);
            // }
            pub fn initWithSampleCount(self_: *T, sampleCount_: Size) *T {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithSampleCount_, sampleCount_);
            }
            pub fn initWithSampleCount_horizontal_vertical(self_: *T, sampleCount_: Size, horizontal_: *const f32, vertical_: *const f32) *T {
                return @as(*const fn (*T, *c.objc_selector, Size, *const f32, *const f32) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithSampleCount_horizontal_vertical_, sampleCount_, horizontal_, vertical_);
            }
            pub fn sampleCount(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
            pub fn maxSampleCount(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_maxSampleCount);
            }
            pub fn horizontalSampleStorage(self_: *T) *f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *f32, @ptrCast(&c.objc_msgSend))(self_, sel_horizontalSampleStorage);
            }
            pub fn verticalSampleStorage(self_: *T) *f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *f32, @ptrCast(&c.objc_msgSend))(self_, sel_verticalSampleStorage);
            }
            pub fn horizontal(self_: *T) *RasterizationRateSampleArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RasterizationRateSampleArray, @ptrCast(&c.objc_msgSend))(self_, sel_horizontal);
            }
            pub fn vertical(self_: *T) *RasterizationRateSampleArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RasterizationRateSampleArray, @ptrCast(&c.objc_msgSend))(self_, sel_vertical);
            }
            pub fn setSampleCount(self_: *T, sampleCount_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleCount_, sampleCount_);
            }
        };
    }
};

pub const RasterizationRateLayerArray = opaque {
    pub fn class() *c.objc_class {
        return class_RasterizationRateLayerArray;
    }
    pub usingnamespace Methods(RasterizationRateLayerArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, layerIndex_: ns.UInteger) ?*RasterizationRateLayerDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*RasterizationRateLayerDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, layerIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, layer_: ?*RasterizationRateLayerDescriptor, layerIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RasterizationRateLayerDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, layer_, layerIndex_);
            }
        };
    }
};

pub const RasterizationRateMapDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RasterizationRateMapDescriptor;
    }
    pub usingnamespace Methods(RasterizationRateMapDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn rasterizationRateMapDescriptorWithScreenSize(screenSize_: Size) *RasterizationRateMapDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, Size) callconv(.C) *RasterizationRateMapDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_rasterizationRateMapDescriptorWithScreenSize_, screenSize_);
            }
            pub fn rasterizationRateMapDescriptorWithScreenSize_layer(screenSize_: Size, layer_: *RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, Size, *RasterizationRateLayerDescriptor) callconv(.C) *RasterizationRateMapDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_rasterizationRateMapDescriptorWithScreenSize_layer_, screenSize_, layer_);
            }
            pub fn rasterizationRateMapDescriptorWithScreenSize_layerCount_layers(screenSize_: Size, layerCount_: ns.UInteger, layers_: **const RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, Size, ns.UInteger, **const RasterizationRateLayerDescriptor) callconv(.C) *RasterizationRateMapDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_, screenSize_, layerCount_, layers_);
            }
            pub fn layerAtIndex(self_: *T, layerIndex_: ns.UInteger) ?*RasterizationRateLayerDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) ?*RasterizationRateLayerDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_layerAtIndex_, layerIndex_);
            }
            pub fn setLayer_atIndex(self_: *T, layer_: ?*RasterizationRateLayerDescriptor, layerIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RasterizationRateLayerDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLayer_atIndex_, layer_, layerIndex_);
            }
            pub fn layers(self_: *T) *RasterizationRateLayerArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RasterizationRateLayerArray, @ptrCast(&c.objc_msgSend))(self_, sel_layers);
            }
            pub fn screenSize(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_screenSize);
            }
            pub fn setScreenSize(self_: *T, screenSize_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setScreenSize_, screenSize_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn layerCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_layerCount);
            }
        };
    }
};

pub const RasterizationRateMap = opaque {
    pub usingnamespace Methods(RasterizationRateMap);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn copyParameterDataToBuffer_offset(self_: *T, buffer_: *Buffer, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_copyParameterDataToBuffer_offset_, buffer_, offset_);
            }
            pub fn physicalSizeForLayer(self_: *T, layerIndex_: ns.UInteger) Size {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_physicalSizeForLayer_, layerIndex_);
            }
            pub fn mapScreenToPhysicalCoordinates_forLayer(self_: *T, screenCoordinates_: Coordinate2D, layerIndex_: ns.UInteger) Coordinate2D {
                return @as(*const fn (*T, *c.objc_selector, Coordinate2D, ns.UInteger) callconv(.C) Coordinate2D, @ptrCast(&c.objc_msgSend))(self_, sel_mapScreenToPhysicalCoordinates_forLayer_, screenCoordinates_, layerIndex_);
            }
            pub fn mapPhysicalToScreenCoordinates_forLayer(self_: *T, physicalCoordinates_: Coordinate2D, layerIndex_: ns.UInteger) Coordinate2D {
                return @as(*const fn (*T, *c.objc_selector, Coordinate2D, ns.UInteger) callconv(.C) Coordinate2D, @ptrCast(&c.objc_msgSend))(self_, sel_mapPhysicalToScreenCoordinates_forLayer_, physicalCoordinates_, layerIndex_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn screenSize(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_screenSize);
            }
            pub fn physicalGranularity(self_: *T) Size {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Size, @ptrCast(&c.objc_msgSend))(self_, sel_physicalGranularity);
            }
            pub fn layerCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_layerCount);
            }
            pub fn parameterBufferSizeAndAlign(self_: *T) SizeAndAlign {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SizeAndAlign, @ptrCast(&c.objc_msgSend))(self_, sel_parameterBufferSizeAndAlign);
            }
        };
    }
};

pub const RenderCommandEncoder = opaque {
    pub usingnamespace Methods(RenderCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn setRenderPipelineState(self_: *T, pipelineState_: *RenderPipelineState) void {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineState) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderPipelineState_, pipelineState_);
            }
            pub fn setVertexBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setVertexBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setVertexBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setVertexBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setVertexTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexTexture_atIndex_, texture_, index_);
            }
            pub fn setVertexTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexTextures_withRange_, textures_, range_);
            }
            pub fn setVertexSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setVertexSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn setVertexVisibleFunctionTable_atBufferIndex(self_: *T, functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexVisibleFunctionTable_atBufferIndex_, functionTable_, bufferIndex_);
            }
            pub fn setVertexVisibleFunctionTables_withBufferRange(self_: *T, functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexVisibleFunctionTables_withBufferRange_, functionTables_, range_);
            }
            pub fn setVertexIntersectionFunctionTable_atBufferIndex(self_: *T, intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IntersectionFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable_, bufferIndex_);
            }
            pub fn setVertexIntersectionFunctionTables_withBufferRange(self_: *T, intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IntersectionFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables_, range_);
            }
            pub fn setVertexAccelerationStructure_atBufferIndex(self_: *T, accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructure, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexAccelerationStructure_atBufferIndex_, accelerationStructure_, bufferIndex_);
            }
            pub fn setViewport(self_: *T, viewport_: Viewport) void {
                return @as(*const fn (*T, *c.objc_selector, Viewport) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setViewport_, viewport_);
            }
            pub fn setViewports_count(self_: *T, viewports_: *const Viewport, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const Viewport, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setViewports_count_, viewports_, count_);
            }
            pub fn setFrontFacingWinding(self_: *T, frontFacingWinding_: Winding) void {
                return @as(*const fn (*T, *c.objc_selector, Winding) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFrontFacingWinding_, frontFacingWinding_);
            }
            pub fn setVertexAmplificationCount_viewMappings(self_: *T, count_: ns.UInteger, viewMappings_: ?*const VertexAmplificationViewMapping) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ?*const VertexAmplificationViewMapping) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexAmplificationCount_viewMappings_, count_, viewMappings_);
            }
            pub fn setCullMode(self_: *T, cullMode_: CullMode) void {
                return @as(*const fn (*T, *c.objc_selector, CullMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCullMode_, cullMode_);
            }
            pub fn setDepthClipMode(self_: *T, depthClipMode_: DepthClipMode) void {
                return @as(*const fn (*T, *c.objc_selector, DepthClipMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthClipMode_, depthClipMode_);
            }
            pub fn setDepthBias_slopeScale_clamp(self_: *T, depthBias_: f32, slopeScale_: f32, clamp_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32, f32, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthBias_slopeScale_clamp_, depthBias_, slopeScale_, clamp_);
            }
            pub fn setScissorRect(self_: *T, rect_: ScissorRect) void {
                return @as(*const fn (*T, *c.objc_selector, ScissorRect) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setScissorRect_, rect_);
            }
            pub fn setScissorRects_count(self_: *T, scissorRects_: *const ScissorRect, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const ScissorRect, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setScissorRects_count_, scissorRects_, count_);
            }
            pub fn setTriangleFillMode(self_: *T, fillMode_: TriangleFillMode) void {
                return @as(*const fn (*T, *c.objc_selector, TriangleFillMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTriangleFillMode_, fillMode_);
            }
            pub fn setFragmentBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setFragmentBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setFragmentBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setFragmentBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setFragmentTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentTexture_atIndex_, texture_, index_);
            }
            pub fn setFragmentTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentTextures_withRange_, textures_, range_);
            }
            pub fn setFragmentSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setFragmentSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn setFragmentVisibleFunctionTable_atBufferIndex(self_: *T, functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentVisibleFunctionTable_atBufferIndex_, functionTable_, bufferIndex_);
            }
            pub fn setFragmentVisibleFunctionTables_withBufferRange(self_: *T, functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentVisibleFunctionTables_withBufferRange_, functionTables_, range_);
            }
            pub fn setFragmentIntersectionFunctionTable_atBufferIndex(self_: *T, intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IntersectionFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable_, bufferIndex_);
            }
            pub fn setFragmentIntersectionFunctionTables_withBufferRange(self_: *T, intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IntersectionFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables_, range_);
            }
            pub fn setFragmentAccelerationStructure_atBufferIndex(self_: *T, accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructure, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentAccelerationStructure_atBufferIndex_, accelerationStructure_, bufferIndex_);
            }
            pub fn setBlendColorRed_green_blue_alpha(self_: *T, red_: f32, green_: f32, blue_: f32, alpha_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32, f32, f32, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBlendColorRed_green_blue_alpha_, red_, green_, blue_, alpha_);
            }
            pub fn setDepthStencilState(self_: *T, depthStencilState_: ?*DepthStencilState) void {
                return @as(*const fn (*T, *c.objc_selector, ?*DepthStencilState) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStencilState_, depthStencilState_);
            }
            pub fn setStencilReferenceValue(self_: *T, referenceValue_: u32) void {
                return @as(*const fn (*T, *c.objc_selector, u32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilReferenceValue_, referenceValue_);
            }
            pub fn setStencilFrontReferenceValue_backReferenceValue(self_: *T, frontReferenceValue_: u32, backReferenceValue_: u32) void {
                return @as(*const fn (*T, *c.objc_selector, u32, u32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilFrontReferenceValue_backReferenceValue_, frontReferenceValue_, backReferenceValue_);
            }
            pub fn setVisibilityResultMode_offset(self_: *T, mode_: VisibilityResultMode, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, VisibilityResultMode, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibilityResultMode_offset_, mode_, offset_);
            }
            pub fn setColorStoreAction_atIndex(self_: *T, storeAction_: StoreAction, colorAttachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setColorStoreAction_atIndex_, storeAction_, colorAttachmentIndex_);
            }
            pub fn setDepthStoreAction(self_: *T, storeAction_: StoreAction) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStoreAction_, storeAction_);
            }
            pub fn setStencilStoreAction(self_: *T, storeAction_: StoreAction) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilStoreAction_, storeAction_);
            }
            pub fn setColorStoreActionOptions_atIndex(self_: *T, storeActionOptions_: StoreActionOptions, colorAttachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setColorStoreActionOptions_atIndex_, storeActionOptions_, colorAttachmentIndex_);
            }
            pub fn setDepthStoreActionOptions(self_: *T, storeActionOptions_: StoreActionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthStoreActionOptions_, storeActionOptions_);
            }
            pub fn setStencilStoreActionOptions(self_: *T, storeActionOptions_: StoreActionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilStoreActionOptions_, storeActionOptions_);
            }
            pub fn setObjectBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setObjectBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setObjectBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setObjectBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setObjectTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectTexture_atIndex_, texture_, index_);
            }
            pub fn setObjectTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectTextures_withRange_, textures_, range_);
            }
            pub fn setObjectSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setObjectSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn setObjectThreadgroupMemoryLength_atIndex(self_: *T, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectThreadgroupMemoryLength_atIndex_, length_, index_);
            }
            pub fn setMeshBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setMeshBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setMeshBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setMeshBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setMeshTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshTexture_atIndex_, texture_, index_);
            }
            pub fn setMeshTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshTextures_withRange_, textures_, range_);
            }
            pub fn setMeshSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setMeshSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *T, threadgroupsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_);
            }
            pub fn drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *T, threadsPerGrid_: Size, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_);
            }
            pub fn drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup(self_: *T, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger, threadsPerObjectThreadgroup_: Size, threadsPerMeshThreadgroup_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, *Buffer, ns.UInteger, Size, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, indirectBuffer_, indirectBufferOffset_, threadsPerObjectThreadgroup_, threadsPerMeshThreadgroup_);
            }
            pub fn drawPrimitives_vertexStart_vertexCount_instanceCount(self_: *T, primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_, primitiveType_, vertexStart_, vertexCount_, instanceCount_);
            }
            pub fn drawPrimitives_vertexStart_vertexCount(self_: *T, primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPrimitives_vertexStart_vertexCount_, primitiveType_, vertexStart_, vertexCount_);
            }
            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount(self_: *T, primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, IndexType, *Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_);
            }
            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset(self_: *T, primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, IndexType, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_);
            }
            pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance(self_: *T, primitiveType_: PrimitiveType, vertexStart_: ns.UInteger, vertexCount_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType_, vertexStart_, vertexCount_, instanceCount_, baseInstance_);
            }
            pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance(self_: *T, primitiveType_: PrimitiveType, indexCount_: ns.UInteger, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseVertex_: ns.Integer, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, ns.UInteger, IndexType, *Buffer, ns.UInteger, ns.UInteger, ns.Integer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, primitiveType_, indexCount_, indexType_, indexBuffer_, indexBufferOffset_, instanceCount_, baseVertex_, baseInstance_);
            }
            pub fn drawPrimitives_indirectBuffer_indirectBufferOffset(self_: *T, primitiveType_: PrimitiveType, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPrimitives_indirectBuffer_indirectBufferOffset_, primitiveType_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *T, primitiveType_: PrimitiveType, indexType_: IndexType, indexBuffer_: *Buffer, indexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveType, IndexType, *Buffer, ns.UInteger, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, primitiveType_, indexType_, indexBuffer_, indexBufferOffset_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn textureBarrier(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_textureBarrier);
            }
            pub fn updateFence_afterStages(self_: *T, fence_: *Fence, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateFence_afterStages_, fence_, stages_);
            }
            pub fn waitForFence_beforeStages(self_: *T, fence_: *Fence, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForFence_beforeStages_, fence_, stages_);
            }
            pub fn setTessellationFactorBuffer_offset_instanceStride(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, instanceStride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationFactorBuffer_offset_instanceStride_, buffer_, offset_, instanceStride_);
            }
            pub fn setTessellationFactorScale(self_: *T, scale_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationFactorScale_, scale_);
            }
            pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger, ns.UInteger, ?*Buffer, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_, numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, instanceCount_, baseInstance_);
            }
            pub fn drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ?*Buffer, ns.UInteger, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_, numberOfPatchControlPoints_, patchIndexBuffer_, patchIndexBufferOffset_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchStart_: ns.UInteger, patchCount_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, instanceCount_: ns.UInteger, baseInstance_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger, ns.UInteger, ?*Buffer, ns.UInteger, *Buffer, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_, numberOfPatchControlPoints_, patchStart_, patchCount_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, instanceCount_, baseInstance_);
            }
            pub fn drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset(self_: *T, numberOfPatchControlPoints_: ns.UInteger, patchIndexBuffer_: ?*Buffer, patchIndexBufferOffset_: ns.UInteger, controlPointIndexBuffer_: *Buffer, controlPointIndexBufferOffset_: ns.UInteger, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ?*Buffer, ns.UInteger, *Buffer, ns.UInteger, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_, numberOfPatchControlPoints_, patchIndexBuffer_, patchIndexBufferOffset_, controlPointIndexBuffer_, controlPointIndexBufferOffset_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn setTileBytes_length_atIndex(self_: *T, bytes_: *const anyopaque, length_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileBytes_length_atIndex_, bytes_, length_, index_);
            }
            pub fn setTileBuffer_offset_atIndex(self_: *T, buffer_: ?*Buffer, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileBuffer_offset_atIndex_, buffer_, offset_, index_);
            }
            pub fn setTileBufferOffset_atIndex(self_: *T, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileBufferOffset_atIndex_, offset_, index_);
            }
            pub fn setTileBuffers_offsets_withRange(self_: *T, buffers_: *?*const Buffer, offsets_: *const ns.UInteger, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Buffer, *const ns.UInteger, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileBuffers_offsets_withRange_, buffers_, offsets_, range_);
            }
            pub fn setTileTexture_atIndex(self_: *T, texture_: ?*Texture, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileTexture_atIndex_, texture_, index_);
            }
            pub fn setTileTextures_withRange(self_: *T, textures_: *?*const Texture, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const Texture, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileTextures_withRange_, textures_, range_);
            }
            pub fn setTileSamplerState_atIndex(self_: *T, sampler_: ?*SamplerState, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileSamplerState_atIndex_, sampler_, index_);
            }
            pub fn setTileSamplerStates_withRange(self_: *T, samplers_: *?*const SamplerState, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileSamplerStates_withRange_, samplers_, range_);
            }
            pub fn setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex(self_: *T, sampler_: ?*SamplerState, lodMinClamp_: f32, lodMaxClamp_: f32, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplerState, f32, f32, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler_, lodMinClamp_, lodMaxClamp_, index_);
            }
            pub fn setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange(self_: *T, samplers_: *?*const SamplerState, lodMinClamps_: *const f32, lodMaxClamps_: *const f32, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const SamplerState, *const f32, *const f32, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers_, lodMinClamps_, lodMaxClamps_, range_);
            }
            pub fn setTileVisibleFunctionTable_atBufferIndex(self_: *T, functionTable_: ?*VisibleFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VisibleFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileVisibleFunctionTable_atBufferIndex_, functionTable_, bufferIndex_);
            }
            pub fn setTileVisibleFunctionTables_withBufferRange(self_: *T, functionTables_: *?*const VisibleFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const VisibleFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileVisibleFunctionTables_withBufferRange_, functionTables_, range_);
            }
            pub fn setTileIntersectionFunctionTable_atBufferIndex(self_: *T, intersectionFunctionTable_: ?*IntersectionFunctionTable, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*IntersectionFunctionTable, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable_, bufferIndex_);
            }
            pub fn setTileIntersectionFunctionTables_withBufferRange(self_: *T, intersectionFunctionTables_: *?*const IntersectionFunctionTable, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const IntersectionFunctionTable, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables_, range_);
            }
            pub fn setTileAccelerationStructure_atBufferIndex(self_: *T, accelerationStructure_: ?*AccelerationStructure, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AccelerationStructure, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileAccelerationStructure_atBufferIndex_, accelerationStructure_, bufferIndex_);
            }
            pub fn dispatchThreadsPerTile(self_: *T, threadsPerTile_: Size) void {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_dispatchThreadsPerTile_, threadsPerTile_);
            }
            pub fn setThreadgroupMemoryLength_offset_atIndex(self_: *T, length_: ns.UInteger, offset_: ns.UInteger, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadgroupMemoryLength_offset_atIndex_, length_, offset_, index_);
            }
            pub fn useResource_usage(self_: *T, resource_: *Resource, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, *Resource, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResource_usage_, resource_, usage_);
            }
            pub fn useResources_count_usage(self_: *T, resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger, ResourceUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResources_count_usage_, resources_, count_, usage_);
            }
            pub fn useResource_usage_stages(self_: *T, resource_: *Resource, usage_: ResourceUsage, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, *Resource, ResourceUsage, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResource_usage_stages_, resource_, usage_, stages_);
            }
            pub fn useResources_count_usage_stages(self_: *T, resources_: **const Resource, count_: ns.UInteger, usage_: ResourceUsage, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger, ResourceUsage, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useResources_count_usage_stages_, resources_, count_, usage_, stages_);
            }
            pub fn useHeap(self_: *T, heap_: *Heap) void {
                return @as(*const fn (*T, *c.objc_selector, *Heap) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeap_, heap_);
            }
            pub fn useHeaps_count(self_: *T, heaps_: **const Heap, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, **const Heap, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeaps_count_, heaps_, count_);
            }
            pub fn useHeap_stages(self_: *T, heap_: *Heap, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, *Heap, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeap_stages_, heap_, stages_);
            }
            pub fn useHeaps_count_stages(self_: *T, heaps_: **const Heap, count_: ns.UInteger, stages_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, **const Heap, ns.UInteger, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_useHeaps_count_stages_, heaps_, count_, stages_);
            }
            pub fn executeCommandsInBuffer_withRange(self_: *T, indirectCommandBuffer_: *IndirectCommandBuffer, executionRange_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_executeCommandsInBuffer_withRange_, indirectCommandBuffer_, executionRange_);
            }
            pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset(self_: *T, indirectCommandbuffer_: *IndirectCommandBuffer, indirectRangeBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *IndirectCommandBuffer, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer_, indirectRangeBuffer_, indirectBufferOffset_);
            }
            pub fn memoryBarrierWithScope_afterStages_beforeStages(self_: *T, scope_: BarrierScope, after_: RenderStages, before_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, BarrierScope, RenderStages, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_memoryBarrierWithScope_afterStages_beforeStages_, scope_, after_, before_);
            }
            pub fn memoryBarrierWithResources_count_afterStages_beforeStages(self_: *T, resources_: **const Resource, count_: ns.UInteger, after_: RenderStages, before_: RenderStages) void {
                return @as(*const fn (*T, *c.objc_selector, **const Resource, ns.UInteger, RenderStages, RenderStages) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_memoryBarrierWithResources_count_afterStages_beforeStages_, resources_, count_, after_, before_);
            }
            pub fn sampleCountersInBuffer_atSampleIndex_withBarrier(self_: *T, sampleBuffer_: *CounterSampleBuffer, sampleIndex_: ns.UInteger, barrier_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, *CounterSampleBuffer, ns.UInteger, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer_, sampleIndex_, barrier_);
            }
            pub fn tileWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_tileWidth);
            }
            pub fn tileHeight(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_tileHeight);
            }
        };
    }
};

pub const RenderPassAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPassAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn texture(self_: *T) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_texture);
            }
            pub fn setTexture(self_: *T, texture_: ?*Texture) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTexture_, texture_);
            }
            pub fn level(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_level);
            }
            pub fn setLevel(self_: *T, level_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLevel_, level_);
            }
            pub fn slice(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_slice);
            }
            pub fn setSlice(self_: *T, slice_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSlice_, slice_);
            }
            pub fn depthPlane(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_depthPlane);
            }
            pub fn setDepthPlane(self_: *T, depthPlane_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthPlane_, depthPlane_);
            }
            pub fn resolveTexture(self_: *T) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_resolveTexture);
            }
            pub fn setResolveTexture(self_: *T, resolveTexture_: ?*Texture) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Texture) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResolveTexture_, resolveTexture_);
            }
            pub fn resolveLevel(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_resolveLevel);
            }
            pub fn setResolveLevel(self_: *T, resolveLevel_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResolveLevel_, resolveLevel_);
            }
            pub fn resolveSlice(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_resolveSlice);
            }
            pub fn setResolveSlice(self_: *T, resolveSlice_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResolveSlice_, resolveSlice_);
            }
            pub fn resolveDepthPlane(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_resolveDepthPlane);
            }
            pub fn setResolveDepthPlane(self_: *T, resolveDepthPlane_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResolveDepthPlane_, resolveDepthPlane_);
            }
            pub fn loadAction(self_: *T) LoadAction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) LoadAction, @ptrCast(&c.objc_msgSend))(self_, sel_loadAction);
            }
            pub fn setLoadAction(self_: *T, loadAction_: LoadAction) void {
                return @as(*const fn (*T, *c.objc_selector, LoadAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLoadAction_, loadAction_);
            }
            pub fn storeAction(self_: *T) StoreAction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StoreAction, @ptrCast(&c.objc_msgSend))(self_, sel_storeAction);
            }
            pub fn setStoreAction(self_: *T, storeAction_: StoreAction) void {
                return @as(*const fn (*T, *c.objc_selector, StoreAction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStoreAction_, storeAction_);
            }
            pub fn storeActionOptions(self_: *T) StoreActionOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StoreActionOptions, @ptrCast(&c.objc_msgSend))(self_, sel_storeActionOptions);
            }
            pub fn setStoreActionOptions(self_: *T, storeActionOptions_: StoreActionOptions) void {
                return @as(*const fn (*T, *c.objc_selector, StoreActionOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStoreActionOptions_, storeActionOptions_);
            }
        };
    }
};

pub const RenderPassColorAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassColorAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPassColorAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace RenderPassAttachmentDescriptor.Methods(T);

            pub fn clearColor(self_: *T) ClearColor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ClearColor, @ptrCast(&c.objc_msgSend))(self_, sel_clearColor);
            }
            pub fn setClearColor(self_: *T, clearColor_: ClearColor) void {
                return @as(*const fn (*T, *c.objc_selector, ClearColor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setClearColor_, clearColor_);
            }
        };
    }
};

pub const RenderPassDepthAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassDepthAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPassDepthAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace RenderPassAttachmentDescriptor.Methods(T);

            pub fn clearDepth(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_clearDepth);
            }
            pub fn setClearDepth(self_: *T, clearDepth_: f64) void {
                return @as(*const fn (*T, *c.objc_selector, f64) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setClearDepth_, clearDepth_);
            }
            pub fn depthResolveFilter(self_: *T) MultisampleDepthResolveFilter {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) MultisampleDepthResolveFilter, @ptrCast(&c.objc_msgSend))(self_, sel_depthResolveFilter);
            }
            pub fn setDepthResolveFilter(self_: *T, depthResolveFilter_: MultisampleDepthResolveFilter) void {
                return @as(*const fn (*T, *c.objc_selector, MultisampleDepthResolveFilter) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthResolveFilter_, depthResolveFilter_);
            }
        };
    }
};

pub const RenderPassStencilAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassStencilAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPassStencilAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace RenderPassAttachmentDescriptor.Methods(T);

            pub fn clearStencil(self_: *T) u32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u32, @ptrCast(&c.objc_msgSend))(self_, sel_clearStencil);
            }
            pub fn setClearStencil(self_: *T, clearStencil_: u32) void {
                return @as(*const fn (*T, *c.objc_selector, u32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setClearStencil_, clearStencil_);
            }
            pub fn stencilResolveFilter(self_: *T) MultisampleStencilResolveFilter {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) MultisampleStencilResolveFilter, @ptrCast(&c.objc_msgSend))(self_, sel_stencilResolveFilter);
            }
            pub fn setStencilResolveFilter(self_: *T, stencilResolveFilter_: MultisampleStencilResolveFilter) void {
                return @as(*const fn (*T, *c.objc_selector, MultisampleStencilResolveFilter) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilResolveFilter_, stencilResolveFilter_);
            }
        };
    }
};

pub const RenderPassColorAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassColorAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(RenderPassColorAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *RenderPassColorAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *RenderPassColorAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*RenderPassColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPassColorAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const RenderPassSampleBufferAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassSampleBufferAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPassSampleBufferAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn sampleBuffer(self_: *T) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBuffer);
            }
            pub fn setSampleBuffer(self_: *T, sampleBuffer_: ?*CounterSampleBuffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSampleBuffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleBuffer_, sampleBuffer_);
            }
            pub fn startOfVertexSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfVertexSampleIndex);
            }
            pub fn setStartOfVertexSampleIndex(self_: *T, startOfVertexSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfVertexSampleIndex_, startOfVertexSampleIndex_);
            }
            pub fn endOfVertexSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfVertexSampleIndex);
            }
            pub fn setEndOfVertexSampleIndex(self_: *T, endOfVertexSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfVertexSampleIndex_, endOfVertexSampleIndex_);
            }
            pub fn startOfFragmentSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfFragmentSampleIndex);
            }
            pub fn setStartOfFragmentSampleIndex(self_: *T, startOfFragmentSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfFragmentSampleIndex_, startOfFragmentSampleIndex_);
            }
            pub fn endOfFragmentSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfFragmentSampleIndex);
            }
            pub fn setEndOfFragmentSampleIndex(self_: *T, endOfFragmentSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfFragmentSampleIndex_, endOfFragmentSampleIndex_);
            }
        };
    }
};

pub const RenderPassSampleBufferAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassSampleBufferAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(RenderPassSampleBufferAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *RenderPassSampleBufferAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *RenderPassSampleBufferAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*RenderPassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPassSampleBufferAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const RenderPassDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPassDescriptor;
    }
    pub usingnamespace Methods(RenderPassDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn renderPassDescriptor() *RenderPassDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *RenderPassDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_renderPassDescriptor);
            }
            pub fn setSamplePositions_count(self_: *T, positions_: ?*const SamplePosition, count_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*const SamplePosition, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSamplePositions_count_, positions_, count_);
            }
            pub fn getSamplePositions_count(self_: *T, positions_: ?*SamplePosition, count_: ns.UInteger) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, ?*SamplePosition, ns.UInteger) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_getSamplePositions_count_, positions_, count_);
            }
            pub fn colorAttachments(self_: *T) *RenderPassColorAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPassColorAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_colorAttachments);
            }
            pub fn depthAttachment(self_: *T) *RenderPassDepthAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPassDepthAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_depthAttachment);
            }
            pub fn setDepthAttachment(self_: *T, depthAttachment_: ?*RenderPassDepthAttachmentDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPassDepthAttachmentDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthAttachment_, depthAttachment_);
            }
            pub fn stencilAttachment(self_: *T) *RenderPassStencilAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPassStencilAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_stencilAttachment);
            }
            pub fn setStencilAttachment(self_: *T, stencilAttachment_: ?*RenderPassStencilAttachmentDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPassStencilAttachmentDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilAttachment_, stencilAttachment_);
            }
            pub fn visibilityResultBuffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_visibilityResultBuffer);
            }
            pub fn setVisibilityResultBuffer(self_: *T, visibilityResultBuffer_: ?*Buffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Buffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVisibilityResultBuffer_, visibilityResultBuffer_);
            }
            pub fn renderTargetArrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_renderTargetArrayLength);
            }
            pub fn setRenderTargetArrayLength(self_: *T, renderTargetArrayLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderTargetArrayLength_, renderTargetArrayLength_);
            }
            pub fn imageblockSampleLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_imageblockSampleLength);
            }
            pub fn setImageblockSampleLength(self_: *T, imageblockSampleLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setImageblockSampleLength_, imageblockSampleLength_);
            }
            pub fn threadgroupMemoryLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupMemoryLength);
            }
            pub fn setThreadgroupMemoryLength(self_: *T, threadgroupMemoryLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadgroupMemoryLength_, threadgroupMemoryLength_);
            }
            pub fn tileWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_tileWidth);
            }
            pub fn setTileWidth(self_: *T, tileWidth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileWidth_, tileWidth_);
            }
            pub fn tileHeight(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_tileHeight);
            }
            pub fn setTileHeight(self_: *T, tileHeight_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileHeight_, tileHeight_);
            }
            pub fn defaultRasterSampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_defaultRasterSampleCount);
            }
            pub fn setDefaultRasterSampleCount(self_: *T, defaultRasterSampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDefaultRasterSampleCount_, defaultRasterSampleCount_);
            }
            pub fn renderTargetWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_renderTargetWidth);
            }
            pub fn setRenderTargetWidth(self_: *T, renderTargetWidth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderTargetWidth_, renderTargetWidth_);
            }
            pub fn renderTargetHeight(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_renderTargetHeight);
            }
            pub fn setRenderTargetHeight(self_: *T, renderTargetHeight_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRenderTargetHeight_, renderTargetHeight_);
            }
            pub fn rasterizationRateMap(self_: *T) ?*RasterizationRateMap {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*RasterizationRateMap, @ptrCast(&c.objc_msgSend))(self_, sel_rasterizationRateMap);
            }
            pub fn setRasterizationRateMap(self_: *T, rasterizationRateMap_: ?*RasterizationRateMap) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RasterizationRateMap) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterizationRateMap_, rasterizationRateMap_);
            }
            pub fn sampleBufferAttachments(self_: *T) *RenderPassSampleBufferAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPassSampleBufferAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBufferAttachments);
            }
        };
    }
};

pub const RenderPipelineColorAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPipelineColorAttachmentDescriptor;
    }
    pub usingnamespace Methods(RenderPipelineColorAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn pixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_pixelFormat);
            }
            pub fn setPixelFormat(self_: *T, pixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPixelFormat_, pixelFormat_);
            }
            pub fn isBlendingEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isBlendingEnabled);
            }
            pub fn setBlendingEnabled(self_: *T, blendingEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBlendingEnabled_, blendingEnabled_);
            }
            pub fn sourceRGBBlendFactor(self_: *T) BlendFactor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendFactor, @ptrCast(&c.objc_msgSend))(self_, sel_sourceRGBBlendFactor);
            }
            pub fn setSourceRGBBlendFactor(self_: *T, sourceRGBBlendFactor_: BlendFactor) void {
                return @as(*const fn (*T, *c.objc_selector, BlendFactor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSourceRGBBlendFactor_, sourceRGBBlendFactor_);
            }
            pub fn destinationRGBBlendFactor(self_: *T) BlendFactor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendFactor, @ptrCast(&c.objc_msgSend))(self_, sel_destinationRGBBlendFactor);
            }
            pub fn setDestinationRGBBlendFactor(self_: *T, destinationRGBBlendFactor_: BlendFactor) void {
                return @as(*const fn (*T, *c.objc_selector, BlendFactor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDestinationRGBBlendFactor_, destinationRGBBlendFactor_);
            }
            pub fn rgbBlendOperation(self_: *T) BlendOperation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendOperation, @ptrCast(&c.objc_msgSend))(self_, sel_rgbBlendOperation);
            }
            pub fn setRgbBlendOperation(self_: *T, rgbBlendOperation_: BlendOperation) void {
                return @as(*const fn (*T, *c.objc_selector, BlendOperation) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRgbBlendOperation_, rgbBlendOperation_);
            }
            pub fn sourceAlphaBlendFactor(self_: *T) BlendFactor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendFactor, @ptrCast(&c.objc_msgSend))(self_, sel_sourceAlphaBlendFactor);
            }
            pub fn setSourceAlphaBlendFactor(self_: *T, sourceAlphaBlendFactor_: BlendFactor) void {
                return @as(*const fn (*T, *c.objc_selector, BlendFactor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSourceAlphaBlendFactor_, sourceAlphaBlendFactor_);
            }
            pub fn destinationAlphaBlendFactor(self_: *T) BlendFactor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendFactor, @ptrCast(&c.objc_msgSend))(self_, sel_destinationAlphaBlendFactor);
            }
            pub fn setDestinationAlphaBlendFactor(self_: *T, destinationAlphaBlendFactor_: BlendFactor) void {
                return @as(*const fn (*T, *c.objc_selector, BlendFactor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDestinationAlphaBlendFactor_, destinationAlphaBlendFactor_);
            }
            pub fn alphaBlendOperation(self_: *T) BlendOperation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) BlendOperation, @ptrCast(&c.objc_msgSend))(self_, sel_alphaBlendOperation);
            }
            pub fn setAlphaBlendOperation(self_: *T, alphaBlendOperation_: BlendOperation) void {
                return @as(*const fn (*T, *c.objc_selector, BlendOperation) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAlphaBlendOperation_, alphaBlendOperation_);
            }
            pub fn writeMask(self_: *T) ColorWriteMask {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ColorWriteMask, @ptrCast(&c.objc_msgSend))(self_, sel_writeMask);
            }
            pub fn setWriteMask(self_: *T, writeMask_: ColorWriteMask) void {
                return @as(*const fn (*T, *c.objc_selector, ColorWriteMask) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setWriteMask_, writeMask_);
            }
        };
    }
};

pub const RenderPipelineReflection = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPipelineReflection;
    }
    pub usingnamespace Methods(RenderPipelineReflection);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            // pub fn vertexBindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexBindings);
            // }
            // pub fn fragmentBindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentBindings);
            // }
            // pub fn tileBindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_tileBindings);
            // }
            // pub fn objectBindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_objectBindings);
            // }
            // pub fn meshBindings(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_meshBindings);
            // }
            // pub fn vertexArguments(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexArguments);
            // }
            // pub fn fragmentArguments(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentArguments);
            // }
            // pub fn tileArguments(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_tileArguments);
            // }
        };
    }
};

pub const RenderPipelineDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPipelineDescriptor;
    }
    pub usingnamespace Methods(RenderPipelineDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn vertexFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_vertexFunction);
            }
            pub fn setVertexFunction(self_: *T, vertexFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexFunction_, vertexFunction_);
            }
            pub fn fragmentFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentFunction);
            }
            pub fn setFragmentFunction(self_: *T, fragmentFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentFunction_, fragmentFunction_);
            }
            pub fn vertexDescriptor(self_: *T) ?*VertexDescriptor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*VertexDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_vertexDescriptor);
            }
            pub fn setVertexDescriptor(self_: *T, vertexDescriptor_: ?*VertexDescriptor) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VertexDescriptor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexDescriptor_, vertexDescriptor_);
            }
            pub fn sampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
            pub fn setSampleCount(self_: *T, sampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleCount_, sampleCount_);
            }
            pub fn rasterSampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_rasterSampleCount);
            }
            pub fn setRasterSampleCount(self_: *T, rasterSampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterSampleCount_, rasterSampleCount_);
            }
            pub fn isAlphaToCoverageEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isAlphaToCoverageEnabled);
            }
            pub fn setAlphaToCoverageEnabled(self_: *T, alphaToCoverageEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAlphaToCoverageEnabled_, alphaToCoverageEnabled_);
            }
            pub fn isAlphaToOneEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isAlphaToOneEnabled);
            }
            pub fn setAlphaToOneEnabled(self_: *T, alphaToOneEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAlphaToOneEnabled_, alphaToOneEnabled_);
            }
            pub fn isRasterizationEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isRasterizationEnabled);
            }
            pub fn setRasterizationEnabled(self_: *T, rasterizationEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterizationEnabled_, rasterizationEnabled_);
            }
            pub fn maxVertexAmplificationCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxVertexAmplificationCount);
            }
            pub fn setMaxVertexAmplificationCount(self_: *T, maxVertexAmplificationCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxVertexAmplificationCount_, maxVertexAmplificationCount_);
            }
            pub fn colorAttachments(self_: *T) *RenderPipelineColorAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPipelineColorAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_colorAttachments);
            }
            pub fn depthAttachmentPixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_depthAttachmentPixelFormat);
            }
            pub fn setDepthAttachmentPixelFormat(self_: *T, depthAttachmentPixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat_);
            }
            pub fn stencilAttachmentPixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_stencilAttachmentPixelFormat);
            }
            pub fn setStencilAttachmentPixelFormat(self_: *T, stencilAttachmentPixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat_);
            }
            pub fn inputPrimitiveTopology(self_: *T) PrimitiveTopologyClass {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PrimitiveTopologyClass, @ptrCast(&c.objc_msgSend))(self_, sel_inputPrimitiveTopology);
            }
            pub fn setInputPrimitiveTopology(self_: *T, inputPrimitiveTopology_: PrimitiveTopologyClass) void {
                return @as(*const fn (*T, *c.objc_selector, PrimitiveTopologyClass) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setInputPrimitiveTopology_, inputPrimitiveTopology_);
            }
            pub fn tessellationPartitionMode(self_: *T) TessellationPartitionMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TessellationPartitionMode, @ptrCast(&c.objc_msgSend))(self_, sel_tessellationPartitionMode);
            }
            pub fn setTessellationPartitionMode(self_: *T, tessellationPartitionMode_: TessellationPartitionMode) void {
                return @as(*const fn (*T, *c.objc_selector, TessellationPartitionMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationPartitionMode_, tessellationPartitionMode_);
            }
            pub fn maxTessellationFactor(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTessellationFactor);
            }
            pub fn setMaxTessellationFactor(self_: *T, maxTessellationFactor_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTessellationFactor_, maxTessellationFactor_);
            }
            pub fn isTessellationFactorScaleEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isTessellationFactorScaleEnabled);
            }
            pub fn setTessellationFactorScaleEnabled(self_: *T, tessellationFactorScaleEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationFactorScaleEnabled_, tessellationFactorScaleEnabled_);
            }
            pub fn tessellationFactorFormat(self_: *T) TessellationFactorFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TessellationFactorFormat, @ptrCast(&c.objc_msgSend))(self_, sel_tessellationFactorFormat);
            }
            pub fn setTessellationFactorFormat(self_: *T, tessellationFactorFormat_: TessellationFactorFormat) void {
                return @as(*const fn (*T, *c.objc_selector, TessellationFactorFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationFactorFormat_, tessellationFactorFormat_);
            }
            pub fn tessellationControlPointIndexType(self_: *T) TessellationControlPointIndexType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TessellationControlPointIndexType, @ptrCast(&c.objc_msgSend))(self_, sel_tessellationControlPointIndexType);
            }
            pub fn setTessellationControlPointIndexType(self_: *T, tessellationControlPointIndexType_: TessellationControlPointIndexType) void {
                return @as(*const fn (*T, *c.objc_selector, TessellationControlPointIndexType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationControlPointIndexType_, tessellationControlPointIndexType_);
            }
            pub fn tessellationFactorStepFunction(self_: *T) TessellationFactorStepFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TessellationFactorStepFunction, @ptrCast(&c.objc_msgSend))(self_, sel_tessellationFactorStepFunction);
            }
            pub fn setTessellationFactorStepFunction(self_: *T, tessellationFactorStepFunction_: TessellationFactorStepFunction) void {
                return @as(*const fn (*T, *c.objc_selector, TessellationFactorStepFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationFactorStepFunction_, tessellationFactorStepFunction_);
            }
            pub fn tessellationOutputWindingOrder(self_: *T) Winding {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Winding, @ptrCast(&c.objc_msgSend))(self_, sel_tessellationOutputWindingOrder);
            }
            pub fn setTessellationOutputWindingOrder(self_: *T, tessellationOutputWindingOrder_: Winding) void {
                return @as(*const fn (*T, *c.objc_selector, Winding) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTessellationOutputWindingOrder_, tessellationOutputWindingOrder_);
            }
            pub fn vertexBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_vertexBuffers);
            }
            pub fn fragmentBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentBuffers);
            }
            pub fn supportIndirectCommandBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportIndirectCommandBuffers);
            }
            pub fn setSupportIndirectCommandBuffers(self_: *T, supportIndirectCommandBuffers_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers_);
            }
            // pub fn binaryArchives(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_binaryArchives);
            // }
            // pub fn setBinaryArchives(self_: *T, binaryArchives_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBinaryArchives_, binaryArchives_);
            // }
            // pub fn vertexPreloadedLibraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexPreloadedLibraries);
            // }
            // pub fn setVertexPreloadedLibraries(self_: *T, vertexPreloadedLibraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexPreloadedLibraries_, vertexPreloadedLibraries_);
            // }
            // pub fn fragmentPreloadedLibraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentPreloadedLibraries);
            // }
            // pub fn setFragmentPreloadedLibraries(self_: *T, fragmentPreloadedLibraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentPreloadedLibraries_, fragmentPreloadedLibraries_);
            // }
            pub fn vertexLinkedFunctions(self_: *T) *LinkedFunctions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *LinkedFunctions, @ptrCast(&c.objc_msgSend))(self_, sel_vertexLinkedFunctions);
            }
            pub fn setVertexLinkedFunctions(self_: *T, vertexLinkedFunctions_: ?*LinkedFunctions) void {
                return @as(*const fn (*T, *c.objc_selector, ?*LinkedFunctions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexLinkedFunctions_, vertexLinkedFunctions_);
            }
            pub fn fragmentLinkedFunctions(self_: *T) *LinkedFunctions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *LinkedFunctions, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentLinkedFunctions);
            }
            pub fn setFragmentLinkedFunctions(self_: *T, fragmentLinkedFunctions_: ?*LinkedFunctions) void {
                return @as(*const fn (*T, *c.objc_selector, ?*LinkedFunctions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentLinkedFunctions_, fragmentLinkedFunctions_);
            }
            pub fn supportAddingVertexBinaryFunctions(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportAddingVertexBinaryFunctions);
            }
            pub fn setSupportAddingVertexBinaryFunctions(self_: *T, supportAddingVertexBinaryFunctions_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportAddingVertexBinaryFunctions_, supportAddingVertexBinaryFunctions_);
            }
            pub fn supportAddingFragmentBinaryFunctions(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportAddingFragmentBinaryFunctions);
            }
            pub fn setSupportAddingFragmentBinaryFunctions(self_: *T, supportAddingFragmentBinaryFunctions_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportAddingFragmentBinaryFunctions_, supportAddingFragmentBinaryFunctions_);
            }
            pub fn maxVertexCallStackDepth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxVertexCallStackDepth);
            }
            pub fn setMaxVertexCallStackDepth(self_: *T, maxVertexCallStackDepth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxVertexCallStackDepth_, maxVertexCallStackDepth_);
            }
            pub fn maxFragmentCallStackDepth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxFragmentCallStackDepth);
            }
            pub fn setMaxFragmentCallStackDepth(self_: *T, maxFragmentCallStackDepth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxFragmentCallStackDepth_, maxFragmentCallStackDepth_);
            }
        };
    }
};

pub const RenderPipelineFunctionsDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPipelineFunctionsDescriptor;
    }
    pub usingnamespace Methods(RenderPipelineFunctionsDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            // pub fn vertexAdditionalBinaryFunctions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_vertexAdditionalBinaryFunctions);
            // }
            // pub fn setVertexAdditionalBinaryFunctions(self_: *T, vertexAdditionalBinaryFunctions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setVertexAdditionalBinaryFunctions_, vertexAdditionalBinaryFunctions_);
            // }
            // pub fn fragmentAdditionalBinaryFunctions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentAdditionalBinaryFunctions);
            // }
            // pub fn setFragmentAdditionalBinaryFunctions(self_: *T, fragmentAdditionalBinaryFunctions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentAdditionalBinaryFunctions_, fragmentAdditionalBinaryFunctions_);
            // }
            // pub fn tileAdditionalBinaryFunctions(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_tileAdditionalBinaryFunctions);
            // }
            // pub fn setTileAdditionalBinaryFunctions(self_: *T, tileAdditionalBinaryFunctions_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileAdditionalBinaryFunctions_, tileAdditionalBinaryFunctions_);
            // }
        };
    }
};

pub const RenderPipelineState = opaque {
    pub usingnamespace Methods(RenderPipelineState);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn imageblockMemoryLengthForDimensions(self_: *T, imageblockDimensions_: Size) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector, Size) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_imageblockMemoryLengthForDimensions_, imageblockDimensions_);
            }
            pub fn functionHandleWithFunction_stage(self_: *T, function_: *Function, stage_: RenderStages) ?*FunctionHandle {
                return @as(*const fn (*T, *c.objc_selector, *Function, RenderStages) callconv(.C) ?*FunctionHandle, @ptrCast(&c.objc_msgSend))(self_, sel_functionHandleWithFunction_stage_, function_, stage_);
            }
            pub fn newVisibleFunctionTableWithDescriptor_stage(self_: *T, descriptor_: *VisibleFunctionTableDescriptor, stage_: RenderStages) ?*VisibleFunctionTable {
                return @as(*const fn (*T, *c.objc_selector, *VisibleFunctionTableDescriptor, RenderStages) callconv(.C) ?*VisibleFunctionTable, @ptrCast(&c.objc_msgSend))(self_, sel_newVisibleFunctionTableWithDescriptor_stage_, descriptor_, stage_);
            }
            pub fn newIntersectionFunctionTableWithDescriptor_stage(self_: *T, descriptor_: *IntersectionFunctionTableDescriptor, stage_: RenderStages) ?*IntersectionFunctionTable {
                return @as(*const fn (*T, *c.objc_selector, *IntersectionFunctionTableDescriptor, RenderStages) callconv(.C) ?*IntersectionFunctionTable, @ptrCast(&c.objc_msgSend))(self_, sel_newIntersectionFunctionTableWithDescriptor_stage_, descriptor_, stage_);
            }
            pub fn newRenderPipelineStateWithAdditionalBinaryFunctions_error(self_: *T, additionalBinaryFunctions_: *RenderPipelineFunctionsDescriptor, error_: ?*?*ns.Error) ?*RenderPipelineState {
                return @as(*const fn (*T, *c.objc_selector, *RenderPipelineFunctionsDescriptor, ?*?*ns.Error) callconv(.C) ?*RenderPipelineState, @ptrCast(&c.objc_msgSend))(self_, sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_, additionalBinaryFunctions_, error_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn maxTotalThreadsPerThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerThreadgroup);
            }
            pub fn threadgroupSizeMatchesTileSize(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupSizeMatchesTileSize);
            }
            pub fn imageblockSampleLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_imageblockSampleLength);
            }
            pub fn supportIndirectCommandBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportIndirectCommandBuffers);
            }
            pub fn maxTotalThreadsPerObjectThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerObjectThreadgroup);
            }
            pub fn maxTotalThreadsPerMeshThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerMeshThreadgroup);
            }
            pub fn objectThreadExecutionWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_objectThreadExecutionWidth);
            }
            pub fn meshThreadExecutionWidth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_meshThreadExecutionWidth);
            }
            pub fn maxTotalThreadgroupsPerMeshGrid(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadgroupsPerMeshGrid);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const RenderPipelineColorAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_RenderPipelineColorAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(RenderPipelineColorAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *RenderPipelineColorAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *RenderPipelineColorAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*RenderPipelineColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*RenderPipelineColorAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const TileRenderPipelineColorAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_TileRenderPipelineColorAttachmentDescriptor;
    }
    pub usingnamespace Methods(TileRenderPipelineColorAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn pixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_pixelFormat);
            }
            pub fn setPixelFormat(self_: *T, pixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPixelFormat_, pixelFormat_);
            }
        };
    }
};

pub const TileRenderPipelineColorAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_TileRenderPipelineColorAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(TileRenderPipelineColorAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *TileRenderPipelineColorAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *TileRenderPipelineColorAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: *TileRenderPipelineColorAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *TileRenderPipelineColorAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const TileRenderPipelineDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_TileRenderPipelineDescriptor;
    }
    pub usingnamespace Methods(TileRenderPipelineDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn tileFunction(self_: *T) *Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Function, @ptrCast(&c.objc_msgSend))(self_, sel_tileFunction);
            }
            pub fn setTileFunction(self_: *T, tileFunction_: *Function) void {
                return @as(*const fn (*T, *c.objc_selector, *Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTileFunction_, tileFunction_);
            }
            pub fn rasterSampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_rasterSampleCount);
            }
            pub fn setRasterSampleCount(self_: *T, rasterSampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterSampleCount_, rasterSampleCount_);
            }
            pub fn colorAttachments(self_: *T) *TileRenderPipelineColorAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *TileRenderPipelineColorAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_colorAttachments);
            }
            pub fn threadgroupSizeMatchesTileSize(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_threadgroupSizeMatchesTileSize);
            }
            pub fn setThreadgroupSizeMatchesTileSize(self_: *T, threadgroupSizeMatchesTileSize_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setThreadgroupSizeMatchesTileSize_, threadgroupSizeMatchesTileSize_);
            }
            pub fn tileBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_tileBuffers);
            }
            pub fn maxTotalThreadsPerThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerThreadgroup);
            }
            pub fn setMaxTotalThreadsPerThreadgroup(self_: *T, maxTotalThreadsPerThreadgroup_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup_);
            }
            // pub fn binaryArchives(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_binaryArchives);
            // }
            // pub fn setBinaryArchives(self_: *T, binaryArchives_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBinaryArchives_, binaryArchives_);
            // }
            // pub fn preloadedLibraries(self_: *T) ns.Array {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Array, @ptrCast(&c.objc_msgSend))(self_, sel_preloadedLibraries);
            // }
            // pub fn setPreloadedLibraries(self_: *T, preloadedLibraries_: ns.Array) void {
            //     return @as(*const fn (*T, *c.objc_selector, ns.Array) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPreloadedLibraries_, preloadedLibraries_);
            // }
            pub fn linkedFunctions(self_: *T) *LinkedFunctions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *LinkedFunctions, @ptrCast(&c.objc_msgSend))(self_, sel_linkedFunctions);
            }
            pub fn setLinkedFunctions(self_: *T, linkedFunctions_: ?*LinkedFunctions) void {
                return @as(*const fn (*T, *c.objc_selector, ?*LinkedFunctions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLinkedFunctions_, linkedFunctions_);
            }
            pub fn supportAddingBinaryFunctions(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportAddingBinaryFunctions);
            }
            pub fn setSupportAddingBinaryFunctions(self_: *T, supportAddingBinaryFunctions_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions_);
            }
            pub fn maxCallStackDepth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxCallStackDepth);
            }
            pub fn setMaxCallStackDepth(self_: *T, maxCallStackDepth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxCallStackDepth_, maxCallStackDepth_);
            }
        };
    }
};

pub const MeshRenderPipelineDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_MeshRenderPipelineDescriptor;
    }
    pub usingnamespace Methods(MeshRenderPipelineDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn objectFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_objectFunction);
            }
            pub fn setObjectFunction(self_: *T, objectFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectFunction_, objectFunction_);
            }
            pub fn meshFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_meshFunction);
            }
            pub fn setMeshFunction(self_: *T, meshFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshFunction_, meshFunction_);
            }
            pub fn fragmentFunction(self_: *T) ?*Function {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Function, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentFunction);
            }
            pub fn setFragmentFunction(self_: *T, fragmentFunction_: ?*Function) void {
                return @as(*const fn (*T, *c.objc_selector, ?*Function) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFragmentFunction_, fragmentFunction_);
            }
            pub fn maxTotalThreadsPerObjectThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerObjectThreadgroup);
            }
            pub fn setMaxTotalThreadsPerObjectThreadgroup(self_: *T, maxTotalThreadsPerObjectThreadgroup_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadsPerObjectThreadgroup_, maxTotalThreadsPerObjectThreadgroup_);
            }
            pub fn maxTotalThreadsPerMeshThreadgroup(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadsPerMeshThreadgroup);
            }
            pub fn setMaxTotalThreadsPerMeshThreadgroup(self_: *T, maxTotalThreadsPerMeshThreadgroup_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadsPerMeshThreadgroup_, maxTotalThreadsPerMeshThreadgroup_);
            }
            pub fn objectThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
            }
            pub fn setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *T, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth_);
            }
            pub fn meshThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
            }
            pub fn setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth(self_: *T, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth_);
            }
            pub fn payloadMemoryLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_payloadMemoryLength);
            }
            pub fn setPayloadMemoryLength(self_: *T, payloadMemoryLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPayloadMemoryLength_, payloadMemoryLength_);
            }
            pub fn maxTotalThreadgroupsPerMeshGrid(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxTotalThreadgroupsPerMeshGrid);
            }
            pub fn setMaxTotalThreadgroupsPerMeshGrid(self_: *T, maxTotalThreadgroupsPerMeshGrid_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxTotalThreadgroupsPerMeshGrid_, maxTotalThreadgroupsPerMeshGrid_);
            }
            pub fn objectBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_objectBuffers);
            }
            pub fn meshBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_meshBuffers);
            }
            pub fn fragmentBuffers(self_: *T) *PipelineBufferDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *PipelineBufferDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_fragmentBuffers);
            }
            pub fn rasterSampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_rasterSampleCount);
            }
            pub fn setRasterSampleCount(self_: *T, rasterSampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterSampleCount_, rasterSampleCount_);
            }
            pub fn isAlphaToCoverageEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isAlphaToCoverageEnabled);
            }
            pub fn setAlphaToCoverageEnabled(self_: *T, alphaToCoverageEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAlphaToCoverageEnabled_, alphaToCoverageEnabled_);
            }
            pub fn isAlphaToOneEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isAlphaToOneEnabled);
            }
            pub fn setAlphaToOneEnabled(self_: *T, alphaToOneEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAlphaToOneEnabled_, alphaToOneEnabled_);
            }
            pub fn isRasterizationEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isRasterizationEnabled);
            }
            pub fn setRasterizationEnabled(self_: *T, rasterizationEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRasterizationEnabled_, rasterizationEnabled_);
            }
            pub fn maxVertexAmplificationCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxVertexAmplificationCount);
            }
            pub fn setMaxVertexAmplificationCount(self_: *T, maxVertexAmplificationCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxVertexAmplificationCount_, maxVertexAmplificationCount_);
            }
            pub fn colorAttachments(self_: *T) *RenderPipelineColorAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *RenderPipelineColorAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_colorAttachments);
            }
            pub fn depthAttachmentPixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_depthAttachmentPixelFormat);
            }
            pub fn setDepthAttachmentPixelFormat(self_: *T, depthAttachmentPixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat_);
            }
            pub fn stencilAttachmentPixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_stencilAttachmentPixelFormat);
            }
            pub fn setStencilAttachmentPixelFormat(self_: *T, stencilAttachmentPixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat_);
            }
        };
    }
};

pub const Resource = opaque {
    pub usingnamespace Methods(Resource);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn setPurgeableState(self_: *T, state_: PurgeableState) PurgeableState {
                return @as(*const fn (*T, *c.objc_selector, PurgeableState) callconv(.C) PurgeableState, @ptrCast(&c.objc_msgSend))(self_, sel_setPurgeableState_, state_);
            }
            pub fn makeAliasable(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_makeAliasable);
            }
            pub fn isAliasable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isAliasable);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn cpuCacheMode(self_: *T) CPUCacheMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CPUCacheMode, @ptrCast(&c.objc_msgSend))(self_, sel_cpuCacheMode);
            }
            pub fn storageMode(self_: *T) StorageMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StorageMode, @ptrCast(&c.objc_msgSend))(self_, sel_storageMode);
            }
            pub fn hazardTrackingMode(self_: *T) HazardTrackingMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HazardTrackingMode, @ptrCast(&c.objc_msgSend))(self_, sel_hazardTrackingMode);
            }
            pub fn resourceOptions(self_: *T) ResourceOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceOptions, @ptrCast(&c.objc_msgSend))(self_, sel_resourceOptions);
            }
            pub fn heap(self_: *T) ?*Heap {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Heap, @ptrCast(&c.objc_msgSend))(self_, sel_heap);
            }
            pub fn heapOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_heapOffset);
            }
            pub fn allocatedSize(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_allocatedSize);
            }
        };
    }
};

pub const ResourceStateCommandEncoder = opaque {
    pub usingnamespace Methods(ResourceStateCommandEncoder);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace CommandEncoder.Methods(T);

            pub fn updateTextureMappings_mode_regions_mipLevels_slices_numRegions(self_: *T, texture_: *Texture, mode_: SparseTextureMappingMode, regions_: *const Region, mipLevels_: *const ns.UInteger, slices_: *const ns.UInteger, numRegions_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, SparseTextureMappingMode, *const Region, *const ns.UInteger, *const ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateTextureMappings_mode_regions_mipLevels_slices_numRegions_, texture_, mode_, regions_, mipLevels_, slices_, numRegions_);
            }
            pub fn updateTextureMapping_mode_region_mipLevel_slice(self_: *T, texture_: *Texture, mode_: SparseTextureMappingMode, region_: Region, mipLevel_: ns.UInteger, slice_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, SparseTextureMappingMode, Region, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateTextureMapping_mode_region_mipLevel_slice_, texture_, mode_, region_, mipLevel_, slice_);
            }
            pub fn updateTextureMapping_mode_indirectBuffer_indirectBufferOffset(self_: *T, texture_: *Texture, mode_: SparseTextureMappingMode, indirectBuffer_: *Buffer, indirectBufferOffset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, SparseTextureMappingMode, *Buffer, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_, texture_, mode_, indirectBuffer_, indirectBufferOffset_);
            }
            pub fn updateFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_updateFence_, fence_);
            }
            pub fn waitForFence(self_: *T, fence_: *Fence) void {
                return @as(*const fn (*T, *c.objc_selector, *Fence) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_waitForFence_, fence_);
            }
            pub fn moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin(self_: *T, sourceTexture_: *Texture, sourceSlice_: ns.UInteger, sourceLevel_: ns.UInteger, sourceOrigin_: Origin, sourceSize_: Size, destinationTexture_: *Texture, destinationSlice_: ns.UInteger, destinationLevel_: ns.UInteger, destinationOrigin_: Origin) void {
                return @as(*const fn (*T, *c.objc_selector, *Texture, ns.UInteger, ns.UInteger, Origin, Size, *Texture, ns.UInteger, ns.UInteger, Origin) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture_, sourceSlice_, sourceLevel_, sourceOrigin_, sourceSize_, destinationTexture_, destinationSlice_, destinationLevel_, destinationOrigin_);
            }
        };
    }
};

pub const ResourceStatePassSampleBufferAttachmentDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ResourceStatePassSampleBufferAttachmentDescriptor;
    }
    pub usingnamespace Methods(ResourceStatePassSampleBufferAttachmentDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn sampleBuffer(self_: *T) ?*CounterSampleBuffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*CounterSampleBuffer, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBuffer);
            }
            pub fn setSampleBuffer(self_: *T, sampleBuffer_: ?*CounterSampleBuffer) void {
                return @as(*const fn (*T, *c.objc_selector, ?*CounterSampleBuffer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleBuffer_, sampleBuffer_);
            }
            pub fn startOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_startOfEncoderSampleIndex);
            }
            pub fn setStartOfEncoderSampleIndex(self_: *T, startOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex_);
            }
            pub fn endOfEncoderSampleIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_endOfEncoderSampleIndex);
            }
            pub fn setEndOfEncoderSampleIndex(self_: *T, endOfEncoderSampleIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex_);
            }
        };
    }
};

pub const ResourceStatePassSampleBufferAttachmentDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_ResourceStatePassSampleBufferAttachmentDescriptorArray;
    }
    pub usingnamespace Methods(ResourceStatePassSampleBufferAttachmentDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, attachmentIndex_: ns.UInteger) *ResourceStatePassSampleBufferAttachmentDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *ResourceStatePassSampleBufferAttachmentDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, attachmentIndex_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attachment_: ?*ResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ResourceStatePassSampleBufferAttachmentDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attachment_, attachmentIndex_);
            }
        };
    }
};

pub const ResourceStatePassDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_ResourceStatePassDescriptor;
    }
    pub usingnamespace Methods(ResourceStatePassDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn resourceStatePassDescriptor() *ResourceStatePassDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *ResourceStatePassDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_resourceStatePassDescriptor);
            }
            pub fn sampleBufferAttachments(self_: *T) *ResourceStatePassSampleBufferAttachmentDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ResourceStatePassSampleBufferAttachmentDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_sampleBufferAttachments);
            }
        };
    }
};

pub const SamplerDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_SamplerDescriptor;
    }
    pub usingnamespace Methods(SamplerDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn minFilter(self_: *T) SamplerMinMagFilter {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerMinMagFilter, @ptrCast(&c.objc_msgSend))(self_, sel_minFilter);
            }
            pub fn setMinFilter(self_: *T, minFilter_: SamplerMinMagFilter) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerMinMagFilter) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMinFilter_, minFilter_);
            }
            pub fn magFilter(self_: *T) SamplerMinMagFilter {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerMinMagFilter, @ptrCast(&c.objc_msgSend))(self_, sel_magFilter);
            }
            pub fn setMagFilter(self_: *T, magFilter_: SamplerMinMagFilter) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerMinMagFilter) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMagFilter_, magFilter_);
            }
            pub fn mipFilter(self_: *T) SamplerMipFilter {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerMipFilter, @ptrCast(&c.objc_msgSend))(self_, sel_mipFilter);
            }
            pub fn setMipFilter(self_: *T, mipFilter_: SamplerMipFilter) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerMipFilter) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMipFilter_, mipFilter_);
            }
            pub fn maxAnisotropy(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maxAnisotropy);
            }
            pub fn setMaxAnisotropy(self_: *T, maxAnisotropy_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMaxAnisotropy_, maxAnisotropy_);
            }
            pub fn sAddressMode(self_: *T) SamplerAddressMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerAddressMode, @ptrCast(&c.objc_msgSend))(self_, sel_sAddressMode);
            }
            pub fn setSAddressMode(self_: *T, sAddressMode_: SamplerAddressMode) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerAddressMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSAddressMode_, sAddressMode_);
            }
            pub fn tAddressMode(self_: *T) SamplerAddressMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerAddressMode, @ptrCast(&c.objc_msgSend))(self_, sel_tAddressMode);
            }
            pub fn setTAddressMode(self_: *T, tAddressMode_: SamplerAddressMode) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerAddressMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTAddressMode_, tAddressMode_);
            }
            pub fn rAddressMode(self_: *T) SamplerAddressMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerAddressMode, @ptrCast(&c.objc_msgSend))(self_, sel_rAddressMode);
            }
            pub fn setRAddressMode(self_: *T, rAddressMode_: SamplerAddressMode) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerAddressMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setRAddressMode_, rAddressMode_);
            }
            pub fn borderColor(self_: *T) SamplerBorderColor {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) SamplerBorderColor, @ptrCast(&c.objc_msgSend))(self_, sel_borderColor);
            }
            pub fn setBorderColor(self_: *T, borderColor_: SamplerBorderColor) void {
                return @as(*const fn (*T, *c.objc_selector, SamplerBorderColor) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBorderColor_, borderColor_);
            }
            pub fn normalizedCoordinates(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_normalizedCoordinates);
            }
            pub fn setNormalizedCoordinates(self_: *T, normalizedCoordinates_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setNormalizedCoordinates_, normalizedCoordinates_);
            }
            pub fn lodMinClamp(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_lodMinClamp);
            }
            pub fn setLodMinClamp(self_: *T, lodMinClamp_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLodMinClamp_, lodMinClamp_);
            }
            pub fn lodMaxClamp(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_lodMaxClamp);
            }
            pub fn setLodMaxClamp(self_: *T, lodMaxClamp_: f32) void {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLodMaxClamp_, lodMaxClamp_);
            }
            pub fn lodAverage(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_lodAverage);
            }
            pub fn setLodAverage(self_: *T, lodAverage_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLodAverage_, lodAverage_);
            }
            pub fn compareFunction(self_: *T) CompareFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CompareFunction, @ptrCast(&c.objc_msgSend))(self_, sel_compareFunction);
            }
            pub fn setCompareFunction(self_: *T, compareFunction_: CompareFunction) void {
                return @as(*const fn (*T, *c.objc_selector, CompareFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCompareFunction_, compareFunction_);
            }
            pub fn supportArgumentBuffers(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_supportArgumentBuffers);
            }
            pub fn setSupportArgumentBuffers(self_: *T, supportArgumentBuffers_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSupportArgumentBuffers_, supportArgumentBuffers_);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn setLabel(self_: *T, label_: ?*ns.String) void {
                return @as(*const fn (*T, *c.objc_selector, ?*ns.String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setLabel_, label_);
            }
        };
    }
};

pub const SamplerState = opaque {
    pub usingnamespace Methods(SamplerState);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};

pub const BufferLayoutDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_BufferLayoutDescriptor;
    }
    pub usingnamespace Methods(BufferLayoutDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn stride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_stride);
            }
            pub fn setStride(self_: *T, stride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStride_, stride_);
            }
            pub fn stepFunction(self_: *T) StepFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StepFunction, @ptrCast(&c.objc_msgSend))(self_, sel_stepFunction);
            }
            pub fn setStepFunction(self_: *T, stepFunction_: StepFunction) void {
                return @as(*const fn (*T, *c.objc_selector, StepFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStepFunction_, stepFunction_);
            }
            pub fn stepRate(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_stepRate);
            }
            pub fn setStepRate(self_: *T, stepRate_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStepRate_, stepRate_);
            }
        };
    }
};

pub const BufferLayoutDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_BufferLayoutDescriptorArray;
    }
    pub usingnamespace Methods(BufferLayoutDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, index_: ns.UInteger) *BufferLayoutDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *BufferLayoutDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, index_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, bufferDesc_: ?*BufferLayoutDescriptor, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*BufferLayoutDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, bufferDesc_, index_);
            }
        };
    }
};

pub const AttributeDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_AttributeDescriptor;
    }
    pub usingnamespace Methods(AttributeDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn format(self_: *T) AttributeFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AttributeFormat, @ptrCast(&c.objc_msgSend))(self_, sel_format);
            }
            pub fn setFormat(self_: *T, format_: AttributeFormat) void {
                return @as(*const fn (*T, *c.objc_selector, AttributeFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFormat_, format_);
            }
            pub fn offset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_offset);
            }
            pub fn setOffset(self_: *T, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOffset_, offset_);
            }
            pub fn bufferIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferIndex);
            }
            pub fn setBufferIndex(self_: *T, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBufferIndex_, bufferIndex_);
            }
        };
    }
};

pub const AttributeDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_AttributeDescriptorArray;
    }
    pub usingnamespace Methods(AttributeDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, index_: ns.UInteger) *AttributeDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *AttributeDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, index_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attributeDesc_: ?*AttributeDescriptor, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*AttributeDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attributeDesc_, index_);
            }
        };
    }
};

pub const StageInputOutputDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_StageInputOutputDescriptor;
    }
    pub usingnamespace Methods(StageInputOutputDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn stageInputOutputDescriptor() *StageInputOutputDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *StageInputOutputDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_stageInputOutputDescriptor);
            }
            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn layouts(self_: *T) *BufferLayoutDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *BufferLayoutDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_layouts);
            }
            pub fn attributes(self_: *T) *AttributeDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AttributeDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_attributes);
            }
            pub fn indexType(self_: *T) IndexType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IndexType, @ptrCast(&c.objc_msgSend))(self_, sel_indexType);
            }
            pub fn setIndexType(self_: *T, indexType_: IndexType) void {
                return @as(*const fn (*T, *c.objc_selector, IndexType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexType_, indexType_);
            }
            pub fn indexBufferIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_indexBufferIndex);
            }
            pub fn setIndexBufferIndex(self_: *T, indexBufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setIndexBufferIndex_, indexBufferIndex_);
            }
        };
    }
};

pub const SharedTextureHandle = opaque {
    pub fn class() *c.objc_class {
        return class_SharedTextureHandle;
    }
    pub usingnamespace Methods(SharedTextureHandle);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.SecureCoding.Methods(T);

            pub fn device(self_: *T) *Device {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Device, @ptrCast(&c.objc_msgSend))(self_, sel_device);
            }
            pub fn label(self_: *T) ?*ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_label);
            }
        };
    }
};

pub const TextureDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_TextureDescriptor;
    }
    pub usingnamespace Methods(TextureDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn texture2DDescriptorWithPixelFormat_width_height_mipmapped(pixelFormat_: PixelFormat, width_: ns.UInteger, height_: ns.UInteger, mipmapped_: bool) *TextureDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, PixelFormat, ns.UInteger, ns.UInteger, bool) callconv(.C) *TextureDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, pixelFormat_, width_, height_, mipmapped_);
            }
            pub fn textureCubeDescriptorWithPixelFormat_size_mipmapped(pixelFormat_: PixelFormat, size_: ns.UInteger, mipmapped_: bool) *TextureDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, PixelFormat, ns.UInteger, bool) callconv(.C) *TextureDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_textureCubeDescriptorWithPixelFormat_size_mipmapped_, pixelFormat_, size_, mipmapped_);
            }
            pub fn textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage(pixelFormat_: PixelFormat, width_: ns.UInteger, resourceOptions_: ResourceOptions, usage_: TextureUsage) *TextureDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector, PixelFormat, ns.UInteger, ResourceOptions, TextureUsage) callconv(.C) *TextureDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_, pixelFormat_, width_, resourceOptions_, usage_);
            }
            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn setTextureType(self_: *T, textureType_: TextureType) void {
                return @as(*const fn (*T, *c.objc_selector, TextureType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setTextureType_, textureType_);
            }
            pub fn pixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_pixelFormat);
            }
            pub fn setPixelFormat(self_: *T, pixelFormat_: PixelFormat) void {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setPixelFormat_, pixelFormat_);
            }
            pub fn width(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_width);
            }
            pub fn setWidth(self_: *T, width_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setWidth_, width_);
            }
            pub fn height(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_height);
            }
            pub fn setHeight(self_: *T, height_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setHeight_, height_);
            }
            pub fn depth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_depth);
            }
            pub fn setDepth(self_: *T, depth_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDepth_, depth_);
            }
            pub fn mipmapLevelCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_mipmapLevelCount);
            }
            pub fn setMipmapLevelCount(self_: *T, mipmapLevelCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setMipmapLevelCount_, mipmapLevelCount_);
            }
            pub fn sampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
            pub fn setSampleCount(self_: *T, sampleCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSampleCount_, sampleCount_);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
            pub fn setArrayLength(self_: *T, arrayLength_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setArrayLength_, arrayLength_);
            }
            pub fn resourceOptions(self_: *T) ResourceOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceOptions, @ptrCast(&c.objc_msgSend))(self_, sel_resourceOptions);
            }
            pub fn setResourceOptions(self_: *T, resourceOptions_: ResourceOptions) void {
                return @as(*const fn (*T, *c.objc_selector, ResourceOptions) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setResourceOptions_, resourceOptions_);
            }
            pub fn cpuCacheMode(self_: *T) CPUCacheMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) CPUCacheMode, @ptrCast(&c.objc_msgSend))(self_, sel_cpuCacheMode);
            }
            pub fn setCpuCacheMode(self_: *T, cpuCacheMode_: CPUCacheMode) void {
                return @as(*const fn (*T, *c.objc_selector, CPUCacheMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCpuCacheMode_, cpuCacheMode_);
            }
            pub fn storageMode(self_: *T) StorageMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) StorageMode, @ptrCast(&c.objc_msgSend))(self_, sel_storageMode);
            }
            pub fn setStorageMode(self_: *T, storageMode_: StorageMode) void {
                return @as(*const fn (*T, *c.objc_selector, StorageMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStorageMode_, storageMode_);
            }
            pub fn hazardTrackingMode(self_: *T) HazardTrackingMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) HazardTrackingMode, @ptrCast(&c.objc_msgSend))(self_, sel_hazardTrackingMode);
            }
            pub fn setHazardTrackingMode(self_: *T, hazardTrackingMode_: HazardTrackingMode) void {
                return @as(*const fn (*T, *c.objc_selector, HazardTrackingMode) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setHazardTrackingMode_, hazardTrackingMode_);
            }
            pub fn usage(self_: *T) TextureUsage {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureUsage, @ptrCast(&c.objc_msgSend))(self_, sel_usage);
            }
            pub fn setUsage(self_: *T, usage_: TextureUsage) void {
                return @as(*const fn (*T, *c.objc_selector, TextureUsage) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setUsage_, usage_);
            }
            pub fn allowGPUOptimizedContents(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowGPUOptimizedContents);
            }
            pub fn setAllowGPUOptimizedContents(self_: *T, allowGPUOptimizedContents_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAllowGPUOptimizedContents_, allowGPUOptimizedContents_);
            }
            pub fn compressionType(self_: *T) TextureCompressionType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureCompressionType, @ptrCast(&c.objc_msgSend))(self_, sel_compressionType);
            }
            pub fn setCompressionType(self_: *T, compressionType_: TextureCompressionType) void {
                return @as(*const fn (*T, *c.objc_selector, TextureCompressionType) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setCompressionType_, compressionType_);
            }
            pub fn swizzle(self_: *T) TextureSwizzleChannels {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureSwizzleChannels, @ptrCast(&c.objc_msgSend))(self_, sel_swizzle);
            }
            pub fn setSwizzle(self_: *T, swizzle_: TextureSwizzleChannels) void {
                return @as(*const fn (*T, *c.objc_selector, TextureSwizzleChannels) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setSwizzle_, swizzle_);
            }
        };
    }
};

pub const Texture = opaque {
    pub usingnamespace Methods(Texture);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice(self_: *T, pixelBytes_: *anyopaque, bytesPerRow_: ns.UInteger, bytesPerImage_: ns.UInteger, region_: Region, level_: ns.UInteger, slice_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *anyopaque, ns.UInteger, ns.UInteger, Region, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_, pixelBytes_, bytesPerRow_, bytesPerImage_, region_, level_, slice_);
            }
            pub fn replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage(self_: *T, region_: Region, level_: ns.UInteger, slice_: ns.UInteger, pixelBytes_: *const anyopaque, bytesPerRow_: ns.UInteger, bytesPerImage_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, Region, ns.UInteger, ns.UInteger, *const anyopaque, ns.UInteger, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_, region_, level_, slice_, pixelBytes_, bytesPerRow_, bytesPerImage_);
            }
            pub fn getBytes_bytesPerRow_fromRegion_mipmapLevel(self_: *T, pixelBytes_: *anyopaque, bytesPerRow_: ns.UInteger, region_: Region, level_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *anyopaque, ns.UInteger, Region, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_getBytes_bytesPerRow_fromRegion_mipmapLevel_, pixelBytes_, bytesPerRow_, region_, level_);
            }
            pub fn replaceRegion_mipmapLevel_withBytes_bytesPerRow(self_: *T, region_: Region, level_: ns.UInteger, pixelBytes_: *const anyopaque, bytesPerRow_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, Region, ns.UInteger, *const anyopaque, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_replaceRegion_mipmapLevel_withBytes_bytesPerRow_, region_, level_, pixelBytes_, bytesPerRow_);
            }
            pub fn newTextureViewWithPixelFormat(self_: *T, pixelFormat_: PixelFormat) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureViewWithPixelFormat_, pixelFormat_);
            }
            pub fn newTextureViewWithPixelFormat_textureType_levels_slices(self_: *T, pixelFormat_: PixelFormat, textureType_: TextureType, levelRange_: ns.Range, sliceRange_: ns.Range) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat, TextureType, ns.Range, ns.Range) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureViewWithPixelFormat_textureType_levels_slices_, pixelFormat_, textureType_, levelRange_, sliceRange_);
            }
            pub fn newSharedTextureHandle(self_: *T) ?*SharedTextureHandle {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*SharedTextureHandle, @ptrCast(&c.objc_msgSend))(self_, sel_newSharedTextureHandle);
            }
            pub fn newRemoteTextureViewForDevice(self_: *T, device_: *Device) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, *Device) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newRemoteTextureViewForDevice_, device_);
            }
            pub fn newTextureViewWithPixelFormat_textureType_levels_slices_swizzle(self_: *T, pixelFormat_: PixelFormat, textureType_: TextureType, levelRange_: ns.Range, sliceRange_: ns.Range, swizzle_: TextureSwizzleChannels) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector, PixelFormat, TextureType, ns.Range, ns.Range, TextureSwizzleChannels) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_, pixelFormat_, textureType_, levelRange_, sliceRange_, swizzle_);
            }
            pub fn rootResource(self_: *T) ?*Resource {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Resource, @ptrCast(&c.objc_msgSend))(self_, sel_rootResource);
            }
            pub fn parentTexture(self_: *T) ?*Texture {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Texture, @ptrCast(&c.objc_msgSend))(self_, sel_parentTexture);
            }
            pub fn parentRelativeLevel(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_parentRelativeLevel);
            }
            pub fn parentRelativeSlice(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_parentRelativeSlice);
            }
            pub fn buffer(self_: *T) ?*Buffer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Buffer, @ptrCast(&c.objc_msgSend))(self_, sel_buffer);
            }
            pub fn bufferOffset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferOffset);
            }
            pub fn bufferBytesPerRow(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferBytesPerRow);
            }
            pub fn iosurface(self_: *T) IOSurfaceRef {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) IOSurfaceRef, @ptrCast(&c.objc_msgSend))(self_, sel_iosurface);
            }
            pub fn iosurfacePlane(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_iosurfacePlane);
            }
            pub fn textureType(self_: *T) TextureType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureType, @ptrCast(&c.objc_msgSend))(self_, sel_textureType);
            }
            pub fn pixelFormat(self_: *T) PixelFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) PixelFormat, @ptrCast(&c.objc_msgSend))(self_, sel_pixelFormat);
            }
            pub fn width(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_width);
            }
            pub fn height(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_height);
            }
            pub fn depth(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_depth);
            }
            pub fn mipmapLevelCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_mipmapLevelCount);
            }
            pub fn sampleCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_sampleCount);
            }
            pub fn arrayLength(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_arrayLength);
            }
            pub fn usage(self_: *T) TextureUsage {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureUsage, @ptrCast(&c.objc_msgSend))(self_, sel_usage);
            }
            pub fn isShareable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isShareable);
            }
            pub fn isFramebufferOnly(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isFramebufferOnly);
            }
            pub fn firstMipmapInTail(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_firstMipmapInTail);
            }
            pub fn tailSizeInBytes(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_tailSizeInBytes);
            }
            pub fn isSparse(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isSparse);
            }
            pub fn allowGPUOptimizedContents(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowGPUOptimizedContents);
            }
            pub fn compressionType(self_: *T) TextureCompressionType {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureCompressionType, @ptrCast(&c.objc_msgSend))(self_, sel_compressionType);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
            pub fn remoteStorageTexture(self_: *T) *Texture {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Texture, @ptrCast(&c.objc_msgSend))(self_, sel_remoteStorageTexture);
            }
            pub fn swizzle(self_: *T) TextureSwizzleChannels {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TextureSwizzleChannels, @ptrCast(&c.objc_msgSend))(self_, sel_swizzle);
            }
        };
    }
};

pub const VertexBufferLayoutDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_VertexBufferLayoutDescriptor;
    }
    pub usingnamespace Methods(VertexBufferLayoutDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn stride(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_stride);
            }
            pub fn setStride(self_: *T, stride_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStride_, stride_);
            }
            pub fn stepFunction(self_: *T) VertexStepFunction {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) VertexStepFunction, @ptrCast(&c.objc_msgSend))(self_, sel_stepFunction);
            }
            pub fn setStepFunction(self_: *T, stepFunction_: VertexStepFunction) void {
                return @as(*const fn (*T, *c.objc_selector, VertexStepFunction) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStepFunction_, stepFunction_);
            }
            pub fn stepRate(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_stepRate);
            }
            pub fn setStepRate(self_: *T, stepRate_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setStepRate_, stepRate_);
            }
        };
    }
};

pub const VertexBufferLayoutDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_VertexBufferLayoutDescriptorArray;
    }
    pub usingnamespace Methods(VertexBufferLayoutDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, index_: ns.UInteger) *VertexBufferLayoutDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *VertexBufferLayoutDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, index_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, bufferDesc_: ?*VertexBufferLayoutDescriptor, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VertexBufferLayoutDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, bufferDesc_, index_);
            }
        };
    }
};

pub const VertexAttributeDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_VertexAttributeDescriptor;
    }
    pub usingnamespace Methods(VertexAttributeDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn format(self_: *T) VertexFormat {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) VertexFormat, @ptrCast(&c.objc_msgSend))(self_, sel_format);
            }
            pub fn setFormat(self_: *T, format_: VertexFormat) void {
                return @as(*const fn (*T, *c.objc_selector, VertexFormat) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFormat_, format_);
            }
            pub fn offset(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_offset);
            }
            pub fn setOffset(self_: *T, offset_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setOffset_, offset_);
            }
            pub fn bufferIndex(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_bufferIndex);
            }
            pub fn setBufferIndex(self_: *T, bufferIndex_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setBufferIndex_, bufferIndex_);
            }
        };
    }
};

pub const VertexAttributeDescriptorArray = opaque {
    pub fn class() *c.objc_class {
        return class_VertexAttributeDescriptorArray;
    }
    pub usingnamespace Methods(VertexAttributeDescriptorArray);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn objectAtIndexedSubscript(self_: *T, index_: ns.UInteger) *VertexAttributeDescriptor {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) *VertexAttributeDescriptor, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndexedSubscript_, index_);
            }
            pub fn setObject_atIndexedSubscript(self_: *T, attributeDesc_: ?*VertexAttributeDescriptor, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*VertexAttributeDescriptor, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setObject_atIndexedSubscript_, attributeDesc_, index_);
            }
        };
    }
};

pub const VertexDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_VertexDescriptor;
    }
    pub usingnamespace Methods(VertexDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn vertexDescriptor() *VertexDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *VertexDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_vertexDescriptor);
            }
            pub fn reset(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_reset);
            }
            pub fn layouts(self_: *T) *VertexBufferLayoutDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *VertexBufferLayoutDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_layouts);
            }
            pub fn attributes(self_: *T) *VertexAttributeDescriptorArray {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *VertexAttributeDescriptorArray, @ptrCast(&c.objc_msgSend))(self_, sel_attributes);
            }
        };
    }
};

pub const VisibleFunctionTableDescriptor = opaque {
    pub fn class() *c.objc_class {
        return class_VisibleFunctionTableDescriptor;
    }
    pub usingnamespace Methods(VisibleFunctionTableDescriptor);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);
            pub usingnamespace ns.Copying.Methods(T);

            pub fn visibleFunctionTableDescriptor() *VisibleFunctionTableDescriptor {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *VisibleFunctionTableDescriptor, @ptrCast(&c.objc_msgSend))(T.class(), sel_visibleFunctionTableDescriptor);
            }
            pub fn functionCount(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_functionCount);
            }
            pub fn setFunctionCount(self_: *T, functionCount_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctionCount_, functionCount_);
            }
        };
    }
};

pub const VisibleFunctionTable = opaque {
    pub usingnamespace Methods(VisibleFunctionTable);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Resource.Methods(T);

            pub fn setFunction_atIndex(self_: *T, function_: ?*FunctionHandle, index_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ?*FunctionHandle, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunction_atIndex_, function_, index_);
            }
            pub fn setFunctions_withRange(self_: *T, functions_: *?*const FunctionHandle, range_: ns.Range) void {
                return @as(*const fn (*T, *c.objc_selector, *?*const FunctionHandle, ns.Range) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setFunctions_withRange_, functions_, range_);
            }
            pub fn gpuResourceID(self_: *T) ResourceID {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ResourceID, @ptrCast(&c.objc_msgSend))(self_, sel_gpuResourceID);
            }
        };
    }
};
var class_AccelerationStructureDescriptor: *c.objc_class = undefined;
var class_AccelerationStructureGeometryDescriptor: *c.objc_class = undefined;
var class_PrimitiveAccelerationStructureDescriptor: *c.objc_class = undefined;
var class_AccelerationStructureTriangleGeometryDescriptor: *c.objc_class = undefined;
var class_AccelerationStructureBoundingBoxGeometryDescriptor: *c.objc_class = undefined;
var class_MotionKeyframeData: *c.objc_class = undefined;
var class_AccelerationStructureMotionTriangleGeometryDescriptor: *c.objc_class = undefined;
var class_AccelerationStructureMotionBoundingBoxGeometryDescriptor: *c.objc_class = undefined;
var class_InstanceAccelerationStructureDescriptor: *c.objc_class = undefined;
var class_AccelerationStructurePassSampleBufferAttachmentDescriptor: *c.objc_class = undefined;
var class_AccelerationStructurePassSampleBufferAttachmentDescriptorArray: *c.objc_class = undefined;
var class_AccelerationStructurePassDescriptor: *c.objc_class = undefined;
var class_Type: *c.objc_class = undefined;
var class_StructMember: *c.objc_class = undefined;
var class_StructType: *c.objc_class = undefined;
var class_ArrayType: *c.objc_class = undefined;
var class_PointerType: *c.objc_class = undefined;
var class_TextureReferenceType: *c.objc_class = undefined;
var class_Argument: *c.objc_class = undefined;
var class_BinaryArchiveDescriptor: *c.objc_class = undefined;
var class_BlitPassSampleBufferAttachmentDescriptor: *c.objc_class = undefined;
var class_BlitPassSampleBufferAttachmentDescriptorArray: *c.objc_class = undefined;
var class_BlitPassDescriptor: *c.objc_class = undefined;
var class_CaptureDescriptor: *c.objc_class = undefined;
var class_CaptureManager: *c.objc_class = undefined;
var class_CommandBufferDescriptor: *c.objc_class = undefined;
var class_ComputePassSampleBufferAttachmentDescriptor: *c.objc_class = undefined;
var class_ComputePassSampleBufferAttachmentDescriptorArray: *c.objc_class = undefined;
var class_ComputePassDescriptor: *c.objc_class = undefined;
var class_ComputePipelineReflection: *c.objc_class = undefined;
var class_ComputePipelineDescriptor: *c.objc_class = undefined;
var class_CounterSampleBufferDescriptor: *c.objc_class = undefined;
var class_StencilDescriptor: *c.objc_class = undefined;
var class_DepthStencilDescriptor: *c.objc_class = undefined;
var class_ArgumentDescriptor: *c.objc_class = undefined;
var class_SharedEventListener: *c.objc_class = undefined;
var class_SharedEventHandle: *c.objc_class = undefined;
var class_FunctionConstantValues: *c.objc_class = undefined;
var class_FunctionDescriptor: *c.objc_class = undefined;
var class_IntersectionFunctionDescriptor: *c.objc_class = undefined;
var class_FunctionStitchingAttributeAlwaysInline: *c.objc_class = undefined;
var class_FunctionStitchingInputNode: *c.objc_class = undefined;
var class_FunctionStitchingFunctionNode: *c.objc_class = undefined;
var class_FunctionStitchingGraph: *c.objc_class = undefined;
var class_StitchedLibraryDescriptor: *c.objc_class = undefined;
var class_HeapDescriptor: *c.objc_class = undefined;
var class_IndirectCommandBufferDescriptor: *c.objc_class = undefined;
var class_IntersectionFunctionTableDescriptor: *c.objc_class = undefined;
var class_IOCommandQueueDescriptor: *c.objc_class = undefined;
var class_VertexAttribute: *c.objc_class = undefined;
var class_Attribute: *c.objc_class = undefined;
var class_FunctionConstant: *c.objc_class = undefined;
var class_CompileOptions: *c.objc_class = undefined;
var class_LinkedFunctions: *c.objc_class = undefined;
var class_PipelineBufferDescriptor: *c.objc_class = undefined;
var class_PipelineBufferDescriptorArray: *c.objc_class = undefined;
var class_RasterizationRateSampleArray: *c.objc_class = undefined;
var class_RasterizationRateLayerDescriptor: *c.objc_class = undefined;
var class_RasterizationRateLayerArray: *c.objc_class = undefined;
var class_RasterizationRateMapDescriptor: *c.objc_class = undefined;
var class_RenderPassAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPassColorAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPassDepthAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPassStencilAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPassColorAttachmentDescriptorArray: *c.objc_class = undefined;
var class_RenderPassSampleBufferAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPassSampleBufferAttachmentDescriptorArray: *c.objc_class = undefined;
var class_RenderPassDescriptor: *c.objc_class = undefined;
var class_RenderPipelineColorAttachmentDescriptor: *c.objc_class = undefined;
var class_RenderPipelineReflection: *c.objc_class = undefined;
var class_RenderPipelineDescriptor: *c.objc_class = undefined;
var class_RenderPipelineFunctionsDescriptor: *c.objc_class = undefined;
var class_RenderPipelineColorAttachmentDescriptorArray: *c.objc_class = undefined;
var class_TileRenderPipelineColorAttachmentDescriptor: *c.objc_class = undefined;
var class_TileRenderPipelineColorAttachmentDescriptorArray: *c.objc_class = undefined;
var class_TileRenderPipelineDescriptor: *c.objc_class = undefined;
var class_MeshRenderPipelineDescriptor: *c.objc_class = undefined;
var class_ResourceStatePassSampleBufferAttachmentDescriptor: *c.objc_class = undefined;
var class_ResourceStatePassSampleBufferAttachmentDescriptorArray: *c.objc_class = undefined;
var class_ResourceStatePassDescriptor: *c.objc_class = undefined;
var class_SamplerDescriptor: *c.objc_class = undefined;
var class_BufferLayoutDescriptor: *c.objc_class = undefined;
var class_BufferLayoutDescriptorArray: *c.objc_class = undefined;
var class_AttributeDescriptor: *c.objc_class = undefined;
var class_AttributeDescriptorArray: *c.objc_class = undefined;
var class_StageInputOutputDescriptor: *c.objc_class = undefined;
var class_SharedTextureHandle: *c.objc_class = undefined;
var class_TextureDescriptor: *c.objc_class = undefined;
var class_VertexBufferLayoutDescriptor: *c.objc_class = undefined;
var class_VertexBufferLayoutDescriptorArray: *c.objc_class = undefined;
var class_VertexAttributeDescriptor: *c.objc_class = undefined;
var class_VertexAttributeDescriptorArray: *c.objc_class = undefined;
var class_VertexDescriptor: *c.objc_class = undefined;
var class_VisibleFunctionTableDescriptor: *c.objc_class = undefined;
var sel_optimizeContentsForGPUAccess_slice_level_: *c.objc_selector = undefined;
var sel_setStorageMode_: *c.objc_selector = undefined;
var sel_setOptions_: *c.objc_selector = undefined;
var sel_status: *c.objc_selector = undefined;
var sel_width: *c.objc_selector = undefined;
var sel_copyAndCompactAccelerationStructure_toAccelerationStructure_: *c.objc_selector = undefined;
var sel_newTextureWithDescriptor_iosurface_plane_: *c.objc_selector = undefined;
var sel_computeCommandEncoder: *c.objc_selector = undefined;
var sel_functionHandleWithFunction_: *c.objc_selector = undefined;
var sel_setRasterizationRateMap_: *c.objc_selector = undefined;
var sel_remoteStorageTexture: *c.objc_selector = undefined;
var sel_setMeshSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_setTileBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_controlDependencies: *c.objc_selector = undefined;
var sel_maxTransferRate: *c.objc_selector = undefined;
var sel_maxAvailableSizeWithAlignment_: *c.objc_selector = undefined;
var sel_computePassDescriptor: *c.objc_selector = undefined;
var sel_setMeshBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_buffer: *c.objc_selector = undefined;
var sel_maxVertexAmplificationCount: *c.objc_selector = undefined;
var sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_: *c.objc_selector = undefined;
var sel_setRetainedReferences_: *c.objc_selector = undefined;
var sel_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_: *c.objc_selector = undefined;
var sel_newSharedEventHandle: *c.objc_selector = undefined;
var sel_objectPayloadAlignment: *c.objc_selector = undefined;
var sel_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_setFunctionCount_: *c.objc_selector = undefined;
var sel_depthAttachment: *c.objc_selector = undefined;
var sel_preloadedLibraries: *c.objc_selector = undefined;
var sel_setVertexTexture_atIndex_: *c.objc_selector = undefined;
var sel_arguments: *c.objc_selector = undefined;
var sel_setSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_counterSet: *c.objc_selector = undefined;
var sel_copyStatusToBuffer_offset_: *c.objc_selector = undefined;
var sel_setObjectBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_setDataType_: *c.objc_selector = undefined;
var sel_endScope: *c.objc_selector = undefined;
var sel_allowDuplicateIntersectionFunctionInvocation: *c.objc_selector = undefined;
var sel_setAllowDuplicateIntersectionFunctionInvocation_: *c.objc_selector = undefined;
var sel_motionKeyframeCount: *c.objc_selector = undefined;
var sel_setSampleCount_: *c.objc_selector = undefined;
var sel_setFunctions_withRange_: *c.objc_selector = undefined;
var sel_setConstantBlockAlignment_: *c.objc_selector = undefined;
var sel_clearColor: *c.objc_selector = undefined;
var sel_supportsTextureSampleCount_: *c.objc_selector = undefined;
var sel_setWidth_: *c.objc_selector = undefined;
var sel_setHeight_: *c.objc_selector = undefined;
var sel_setFunction_atIndex_: *c.objc_selector = undefined;
var sel_newTextureWithDescriptor_offset_: *c.objc_selector = undefined;
var sel_setMotionTransformBuffer_: *c.objc_selector = undefined;
var sel_setLayer_atIndex_: *c.objc_selector = undefined;
var sel_name: *c.objc_selector = undefined;
var sel_allocatedSize: *c.objc_selector = undefined;
var sel_newLibraryWithFile_error_: *c.objc_selector = undefined;
var sel_isArgument: *c.objc_selector = undefined;
var sel_setDestination_: *c.objc_selector = undefined;
var sel_backFaceStencil: *c.objc_selector = undefined;
var sel_setStencilReferenceValue_: *c.objc_selector = undefined;
var sel_endOfFragmentSampleIndex: *c.objc_selector = undefined;
var sel_setTessellationFactorScaleEnabled_: *c.objc_selector = undefined;
var sel_format: *c.objc_selector = undefined;
var sel_commit: *c.objc_selector = undefined;
var sel_tessellationFactorStepFunction: *c.objc_selector = undefined;
var sel_debugSignposts: *c.objc_selector = undefined;
var sel_resourceStateCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_setTileVisibleFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_tessellationFactorFormat: *c.objc_selector = undefined;
var sel_setVertexAmplificationCount_viewMappings_: *c.objc_selector = undefined;
var sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_elementPointerType: *c.objc_selector = undefined;
var sel_accelerationStructurePassDescriptor: *c.objc_selector = undefined;
var sel_device: *c.objc_selector = undefined;
var sel_setMotionStartTime_: *c.objc_selector = undefined;
var sel_maxCommandBufferCount: *c.objc_selector = undefined;
var sel_setLibraryType_: *c.objc_selector = undefined;
var sel_dataType: *c.objc_selector = undefined;
var sel_newDynamicLibrary_error_: *c.objc_selector = undefined;
var sel_tileAdditionalBinaryFunctions: *c.objc_selector = undefined;
var sel_physicalSizeForLayer_: *c.objc_selector = undefined;
var sel_imageblockMemoryLengthForDimensions_: *c.objc_selector = undefined;
var sel_firstMipmapInTail: *c.objc_selector = undefined;
var sel_tileWidth: *c.objc_selector = undefined;
var sel_elementArrayType: *c.objc_selector = undefined;
var sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_: *c.objc_selector = undefined;
var sel_setSamplePositions_count_: *c.objc_selector = undefined;
var sel_setObjectFunction_: *c.objc_selector = undefined;
var sel_supportsFunctionPointers: *c.objc_selector = undefined;
var sel_sharedCaptureManager: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithFunction_completionHandler_: *c.objc_selector = undefined;
var sel_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_: *c.objc_selector = undefined;
var sel_setMaxTotalThreadsPerMeshThreadgroup_: *c.objc_selector = undefined;
var sel_newVisibleFunctionTableWithDescriptor_: *c.objc_selector = undefined;
var sel_setInheritBuffers_: *c.objc_selector = undefined;
var sel_setPayloadMemoryLength_: *c.objc_selector = undefined;
var sel_registryID: *c.objc_selector = undefined;
var sel_supportsRaytracingFromRender: *c.objc_selector = undefined;
var sel_newIntersectionFunctionWithDescriptor_completionHandler_: *c.objc_selector = undefined;
var sel_indexBufferOffset: *c.objc_selector = undefined;
var sel_setVisibleFunctionTable_atIndex_: *c.objc_selector = undefined;
var sel_gpuAddress: *c.objc_selector = undefined;
var sel_setVisibilityResultBuffer_: *c.objc_selector = undefined;
var sel_loadBuffer_offset_size_sourceHandle_sourceHandleOffset_: *c.objc_selector = undefined;
var sel_stencilAttachmentPixelFormat: *c.objc_selector = undefined;
var sel_setIntersectionFunctionTables_withRange_: *c.objc_selector = undefined;
var sel_setSize_: *c.objc_selector = undefined;
var sel_setVertexVisibleFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_compressionType: *c.objc_selector = undefined;
var sel_setErrorOptions_: *c.objc_selector = undefined;
var sel_setCaptureObject_: *c.objc_selector = undefined;
var sel_updateFence_: *c.objc_selector = undefined;
var sel_waitForFence_beforeStages_: *c.objc_selector = undefined;
var sel_setStencilResolveFilter_: *c.objc_selector = undefined;
var sel_swizzle: *c.objc_selector = undefined;
var sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_: *c.objc_selector = undefined;
var sel_frontFaceStencil: *c.objc_selector = undefined;
var sel_setMaxAnisotropy_: *c.objc_selector = undefined;
var sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_: *c.objc_selector = undefined;
var sel_depthStencilPassOperation: *c.objc_selector = undefined;
var sel_mapScreenToPhysicalCoordinates_forLayer_: *c.objc_selector = undefined;
var sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_vertexBuffer: *c.objc_selector = undefined;
var sel_visibilityResultBuffer: *c.objc_selector = undefined;
var sel_maxFragmentCallStackDepth: *c.objc_selector = undefined;
var sel_setFragmentAccelerationStructure_atBufferIndex_: *c.objc_selector = undefined;
var sel_presentAfterMinimumDuration_: *c.objc_selector = undefined;
var sel_newCommandQueueWithMaxCommandBufferCount_: *c.objc_selector = undefined;
var sel_elementTextureReferenceType: *c.objc_selector = undefined;
var sel_dispatchQueue: *c.objc_selector = undefined;
var sel_setTileAdditionalBinaryFunctions_: *c.objc_selector = undefined;
var sel_setEndOfVertexSampleIndex_: *c.objc_selector = undefined;
var sel_stride: *c.objc_selector = undefined;
var sel_setIndexType_: *c.objc_selector = undefined;
var sel_addDebugMarker_range_: *c.objc_selector = undefined;
var sel_motionEndTime: *c.objc_selector = undefined;
var sel_setDepthWriteEnabled_: *c.objc_selector = undefined;
var sel_setRenderPipelineState_: *c.objc_selector = undefined;
var sel_sampleBuffer: *c.objc_selector = undefined;
var sel_newLibraryWithData_error_: *c.objc_selector = undefined;
var sel_tileHeight: *c.objc_selector = undefined;
var sel_setHazardTrackingMode_: *c.objc_selector = undefined;
var sel_elementIsArgumentBuffer: *c.objc_selector = undefined;
var sel_setVertexIntersectionFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_setComputePipelineStates_withRange_: *c.objc_selector = undefined;
var sel_init: *c.objc_selector = undefined;
var sel_setMaxFragmentBufferBindCount_: *c.objc_selector = undefined;
var sel_setInstancedAccelerationStructures_: *c.objc_selector = undefined;
var sel_presentDrawable_afterMinimumDuration_: *c.objc_selector = undefined;
var sel_options: *c.objc_selector = undefined;
var sel_patchControlPointCount: *c.objc_selector = undefined;
var sel_stencilCompareFunction: *c.objc_selector = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_: *c.objc_selector = undefined;
var sel_newLibraryWithSource_options_completionHandler_: *c.objc_selector = undefined;
var sel_newAccelerationStructureWithDescriptor_offset_: *c.objc_selector = undefined;
var sel_setBarrier: *c.objc_selector = undefined;
var sel_minimumLinearTextureAlignmentForPixelFormat_: *c.objc_selector = undefined;
var sel_setObjectThreadgroupMemoryLength_atIndex_: *c.objc_selector = undefined;
var sel_setMeshFunction_: *c.objc_selector = undefined;
var sel_transformationMatrixBufferOffset: *c.objc_selector = undefined;
var sel_slice: *c.objc_selector = undefined;
var sel_newBufferWithLength_options_: *c.objc_selector = undefined;
var sel_initWithFunctionName_nodes_outputNode_attributes_: *c.objc_selector = undefined;
var sel_physicalGranularity: *c.objc_selector = undefined;
var sel_setFragmentFunction_: *c.objc_selector = undefined;
var sel_renderTargetArrayLength: *c.objc_selector = undefined;
var sel_setVertexBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_maxTotalThreadgroupsPerMeshGrid: *c.objc_selector = undefined;
var sel_rasterizationRateMap: *c.objc_selector = undefined;
var sel_setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_: *c.objc_selector = undefined;
var sel_setMipmapLevelCount_: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithFunction_options_completionHandler_: *c.objc_selector = undefined;
var sel_attributeType: *c.objc_selector = undefined;
var sel_newIOCommandQueueWithDescriptor_error_: *c.objc_selector = undefined;
var sel_setFragmentTexture_atIndex_: *c.objc_selector = undefined;
var sel_destinationAlphaBlendFactor: *c.objc_selector = undefined;
var sel_setAlphaBlendOperation_: *c.objc_selector = undefined;
var sel_newRemoteBufferViewForDevice_: *c.objc_selector = undefined;
var sel_setFragmentSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_: *c.objc_selector = undefined;
var sel_horizontalSampleStorage: *c.objc_selector = undefined;
var sel_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_: *c.objc_selector = undefined;
var sel_allowReferencingUndefinedSymbols: *c.objc_selector = undefined;
var sel_setFragmentSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_setTriangleCount_: *c.objc_selector = undefined;
var sel_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_borderColor: *c.objc_selector = undefined;
var sel_arrayType: *c.objc_selector = undefined;
var sel_debugLocation: *c.objc_selector = undefined;
var sel_setFrontFacingWinding_: *c.objc_selector = undefined;
var sel_meshThreadExecutionWidth: *c.objc_selector = undefined;
var sel_parentTexture: *c.objc_selector = undefined;
var sel_sampleBufferAttachments: *c.objc_selector = undefined;
var sel_setBackFaceStencil_: *c.objc_selector = undefined;
var sel_sampleCountersInBuffer_atSampleIndex_withBarrier_: *c.objc_selector = undefined;
var sel_setSignaledValue_: *c.objc_selector = undefined;
var sel_peerCount: *c.objc_selector = undefined;
var sel_setCpuCacheMode_: *c.objc_selector = undefined;
var sel_startCaptureWithDevice_: *c.objc_selector = undefined;
var sel_indirectComputeCommandAtIndex_: *c.objc_selector = undefined;
var sel_tryCancel: *c.objc_selector = undefined;
var sel_isPatchControlPointData: *c.objc_selector = undefined;
var sel_newArgumentEncoderWithBufferIndex_reflection_: *c.objc_selector = undefined;
var sel_tAddressMode: *c.objc_selector = undefined;
var sel_height: *c.objc_selector = undefined;
var sel_resourceOptions: *c.objc_selector = undefined;
var sel_setBinaryFunctions_: *c.objc_selector = undefined;
var sel_blitCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_setBlendColorRed_green_blue_alpha_: *c.objc_selector = undefined;
var sel_setTriangleFillMode_: *c.objc_selector = undefined;
var sel_setLabel_: *c.objc_selector = undefined;
var sel_setSwizzle_: *c.objc_selector = undefined;
var sel_renderPassDescriptor: *c.objc_selector = undefined;
var sel_newDefaultLibrary: *c.objc_selector = undefined;
var sel_synchronizeTexture_slice_level_: *c.objc_selector = undefined;
var sel_bufferDataType: *c.objc_selector = undefined;
var sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_boundingBoxBufferOffset: *c.objc_selector = undefined;
var sel_setPrimitiveDataElementSize_: *c.objc_selector = undefined;
var sel_GPUEndTime: *c.objc_selector = undefined;
var sel_reset: *c.objc_selector = undefined;
var sel_supports32BitFloatFiltering: *c.objc_selector = undefined;
var sel_memoryBarrierWithScope_: *c.objc_selector = undefined;
var sel_setInstanceDescriptorBufferOffset_: *c.objc_selector = undefined;
var sel_setInsertLibraries_: *c.objc_selector = undefined;
var sel_memoryBarrierWithResources_count_: *c.objc_selector = undefined;
var sel_maxAnisotropy: *c.objc_selector = undefined;
var sel_constantDataAtIndex_: *c.objc_selector = undefined;
var sel_mipmapLevelCount: *c.objc_selector = undefined;
var sel_setIntersectionFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_tileBindings: *c.objc_selector = undefined;
var sel_instanceDescriptorType: *c.objc_selector = undefined;
var sel_setDepthResolveFilter_: *c.objc_selector = undefined;
var sel_setUsage_: *c.objc_selector = undefined;
var sel_tileFunction: *c.objc_selector = undefined;
var sel_motionStartTime: *c.objc_selector = undefined;
var sel_setAccelerationStructure_atIndex_: *c.objc_selector = undefined;
var sel_setMaxTotalThreadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_stencilResolveFilter: *c.objc_selector = undefined;
var sel_visibleFunctionTableDescriptor: *c.objc_selector = undefined;
var sel_renderCommandEncoder: *c.objc_selector = undefined;
var sel_bufferBytesPerRow: *c.objc_selector = undefined;
var sel_layerCount: *c.objc_selector = undefined;
var sel_newArgumentEncoderWithArguments_: *c.objc_selector = undefined;
var sel_newScratchBufferWithMinimumSize_: *c.objc_selector = undefined;
var sel_setFormat_: *c.objc_selector = undefined;
var sel_setAllowGPUOptimizedContents_: *c.objc_selector = undefined;
var sel_data: *c.objc_selector = undefined;
var sel_isDepthWriteEnabled: *c.objc_selector = undefined;
var sel_present: *c.objc_selector = undefined;
var sel_setTileAccelerationStructure_atBufferIndex_: *c.objc_selector = undefined;
var sel_setPreloadedLibraries_: *c.objc_selector = undefined;
var sel_functionName: *c.objc_selector = undefined;
var sel_setMaxTotalThreadgroupsPerMeshGrid_: *c.objc_selector = undefined;
var sel_setTAddressMode_: *c.objc_selector = undefined;
var sel_objectBindings: *c.objc_selector = undefined;
var sel_mutability: *c.objc_selector = undefined;
var sel_setTessellationOutputWindingOrder_: *c.objc_selector = undefined;
var sel_serializeToURL_error_: *c.objc_selector = undefined;
var sel_objectThreadExecutionWidth: *c.objc_selector = undefined;
var sel_newTextureWithDescriptor_: *c.objc_selector = undefined;
var sel_setVertexIntersectionFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_setDepthPlane_: *c.objc_selector = undefined;
var sel_useHeap_stages_: *c.objc_selector = undefined;
var sel_optimizeContentsForCPUAccess_: *c.objc_selector = undefined;
var sel_setVertexDescriptor_: *c.objc_selector = undefined;
var sel_startCaptureWithScope_: *c.objc_selector = undefined;
var sel_heap: *c.objc_selector = undefined;
var sel_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_: *c.objc_selector = undefined;
var sel_supports32BitMSAA: *c.objc_selector = undefined;
var sel_setArguments_: *c.objc_selector = undefined;
var sel_setTessellationFactorStepFunction_: *c.objc_selector = undefined;
var sel_renderCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_newBufferWithLength_options_offset_: *c.objc_selector = undefined;
var sel_objectFunction: *c.objc_selector = undefined;
var sel_isFramebufferOnly: *c.objc_selector = undefined;
var sel_inheritPipelineState: *c.objc_selector = undefined;
var sel_setDefaultCaptureScope_: *c.objc_selector = undefined;
var sel_boundingBoxBuffer: *c.objc_selector = undefined;
var sel_setMaxCommandsInFlight_: *c.objc_selector = undefined;
var sel_location: *c.objc_selector = undefined;
var sel_newBufferWithBytes_length_options_: *c.objc_selector = undefined;
var sel_addPresentedHandler_: *c.objc_selector = undefined;
var sel_setRenderTargetHeight_: *c.objc_selector = undefined;
var sel_setStepRate_: *c.objc_selector = undefined;
var sel_executeCommandsInBuffer_withRange_: *c.objc_selector = undefined;
var sel_languageVersion: *c.objc_selector = undefined;
var sel_vertexFormat: *c.objc_selector = undefined;
var sel_setDepthBias_slopeScale_clamp_: *c.objc_selector = undefined;
var sel_tessellationPartitionMode: *c.objc_selector = undefined;
var sel_magFilter: *c.objc_selector = undefined;
var sel_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_: *c.objc_selector = undefined;
var sel_newCommandQueue: *c.objc_selector = undefined;
var sel_newFunctionWithDescriptor_error_: *c.objc_selector = undefined;
var sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_setSupportArgumentBuffers_: *c.objc_selector = undefined;
var sel_isPatchData: *c.objc_selector = undefined;
var sel_meshFunction: *c.objc_selector = undefined;
var sel_outputURL: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithDescriptor_completionHandler_: *c.objc_selector = undefined;
var sel_heapOffset: *c.objc_selector = undefined;
var sel_setStencilCompareFunction_: *c.objc_selector = undefined;
var sel_privateFunctions: *c.objc_selector = undefined;
var sel_setIndexBufferIndex_: *c.objc_selector = undefined;
var sel_setMaxVertexCallStackDepth_: *c.objc_selector = undefined;
var sel_setDepthStencilState_: *c.objc_selector = undefined;
var sel_geometryDescriptors: *c.objc_selector = undefined;
var sel_boundingBoxStride: *c.objc_selector = undefined;
var sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_: *c.objc_selector = undefined;
var sel_commandBufferWithUnretainedReferences: *c.objc_selector = undefined;
var sel_setCounterSet_: *c.objc_selector = undefined;
var sel_setScissorRects_count_: *c.objc_selector = undefined;
var sel_setRenderTargetArrayLength_: *c.objc_selector = undefined;
var sel_threadgroupMemoryAlignment: *c.objc_selector = undefined;
var sel_dispatchThreadgroups_threadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_setFragmentIntersectionFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_areBarycentricCoordsSupported: *c.objc_selector = undefined;
var sel_setLoadAction_: *c.objc_selector = undefined;
var sel_setTileBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_synchronizeResource_: *c.objc_selector = undefined;
var sel_logs: *c.objc_selector = undefined;
var sel_newVisibleFunctionTableWithDescriptor_stage_: *c.objc_selector = undefined;
var sel_getBytes_bytesPerRow_fromRegion_mipmapLevel_: *c.objc_selector = undefined;
var sel_groups: *c.objc_selector = undefined;
var sel_setDepthClipMode_: *c.objc_selector = undefined;
var sel_motionTransformBufferOffset: *c.objc_selector = undefined;
var sel_setMaxTotalThreadsPerObjectThreadgroup_: *c.objc_selector = undefined;
var sel_setTileTextures_withRange_: *c.objc_selector = undefined;
var sel_computeFunction: *c.objc_selector = undefined;
var sel_setVertexFunction_: *c.objc_selector = undefined;
var sel_type: *c.objc_selector = undefined;
var sel_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_: *c.objc_selector = undefined;
var sel_waitUntilScheduled: *c.objc_selector = undefined;
var sel_setThreadGroupSizeIsMultipleOfThreadExecutionWidth_: *c.objc_selector = undefined;
var sel_allowGPUOptimizedContents: *c.objc_selector = undefined;
var sel_primitiveDataElementSize: *c.objc_selector = undefined;
var sel_isAlphaToOneEnabled: *c.objc_selector = undefined;
var sel_getDefaultSamplePositions_count_: *c.objc_selector = undefined;
var sel_setBufferIndex_: *c.objc_selector = undefined;
var sel_setMotionEndBorderMode_: *c.objc_selector = undefined;
var sel_maxVertexBufferBindCount: *c.objc_selector = undefined;
var sel_opaque: *c.objc_selector = undefined;
var sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_setStoreActionOptions_: *c.objc_selector = undefined;
var sel_label: *c.objc_selector = undefined;
var sel_setScratchBufferAllocator_: *c.objc_selector = undefined;
var sel_setStageInRegion_: *c.objc_selector = undefined;
var sel_counters: *c.objc_selector = undefined;
var sel_rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_: *c.objc_selector = undefined;
var sel_setTileBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_setBuffer_: *c.objc_selector = undefined;
var sel_startOfVertexSampleIndex: *c.objc_selector = undefined;
var sel_supportsPullModelInterpolation: *c.objc_selector = undefined;
var sel_preserveInvariance: *c.objc_selector = undefined;
var sel_setColorStoreAction_atIndex_: *c.objc_selector = undefined;
var sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_: *c.objc_selector = undefined;
var sel_compileSymbolVisibility: *c.objc_selector = undefined;
var sel_setImageblockSampleLength_: *c.objc_selector = undefined;
var sel_setRasterSampleCount_: *c.objc_selector = undefined;
var sel_meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: *c.objc_selector = undefined;
var sel_objectPayloadDataSize: *c.objc_selector = undefined;
var sel_fragmentArguments: *c.objc_selector = undefined;
var sel_setObjectTexture_atIndex_: *c.objc_selector = undefined;
var sel_meshBuffers: *c.objc_selector = undefined;
var sel_newSharedTextureWithDescriptor_: *c.objc_selector = undefined;
var sel_endOfVertexSampleIndex: *c.objc_selector = undefined;
var sel_meshBindings: *c.objc_selector = undefined;
var sel_setStride_: *c.objc_selector = undefined;
var sel_isShareable: *c.objc_selector = undefined;
var sel_dispatchType: *c.objc_selector = undefined;
var sel_level: *c.objc_selector = undefined;
var sel_setThreadgroupMemoryLength_atIndex_: *c.objc_selector = undefined;
var sel_setResourceOptions_: *c.objc_selector = undefined;
var sel_libraryType: *c.objc_selector = undefined;
var sel_usage: *c.objc_selector = undefined;
var sel_setEndOfEncoderSampleIndex_: *c.objc_selector = undefined;
var sel_presentAtTime_: *c.objc_selector = undefined;
var sel_setVertexBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_newIntersectionFunctionTableWithDescriptor_: *c.objc_selector = undefined;
var sel_stopCapture: *c.objc_selector = undefined;
var sel_setAlphaToOneEnabled_: *c.objc_selector = undefined;
var sel_isBlendingEnabled: *c.objc_selector = undefined;
var sel_setLevel_: *c.objc_selector = undefined;
var sel_fragmentBindings: *c.objc_selector = undefined;
var sel_setViewport_: *c.objc_selector = undefined;
var sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_: *c.objc_selector = undefined;
var sel_setObject_atIndexedSubscript_: *c.objc_selector = undefined;
var sel_setStoreAction_: *c.objc_selector = undefined;
var sel_setVertexSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_setVertexSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_notifyListener_atValue_block_: *c.objc_selector = undefined;
var sel_addFunctionWithDescriptor_library_error_: *c.objc_selector = undefined;
var sel_popDebugGroup: *c.objc_selector = undefined;
var sel_setBoundingBoxBuffer_: *c.objc_selector = undefined;
var sel_resetCommandsInBuffer_withRange_: *c.objc_selector = undefined;
var sel_vertexBindings: *c.objc_selector = undefined;
var sel_functionCount: *c.objc_selector = undefined;
var sel_gpuResourceID: *c.objc_selector = undefined;
var sel_textureType: *c.objc_selector = undefined;
var sel_setVisibleFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_updateTextureMapping_mode_region_mipLevel_slice_: *c.objc_selector = undefined;
var sel_maxSampleCount: *c.objc_selector = undefined;
var sel_buffers: *c.objc_selector = undefined;
var sel_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithMeshDescriptor_options_reflection_error_: *c.objc_selector = undefined;
var sel_setIndirectCommandBuffer_atIndex_: *c.objc_selector = undefined;
var sel_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_: *c.objc_selector = undefined;
var sel_setMeshBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_functionType: *c.objc_selector = undefined;
var sel_setType_: *c.objc_selector = undefined;
var sel_optimizationLevel: *c.objc_selector = undefined;
var sel_setDepthStoreActionOptions_: *c.objc_selector = undefined;
var sel_payloadMemoryLength: *c.objc_selector = undefined;
var sel_setVertexFormat_: *c.objc_selector = undefined;
var sel_setInstanceDescriptorStride_: *c.objc_selector = undefined;
var sel_depthCompareFunction: *c.objc_selector = undefined;
var sel_errorState: *c.objc_selector = undefined;
var sel_threadGroupSizeIsMultipleOfThreadExecutionWidth: *c.objc_selector = undefined;
var sel_newAccelerationStructureWithDescriptor_: *c.objc_selector = undefined;
var sel_installName: *c.objc_selector = undefined;
var sel_setLanguageVersion_: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithDescriptor_error_: *c.objc_selector = undefined;
var sel_setRenderPipelineState_atIndex_: *c.objc_selector = undefined;
var sel_supportRayTracing: *c.objc_selector = undefined;
var sel_rasterizationRateMapDescriptorWithScreenSize_layer_: *c.objc_selector = undefined;
var sel_threadgroupMemoryLength: *c.objc_selector = undefined;
var sel_tileArguments: *c.objc_selector = undefined;
var sel_boundingBoxCount: *c.objc_selector = undefined;
var sel_elementType: *c.objc_selector = undefined;
var sel_depthFailureOperation: *c.objc_selector = undefined;
var sel_textureReferenceType: *c.objc_selector = undefined;
var sel_useHeap_: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithDescriptor_options_completionHandler_: *c.objc_selector = undefined;
var sel_peerIndex: *c.objc_selector = undefined;
var sel_setControlDependencies_: *c.objc_selector = undefined;
var sel_endOfEncoderSampleIndex: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_: *c.objc_selector = undefined;
var sel_setStageInRegionWithIndirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_heapAccelerationStructureSizeAndAlignWithDescriptor_: *c.objc_selector = undefined;
var sel_addTileRenderPipelineFunctionsWithDescriptor_error_: *c.objc_selector = undefined;
var sel_convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_: *c.objc_selector = undefined;
var sel_setArgumentBuffer_offset_: *c.objc_selector = undefined;
var sel_setSparsePageSize_: *c.objc_selector = undefined;
var sel_stageInputOutputDescriptor: *c.objc_selector = undefined;
var sel_setTileSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_parallelRenderCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_setAccelerationStructure_atBufferIndex_: *c.objc_selector = undefined;
var sel_newSharedEventWithHandle_: *c.objc_selector = undefined;
var sel_stencilAttachment: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithFunction_error_: *c.objc_selector = undefined;
var sel_setClearColor_: *c.objc_selector = undefined;
var sel_generateMipmapsForTexture_: *c.objc_selector = undefined;
var sel_setStencilAttachment_: *c.objc_selector = undefined;
var sel_insertDebugCaptureBoundary: *c.objc_selector = undefined;
var sel_optimizeContentsForCPUAccess_slice_level_: *c.objc_selector = undefined;
var sel_setFrontFaceStencil_: *c.objc_selector = undefined;
var sel_copyParameterDataToBuffer_offset_: *c.objc_selector = undefined;
var sel_supportAddingFragmentBinaryFunctions: *c.objc_selector = undefined;
var sel_beginScope: *c.objc_selector = undefined;
var sel_textureBarrier: *c.objc_selector = undefined;
var sel_useResource_usage_stages_: *c.objc_selector = undefined;
var sel_setFragmentVisibleFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_specializedName: *c.objc_selector = undefined;
var sel_stencilFailureOperation: *c.objc_selector = undefined;
var sel_commandTypes: *c.objc_selector = undefined;
var sel_setRenderPipelineStates_withRange_: *c.objc_selector = undefined;
var sel_setComputePipelineState_atIndex_: *c.objc_selector = undefined;
var sel_supportIndirectCommandBuffers: *c.objc_selector = undefined;
var sel_setStencilStoreAction_: *c.objc_selector = undefined;
var sel_setMipFilter_: *c.objc_selector = undefined;
var sel_newFence: *c.objc_selector = undefined;
var sel_setPurgeableState_: *c.objc_selector = undefined;
var sel_textureDataType: *c.objc_selector = undefined;
var sel_isAlphaToCoverageEnabled: *c.objc_selector = undefined;
var sel_destination: *c.objc_selector = undefined;
var sel_setResolveDepthPlane_: *c.objc_selector = undefined;
var sel_setImageblockWidth_height_: *c.objc_selector = undefined;
var sel_setSourceRGBBlendFactor_: *c.objc_selector = undefined;
var sel_newSharedTextureWithHandle_: *c.objc_selector = undefined;
var sel_setVisibleFunctionTables_withRange_: *c.objc_selector = undefined;
var sel_indexBufferIndex: *c.objc_selector = undefined;
var sel_setMeshBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_setPriority_: *c.objc_selector = undefined;
var sel_binaryArchives: *c.objc_selector = undefined;
var sel_resolveCounters_inRange_destinationBuffer_destinationOffset_: *c.objc_selector = undefined;
var sel_setBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_functions: *c.objc_selector = undefined;
var sel_readMask: *c.objc_selector = undefined;
var sel_computeCommandEncoderWithDispatchType_: *c.objc_selector = undefined;
var sel_isSparse: *c.objc_selector = undefined;
var sel_setMeshSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_setFunctions_: *c.objc_selector = undefined;
var sel_supportsPrimitiveMotionBlur: *c.objc_selector = undefined;
var sel_setShouldMaximizeConcurrentCompilation_: *c.objc_selector = undefined;
var sel_setClearStencil_: *c.objc_selector = undefined;
var sel_minFilter: *c.objc_selector = undefined;
var sel_setDestinationRGBBlendFactor_: *c.objc_selector = undefined;
var sel_setNormalizedCoordinates_: *c.objc_selector = undefined;
var sel_addScheduledHandler_: *c.objc_selector = undefined;
var sel_isDepth24Stencil8PixelFormatSupported: *c.objc_selector = undefined;
var sel_setTileVisibleFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_memoryBarrierWithResources_count_afterStages_beforeStages_: *c.objc_selector = undefined;
var sel_vertexBuffers: *c.objc_selector = undefined;
var sel_setTextures_withRange_: *c.objc_selector = undefined;
var sel_setStartOfVertexSampleIndex_: *c.objc_selector = undefined;
var sel_setMeshTextures_withRange_: *c.objc_selector = undefined;
var sel_encodeSignalEvent_value_: *c.objc_selector = undefined;
var sel_descriptor: *c.objc_selector = undefined;
var sel_setTransformationMatrixBufferOffset_: *c.objc_selector = undefined;
var sel_startOfEncoderSampleIndex: *c.objc_selector = undefined;
var sel_newIOHandleWithURL_compressionMethod_error_: *c.objc_selector = undefined;
var sel_heapAccelerationStructureSizeAndAlignWithSize_: *c.objc_selector = undefined;
var sel_maxBufferLength: *c.objc_selector = undefined;
var sel_setBoundingBoxBuffers_: *c.objc_selector = undefined;
var sel_writeMask: *c.objc_selector = undefined;
var sel_textureCubeDescriptorWithPixelFormat_size_mipmapped_: *c.objc_selector = undefined;
var sel_staticThreadgroupMemoryLength: *c.objc_selector = undefined;
var sel_newTextureViewWithPixelFormat_textureType_levels_slices_: *c.objc_selector = undefined;
var sel_setLinkedFunctions_: *c.objc_selector = undefined;
var sel_colorAttachments: *c.objc_selector = undefined;
var sel_maxCallStackDepth: *c.objc_selector = undefined;
var sel_sparsePageSize: *c.objc_selector = undefined;
var sel_supportsFamily_: *c.objc_selector = undefined;
var sel_setPrimitiveDataStride_: *c.objc_selector = undefined;
var sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_: *c.objc_selector = undefined;
var sel_resourceStateCommandEncoder: *c.objc_selector = undefined;
var sel_setObjectBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_setSampleBuffer_: *c.objc_selector = undefined;
var sel_setComputeFunction_: *c.objc_selector = undefined;
var sel_isDepthTexture: *c.objc_selector = undefined;
var sel_parentRelativeSlice: *c.objc_selector = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_: *c.objc_selector = undefined;
var sel_setMaxFragmentCallStackDepth_: *c.objc_selector = undefined;
var sel_primitiveDataStride: *c.objc_selector = undefined;
var sel_instanceDescriptorBuffer: *c.objc_selector = undefined;
var sel_setIndex_: *c.objc_selector = undefined;
var sel_setSupportAddingFragmentBinaryFunctions_: *c.objc_selector = undefined;
var sel_setSpecializedName_: *c.objc_selector = undefined;
var sel_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_: *c.objc_selector = undefined;
var sel_initWithName_arguments_controlDependencies_: *c.objc_selector = undefined;
var sel_setInstanceCount_: *c.objc_selector = undefined;
var sel_structType: *c.objc_selector = undefined;
var sel_setCommandTypes_: *c.objc_selector = undefined;
var sel_layers: *c.objc_selector = undefined;
var sel_vertexPreloadedLibraries: *c.objc_selector = undefined;
var sel_stepRate: *c.objc_selector = undefined;
var sel_URL: *c.objc_selector = undefined;
var sel_isAliasable: *c.objc_selector = undefined;
var sel_layouts: *c.objc_selector = undefined;
var sel_setBinaryArchives_: *c.objc_selector = undefined;
var sel_maxThreadgroupMemoryLength: *c.objc_selector = undefined;
var sel_setMaxVertexAmplificationCount_: *c.objc_selector = undefined;
var sel_supportsFunctionPointersFromRender: *c.objc_selector = undefined;
var sel_supportAddingBinaryFunctions: *c.objc_selector = undefined;
var sel_setOpaqueTriangleIntersectionFunctionWithSignature_withRange_: *c.objc_selector = undefined;
var sel_updateTextureMappings_mode_regions_mipLevels_slices_numRegions_: *c.objc_selector = undefined;
var sel_motionStartBorderMode: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithDescriptor_options_completionHandler_: *c.objc_selector = undefined;
var sel_startOfFragmentSampleIndex: *c.objc_selector = undefined;
var sel_removeAllDebugMarkers: *c.objc_selector = undefined;
var sel_kernelEndTime: *c.objc_selector = undefined;
var sel_isUsed: *c.objc_selector = undefined;
var sel_indirectRenderCommandAtIndex_: *c.objc_selector = undefined;
var sel_setTessellationFactorFormat_: *c.objc_selector = undefined;
var sel_constantBlockAlignment: *c.objc_selector = undefined;
var sel_updateFence_afterStages_: *c.objc_selector = undefined;
var sel_setMotionEndTime_: *c.objc_selector = undefined;
var sel_setComputePipelineState_: *c.objc_selector = undefined;
var sel_horizontal: *c.objc_selector = undefined;
var sel_setObjectTextures_withRange_: *c.objc_selector = undefined;
var sel_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_setScreenSize_: *c.objc_selector = undefined;
var sel_textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_: *c.objc_selector = undefined;
var sel_copyAccelerationStructure_toAccelerationStructure_: *c.objc_selector = undefined;
var sel_setAttributes_: *c.objc_selector = undefined;
var sel_resetWithRange_: *c.objc_selector = undefined;
var sel_setFragmentBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_compareFunction: *c.objc_selector = undefined;
var sel_newRasterizationRateMapWithDescriptor_: *c.objc_selector = undefined;
var sel_setScissorRect_: *c.objc_selector = undefined;
var sel_setStencilFrontReferenceValue_backReferenceValue_: *c.objc_selector = undefined;
var sel_fragmentBuffers: *c.objc_selector = undefined;
var sel_instanceDescriptorBufferOffset: *c.objc_selector = undefined;
var sel_setOptimizationLevel_: *c.objc_selector = undefined;
var sel_parameterBufferSizeAndAlign: *c.objc_selector = undefined;
var sel_instanceDescriptorStride: *c.objc_selector = undefined;
var sel_setDefaultRasterSampleCount_: *c.objc_selector = undefined;
var sel_alphaBlendOperation: *c.objc_selector = undefined;
var sel_setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_: *c.objc_selector = undefined;
var sel_setResolveSlice_: *c.objc_selector = undefined;
var sel_setBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_elementStructType: *c.objc_selector = undefined;
var sel_isHeadless: *c.objc_selector = undefined;
var sel_areProgrammableSamplePositionsSupported: *c.objc_selector = undefined;
var sel_useHeaps_count_stages_: *c.objc_selector = undefined;
var sel_newFunctionWithName_constantValues_error_: *c.objc_selector = undefined;
var sel_setPreserveInvariance_: *c.objc_selector = undefined;
var sel_remoteStorageBuffer: *c.objc_selector = undefined;
var sel_boundingBoxBuffers: *c.objc_selector = undefined;
var sel_setDestinationAlphaBlendFactor_: *c.objc_selector = undefined;
var sel_setBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_: *c.objc_selector = undefined;
var sel_drawableID: *c.objc_selector = undefined;
var sel_setVertexTextures_withRange_: *c.objc_selector = undefined;
var sel_commandBufferWithDescriptor_: *c.objc_selector = undefined;
var sel_retainedReferences: *c.objc_selector = undefined;
var sel_setRgbBlendOperation_: *c.objc_selector = undefined;
var sel_rasterizationRateMapDescriptorWithScreenSize_: *c.objc_selector = undefined;
var sel_setSupportAddingVertexBinaryFunctions_: *c.objc_selector = undefined;
var sel_depth: *c.objc_selector = undefined;
var sel_indexBuffer: *c.objc_selector = undefined;
var sel_setConstantValue_type_withName_: *c.objc_selector = undefined;
var sel_initWithSampleCount_horizontal_vertical_: *c.objc_selector = undefined;
var sel_newArgumentEncoderWithBufferIndex_: *c.objc_selector = undefined;
var sel_functionNames: *c.objc_selector = undefined;
var sel_inputPrimitiveTopology: *c.objc_selector = undefined;
var sel_libraries: *c.objc_selector = undefined;
var sel_setTileWidth_: *c.objc_selector = undefined;
var sel_storeActionOptions: *c.objc_selector = undefined;
var sel_threadgroupSizeMatchesTileSize: *c.objc_selector = undefined;
var sel_setMinFilter_: *c.objc_selector = undefined;
var sel_usedSize: *c.objc_selector = undefined;
var sel_setStepFunction_: *c.objc_selector = undefined;
var sel_waitForFence_: *c.objc_selector = undefined;
var sel_setTessellationFactorBuffer_offset_instanceStride_: *c.objc_selector = undefined;
var sel_setThreadgroupMemoryLength_offset_atIndex_: *c.objc_selector = undefined;
var sel_setPrivateFunctions_: *c.objc_selector = undefined;
var sel_screenSize: *c.objc_selector = undefined;
var sel_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_commandQueue: *c.objc_selector = undefined;
var sel_accelerationStructureCommandEncoder: *c.objc_selector = undefined;
var sel_line: *c.objc_selector = undefined;
var sel_newRemoteTextureViewForDevice_: *c.objc_selector = undefined;
var sel_setColorStoreActionOptions_atIndex_: *c.objc_selector = undefined;
var sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_: *c.objc_selector = undefined;
var sel_setReadMask_: *c.objc_selector = undefined;
var sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_: *c.objc_selector = undefined;
var sel_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_: *c.objc_selector = undefined;
var sel_setInputPrimitiveTopology_: *c.objc_selector = undefined;
var sel_initWithDispatchQueue_: *c.objc_selector = undefined;
var sel_offset: *c.objc_selector = undefined;
var sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_linkedFunctions: *c.objc_selector = undefined;
var sel_newLibraryWithURL_error_: *c.objc_selector = undefined;
var sel_setStencilFailureOperation_: *c.objc_selector = undefined;
var sel_isRasterizationEnabled: *c.objc_selector = undefined;
var sel_bufferOffset: *c.objc_selector = undefined;
var sel_argumentDescriptor: *c.objc_selector = undefined;
var sel_dispatchThreadsPerTile_: *c.objc_selector = undefined;
var sel_hasUnifiedMemory: *c.objc_selector = undefined;
var sel_encoderLabel: *c.objc_selector = undefined;
var sel_signaledValue: *c.objc_selector = undefined;
var sel_setDepthStoreAction_: *c.objc_selector = undefined;
var sel_objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: *c.objc_selector = undefined;
var sel_maxTotalThreadsPerThreadgroup: *c.objc_selector = undefined;
var sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_supportAddingVertexBinaryFunctions: *c.objc_selector = undefined;
var sel_newAccelerationStructureWithSize_: *c.objc_selector = undefined;
var sel_objectAtIndexedSubscript_: *c.objc_selector = undefined;
var sel_setIntersectionFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_fragmentFunction: *c.objc_selector = undefined;
var sel_setIndexBufferOffset_: *c.objc_selector = undefined;
var sel_insertDebugSignpost_: *c.objc_selector = undefined;
var sel_setMeshBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_presentedTime: *c.objc_selector = undefined;
var sel_sampleTimestamps_gpuTimestamp_: *c.objc_selector = undefined;
var sel_functionDescriptor: *c.objc_selector = undefined;
var sel_depthPlane: *c.objc_selector = undefined;
var sel_fillBuffer_range_value_: *c.objc_selector = undefined;
var sel_useResources_count_usage_stages_: *c.objc_selector = undefined;
var sel_setVisibleFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_encodedLength: *c.objc_selector = undefined;
var sel_setObjectSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_setFragmentIntersectionFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_shouldMaximizeConcurrentCompilation: *c.objc_selector = undefined;
var sel_GPUStartTime: *c.objc_selector = undefined;
var sel_primitiveDataBuffer: *c.objc_selector = undefined;
var sel_isActive: *c.objc_selector = undefined;
var sel_commandBuffer: *c.objc_selector = undefined;
var sel_insertLibraries: *c.objc_selector = undefined;
var sel_tailSizeInBytes: *c.objc_selector = undefined;
var sel_setCompressionType_: *c.objc_selector = undefined;
var sel_column: *c.objc_selector = undefined;
var sel_enqueueBarrier: *c.objc_selector = undefined;
var sel_isTessellationFactorScaleEnabled: *c.objc_selector = undefined;
var sel_setUrl_: *c.objc_selector = undefined;
var sel_loadBytes_size_sourceHandle_sourceHandleOffset_: *c.objc_selector = undefined;
var sel_setRasterizationEnabled_: *c.objc_selector = undefined;
var sel_maxKernelBufferBindCount: *c.objc_selector = undefined;
var sel_supportsBCTextureCompression: *c.objc_selector = undefined;
var sel_argumentBuffersSupport: *c.objc_selector = undefined;
var sel_setStartOfFragmentSampleIndex_: *c.objc_selector = undefined;
var sel_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_newFunctionWithName_constantValues_completionHandler_: *c.objc_selector = undefined;
var sel_verticalSampleStorage: *c.objc_selector = undefined;
var sel_setPreprocessorMacros_: *c.objc_selector = undefined;
var sel_setStageInputDescriptor_: *c.objc_selector = undefined;
var sel_setCullMode_: *c.objc_selector = undefined;
var sel_motionTransformCount: *c.objc_selector = undefined;
var sel_maxCommandsInFlight: *c.objc_selector = undefined;
var sel_setDepthCompareFunction_: *c.objc_selector = undefined;
var sel_setDepthStencilPassOperation_: *c.objc_selector = undefined;
var sel_setTileSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_motionEndBorderMode: *c.objc_selector = undefined;
var sel_areRasterOrderGroupsSupported: *c.objc_selector = undefined;
var sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_: *c.objc_selector = undefined;
var sel_setPixelFormat_: *c.objc_selector = undefined;
var sel_setLibraries_: *c.objc_selector = undefined;
var sel_setTextureType_: *c.objc_selector = undefined;
var sel_newArgumentEncoderForBufferAtIndex_: *c.objc_selector = undefined;
var sel_newFunctionWithDescriptor_completionHandler_: *c.objc_selector = undefined;
var sel_newFunctionWithName_: *c.objc_selector = undefined;
var sel_makeAliasable: *c.objc_selector = undefined;
var sel_newIntersectionFunctionWithDescriptor_error_: *c.objc_selector = undefined;
var sel_bufferAlignment: *c.objc_selector = undefined;
var sel_isRemovable: *c.objc_selector = undefined;
var sel_dispatchThreads_threadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_setIntersectionFunctionTable_atIndex_: *c.objc_selector = undefined;
var sel_clearDepth: *c.objc_selector = undefined;
var sel_rgbBlendOperation: *c.objc_selector = undefined;
var sel_getSamplePositions_count_: *c.objc_selector = undefined;
var sel_setDepthAttachmentPixelFormat_: *c.objc_selector = undefined;
var sel_dataSize: *c.objc_selector = undefined;
var sel_sourceAlphaBlendFactor: *c.objc_selector = undefined;
var sel_threadExecutionWidth: *c.objc_selector = undefined;
var sel_supportsDynamicLibraries: *c.objc_selector = undefined;
var sel_setMeshTexture_atIndex_: *c.objc_selector = undefined;
var sel_loadAction: *c.objc_selector = undefined;
var sel_sampleCount: *c.objc_selector = undefined;
var sel_locationNumber: *c.objc_selector = undefined;
var sel_newAccelerationStructureWithSize_offset_: *c.objc_selector = undefined;
var sel_isCapturing: *c.objc_selector = undefined;
var sel_bufferIndex: *c.objc_selector = undefined;
var sel_index: *c.objc_selector = undefined;
var sel_recommendedMaxWorkingSetSize: *c.objc_selector = undefined;
var sel_arrayLength: *c.objc_selector = undefined;
var sel_newLibraryWithSource_options_error_: *c.objc_selector = undefined;
var sel_setSourceAlphaBlendFactor_: *c.objc_selector = undefined;
var sel_newDynamicLibraryWithURL_error_: *c.objc_selector = undefined;
var sel_heapTextureSizeAndAlignWithDescriptor_: *c.objc_selector = undefined;
var sel_stageInputAttributes: *c.objc_selector = undefined;
var sel_members: *c.objc_selector = undefined;
var sel_setFragmentAdditionalBinaryFunctions_: *c.objc_selector = undefined;
var sel_setTexture_atIndex_: *c.objc_selector = undefined;
var sel_captureObject: *c.objc_selector = undefined;
var sel_addBarrier: *c.objc_selector = undefined;
var sel_supportArgumentBuffers: *c.objc_selector = undefined;
var sel_vertexStride: *c.objc_selector = undefined;
var sel_setBoundingBoxStride_: *c.objc_selector = undefined;
var sel_setStartOfEncoderSampleIndex_: *c.objc_selector = undefined;
var sel_setMagFilter_: *c.objc_selector = undefined;
var sel_setArgumentIndex_: *c.objc_selector = undefined;
var sel_parentRelativeLevel: *c.objc_selector = undefined;
var sel_newCaptureScopeWithCommandQueue_: *c.objc_selector = undefined;
var sel_setSlice_: *c.objc_selector = undefined;
var sel_pixelFormat: *c.objc_selector = undefined;
var sel_argumentIndexStride: *c.objc_selector = undefined;
var sel_kernelStartTime: *c.objc_selector = undefined;
var sel_destinationRGBBlendFactor: *c.objc_selector = undefined;
var sel_rasterSampleCount: *c.objc_selector = undefined;
var sel_maxArgumentBufferSamplerCount: *c.objc_selector = undefined;
var sel_argumentIndex: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithDescriptor_options_reflection_error_: *c.objc_selector = undefined;
var sel_normalizedCoordinates: *c.objc_selector = undefined;
var sel_setVertexAccelerationStructure_atBufferIndex_: *c.objc_selector = undefined;
var sel_heapBufferSizeAndAlignWithLength_options_: *c.objc_selector = undefined;
var sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_currentAllocatedSize: *c.objc_selector = undefined;
var sel_objectBuffers: *c.objc_selector = undefined;
var sel_accelerationStructureCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_: *c.objc_selector = undefined;
var sel_alignment: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithTileDescriptor_options_reflection_error_: *c.objc_selector = undefined;
var sel_resolveDepthPlane: *c.objc_selector = undefined;
var sel_threadgroupMemoryDataSize: *c.objc_selector = undefined;
var sel_setConstantValues_type_withRange_: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithDescriptor_options_reflection_error_: *c.objc_selector = undefined;
var sel_fragmentLinkedFunctions: *c.objc_selector = undefined;
var sel_setIndirectCommandBuffers_withRange_: *c.objc_selector = undefined;
var sel_startCaptureWithDescriptor_error_: *c.objc_selector = undefined;
var sel_function: *c.objc_selector = undefined;
var sel_intersectionFunctionTableOffset: *c.objc_selector = undefined;
var sel_fragmentAdditionalBinaryFunctions: *c.objc_selector = undefined;
var sel_blitPassDescriptor: *c.objc_selector = undefined;
var sel_preprocessorMacros: *c.objc_selector = undefined;
var sel_sourceRGBBlendFactor: *c.objc_selector = undefined;
var sel_blitCommandEncoder: *c.objc_selector = undefined;
var sel_setInstallName_: *c.objc_selector = undefined;
var sel_lodMaxClamp: *c.objc_selector = undefined;
var sel_setVertexBuffers_: *c.objc_selector = undefined;
var sel_defaultCaptureScope: *c.objc_selector = undefined;
var sel_signalEvent_value_: *c.objc_selector = undefined;
var sel_setEndOfFragmentSampleIndex_: *c.objc_selector = undefined;
var sel_tileBuffers: *c.objc_selector = undefined;
var sel_vertexArguments: *c.objc_selector = undefined;
var sel_setOutputNode_: *c.objc_selector = undefined;
var sel_vertexFunction: *c.objc_selector = undefined;
var sel_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_: *c.objc_selector = undefined;
var sel_required: *c.objc_selector = undefined;
var sel_setTessellationControlPointIndexType_: *c.objc_selector = undefined;
var sel_mipFilter: *c.objc_selector = undefined;
var sel_setInheritPipelineState_: *c.objc_selector = undefined;
var sel_maximumConcurrentCompilationTaskCount: *c.objc_selector = undefined;
var sel_setSAddressMode_: *c.objc_selector = undefined;
var sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_: *c.objc_selector = undefined;
var sel_newIndirectCommandBufferWithDescriptor_maxCommandCount_options_: *c.objc_selector = undefined;
var sel_indexType: *c.objc_selector = undefined;
var sel_setVertexBuffers_offsets_withRange_: *c.objc_selector = undefined;
var sel_useHeaps_count_: *c.objc_selector = undefined;
var sel_resolveTexture: *c.objc_selector = undefined;
var sel_waitForEvent_value_: *c.objc_selector = undefined;
var sel_newHeapWithDescriptor_: *c.objc_selector = undefined;
var sel_setVertexAdditionalBinaryFunctions_: *c.objc_selector = undefined;
var sel_resolveSlice: *c.objc_selector = undefined;
var sel_setFastMathEnabled_: *c.objc_selector = undefined;
var sel_setMaxCallStackDepth_: *c.objc_selector = undefined;
var sel_hazardTrackingMode: *c.objc_selector = undefined;
var sel_setFunctionGraphs_: *c.objc_selector = undefined;
var sel_setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_: *c.objc_selector = undefined;
var sel_layerAtIndex_: *c.objc_selector = undefined;
var sel_minimumTextureBufferAlignmentForPixelFormat_: *c.objc_selector = undefined;
var sel_setVertexBuffer_: *c.objc_selector = undefined;
var sel_supportsQueryTextureLOD: *c.objc_selector = undefined;
var sel_setVertexBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_setObjectBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_setMutability_: *c.objc_selector = undefined;
var sel_vertexLinkedFunctions: *c.objc_selector = undefined;
var sel_newCaptureScopeWithDevice_: *c.objc_selector = undefined;
var sel_supportsRenderDynamicLibraries: *c.objc_selector = undefined;
var sel_pointerType: *c.objc_selector = undefined;
var sel_setFragmentBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_bufferDataSize: *c.objc_selector = undefined;
var sel_setClearDepth_: *c.objc_selector = undefined;
var sel_attributeIndex: *c.objc_selector = undefined;
var sel_setArgumentBuffer_startOffset_arrayElement_: *c.objc_selector = undefined;
var sel_resetTextureAccessCounters_region_mipLevel_slice_: *c.objc_selector = undefined;
var sel_constantValues: *c.objc_selector = undefined;
var sel_copyFromTexture_toTexture_: *c.objc_selector = undefined;
var sel_setStencilAttachmentPixelFormat_: *c.objc_selector = undefined;
var sel_setMaxVertexBufferBindCount_: *c.objc_selector = undefined;
var sel_error: *c.objc_selector = undefined;
var sel_instanceCount: *c.objc_selector = undefined;
var sel_fastMathEnabled: *c.objc_selector = undefined;
var sel_drawPrimitives_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_concurrentDispatchThreads_threadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_presentDrawable_atTime_: *c.objc_selector = undefined;
var sel_newIntersectionFunctionTableWithDescriptor_stage_: *c.objc_selector = undefined;
var sel_readWriteTextureSupport: *c.objc_selector = undefined;
var sel_supportsShaderBarycentricCoordinates: *c.objc_selector = undefined;
var sel_endEncoding: *c.objc_selector = undefined;
var sel_setDispatchType_: *c.objc_selector = undefined;
var sel_useResources_count_usage_: *c.objc_selector = undefined;
var sel_setVisibilityResultMode_offset_: *c.objc_selector = undefined;
var sel_renderTargetWidth: *c.objc_selector = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_: *c.objc_selector = undefined;
var sel_sAddressMode: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithTileDescriptor_options_completionHandler_: *c.objc_selector = undefined;
var sel_startCaptureWithCommandQueue_: *c.objc_selector = undefined;
var sel_setMaxKernelBufferBindCount_: *c.objc_selector = undefined;
var sel_peerGroupID: *c.objc_selector = undefined;
var sel_initWithSampleCount_: *c.objc_selector = undefined;
var sel_waitUntilCompleted: *c.objc_selector = undefined;
var sel_setBlendingEnabled_: *c.objc_selector = undefined;
var sel_size: *c.objc_selector = undefined;
var sel_setOpaque_: *c.objc_selector = undefined;
var sel_supportsRasterizationRateMapWithLayerCount_: *c.objc_selector = undefined;
var sel_storeAction: *c.objc_selector = undefined;
var sel_setMotionStartBorderMode_: *c.objc_selector = undefined;
var sel_setWriteMask_: *c.objc_selector = undefined;
var sel_newCounterSampleBufferWithDescriptor_error_: *c.objc_selector = undefined;
var sel_mapPhysicalToScreenCoordinates_forLayer_: *c.objc_selector = undefined;
var sel_setResolveLevel_: *c.objc_selector = undefined;
var sel_depthAttachmentPixelFormat: *c.objc_selector = undefined;
var sel_setName_: *c.objc_selector = undefined;
var sel_fragmentPreloadedLibraries: *c.objc_selector = undefined;
var sel_setDepth_: *c.objc_selector = undefined;
var sel_newTextureViewWithPixelFormat_: *c.objc_selector = undefined;
var sel_vertexAdditionalBinaryFunctions: *c.objc_selector = undefined;
var sel_setRAddressMode_: *c.objc_selector = undefined;
var sel_setTileIntersectionFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_functionGraphs: *c.objc_selector = undefined;
var sel_computeCommandEncoderWithDescriptor_: *c.objc_selector = undefined;
var sel_optimizeContentsForGPUAccess_: *c.objc_selector = undefined;
var sel_depthResolveFilter: *c.objc_selector = undefined;
var sel_setFunctionName_: *c.objc_selector = undefined;
var sel_newSharedTextureHandle: *c.objc_selector = undefined;
var sel_storageMode: *c.objc_selector = undefined;
var sel_setSupportIndirectCommandBuffers_: *c.objc_selector = undefined;
var sel_setSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_setMotionTransformCount_: *c.objc_selector = undefined;
var sel_encodeWaitForEvent_value_: *c.objc_selector = undefined;
var sel_counterSets: *c.objc_selector = undefined;
var sel_vertical: *c.objc_selector = undefined;
var sel_setSupportAddingBinaryFunctions_: *c.objc_selector = undefined;
var sel_newBufferWithBytesNoCopy_length_options_deallocator_: *c.objc_selector = undefined;
var sel_clearBarrier: *c.objc_selector = undefined;
var sel_binaryFunctions: *c.objc_selector = undefined;
var sel_addRenderPipelineFunctionsWithDescriptor_error_: *c.objc_selector = undefined;
var sel_setVertexPreloadedLibraries_: *c.objc_selector = undefined;
var sel_setVertexBufferOffset_: *c.objc_selector = undefined;
var sel_vertexBufferOffset: *c.objc_selector = undefined;
var sel_newArgumentEncoderWithBufferBinding_: *c.objc_selector = undefined;
var sel_iosurface: *c.objc_selector = undefined;
var sel_newRenderPipelineStateWithMeshDescriptor_options_completionHandler_: *c.objc_selector = undefined;
var sel_imageblockSampleLength: *c.objc_selector = undefined;
var sel_instancedAccelerationStructures: *c.objc_selector = undefined;
var sel_url: *c.objc_selector = undefined;
var sel_setFragmentBufferOffset_atIndex_: *c.objc_selector = undefined;
var sel_setVertexStride_: *c.objc_selector = undefined;
var sel_writeCompactedAccelerationStructureSize_toBuffer_offset_: *c.objc_selector = undefined;
var sel_setTessellationPartitionMode_: *c.objc_selector = undefined;
var sel_setTileFunction_: *c.objc_selector = undefined;
var sel_setFragmentLinkedFunctions_: *c.objc_selector = undefined;
var sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_: *c.objc_selector = undefined;
var sel_setMotionKeyframeCount_: *c.objc_selector = undefined;
var sel_setViewports_count_: *c.objc_selector = undefined;
var sel_newLibraryWithStitchedDescriptor_error_: *c.objc_selector = undefined;
var sel_setBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_resolveCounterRange_: *c.objc_selector = undefined;
var sel_scratchBufferAllocator: *c.objc_selector = undefined;
var sel_functionConstantsDictionary: *c.objc_selector = undefined;
var sel_newSharedEvent: *c.objc_selector = undefined;
var sel_setMaxCommandBufferCount_: *c.objc_selector = undefined;
var sel_supportsFeatureSet_: *c.objc_selector = undefined;
var sel_vertexAttributes: *c.objc_selector = undefined;
var sel_vertexDescriptor: *c.objc_selector = undefined;
var sel_motionTransformBuffer: *c.objc_selector = undefined;
var sel_bindings: *c.objc_selector = undefined;
var sel_intersectionFunctionTableDescriptor: *c.objc_selector = undefined;
var sel_setFragmentVisibleFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_renderTargetHeight: *c.objc_selector = undefined;
var sel_setTessellationFactorScale_: *c.objc_selector = undefined;
var sel_maxThreadsPerThreadgroup: *c.objc_selector = undefined;
var sel_setSamplerState_atIndex_: *c.objc_selector = undefined;
var sel_setTexture_: *c.objc_selector = undefined;
var sel_isLowPower: *c.objc_selector = undefined;
var sel_lodAverage: *c.objc_selector = undefined;
var sel_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_: *c.objc_selector = undefined;
var sel_setFragmentBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_newDepthStencilStateWithDescriptor_: *c.objc_selector = undefined;
var sel_supportsDestination_: *c.objc_selector = undefined;
var sel_triangleCount: *c.objc_selector = undefined;
var sel_newSamplerStateWithDescriptor_: *c.objc_selector = undefined;
var sel_didModifyRange_: *c.objc_selector = undefined;
var sel_patchType: *c.objc_selector = undefined;
var sel_rAddressMode: *c.objc_selector = undefined;
var sel_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_: *c.objc_selector = undefined;
var sel_setIntersectionFunctionTableOffset_: *c.objc_selector = undefined;
var sel_setMaxTessellationFactor_: *c.objc_selector = undefined;
var sel_setLodMaxClamp_: *c.objc_selector = undefined;
var sel_setRenderTargetWidth_: *c.objc_selector = undefined;
var sel_initWithArgumentIndex_: *c.objc_selector = undefined;
var sel_outputNode: *c.objc_selector = undefined;
var sel_setCompareFunction_: *c.objc_selector = undefined;
var sel_maxFragmentBufferBindCount: *c.objc_selector = undefined;
var sel_cpuCacheMode: *c.objc_selector = undefined;
var sel_setCompileSymbolVisibility_: *c.objc_selector = undefined;
var sel_setNodes_: *c.objc_selector = undefined;
var sel_errorOptions: *c.objc_selector = undefined;
var sel_setInstanceDescriptorBuffer_: *c.objc_selector = undefined;
var sel_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_: *c.objc_selector = undefined;
var sel_contents: *c.objc_selector = undefined;
var sel_setFragmentPreloadedLibraries_: *c.objc_selector = undefined;
var sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_: *c.objc_selector = undefined;
var sel_maxTotalThreadsPerObjectThreadgroup: *c.objc_selector = undefined;
var sel_setTileIntersectionFunctionTables_withBufferRange_: *c.objc_selector = undefined;
var sel_setBoundingBoxBufferOffset_: *c.objc_selector = undefined;
var sel_setTileBytes_length_atIndex_: *c.objc_selector = undefined;
var sel_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_: *c.objc_selector = undefined;
var sel_stageInputDescriptor: *c.objc_selector = undefined;
var sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_: *c.objc_selector = undefined;
var sel_setKernelBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_newIOHandleWithURL_error_: *c.objc_selector = undefined;
var sel_stepFunction: *c.objc_selector = undefined;
var sel_setMotionTransformBufferOffset_: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithFunction_options_reflection_error_: *c.objc_selector = undefined;
var sel_setConstantValue_type_atIndex_: *c.objc_selector = undefined;
var sel_newEvent: *c.objc_selector = undefined;
var sel_setSupportRayTracing_: *c.objc_selector = undefined;
var sel_concurrentDispatchThreadgroups_threadsPerThreadgroup_: *c.objc_selector = undefined;
var sel_setStencilStoreActionOptions_: *c.objc_selector = undefined;
var sel_sparseTileSizeInBytesForSparsePageSize_: *c.objc_selector = undefined;
var sel_newDefaultLibraryWithBundle_error_: *c.objc_selector = undefined;
var sel_drawPrimitives_vertexStart_vertexCount_instanceCount_: *c.objc_selector = undefined;
var sel_replaceRegion_mipmapLevel_withBytes_bytesPerRow_: *c.objc_selector = undefined;
var sel_transformationMatrixBuffer: *c.objc_selector = undefined;
var sel_useResource_usage_: *c.objc_selector = undefined;
var sel_setDepthFailureOperation_: *c.objc_selector = undefined;
var sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_: *c.objc_selector = undefined;
var sel_nodes: *c.objc_selector = undefined;
var sel_setPrimitiveDataBuffer_: *c.objc_selector = undefined;
var sel_clearStencil: *c.objc_selector = undefined;
var sel_supportsRaytracing: *c.objc_selector = undefined;
var sel_setLodAverage_: *c.objc_selector = undefined;
var sel_setGroups_: *c.objc_selector = undefined;
var sel_newTextureWithDescriptor_offset_bytesPerRow_: *c.objc_selector = undefined;
var sel_optimizeIndirectCommandBuffer_withRange_: *c.objc_selector = undefined;
var sel_supportsVertexAmplificationCount_: *c.objc_selector = undefined;
var sel_setVertexLinkedFunctions_: *c.objc_selector = undefined;
var sel_setThreadgroupSizeMatchesTileSize_: *c.objc_selector = undefined;
var sel_setDepthAttachment_: *c.objc_selector = undefined;
var sel_tessellationControlPointIndexType: *c.objc_selector = undefined;
var sel_setVertexVisibleFunctionTable_atBufferIndex_: *c.objc_selector = undefined;
var sel_addCompletedHandler_: *c.objc_selector = undefined;
var sel_setResolveTexture_: *c.objc_selector = undefined;
var sel_setInstanceDescriptorType_: *c.objc_selector = undefined;
var sel_setTileTexture_atIndex_: *c.objc_selector = undefined;
var sel_setLodMinClamp_: *c.objc_selector = undefined;
var sel_setGeometryDescriptors_: *c.objc_selector = undefined;
var sel_setFragmentTextures_withRange_: *c.objc_selector = undefined;
var sel_setArrayLength_: *c.objc_selector = undefined;
var sel_supportsCounterSampling_: *c.objc_selector = undefined;
var sel_newBinaryArchiveWithDescriptor_error_: *c.objc_selector = undefined;
var sel_setBorderColor_: *c.objc_selector = undefined;
var sel_defaultRasterSampleCount: *c.objc_selector = undefined;
var sel_setTransformationMatrixBuffer_: *c.objc_selector = undefined;
var sel_setPrimitiveDataBufferOffset_: *c.objc_selector = undefined;
var sel_setIndexBuffer_: *c.objc_selector = undefined;
var sel_access: *c.objc_selector = undefined;
var sel_setTileHeight_: *c.objc_selector = undefined;
var sel_sparseTileSizeInBytes: *c.objc_selector = undefined;
var sel_setAllowReferencingUndefinedSymbols_: *c.objc_selector = undefined;
var sel_memoryBarrierWithScope_afterStages_beforeStages_: *c.objc_selector = undefined;
var sel_setConstantValues_: *c.objc_selector = undefined;
var sel_resourceStatePassDescriptor: *c.objc_selector = undefined;
var sel_resolveLevel: *c.objc_selector = undefined;
var sel_inheritBuffers: *c.objc_selector = undefined;
var sel_length: *c.objc_selector = undefined;
var sel_maxTotalThreadsPerMeshThreadgroup: *c.objc_selector = undefined;
var sel_bufferPointerType: *c.objc_selector = undefined;
var sel_accelerationStructureSizesWithDescriptor_: *c.objc_selector = undefined;
var sel_setObjectSamplerStates_withRange_: *c.objc_selector = undefined;
var sel_maxVertexCallStackDepth: *c.objc_selector = undefined;
var sel_rootResource: *c.objc_selector = undefined;
var sel_lodMinClamp: *c.objc_selector = undefined;
var sel_bufferStructType: *c.objc_selector = undefined;
var sel_setOffset_: *c.objc_selector = undefined;
var sel_maxTessellationFactor: *c.objc_selector = undefined;
var sel_texture: *c.objc_selector = undefined;
var sel_newComputePipelineStateWithAdditionalBinaryFunctions_error_: *c.objc_selector = undefined;
var sel_newLibraryWithStitchedDescriptor_completionHandler_: *c.objc_selector = undefined;
var sel_setBoundingBoxCount_: *c.objc_selector = undefined;
var sel_functionHandleWithFunction_stage_: *c.objc_selector = undefined;
var sel_setThreadgroupMemoryLength_: *c.objc_selector = undefined;
var sel_addComputePipelineFunctionsWithDescriptor_error_: *c.objc_selector = undefined;
var sel_primitiveDataBufferOffset: *c.objc_selector = undefined;
var sel_attributes: *c.objc_selector = undefined;
var sel_setOutputURL_: *c.objc_selector = undefined;
var sel_priority: *c.objc_selector = undefined;
var sel_enqueue: *c.objc_selector = undefined;
var sel_setObjectBuffer_offset_atIndex_: *c.objc_selector = undefined;
var sel_pushDebugGroup_: *c.objc_selector = undefined;
var sel_setAccess_: *c.objc_selector = undefined;
var sel_presentDrawable_: *c.objc_selector = undefined;
var sel_setAlphaToCoverageEnabled_: *c.objc_selector = undefined;
var sel_iosurfacePlane: *c.objc_selector = undefined;
var sel_tessellationOutputWindingOrder: *c.objc_selector = undefined;
var sel_memberByName_: *c.objc_selector = undefined;

pub fn init() void {
    class_AccelerationStructureDescriptor = c.objc_getClass("MTLAccelerationStructureDescriptor").?;
    class_AccelerationStructureGeometryDescriptor = c.objc_getClass("MTLAccelerationStructureGeometryDescriptor").?;
    class_PrimitiveAccelerationStructureDescriptor = c.objc_getClass("MTLPrimitiveAccelerationStructureDescriptor").?;
    class_AccelerationStructureTriangleGeometryDescriptor = c.objc_getClass("MTLAccelerationStructureTriangleGeometryDescriptor").?;
    class_AccelerationStructureBoundingBoxGeometryDescriptor = c.objc_getClass("MTLAccelerationStructureBoundingBoxGeometryDescriptor").?;
    class_MotionKeyframeData = c.objc_getClass("MTLMotionKeyframeData").?;
    class_AccelerationStructureMotionTriangleGeometryDescriptor = c.objc_getClass("MTLAccelerationStructureMotionTriangleGeometryDescriptor").?;
    class_AccelerationStructureMotionBoundingBoxGeometryDescriptor = c.objc_getClass("MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor").?;
    class_InstanceAccelerationStructureDescriptor = c.objc_getClass("MTLInstanceAccelerationStructureDescriptor").?;
    class_AccelerationStructurePassSampleBufferAttachmentDescriptor = c.objc_getClass("MTLAccelerationStructurePassSampleBufferAttachmentDescriptor").?;
    class_AccelerationStructurePassSampleBufferAttachmentDescriptorArray = c.objc_getClass("MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray").?;
    class_AccelerationStructurePassDescriptor = c.objc_getClass("MTLAccelerationStructurePassDescriptor").?;
    class_Type = c.objc_getClass("MTLType").?;
    class_StructMember = c.objc_getClass("MTLStructMember").?;
    class_StructType = c.objc_getClass("MTLStructType").?;
    class_ArrayType = c.objc_getClass("MTLArrayType").?;
    class_PointerType = c.objc_getClass("MTLPointerType").?;
    class_TextureReferenceType = c.objc_getClass("MTLTextureReferenceType").?;
    class_Argument = c.objc_getClass("MTLArgument").?;
    class_BinaryArchiveDescriptor = c.objc_getClass("MTLBinaryArchiveDescriptor").?;
    class_BlitPassSampleBufferAttachmentDescriptor = c.objc_getClass("MTLBlitPassSampleBufferAttachmentDescriptor").?;
    class_BlitPassSampleBufferAttachmentDescriptorArray = c.objc_getClass("MTLBlitPassSampleBufferAttachmentDescriptorArray").?;
    class_BlitPassDescriptor = c.objc_getClass("MTLBlitPassDescriptor").?;
    class_CaptureDescriptor = c.objc_getClass("MTLCaptureDescriptor").?;
    class_CaptureManager = c.objc_getClass("MTLCaptureManager").?;
    class_CommandBufferDescriptor = c.objc_getClass("MTLCommandBufferDescriptor").?;
    class_ComputePassSampleBufferAttachmentDescriptor = c.objc_getClass("MTLComputePassSampleBufferAttachmentDescriptor").?;
    class_ComputePassSampleBufferAttachmentDescriptorArray = c.objc_getClass("MTLComputePassSampleBufferAttachmentDescriptorArray").?;
    class_ComputePassDescriptor = c.objc_getClass("MTLComputePassDescriptor").?;
    class_ComputePipelineReflection = c.objc_getClass("MTLComputePipelineReflection").?;
    class_ComputePipelineDescriptor = c.objc_getClass("MTLComputePipelineDescriptor").?;
    class_CounterSampleBufferDescriptor = c.objc_getClass("MTLCounterSampleBufferDescriptor").?;
    class_StencilDescriptor = c.objc_getClass("MTLStencilDescriptor").?;
    class_DepthStencilDescriptor = c.objc_getClass("MTLDepthStencilDescriptor").?;
    class_ArgumentDescriptor = c.objc_getClass("MTLArgumentDescriptor").?;
    class_SharedEventListener = c.objc_getClass("MTLSharedEventListener").?;
    class_SharedEventHandle = c.objc_getClass("MTLSharedEventHandle").?;
    class_FunctionConstantValues = c.objc_getClass("MTLFunctionConstantValues").?;
    class_FunctionDescriptor = c.objc_getClass("MTLFunctionDescriptor").?;
    class_IntersectionFunctionDescriptor = c.objc_getClass("MTLIntersectionFunctionDescriptor").?;
    class_FunctionStitchingAttributeAlwaysInline = c.objc_getClass("MTLFunctionStitchingAttributeAlwaysInline").?;
    class_FunctionStitchingInputNode = c.objc_getClass("MTLFunctionStitchingInputNode").?;
    class_FunctionStitchingFunctionNode = c.objc_getClass("MTLFunctionStitchingFunctionNode").?;
    class_FunctionStitchingGraph = c.objc_getClass("MTLFunctionStitchingGraph").?;
    class_StitchedLibraryDescriptor = c.objc_getClass("MTLStitchedLibraryDescriptor").?;
    class_HeapDescriptor = c.objc_getClass("MTLHeapDescriptor").?;
    class_IndirectCommandBufferDescriptor = c.objc_getClass("MTLIndirectCommandBufferDescriptor").?;
    class_IntersectionFunctionTableDescriptor = c.objc_getClass("MTLIntersectionFunctionTableDescriptor").?;
    class_IOCommandQueueDescriptor = c.objc_getClass("MTLIOCommandQueueDescriptor").?;
    class_VertexAttribute = c.objc_getClass("MTLVertexAttribute").?;
    class_Attribute = c.objc_getClass("MTLAttribute").?;
    class_FunctionConstant = c.objc_getClass("MTLFunctionConstant").?;
    class_CompileOptions = c.objc_getClass("MTLCompileOptions").?;
    class_LinkedFunctions = c.objc_getClass("MTLLinkedFunctions").?;
    class_PipelineBufferDescriptor = c.objc_getClass("MTLPipelineBufferDescriptor").?;
    class_PipelineBufferDescriptorArray = c.objc_getClass("MTLPipelineBufferDescriptorArray").?;
    class_RasterizationRateSampleArray = c.objc_getClass("MTLRasterizationRateSampleArray").?;
    class_RasterizationRateLayerDescriptor = c.objc_getClass("MTLRasterizationRateLayerDescriptor").?;
    class_RasterizationRateLayerArray = c.objc_getClass("MTLRasterizationRateLayerArray").?;
    class_RasterizationRateMapDescriptor = c.objc_getClass("MTLRasterizationRateMapDescriptor").?;
    class_RenderPassAttachmentDescriptor = c.objc_getClass("MTLRenderPassAttachmentDescriptor").?;
    class_RenderPassColorAttachmentDescriptor = c.objc_getClass("MTLRenderPassColorAttachmentDescriptor").?;
    class_RenderPassDepthAttachmentDescriptor = c.objc_getClass("MTLRenderPassDepthAttachmentDescriptor").?;
    class_RenderPassStencilAttachmentDescriptor = c.objc_getClass("MTLRenderPassStencilAttachmentDescriptor").?;
    class_RenderPassColorAttachmentDescriptorArray = c.objc_getClass("MTLRenderPassColorAttachmentDescriptorArray").?;
    class_RenderPassSampleBufferAttachmentDescriptor = c.objc_getClass("MTLRenderPassSampleBufferAttachmentDescriptor").?;
    class_RenderPassSampleBufferAttachmentDescriptorArray = c.objc_getClass("MTLRenderPassSampleBufferAttachmentDescriptorArray").?;
    class_RenderPassDescriptor = c.objc_getClass("MTLRenderPassDescriptor").?;
    class_RenderPipelineColorAttachmentDescriptor = c.objc_getClass("MTLRenderPipelineColorAttachmentDescriptor").?;
    class_RenderPipelineReflection = c.objc_getClass("MTLRenderPipelineReflection").?;
    class_RenderPipelineDescriptor = c.objc_getClass("MTLRenderPipelineDescriptor").?;
    class_RenderPipelineFunctionsDescriptor = c.objc_getClass("MTLRenderPipelineFunctionsDescriptor").?;
    class_RenderPipelineColorAttachmentDescriptorArray = c.objc_getClass("MTLRenderPipelineColorAttachmentDescriptorArray").?;
    class_TileRenderPipelineColorAttachmentDescriptor = c.objc_getClass("MTLTileRenderPipelineColorAttachmentDescriptor").?;
    class_TileRenderPipelineColorAttachmentDescriptorArray = c.objc_getClass("MTLTileRenderPipelineColorAttachmentDescriptorArray").?;
    class_TileRenderPipelineDescriptor = c.objc_getClass("MTLTileRenderPipelineDescriptor").?;
    class_MeshRenderPipelineDescriptor = c.objc_getClass("MTLMeshRenderPipelineDescriptor").?;
    class_ResourceStatePassSampleBufferAttachmentDescriptor = c.objc_getClass("MTLResourceStatePassSampleBufferAttachmentDescriptor").?;
    class_ResourceStatePassSampleBufferAttachmentDescriptorArray = c.objc_getClass("MTLResourceStatePassSampleBufferAttachmentDescriptorArray").?;
    class_ResourceStatePassDescriptor = c.objc_getClass("MTLResourceStatePassDescriptor").?;
    class_SamplerDescriptor = c.objc_getClass("MTLSamplerDescriptor").?;
    class_BufferLayoutDescriptor = c.objc_getClass("MTLBufferLayoutDescriptor").?;
    class_BufferLayoutDescriptorArray = c.objc_getClass("MTLBufferLayoutDescriptorArray").?;
    class_AttributeDescriptor = c.objc_getClass("MTLAttributeDescriptor").?;
    class_AttributeDescriptorArray = c.objc_getClass("MTLAttributeDescriptorArray").?;
    class_StageInputOutputDescriptor = c.objc_getClass("MTLStageInputOutputDescriptor").?;
    class_SharedTextureHandle = c.objc_getClass("MTLSharedTextureHandle").?;
    class_TextureDescriptor = c.objc_getClass("MTLTextureDescriptor").?;
    class_VertexBufferLayoutDescriptor = c.objc_getClass("MTLVertexBufferLayoutDescriptor").?;
    class_VertexBufferLayoutDescriptorArray = c.objc_getClass("MTLVertexBufferLayoutDescriptorArray").?;
    class_VertexAttributeDescriptor = c.objc_getClass("MTLVertexAttributeDescriptor").?;
    class_VertexAttributeDescriptorArray = c.objc_getClass("MTLVertexAttributeDescriptorArray").?;
    class_VertexDescriptor = c.objc_getClass("MTLVertexDescriptor").?;
    class_VisibleFunctionTableDescriptor = c.objc_getClass("MTLVisibleFunctionTableDescriptor").?;

    sel_optimizeContentsForGPUAccess_slice_level_ = c.sel_registerName("optimizeContentsForGPUAccess:slice:level:").?;
    sel_setStorageMode_ = c.sel_registerName("setStorageMode:").?;
    sel_setOptions_ = c.sel_registerName("setOptions:").?;
    sel_status = c.sel_registerName("status").?;
    sel_width = c.sel_registerName("width").?;
    sel_copyAndCompactAccelerationStructure_toAccelerationStructure_ = c.sel_registerName("copyAndCompactAccelerationStructure:toAccelerationStructure:").?;
    sel_newTextureWithDescriptor_iosurface_plane_ = c.sel_registerName("newTextureWithDescriptor:iosurface:plane:").?;
    sel_computeCommandEncoder = c.sel_registerName("computeCommandEncoder").?;
    sel_functionHandleWithFunction_ = c.sel_registerName("functionHandleWithFunction:").?;
    sel_setRasterizationRateMap_ = c.sel_registerName("setRasterizationRateMap:").?;
    sel_remoteStorageTexture = c.sel_registerName("remoteStorageTexture").?;
    sel_setMeshSamplerState_atIndex_ = c.sel_registerName("setMeshSamplerState:atIndex:").?;
    sel_setTileBufferOffset_atIndex_ = c.sel_registerName("setTileBufferOffset:atIndex:").?;
    sel_controlDependencies = c.sel_registerName("controlDependencies").?;
    sel_maxTransferRate = c.sel_registerName("maxTransferRate").?;
    sel_maxAvailableSizeWithAlignment_ = c.sel_registerName("maxAvailableSizeWithAlignment:").?;
    sel_computePassDescriptor = c.sel_registerName("computePassDescriptor").?;
    sel_setMeshBuffers_offsets_withRange_ = c.sel_registerName("setMeshBuffers:offsets:withRange:").?;
    sel_buffer = c.sel_registerName("buffer").?;
    sel_maxVertexAmplificationCount = c.sel_registerName("maxVertexAmplificationCount").?;
    sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_ = c.sel_registerName("texture2DDescriptorWithPixelFormat:width:height:mipmapped:").?;
    sel_setRetainedReferences_ = c.sel_registerName("setRetainedReferences:").?;
    sel_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_ = c.sel_registerName("newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:").?;
    sel_newSharedEventHandle = c.sel_registerName("newSharedEventHandle").?;
    sel_objectPayloadAlignment = c.sel_registerName("objectPayloadAlignment").?;
    sel_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_setFunctionCount_ = c.sel_registerName("setFunctionCount:").?;
    sel_depthAttachment = c.sel_registerName("depthAttachment").?;
    sel_preloadedLibraries = c.sel_registerName("preloadedLibraries").?;
    sel_setVertexTexture_atIndex_ = c.sel_registerName("setVertexTexture:atIndex:").?;
    sel_arguments = c.sel_registerName("arguments").?;
    sel_setSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_counterSet = c.sel_registerName("counterSet").?;
    sel_copyStatusToBuffer_offset_ = c.sel_registerName("copyStatusToBuffer:offset:").?;
    sel_setObjectBytes_length_atIndex_ = c.sel_registerName("setObjectBytes:length:atIndex:").?;
    sel_setDataType_ = c.sel_registerName("setDataType:").?;
    sel_endScope = c.sel_registerName("endScope").?;
    sel_allowDuplicateIntersectionFunctionInvocation = c.sel_registerName("allowDuplicateIntersectionFunctionInvocation").?;
    sel_setAllowDuplicateIntersectionFunctionInvocation_ = c.sel_registerName("setAllowDuplicateIntersectionFunctionInvocation:").?;
    sel_motionKeyframeCount = c.sel_registerName("motionKeyframeCount").?;
    sel_setSampleCount_ = c.sel_registerName("setSampleCount:").?;
    sel_setFunctions_withRange_ = c.sel_registerName("setFunctions:withRange:").?;
    sel_setConstantBlockAlignment_ = c.sel_registerName("setConstantBlockAlignment:").?;
    sel_clearColor = c.sel_registerName("clearColor").?;
    sel_supportsTextureSampleCount_ = c.sel_registerName("supportsTextureSampleCount:").?;
    sel_setWidth_ = c.sel_registerName("setWidth:").?;
    sel_setHeight_ = c.sel_registerName("setHeight:").?;
    sel_setFunction_atIndex_ = c.sel_registerName("setFunction:atIndex:").?;
    sel_newTextureWithDescriptor_offset_ = c.sel_registerName("newTextureWithDescriptor:offset:").?;
    sel_setMotionTransformBuffer_ = c.sel_registerName("setMotionTransformBuffer:").?;
    sel_setLayer_atIndex_ = c.sel_registerName("setLayer:atIndex:").?;
    sel_name = c.sel_registerName("name").?;
    sel_allocatedSize = c.sel_registerName("allocatedSize").?;
    sel_newLibraryWithFile_error_ = c.sel_registerName("newLibraryWithFile:error:").?;
    sel_isArgument = c.sel_registerName("isArgument").?;
    sel_setDestination_ = c.sel_registerName("setDestination:").?;
    sel_backFaceStencil = c.sel_registerName("backFaceStencil").?;
    sel_setStencilReferenceValue_ = c.sel_registerName("setStencilReferenceValue:").?;
    sel_endOfFragmentSampleIndex = c.sel_registerName("endOfFragmentSampleIndex").?;
    sel_setTessellationFactorScaleEnabled_ = c.sel_registerName("setTessellationFactorScaleEnabled:").?;
    sel_format = c.sel_registerName("format").?;
    sel_commit = c.sel_registerName("commit").?;
    sel_tessellationFactorStepFunction = c.sel_registerName("tessellationFactorStepFunction").?;
    sel_debugSignposts = c.sel_registerName("debugSignposts").?;
    sel_resourceStateCommandEncoderWithDescriptor_ = c.sel_registerName("resourceStateCommandEncoderWithDescriptor:").?;
    sel_setTileVisibleFunctionTables_withBufferRange_ = c.sel_registerName("setTileVisibleFunctionTables:withBufferRange:").?;
    sel_tessellationFactorFormat = c.sel_registerName("tessellationFactorFormat").?;
    sel_setVertexAmplificationCount_viewMappings_ = c.sel_registerName("setVertexAmplificationCount:viewMappings:").?;
    sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_elementPointerType = c.sel_registerName("elementPointerType").?;
    sel_accelerationStructurePassDescriptor = c.sel_registerName("accelerationStructurePassDescriptor").?;
    sel_device = c.sel_registerName("device").?;
    sel_setMotionStartTime_ = c.sel_registerName("setMotionStartTime:").?;
    sel_maxCommandBufferCount = c.sel_registerName("maxCommandBufferCount").?;
    sel_setLibraryType_ = c.sel_registerName("setLibraryType:").?;
    sel_dataType = c.sel_registerName("dataType").?;
    sel_newDynamicLibrary_error_ = c.sel_registerName("newDynamicLibrary:error:").?;
    sel_tileAdditionalBinaryFunctions = c.sel_registerName("tileAdditionalBinaryFunctions").?;
    sel_physicalSizeForLayer_ = c.sel_registerName("physicalSizeForLayer:").?;
    sel_imageblockMemoryLengthForDimensions_ = c.sel_registerName("imageblockMemoryLengthForDimensions:").?;
    sel_firstMipmapInTail = c.sel_registerName("firstMipmapInTail").?;
    sel_tileWidth = c.sel_registerName("tileWidth").?;
    sel_elementArrayType = c.sel_registerName("elementArrayType").?;
    sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ = c.sel_registerName("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:").?;
    sel_setSamplePositions_count_ = c.sel_registerName("setSamplePositions:count:").?;
    sel_setObjectFunction_ = c.sel_registerName("setObjectFunction:").?;
    sel_supportsFunctionPointers = c.sel_registerName("supportsFunctionPointers").?;
    sel_sharedCaptureManager = c.sel_registerName("sharedCaptureManager").?;
    sel_newComputePipelineStateWithFunction_completionHandler_ = c.sel_registerName("newComputePipelineStateWithFunction:completionHandler:").?;
    sel_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_ = c.sel_registerName("getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:").?;
    sel_setMaxTotalThreadsPerMeshThreadgroup_ = c.sel_registerName("setMaxTotalThreadsPerMeshThreadgroup:").?;
    sel_newVisibleFunctionTableWithDescriptor_ = c.sel_registerName("newVisibleFunctionTableWithDescriptor:").?;
    sel_setInheritBuffers_ = c.sel_registerName("setInheritBuffers:").?;
    sel_setPayloadMemoryLength_ = c.sel_registerName("setPayloadMemoryLength:").?;
    sel_registryID = c.sel_registerName("registryID").?;
    sel_supportsRaytracingFromRender = c.sel_registerName("supportsRaytracingFromRender").?;
    sel_newIntersectionFunctionWithDescriptor_completionHandler_ = c.sel_registerName("newIntersectionFunctionWithDescriptor:completionHandler:").?;
    sel_indexBufferOffset = c.sel_registerName("indexBufferOffset").?;
    sel_setVisibleFunctionTable_atIndex_ = c.sel_registerName("setVisibleFunctionTable:atIndex:").?;
    sel_gpuAddress = c.sel_registerName("gpuAddress").?;
    sel_setVisibilityResultBuffer_ = c.sel_registerName("setVisibilityResultBuffer:").?;
    sel_loadBuffer_offset_size_sourceHandle_sourceHandleOffset_ = c.sel_registerName("loadBuffer:offset:size:sourceHandle:sourceHandleOffset:").?;
    sel_stencilAttachmentPixelFormat = c.sel_registerName("stencilAttachmentPixelFormat").?;
    sel_setIntersectionFunctionTables_withRange_ = c.sel_registerName("setIntersectionFunctionTables:withRange:").?;
    sel_setSize_ = c.sel_registerName("setSize:").?;
    sel_setVertexVisibleFunctionTables_withBufferRange_ = c.sel_registerName("setVertexVisibleFunctionTables:withBufferRange:").?;
    sel_compressionType = c.sel_registerName("compressionType").?;
    sel_setErrorOptions_ = c.sel_registerName("setErrorOptions:").?;
    sel_setCaptureObject_ = c.sel_registerName("setCaptureObject:").?;
    sel_updateFence_ = c.sel_registerName("updateFence:").?;
    sel_waitForFence_beforeStages_ = c.sel_registerName("waitForFence:beforeStages:").?;
    sel_setStencilResolveFilter_ = c.sel_registerName("setStencilResolveFilter:").?;
    sel_swizzle = c.sel_registerName("swizzle").?;
    sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_ = c.sel_registerName("sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:").?;
    sel_frontFaceStencil = c.sel_registerName("frontFaceStencil").?;
    sel_setMaxAnisotropy_ = c.sel_registerName("setMaxAnisotropy:").?;
    sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ = c.sel_registerName("drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:").?;
    sel_depthStencilPassOperation = c.sel_registerName("depthStencilPassOperation").?;
    sel_mapScreenToPhysicalCoordinates_forLayer_ = c.sel_registerName("mapScreenToPhysicalCoordinates:forLayer:").?;
    sel_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_vertexBuffer = c.sel_registerName("vertexBuffer").?;
    sel_visibilityResultBuffer = c.sel_registerName("visibilityResultBuffer").?;
    sel_maxFragmentCallStackDepth = c.sel_registerName("maxFragmentCallStackDepth").?;
    sel_setFragmentAccelerationStructure_atBufferIndex_ = c.sel_registerName("setFragmentAccelerationStructure:atBufferIndex:").?;
    sel_presentAfterMinimumDuration_ = c.sel_registerName("presentAfterMinimumDuration:").?;
    sel_newCommandQueueWithMaxCommandBufferCount_ = c.sel_registerName("newCommandQueueWithMaxCommandBufferCount:").?;
    sel_elementTextureReferenceType = c.sel_registerName("elementTextureReferenceType").?;
    sel_dispatchQueue = c.sel_registerName("dispatchQueue").?;
    sel_setTileAdditionalBinaryFunctions_ = c.sel_registerName("setTileAdditionalBinaryFunctions:").?;
    sel_setEndOfVertexSampleIndex_ = c.sel_registerName("setEndOfVertexSampleIndex:").?;
    sel_stride = c.sel_registerName("stride").?;
    sel_setIndexType_ = c.sel_registerName("setIndexType:").?;
    sel_addDebugMarker_range_ = c.sel_registerName("addDebugMarker:range:").?;
    sel_motionEndTime = c.sel_registerName("motionEndTime").?;
    sel_setDepthWriteEnabled_ = c.sel_registerName("setDepthWriteEnabled:").?;
    sel_setRenderPipelineState_ = c.sel_registerName("setRenderPipelineState:").?;
    sel_sampleBuffer = c.sel_registerName("sampleBuffer").?;
    sel_newLibraryWithData_error_ = c.sel_registerName("newLibraryWithData:error:").?;
    sel_tileHeight = c.sel_registerName("tileHeight").?;
    sel_setHazardTrackingMode_ = c.sel_registerName("setHazardTrackingMode:").?;
    sel_elementIsArgumentBuffer = c.sel_registerName("elementIsArgumentBuffer").?;
    sel_setVertexIntersectionFunctionTables_withBufferRange_ = c.sel_registerName("setVertexIntersectionFunctionTables:withBufferRange:").?;
    sel_setComputePipelineStates_withRange_ = c.sel_registerName("setComputePipelineStates:withRange:").?;
    sel_init = c.sel_registerName("init").?;
    sel_setMaxFragmentBufferBindCount_ = c.sel_registerName("setMaxFragmentBufferBindCount:").?;
    sel_setInstancedAccelerationStructures_ = c.sel_registerName("setInstancedAccelerationStructures:").?;
    sel_presentDrawable_afterMinimumDuration_ = c.sel_registerName("presentDrawable:afterMinimumDuration:").?;
    sel_options = c.sel_registerName("options").?;
    sel_patchControlPointCount = c.sel_registerName("patchControlPointCount").?;
    sel_stencilCompareFunction = c.sel_registerName("stencilCompareFunction").?;
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_ = c.sel_registerName("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:").?;
    sel_newLibraryWithSource_options_completionHandler_ = c.sel_registerName("newLibraryWithSource:options:completionHandler:").?;
    sel_newAccelerationStructureWithDescriptor_offset_ = c.sel_registerName("newAccelerationStructureWithDescriptor:offset:").?;
    sel_setBarrier = c.sel_registerName("setBarrier").?;
    sel_minimumLinearTextureAlignmentForPixelFormat_ = c.sel_registerName("minimumLinearTextureAlignmentForPixelFormat:").?;
    sel_setObjectThreadgroupMemoryLength_atIndex_ = c.sel_registerName("setObjectThreadgroupMemoryLength:atIndex:").?;
    sel_setMeshFunction_ = c.sel_registerName("setMeshFunction:").?;
    sel_transformationMatrixBufferOffset = c.sel_registerName("transformationMatrixBufferOffset").?;
    sel_slice = c.sel_registerName("slice").?;
    sel_newBufferWithLength_options_ = c.sel_registerName("newBufferWithLength:options:").?;
    sel_initWithFunctionName_nodes_outputNode_attributes_ = c.sel_registerName("initWithFunctionName:nodes:outputNode:attributes:").?;
    sel_physicalGranularity = c.sel_registerName("physicalGranularity").?;
    sel_setFragmentFunction_ = c.sel_registerName("setFragmentFunction:").?;
    sel_renderTargetArrayLength = c.sel_registerName("renderTargetArrayLength").?;
    sel_setVertexBuffer_offset_atIndex_ = c.sel_registerName("setVertexBuffer:offset:atIndex:").?;
    sel_maxTotalThreadgroupsPerMeshGrid = c.sel_registerName("maxTotalThreadgroupsPerMeshGrid").?;
    sel_rasterizationRateMap = c.sel_registerName("rasterizationRateMap").?;
    sel_setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_ = c.sel_registerName("setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:").?;
    sel_setMipmapLevelCount_ = c.sel_registerName("setMipmapLevelCount:").?;
    sel_newComputePipelineStateWithFunction_options_completionHandler_ = c.sel_registerName("newComputePipelineStateWithFunction:options:completionHandler:").?;
    sel_attributeType = c.sel_registerName("attributeType").?;
    sel_newIOCommandQueueWithDescriptor_error_ = c.sel_registerName("newIOCommandQueueWithDescriptor:error:").?;
    sel_setFragmentTexture_atIndex_ = c.sel_registerName("setFragmentTexture:atIndex:").?;
    sel_destinationAlphaBlendFactor = c.sel_registerName("destinationAlphaBlendFactor").?;
    sel_setAlphaBlendOperation_ = c.sel_registerName("setAlphaBlendOperation:").?;
    sel_newRemoteBufferViewForDevice_ = c.sel_registerName("newRemoteBufferViewForDevice:").?;
    sel_setFragmentSamplerStates_withRange_ = c.sel_registerName("setFragmentSamplerStates:withRange:").?;
    sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_ = c.sel_registerName("refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:").?;
    sel_horizontalSampleStorage = c.sel_registerName("horizontalSampleStorage").?;
    sel_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_ = c.sel_registerName("writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:").?;
    sel_allowReferencingUndefinedSymbols = c.sel_registerName("allowReferencingUndefinedSymbols").?;
    sel_setFragmentSamplerState_atIndex_ = c.sel_registerName("setFragmentSamplerState:atIndex:").?;
    sel_setTriangleCount_ = c.sel_registerName("setTriangleCount:").?;
    sel_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_borderColor = c.sel_registerName("borderColor").?;
    sel_arrayType = c.sel_registerName("arrayType").?;
    sel_debugLocation = c.sel_registerName("debugLocation").?;
    sel_setFrontFacingWinding_ = c.sel_registerName("setFrontFacingWinding:").?;
    sel_meshThreadExecutionWidth = c.sel_registerName("meshThreadExecutionWidth").?;
    sel_parentTexture = c.sel_registerName("parentTexture").?;
    sel_sampleBufferAttachments = c.sel_registerName("sampleBufferAttachments").?;
    sel_setBackFaceStencil_ = c.sel_registerName("setBackFaceStencil:").?;
    sel_sampleCountersInBuffer_atSampleIndex_withBarrier_ = c.sel_registerName("sampleCountersInBuffer:atSampleIndex:withBarrier:").?;
    sel_setSignaledValue_ = c.sel_registerName("setSignaledValue:").?;
    sel_peerCount = c.sel_registerName("peerCount").?;
    sel_setCpuCacheMode_ = c.sel_registerName("setCpuCacheMode:").?;
    sel_startCaptureWithDevice_ = c.sel_registerName("startCaptureWithDevice:").?;
    sel_indirectComputeCommandAtIndex_ = c.sel_registerName("indirectComputeCommandAtIndex:").?;
    sel_tryCancel = c.sel_registerName("tryCancel").?;
    sel_isPatchControlPointData = c.sel_registerName("isPatchControlPointData").?;
    sel_newArgumentEncoderWithBufferIndex_reflection_ = c.sel_registerName("newArgumentEncoderWithBufferIndex:reflection:").?;
    sel_tAddressMode = c.sel_registerName("tAddressMode").?;
    sel_height = c.sel_registerName("height").?;
    sel_resourceOptions = c.sel_registerName("resourceOptions").?;
    sel_setBinaryFunctions_ = c.sel_registerName("setBinaryFunctions:").?;
    sel_blitCommandEncoderWithDescriptor_ = c.sel_registerName("blitCommandEncoderWithDescriptor:").?;
    sel_setBlendColorRed_green_blue_alpha_ = c.sel_registerName("setBlendColorRed:green:blue:alpha:").?;
    sel_setTriangleFillMode_ = c.sel_registerName("setTriangleFillMode:").?;
    sel_setLabel_ = c.sel_registerName("setLabel:").?;
    sel_setSwizzle_ = c.sel_registerName("setSwizzle:").?;
    sel_renderPassDescriptor = c.sel_registerName("renderPassDescriptor").?;
    sel_newDefaultLibrary = c.sel_registerName("newDefaultLibrary").?;
    sel_synchronizeTexture_slice_level_ = c.sel_registerName("synchronizeTexture:slice:level:").?;
    sel_bufferDataType = c.sel_registerName("bufferDataType").?;
    sel_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_boundingBoxBufferOffset = c.sel_registerName("boundingBoxBufferOffset").?;
    sel_setPrimitiveDataElementSize_ = c.sel_registerName("setPrimitiveDataElementSize:").?;
    sel_GPUEndTime = c.sel_registerName("GPUEndTime").?;
    sel_reset = c.sel_registerName("reset").?;
    sel_supports32BitFloatFiltering = c.sel_registerName("supports32BitFloatFiltering").?;
    sel_memoryBarrierWithScope_ = c.sel_registerName("memoryBarrierWithScope:").?;
    sel_setInstanceDescriptorBufferOffset_ = c.sel_registerName("setInstanceDescriptorBufferOffset:").?;
    sel_setInsertLibraries_ = c.sel_registerName("setInsertLibraries:").?;
    sel_memoryBarrierWithResources_count_ = c.sel_registerName("memoryBarrierWithResources:count:").?;
    sel_maxAnisotropy = c.sel_registerName("maxAnisotropy").?;
    sel_constantDataAtIndex_ = c.sel_registerName("constantDataAtIndex:").?;
    sel_mipmapLevelCount = c.sel_registerName("mipmapLevelCount").?;
    sel_setIntersectionFunctionTable_atBufferIndex_ = c.sel_registerName("setIntersectionFunctionTable:atBufferIndex:").?;
    sel_tileBindings = c.sel_registerName("tileBindings").?;
    sel_instanceDescriptorType = c.sel_registerName("instanceDescriptorType").?;
    sel_setDepthResolveFilter_ = c.sel_registerName("setDepthResolveFilter:").?;
    sel_setUsage_ = c.sel_registerName("setUsage:").?;
    sel_tileFunction = c.sel_registerName("tileFunction").?;
    sel_motionStartTime = c.sel_registerName("motionStartTime").?;
    sel_setAccelerationStructure_atIndex_ = c.sel_registerName("setAccelerationStructure:atIndex:").?;
    sel_setMaxTotalThreadsPerThreadgroup_ = c.sel_registerName("setMaxTotalThreadsPerThreadgroup:").?;
    sel_stencilResolveFilter = c.sel_registerName("stencilResolveFilter").?;
    sel_visibleFunctionTableDescriptor = c.sel_registerName("visibleFunctionTableDescriptor").?;
    sel_renderCommandEncoder = c.sel_registerName("renderCommandEncoder").?;
    sel_bufferBytesPerRow = c.sel_registerName("bufferBytesPerRow").?;
    sel_layerCount = c.sel_registerName("layerCount").?;
    sel_newArgumentEncoderWithArguments_ = c.sel_registerName("newArgumentEncoderWithArguments:").?;
    sel_newScratchBufferWithMinimumSize_ = c.sel_registerName("newScratchBufferWithMinimumSize:").?;
    sel_setFormat_ = c.sel_registerName("setFormat:").?;
    sel_setAllowGPUOptimizedContents_ = c.sel_registerName("setAllowGPUOptimizedContents:").?;
    sel_data = c.sel_registerName("data").?;
    sel_isDepthWriteEnabled = c.sel_registerName("isDepthWriteEnabled").?;
    sel_present = c.sel_registerName("present").?;
    sel_setTileAccelerationStructure_atBufferIndex_ = c.sel_registerName("setTileAccelerationStructure:atBufferIndex:").?;
    sel_setPreloadedLibraries_ = c.sel_registerName("setPreloadedLibraries:").?;
    sel_functionName = c.sel_registerName("functionName").?;
    sel_setMaxTotalThreadgroupsPerMeshGrid_ = c.sel_registerName("setMaxTotalThreadgroupsPerMeshGrid:").?;
    sel_setTAddressMode_ = c.sel_registerName("setTAddressMode:").?;
    sel_objectBindings = c.sel_registerName("objectBindings").?;
    sel_mutability = c.sel_registerName("mutability").?;
    sel_setTessellationOutputWindingOrder_ = c.sel_registerName("setTessellationOutputWindingOrder:").?;
    sel_serializeToURL_error_ = c.sel_registerName("serializeToURL:error:").?;
    sel_objectThreadExecutionWidth = c.sel_registerName("objectThreadExecutionWidth").?;
    sel_newTextureWithDescriptor_ = c.sel_registerName("newTextureWithDescriptor:").?;
    sel_setVertexIntersectionFunctionTable_atBufferIndex_ = c.sel_registerName("setVertexIntersectionFunctionTable:atBufferIndex:").?;
    sel_setDepthPlane_ = c.sel_registerName("setDepthPlane:").?;
    sel_useHeap_stages_ = c.sel_registerName("useHeap:stages:").?;
    sel_optimizeContentsForCPUAccess_ = c.sel_registerName("optimizeContentsForCPUAccess:").?;
    sel_setVertexDescriptor_ = c.sel_registerName("setVertexDescriptor:").?;
    sel_startCaptureWithScope_ = c.sel_registerName("startCaptureWithScope:").?;
    sel_heap = c.sel_registerName("heap").?;
    sel_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ = c.sel_registerName("drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:").?;
    sel_supports32BitMSAA = c.sel_registerName("supports32BitMSAA").?;
    sel_setArguments_ = c.sel_registerName("setArguments:").?;
    sel_setTessellationFactorStepFunction_ = c.sel_registerName("setTessellationFactorStepFunction:").?;
    sel_renderCommandEncoderWithDescriptor_ = c.sel_registerName("renderCommandEncoderWithDescriptor:").?;
    sel_newBufferWithLength_options_offset_ = c.sel_registerName("newBufferWithLength:options:offset:").?;
    sel_objectFunction = c.sel_registerName("objectFunction").?;
    sel_isFramebufferOnly = c.sel_registerName("isFramebufferOnly").?;
    sel_inheritPipelineState = c.sel_registerName("inheritPipelineState").?;
    sel_setDefaultCaptureScope_ = c.sel_registerName("setDefaultCaptureScope:").?;
    sel_boundingBoxBuffer = c.sel_registerName("boundingBoxBuffer").?;
    sel_setMaxCommandsInFlight_ = c.sel_registerName("setMaxCommandsInFlight:").?;
    sel_location = c.sel_registerName("location").?;
    sel_newBufferWithBytes_length_options_ = c.sel_registerName("newBufferWithBytes:length:options:").?;
    sel_addPresentedHandler_ = c.sel_registerName("addPresentedHandler:").?;
    sel_setRenderTargetHeight_ = c.sel_registerName("setRenderTargetHeight:").?;
    sel_setStepRate_ = c.sel_registerName("setStepRate:").?;
    sel_executeCommandsInBuffer_withRange_ = c.sel_registerName("executeCommandsInBuffer:withRange:").?;
    sel_languageVersion = c.sel_registerName("languageVersion").?;
    sel_vertexFormat = c.sel_registerName("vertexFormat").?;
    sel_setDepthBias_slopeScale_clamp_ = c.sel_registerName("setDepthBias:slopeScale:clamp:").?;
    sel_tessellationPartitionMode = c.sel_registerName("tessellationPartitionMode").?;
    sel_magFilter = c.sel_registerName("magFilter").?;
    sel_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_ = c.sel_registerName("getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:").?;
    sel_newCommandQueue = c.sel_registerName("newCommandQueue").?;
    sel_newFunctionWithDescriptor_error_ = c.sel_registerName("newFunctionWithDescriptor:error:").?;
    sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_setSupportArgumentBuffers_ = c.sel_registerName("setSupportArgumentBuffers:").?;
    sel_isPatchData = c.sel_registerName("isPatchData").?;
    sel_meshFunction = c.sel_registerName("meshFunction").?;
    sel_outputURL = c.sel_registerName("outputURL").?;
    sel_newRenderPipelineStateWithDescriptor_completionHandler_ = c.sel_registerName("newRenderPipelineStateWithDescriptor:completionHandler:").?;
    sel_heapOffset = c.sel_registerName("heapOffset").?;
    sel_setStencilCompareFunction_ = c.sel_registerName("setStencilCompareFunction:").?;
    sel_privateFunctions = c.sel_registerName("privateFunctions").?;
    sel_setIndexBufferIndex_ = c.sel_registerName("setIndexBufferIndex:").?;
    sel_setMaxVertexCallStackDepth_ = c.sel_registerName("setMaxVertexCallStackDepth:").?;
    sel_setDepthStencilState_ = c.sel_registerName("setDepthStencilState:").?;
    sel_geometryDescriptors = c.sel_registerName("geometryDescriptors").?;
    sel_boundingBoxStride = c.sel_registerName("boundingBoxStride").?;
    sel_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_ = c.sel_registerName("drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:").?;
    sel_commandBufferWithUnretainedReferences = c.sel_registerName("commandBufferWithUnretainedReferences").?;
    sel_setCounterSet_ = c.sel_registerName("setCounterSet:").?;
    sel_setScissorRects_count_ = c.sel_registerName("setScissorRects:count:").?;
    sel_setRenderTargetArrayLength_ = c.sel_registerName("setRenderTargetArrayLength:").?;
    sel_threadgroupMemoryAlignment = c.sel_registerName("threadgroupMemoryAlignment").?;
    sel_dispatchThreadgroups_threadsPerThreadgroup_ = c.sel_registerName("dispatchThreadgroups:threadsPerThreadgroup:").?;
    sel_setFragmentIntersectionFunctionTables_withBufferRange_ = c.sel_registerName("setFragmentIntersectionFunctionTables:withBufferRange:").?;
    sel_areBarycentricCoordsSupported = c.sel_registerName("areBarycentricCoordsSupported").?;
    sel_setLoadAction_ = c.sel_registerName("setLoadAction:").?;
    sel_setTileBuffers_offsets_withRange_ = c.sel_registerName("setTileBuffers:offsets:withRange:").?;
    sel_synchronizeResource_ = c.sel_registerName("synchronizeResource:").?;
    sel_logs = c.sel_registerName("logs").?;
    sel_newVisibleFunctionTableWithDescriptor_stage_ = c.sel_registerName("newVisibleFunctionTableWithDescriptor:stage:").?;
    sel_getBytes_bytesPerRow_fromRegion_mipmapLevel_ = c.sel_registerName("getBytes:bytesPerRow:fromRegion:mipmapLevel:").?;
    sel_groups = c.sel_registerName("groups").?;
    sel_setDepthClipMode_ = c.sel_registerName("setDepthClipMode:").?;
    sel_motionTransformBufferOffset = c.sel_registerName("motionTransformBufferOffset").?;
    sel_setMaxTotalThreadsPerObjectThreadgroup_ = c.sel_registerName("setMaxTotalThreadsPerObjectThreadgroup:").?;
    sel_setTileTextures_withRange_ = c.sel_registerName("setTileTextures:withRange:").?;
    sel_computeFunction = c.sel_registerName("computeFunction").?;
    sel_setVertexFunction_ = c.sel_registerName("setVertexFunction:").?;
    sel_type = c.sel_registerName("type").?;
    sel_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_ = c.sel_registerName("setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:").?;
    sel_waitUntilScheduled = c.sel_registerName("waitUntilScheduled").?;
    sel_setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ = c.sel_registerName("setThreadGroupSizeIsMultipleOfThreadExecutionWidth:").?;
    sel_allowGPUOptimizedContents = c.sel_registerName("allowGPUOptimizedContents").?;
    sel_primitiveDataElementSize = c.sel_registerName("primitiveDataElementSize").?;
    sel_isAlphaToOneEnabled = c.sel_registerName("isAlphaToOneEnabled").?;
    sel_getDefaultSamplePositions_count_ = c.sel_registerName("getDefaultSamplePositions:count:").?;
    sel_setBufferIndex_ = c.sel_registerName("setBufferIndex:").?;
    sel_setMotionEndBorderMode_ = c.sel_registerName("setMotionEndBorderMode:").?;
    sel_maxVertexBufferBindCount = c.sel_registerName("maxVertexBufferBindCount").?;
    sel_opaque = c.sel_registerName("opaque").?;
    sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:").?;
    sel_setStoreActionOptions_ = c.sel_registerName("setStoreActionOptions:").?;
    sel_label = c.sel_registerName("label").?;
    sel_setScratchBufferAllocator_ = c.sel_registerName("setScratchBufferAllocator:").?;
    sel_setStageInRegion_ = c.sel_registerName("setStageInRegion:").?;
    sel_counters = c.sel_registerName("counters").?;
    sel_rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_ = c.sel_registerName("rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:").?;
    sel_setTileBuffer_offset_atIndex_ = c.sel_registerName("setTileBuffer:offset:atIndex:").?;
    sel_setBuffer_ = c.sel_registerName("setBuffer:").?;
    sel_startOfVertexSampleIndex = c.sel_registerName("startOfVertexSampleIndex").?;
    sel_supportsPullModelInterpolation = c.sel_registerName("supportsPullModelInterpolation").?;
    sel_preserveInvariance = c.sel_registerName("preserveInvariance").?;
    sel_setColorStoreAction_atIndex_ = c.sel_registerName("setColorStoreAction:atIndex:").?;
    sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_ = c.sel_registerName("drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:").?;
    sel_compileSymbolVisibility = c.sel_registerName("compileSymbolVisibility").?;
    sel_setImageblockSampleLength_ = c.sel_registerName("setImageblockSampleLength:").?;
    sel_setRasterSampleCount_ = c.sel_registerName("setRasterSampleCount:").?;
    sel_meshThreadgroupSizeIsMultipleOfThreadExecutionWidth = c.sel_registerName("meshThreadgroupSizeIsMultipleOfThreadExecutionWidth").?;
    sel_objectPayloadDataSize = c.sel_registerName("objectPayloadDataSize").?;
    sel_fragmentArguments = c.sel_registerName("fragmentArguments").?;
    sel_setObjectTexture_atIndex_ = c.sel_registerName("setObjectTexture:atIndex:").?;
    sel_meshBuffers = c.sel_registerName("meshBuffers").?;
    sel_newSharedTextureWithDescriptor_ = c.sel_registerName("newSharedTextureWithDescriptor:").?;
    sel_endOfVertexSampleIndex = c.sel_registerName("endOfVertexSampleIndex").?;
    sel_meshBindings = c.sel_registerName("meshBindings").?;
    sel_setStride_ = c.sel_registerName("setStride:").?;
    sel_isShareable = c.sel_registerName("isShareable").?;
    sel_dispatchType = c.sel_registerName("dispatchType").?;
    sel_level = c.sel_registerName("level").?;
    sel_setThreadgroupMemoryLength_atIndex_ = c.sel_registerName("setThreadgroupMemoryLength:atIndex:").?;
    sel_setResourceOptions_ = c.sel_registerName("setResourceOptions:").?;
    sel_libraryType = c.sel_registerName("libraryType").?;
    sel_usage = c.sel_registerName("usage").?;
    sel_setEndOfEncoderSampleIndex_ = c.sel_registerName("setEndOfEncoderSampleIndex:").?;
    sel_presentAtTime_ = c.sel_registerName("presentAtTime:").?;
    sel_setVertexBytes_length_atIndex_ = c.sel_registerName("setVertexBytes:length:atIndex:").?;
    sel_newIntersectionFunctionTableWithDescriptor_ = c.sel_registerName("newIntersectionFunctionTableWithDescriptor:").?;
    sel_stopCapture = c.sel_registerName("stopCapture").?;
    sel_setAlphaToOneEnabled_ = c.sel_registerName("setAlphaToOneEnabled:").?;
    sel_isBlendingEnabled = c.sel_registerName("isBlendingEnabled").?;
    sel_setLevel_ = c.sel_registerName("setLevel:").?;
    sel_fragmentBindings = c.sel_registerName("fragmentBindings").?;
    sel_setViewport_ = c.sel_registerName("setViewport:").?;
    sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_ = c.sel_registerName("refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:").?;
    sel_setObject_atIndexedSubscript_ = c.sel_registerName("setObject:atIndexedSubscript:").?;
    sel_setStoreAction_ = c.sel_registerName("setStoreAction:").?;
    sel_setVertexSamplerState_atIndex_ = c.sel_registerName("setVertexSamplerState:atIndex:").?;
    sel_setVertexSamplerStates_withRange_ = c.sel_registerName("setVertexSamplerStates:withRange:").?;
    sel_notifyListener_atValue_block_ = c.sel_registerName("notifyListener:atValue:block:").?;
    sel_addFunctionWithDescriptor_library_error_ = c.sel_registerName("addFunctionWithDescriptor:library:error:").?;
    sel_popDebugGroup = c.sel_registerName("popDebugGroup").?;
    sel_setBoundingBoxBuffer_ = c.sel_registerName("setBoundingBoxBuffer:").?;
    sel_resetCommandsInBuffer_withRange_ = c.sel_registerName("resetCommandsInBuffer:withRange:").?;
    sel_vertexBindings = c.sel_registerName("vertexBindings").?;
    sel_functionCount = c.sel_registerName("functionCount").?;
    sel_gpuResourceID = c.sel_registerName("gpuResourceID").?;
    sel_textureType = c.sel_registerName("textureType").?;
    sel_setVisibleFunctionTable_atBufferIndex_ = c.sel_registerName("setVisibleFunctionTable:atBufferIndex:").?;
    sel_updateTextureMapping_mode_region_mipLevel_slice_ = c.sel_registerName("updateTextureMapping:mode:region:mipLevel:slice:").?;
    sel_maxSampleCount = c.sel_registerName("maxSampleCount").?;
    sel_buffers = c.sel_registerName("buffers").?;
    sel_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_ = c.sel_registerName("buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:").?;
    sel_newRenderPipelineStateWithMeshDescriptor_options_reflection_error_ = c.sel_registerName("newRenderPipelineStateWithMeshDescriptor:options:reflection:error:").?;
    sel_setIndirectCommandBuffer_atIndex_ = c.sel_registerName("setIndirectCommandBuffer:atIndex:").?;
    sel_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ = c.sel_registerName("moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:").?;
    sel_setMeshBytes_length_atIndex_ = c.sel_registerName("setMeshBytes:length:atIndex:").?;
    sel_functionType = c.sel_registerName("functionType").?;
    sel_setType_ = c.sel_registerName("setType:").?;
    sel_optimizationLevel = c.sel_registerName("optimizationLevel").?;
    sel_setDepthStoreActionOptions_ = c.sel_registerName("setDepthStoreActionOptions:").?;
    sel_payloadMemoryLength = c.sel_registerName("payloadMemoryLength").?;
    sel_setVertexFormat_ = c.sel_registerName("setVertexFormat:").?;
    sel_setInstanceDescriptorStride_ = c.sel_registerName("setInstanceDescriptorStride:").?;
    sel_depthCompareFunction = c.sel_registerName("depthCompareFunction").?;
    sel_errorState = c.sel_registerName("errorState").?;
    sel_threadGroupSizeIsMultipleOfThreadExecutionWidth = c.sel_registerName("threadGroupSizeIsMultipleOfThreadExecutionWidth").?;
    sel_newAccelerationStructureWithDescriptor_ = c.sel_registerName("newAccelerationStructureWithDescriptor:").?;
    sel_installName = c.sel_registerName("installName").?;
    sel_setLanguageVersion_ = c.sel_registerName("setLanguageVersion:").?;
    sel_newRenderPipelineStateWithDescriptor_error_ = c.sel_registerName("newRenderPipelineStateWithDescriptor:error:").?;
    sel_setRenderPipelineState_atIndex_ = c.sel_registerName("setRenderPipelineState:atIndex:").?;
    sel_supportRayTracing = c.sel_registerName("supportRayTracing").?;
    sel_rasterizationRateMapDescriptorWithScreenSize_layer_ = c.sel_registerName("rasterizationRateMapDescriptorWithScreenSize:layer:").?;
    sel_threadgroupMemoryLength = c.sel_registerName("threadgroupMemoryLength").?;
    sel_tileArguments = c.sel_registerName("tileArguments").?;
    sel_boundingBoxCount = c.sel_registerName("boundingBoxCount").?;
    sel_elementType = c.sel_registerName("elementType").?;
    sel_depthFailureOperation = c.sel_registerName("depthFailureOperation").?;
    sel_textureReferenceType = c.sel_registerName("textureReferenceType").?;
    sel_useHeap_ = c.sel_registerName("useHeap:").?;
    sel_newComputePipelineStateWithDescriptor_options_completionHandler_ = c.sel_registerName("newComputePipelineStateWithDescriptor:options:completionHandler:").?;
    sel_peerIndex = c.sel_registerName("peerIndex").?;
    sel_setControlDependencies_ = c.sel_registerName("setControlDependencies:").?;
    sel_endOfEncoderSampleIndex = c.sel_registerName("endOfEncoderSampleIndex").?;
    sel_newRenderPipelineStateWithAdditionalBinaryFunctions_error_ = c.sel_registerName("newRenderPipelineStateWithAdditionalBinaryFunctions:error:").?;
    sel_setStageInRegionWithIndirectBuffer_indirectBufferOffset_ = c.sel_registerName("setStageInRegionWithIndirectBuffer:indirectBufferOffset:").?;
    sel_heapAccelerationStructureSizeAndAlignWithDescriptor_ = c.sel_registerName("heapAccelerationStructureSizeAndAlignWithDescriptor:").?;
    sel_addTileRenderPipelineFunctionsWithDescriptor_error_ = c.sel_registerName("addTileRenderPipelineFunctionsWithDescriptor:error:").?;
    sel_convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_ = c.sel_registerName("convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:").?;
    sel_setArgumentBuffer_offset_ = c.sel_registerName("setArgumentBuffer:offset:").?;
    sel_setSparsePageSize_ = c.sel_registerName("setSparsePageSize:").?;
    sel_stageInputOutputDescriptor = c.sel_registerName("stageInputOutputDescriptor").?;
    sel_setTileSamplerStates_withRange_ = c.sel_registerName("setTileSamplerStates:withRange:").?;
    sel_parallelRenderCommandEncoderWithDescriptor_ = c.sel_registerName("parallelRenderCommandEncoderWithDescriptor:").?;
    sel_setAccelerationStructure_atBufferIndex_ = c.sel_registerName("setAccelerationStructure:atBufferIndex:").?;
    sel_newSharedEventWithHandle_ = c.sel_registerName("newSharedEventWithHandle:").?;
    sel_stencilAttachment = c.sel_registerName("stencilAttachment").?;
    sel_newComputePipelineStateWithFunction_error_ = c.sel_registerName("newComputePipelineStateWithFunction:error:").?;
    sel_setClearColor_ = c.sel_registerName("setClearColor:").?;
    sel_generateMipmapsForTexture_ = c.sel_registerName("generateMipmapsForTexture:").?;
    sel_setStencilAttachment_ = c.sel_registerName("setStencilAttachment:").?;
    sel_insertDebugCaptureBoundary = c.sel_registerName("insertDebugCaptureBoundary").?;
    sel_optimizeContentsForCPUAccess_slice_level_ = c.sel_registerName("optimizeContentsForCPUAccess:slice:level:").?;
    sel_setFrontFaceStencil_ = c.sel_registerName("setFrontFaceStencil:").?;
    sel_copyParameterDataToBuffer_offset_ = c.sel_registerName("copyParameterDataToBuffer:offset:").?;
    sel_supportAddingFragmentBinaryFunctions = c.sel_registerName("supportAddingFragmentBinaryFunctions").?;
    sel_beginScope = c.sel_registerName("beginScope").?;
    sel_textureBarrier = c.sel_registerName("textureBarrier").?;
    sel_useResource_usage_stages_ = c.sel_registerName("useResource:usage:stages:").?;
    sel_setFragmentVisibleFunctionTable_atBufferIndex_ = c.sel_registerName("setFragmentVisibleFunctionTable:atBufferIndex:").?;
    sel_specializedName = c.sel_registerName("specializedName").?;
    sel_stencilFailureOperation = c.sel_registerName("stencilFailureOperation").?;
    sel_commandTypes = c.sel_registerName("commandTypes").?;
    sel_setRenderPipelineStates_withRange_ = c.sel_registerName("setRenderPipelineStates:withRange:").?;
    sel_setComputePipelineState_atIndex_ = c.sel_registerName("setComputePipelineState:atIndex:").?;
    sel_supportIndirectCommandBuffers = c.sel_registerName("supportIndirectCommandBuffers").?;
    sel_setStencilStoreAction_ = c.sel_registerName("setStencilStoreAction:").?;
    sel_setMipFilter_ = c.sel_registerName("setMipFilter:").?;
    sel_newFence = c.sel_registerName("newFence").?;
    sel_setPurgeableState_ = c.sel_registerName("setPurgeableState:").?;
    sel_textureDataType = c.sel_registerName("textureDataType").?;
    sel_isAlphaToCoverageEnabled = c.sel_registerName("isAlphaToCoverageEnabled").?;
    sel_destination = c.sel_registerName("destination").?;
    sel_setResolveDepthPlane_ = c.sel_registerName("setResolveDepthPlane:").?;
    sel_setImageblockWidth_height_ = c.sel_registerName("setImageblockWidth:height:").?;
    sel_setSourceRGBBlendFactor_ = c.sel_registerName("setSourceRGBBlendFactor:").?;
    sel_newSharedTextureWithHandle_ = c.sel_registerName("newSharedTextureWithHandle:").?;
    sel_setVisibleFunctionTables_withRange_ = c.sel_registerName("setVisibleFunctionTables:withRange:").?;
    sel_indexBufferIndex = c.sel_registerName("indexBufferIndex").?;
    sel_setMeshBufferOffset_atIndex_ = c.sel_registerName("setMeshBufferOffset:atIndex:").?;
    sel_setPriority_ = c.sel_registerName("setPriority:").?;
    sel_binaryArchives = c.sel_registerName("binaryArchives").?;
    sel_resolveCounters_inRange_destinationBuffer_destinationOffset_ = c.sel_registerName("resolveCounters:inRange:destinationBuffer:destinationOffset:").?;
    sel_setBuffer_offset_atIndex_ = c.sel_registerName("setBuffer:offset:atIndex:").?;
    sel_functions = c.sel_registerName("functions").?;
    sel_readMask = c.sel_registerName("readMask").?;
    sel_computeCommandEncoderWithDispatchType_ = c.sel_registerName("computeCommandEncoderWithDispatchType:").?;
    sel_isSparse = c.sel_registerName("isSparse").?;
    sel_setMeshSamplerStates_withRange_ = c.sel_registerName("setMeshSamplerStates:withRange:").?;
    sel_setFunctions_ = c.sel_registerName("setFunctions:").?;
    sel_supportsPrimitiveMotionBlur = c.sel_registerName("supportsPrimitiveMotionBlur").?;
    sel_setShouldMaximizeConcurrentCompilation_ = c.sel_registerName("setShouldMaximizeConcurrentCompilation:").?;
    sel_setClearStencil_ = c.sel_registerName("setClearStencil:").?;
    sel_minFilter = c.sel_registerName("minFilter").?;
    sel_setDestinationRGBBlendFactor_ = c.sel_registerName("setDestinationRGBBlendFactor:").?;
    sel_setNormalizedCoordinates_ = c.sel_registerName("setNormalizedCoordinates:").?;
    sel_addScheduledHandler_ = c.sel_registerName("addScheduledHandler:").?;
    sel_isDepth24Stencil8PixelFormatSupported = c.sel_registerName("isDepth24Stencil8PixelFormatSupported").?;
    sel_setTileVisibleFunctionTable_atBufferIndex_ = c.sel_registerName("setTileVisibleFunctionTable:atBufferIndex:").?;
    sel_memoryBarrierWithResources_count_afterStages_beforeStages_ = c.sel_registerName("memoryBarrierWithResources:count:afterStages:beforeStages:").?;
    sel_vertexBuffers = c.sel_registerName("vertexBuffers").?;
    sel_setTextures_withRange_ = c.sel_registerName("setTextures:withRange:").?;
    sel_setStartOfVertexSampleIndex_ = c.sel_registerName("setStartOfVertexSampleIndex:").?;
    sel_setMeshTextures_withRange_ = c.sel_registerName("setMeshTextures:withRange:").?;
    sel_encodeSignalEvent_value_ = c.sel_registerName("encodeSignalEvent:value:").?;
    sel_descriptor = c.sel_registerName("descriptor").?;
    sel_setTransformationMatrixBufferOffset_ = c.sel_registerName("setTransformationMatrixBufferOffset:").?;
    sel_startOfEncoderSampleIndex = c.sel_registerName("startOfEncoderSampleIndex").?;
    sel_newIOHandleWithURL_compressionMethod_error_ = c.sel_registerName("newIOHandleWithURL:compressionMethod:error:").?;
    sel_heapAccelerationStructureSizeAndAlignWithSize_ = c.sel_registerName("heapAccelerationStructureSizeAndAlignWithSize:").?;
    sel_maxBufferLength = c.sel_registerName("maxBufferLength").?;
    sel_setBoundingBoxBuffers_ = c.sel_registerName("setBoundingBoxBuffers:").?;
    sel_writeMask = c.sel_registerName("writeMask").?;
    sel_textureCubeDescriptorWithPixelFormat_size_mipmapped_ = c.sel_registerName("textureCubeDescriptorWithPixelFormat:size:mipmapped:").?;
    sel_staticThreadgroupMemoryLength = c.sel_registerName("staticThreadgroupMemoryLength").?;
    sel_newTextureViewWithPixelFormat_textureType_levels_slices_ = c.sel_registerName("newTextureViewWithPixelFormat:textureType:levels:slices:").?;
    sel_setLinkedFunctions_ = c.sel_registerName("setLinkedFunctions:").?;
    sel_colorAttachments = c.sel_registerName("colorAttachments").?;
    sel_maxCallStackDepth = c.sel_registerName("maxCallStackDepth").?;
    sel_sparsePageSize = c.sel_registerName("sparsePageSize").?;
    sel_supportsFamily_ = c.sel_registerName("supportsFamily:").?;
    sel_setPrimitiveDataStride_ = c.sel_registerName("setPrimitiveDataStride:").?;
    sel_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ = c.sel_registerName("copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:").?;
    sel_resourceStateCommandEncoder = c.sel_registerName("resourceStateCommandEncoder").?;
    sel_setObjectBuffers_offsets_withRange_ = c.sel_registerName("setObjectBuffers:offsets:withRange:").?;
    sel_setSampleBuffer_ = c.sel_registerName("setSampleBuffer:").?;
    sel_setComputeFunction_ = c.sel_registerName("setComputeFunction:").?;
    sel_isDepthTexture = c.sel_registerName("isDepthTexture").?;
    sel_parentRelativeSlice = c.sel_registerName("parentRelativeSlice").?;
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_ = c.sel_registerName("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:").?;
    sel_setMaxFragmentCallStackDepth_ = c.sel_registerName("setMaxFragmentCallStackDepth:").?;
    sel_primitiveDataStride = c.sel_registerName("primitiveDataStride").?;
    sel_instanceDescriptorBuffer = c.sel_registerName("instanceDescriptorBuffer").?;
    sel_setIndex_ = c.sel_registerName("setIndex:").?;
    sel_setSupportAddingFragmentBinaryFunctions_ = c.sel_registerName("setSupportAddingFragmentBinaryFunctions:").?;
    sel_setSpecializedName_ = c.sel_registerName("setSpecializedName:").?;
    sel_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ = c.sel_registerName("copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:").?;
    sel_initWithName_arguments_controlDependencies_ = c.sel_registerName("initWithName:arguments:controlDependencies:").?;
    sel_setInstanceCount_ = c.sel_registerName("setInstanceCount:").?;
    sel_structType = c.sel_registerName("structType").?;
    sel_setCommandTypes_ = c.sel_registerName("setCommandTypes:").?;
    sel_layers = c.sel_registerName("layers").?;
    sel_vertexPreloadedLibraries = c.sel_registerName("vertexPreloadedLibraries").?;
    sel_stepRate = c.sel_registerName("stepRate").?;
    sel_URL = c.sel_registerName("URL").?;
    sel_isAliasable = c.sel_registerName("isAliasable").?;
    sel_layouts = c.sel_registerName("layouts").?;
    sel_setBinaryArchives_ = c.sel_registerName("setBinaryArchives:").?;
    sel_maxThreadgroupMemoryLength = c.sel_registerName("maxThreadgroupMemoryLength").?;
    sel_setMaxVertexAmplificationCount_ = c.sel_registerName("setMaxVertexAmplificationCount:").?;
    sel_supportsFunctionPointersFromRender = c.sel_registerName("supportsFunctionPointersFromRender").?;
    sel_supportAddingBinaryFunctions = c.sel_registerName("supportAddingBinaryFunctions").?;
    sel_setOpaqueTriangleIntersectionFunctionWithSignature_withRange_ = c.sel_registerName("setOpaqueTriangleIntersectionFunctionWithSignature:withRange:").?;
    sel_updateTextureMappings_mode_regions_mipLevels_slices_numRegions_ = c.sel_registerName("updateTextureMappings:mode:regions:mipLevels:slices:numRegions:").?;
    sel_motionStartBorderMode = c.sel_registerName("motionStartBorderMode").?;
    sel_newRenderPipelineStateWithDescriptor_options_completionHandler_ = c.sel_registerName("newRenderPipelineStateWithDescriptor:options:completionHandler:").?;
    sel_startOfFragmentSampleIndex = c.sel_registerName("startOfFragmentSampleIndex").?;
    sel_removeAllDebugMarkers = c.sel_registerName("removeAllDebugMarkers").?;
    sel_kernelEndTime = c.sel_registerName("kernelEndTime").?;
    sel_isUsed = c.sel_registerName("isUsed").?;
    sel_indirectRenderCommandAtIndex_ = c.sel_registerName("indirectRenderCommandAtIndex:").?;
    sel_setTessellationFactorFormat_ = c.sel_registerName("setTessellationFactorFormat:").?;
    sel_constantBlockAlignment = c.sel_registerName("constantBlockAlignment").?;
    sel_updateFence_afterStages_ = c.sel_registerName("updateFence:afterStages:").?;
    sel_setMotionEndTime_ = c.sel_registerName("setMotionEndTime:").?;
    sel_setComputePipelineState_ = c.sel_registerName("setComputePipelineState:").?;
    sel_horizontal = c.sel_registerName("horizontal").?;
    sel_setObjectTextures_withRange_ = c.sel_registerName("setObjectTextures:withRange:").?;
    sel_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_ = c.sel_registerName("dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:").?;
    sel_setScreenSize_ = c.sel_registerName("setScreenSize:").?;
    sel_textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_ = c.sel_registerName("textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:").?;
    sel_copyAccelerationStructure_toAccelerationStructure_ = c.sel_registerName("copyAccelerationStructure:toAccelerationStructure:").?;
    sel_setAttributes_ = c.sel_registerName("setAttributes:").?;
    sel_resetWithRange_ = c.sel_registerName("resetWithRange:").?;
    sel_setFragmentBuffers_offsets_withRange_ = c.sel_registerName("setFragmentBuffers:offsets:withRange:").?;
    sel_compareFunction = c.sel_registerName("compareFunction").?;
    sel_newRasterizationRateMapWithDescriptor_ = c.sel_registerName("newRasterizationRateMapWithDescriptor:").?;
    sel_setScissorRect_ = c.sel_registerName("setScissorRect:").?;
    sel_setStencilFrontReferenceValue_backReferenceValue_ = c.sel_registerName("setStencilFrontReferenceValue:backReferenceValue:").?;
    sel_fragmentBuffers = c.sel_registerName("fragmentBuffers").?;
    sel_instanceDescriptorBufferOffset = c.sel_registerName("instanceDescriptorBufferOffset").?;
    sel_setOptimizationLevel_ = c.sel_registerName("setOptimizationLevel:").?;
    sel_parameterBufferSizeAndAlign = c.sel_registerName("parameterBufferSizeAndAlign").?;
    sel_instanceDescriptorStride = c.sel_registerName("instanceDescriptorStride").?;
    sel_setDefaultRasterSampleCount_ = c.sel_registerName("setDefaultRasterSampleCount:").?;
    sel_alphaBlendOperation = c.sel_registerName("alphaBlendOperation").?;
    sel_setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ = c.sel_registerName("setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:").?;
    sel_setResolveSlice_ = c.sel_registerName("setResolveSlice:").?;
    sel_setBuffers_offsets_withRange_ = c.sel_registerName("setBuffers:offsets:withRange:").?;
    sel_elementStructType = c.sel_registerName("elementStructType").?;
    sel_isHeadless = c.sel_registerName("isHeadless").?;
    sel_areProgrammableSamplePositionsSupported = c.sel_registerName("areProgrammableSamplePositionsSupported").?;
    sel_useHeaps_count_stages_ = c.sel_registerName("useHeaps:count:stages:").?;
    sel_newFunctionWithName_constantValues_error_ = c.sel_registerName("newFunctionWithName:constantValues:error:").?;
    sel_setPreserveInvariance_ = c.sel_registerName("setPreserveInvariance:").?;
    sel_remoteStorageBuffer = c.sel_registerName("remoteStorageBuffer").?;
    sel_boundingBoxBuffers = c.sel_registerName("boundingBoxBuffers").?;
    sel_setDestinationAlphaBlendFactor_ = c.sel_registerName("setDestinationAlphaBlendFactor:").?;
    sel_setBufferOffset_atIndex_ = c.sel_registerName("setBufferOffset:atIndex:").?;
    sel_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ = c.sel_registerName("drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:").?;
    sel_drawableID = c.sel_registerName("drawableID").?;
    sel_setVertexTextures_withRange_ = c.sel_registerName("setVertexTextures:withRange:").?;
    sel_commandBufferWithDescriptor_ = c.sel_registerName("commandBufferWithDescriptor:").?;
    sel_retainedReferences = c.sel_registerName("retainedReferences").?;
    sel_setRgbBlendOperation_ = c.sel_registerName("setRgbBlendOperation:").?;
    sel_rasterizationRateMapDescriptorWithScreenSize_ = c.sel_registerName("rasterizationRateMapDescriptorWithScreenSize:").?;
    sel_setSupportAddingVertexBinaryFunctions_ = c.sel_registerName("setSupportAddingVertexBinaryFunctions:").?;
    sel_depth = c.sel_registerName("depth").?;
    sel_indexBuffer = c.sel_registerName("indexBuffer").?;
    sel_setConstantValue_type_withName_ = c.sel_registerName("setConstantValue:type:withName:").?;
    sel_initWithSampleCount_horizontal_vertical_ = c.sel_registerName("initWithSampleCount:horizontal:vertical:").?;
    sel_newArgumentEncoderWithBufferIndex_ = c.sel_registerName("newArgumentEncoderWithBufferIndex:").?;
    sel_functionNames = c.sel_registerName("functionNames").?;
    sel_inputPrimitiveTopology = c.sel_registerName("inputPrimitiveTopology").?;
    sel_libraries = c.sel_registerName("libraries").?;
    sel_setTileWidth_ = c.sel_registerName("setTileWidth:").?;
    sel_storeActionOptions = c.sel_registerName("storeActionOptions").?;
    sel_threadgroupSizeMatchesTileSize = c.sel_registerName("threadgroupSizeMatchesTileSize").?;
    sel_setMinFilter_ = c.sel_registerName("setMinFilter:").?;
    sel_usedSize = c.sel_registerName("usedSize").?;
    sel_setStepFunction_ = c.sel_registerName("setStepFunction:").?;
    sel_waitForFence_ = c.sel_registerName("waitForFence:").?;
    sel_setTessellationFactorBuffer_offset_instanceStride_ = c.sel_registerName("setTessellationFactorBuffer:offset:instanceStride:").?;
    sel_setThreadgroupMemoryLength_offset_atIndex_ = c.sel_registerName("setThreadgroupMemoryLength:offset:atIndex:").?;
    sel_setPrivateFunctions_ = c.sel_registerName("setPrivateFunctions:").?;
    sel_screenSize = c.sel_registerName("screenSize").?;
    sel_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:").?;
    sel_commandQueue = c.sel_registerName("commandQueue").?;
    sel_accelerationStructureCommandEncoder = c.sel_registerName("accelerationStructureCommandEncoder").?;
    sel_line = c.sel_registerName("line").?;
    sel_newRemoteTextureViewForDevice_ = c.sel_registerName("newRemoteTextureViewForDevice:").?;
    sel_setColorStoreActionOptions_atIndex_ = c.sel_registerName("setColorStoreActionOptions:atIndex:").?;
    sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ = c.sel_registerName("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:").?;
    sel_setReadMask_ = c.sel_registerName("setReadMask:").?;
    sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ = c.sel_registerName("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:").?;
    sel_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_ = c.sel_registerName("convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:").?;
    sel_setInputPrimitiveTopology_ = c.sel_registerName("setInputPrimitiveTopology:").?;
    sel_initWithDispatchQueue_ = c.sel_registerName("initWithDispatchQueue:").?;
    sel_offset = c.sel_registerName("offset").?;
    sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:").?;
    sel_linkedFunctions = c.sel_registerName("linkedFunctions").?;
    sel_newLibraryWithURL_error_ = c.sel_registerName("newLibraryWithURL:error:").?;
    sel_setStencilFailureOperation_ = c.sel_registerName("setStencilFailureOperation:").?;
    sel_isRasterizationEnabled = c.sel_registerName("isRasterizationEnabled").?;
    sel_bufferOffset = c.sel_registerName("bufferOffset").?;
    sel_argumentDescriptor = c.sel_registerName("argumentDescriptor").?;
    sel_dispatchThreadsPerTile_ = c.sel_registerName("dispatchThreadsPerTile:").?;
    sel_hasUnifiedMemory = c.sel_registerName("hasUnifiedMemory").?;
    sel_encoderLabel = c.sel_registerName("encoderLabel").?;
    sel_signaledValue = c.sel_registerName("signaledValue").?;
    sel_setDepthStoreAction_ = c.sel_registerName("setDepthStoreAction:").?;
    sel_objectThreadgroupSizeIsMultipleOfThreadExecutionWidth = c.sel_registerName("objectThreadgroupSizeIsMultipleOfThreadExecutionWidth").?;
    sel_maxTotalThreadsPerThreadgroup = c.sel_registerName("maxTotalThreadsPerThreadgroup").?;
    sel_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_supportAddingVertexBinaryFunctions = c.sel_registerName("supportAddingVertexBinaryFunctions").?;
    sel_newAccelerationStructureWithSize_ = c.sel_registerName("newAccelerationStructureWithSize:").?;
    sel_objectAtIndexedSubscript_ = c.sel_registerName("objectAtIndexedSubscript:").?;
    sel_setIntersectionFunctionTables_withBufferRange_ = c.sel_registerName("setIntersectionFunctionTables:withBufferRange:").?;
    sel_fragmentFunction = c.sel_registerName("fragmentFunction").?;
    sel_setIndexBufferOffset_ = c.sel_registerName("setIndexBufferOffset:").?;
    sel_insertDebugSignpost_ = c.sel_registerName("insertDebugSignpost:").?;
    sel_setMeshBuffer_offset_atIndex_ = c.sel_registerName("setMeshBuffer:offset:atIndex:").?;
    sel_presentedTime = c.sel_registerName("presentedTime").?;
    sel_sampleTimestamps_gpuTimestamp_ = c.sel_registerName("sampleTimestamps:gpuTimestamp:").?;
    sel_functionDescriptor = c.sel_registerName("functionDescriptor").?;
    sel_depthPlane = c.sel_registerName("depthPlane").?;
    sel_fillBuffer_range_value_ = c.sel_registerName("fillBuffer:range:value:").?;
    sel_useResources_count_usage_stages_ = c.sel_registerName("useResources:count:usage:stages:").?;
    sel_setVisibleFunctionTables_withBufferRange_ = c.sel_registerName("setVisibleFunctionTables:withBufferRange:").?;
    sel_encodedLength = c.sel_registerName("encodedLength").?;
    sel_setObjectSamplerState_atIndex_ = c.sel_registerName("setObjectSamplerState:atIndex:").?;
    sel_setFragmentIntersectionFunctionTable_atBufferIndex_ = c.sel_registerName("setFragmentIntersectionFunctionTable:atBufferIndex:").?;
    sel_shouldMaximizeConcurrentCompilation = c.sel_registerName("shouldMaximizeConcurrentCompilation").?;
    sel_GPUStartTime = c.sel_registerName("GPUStartTime").?;
    sel_primitiveDataBuffer = c.sel_registerName("primitiveDataBuffer").?;
    sel_isActive = c.sel_registerName("isActive").?;
    sel_commandBuffer = c.sel_registerName("commandBuffer").?;
    sel_insertLibraries = c.sel_registerName("insertLibraries").?;
    sel_tailSizeInBytes = c.sel_registerName("tailSizeInBytes").?;
    sel_setCompressionType_ = c.sel_registerName("setCompressionType:").?;
    sel_column = c.sel_registerName("column").?;
    sel_enqueueBarrier = c.sel_registerName("enqueueBarrier").?;
    sel_isTessellationFactorScaleEnabled = c.sel_registerName("isTessellationFactorScaleEnabled").?;
    sel_setUrl_ = c.sel_registerName("setUrl:").?;
    sel_loadBytes_size_sourceHandle_sourceHandleOffset_ = c.sel_registerName("loadBytes:size:sourceHandle:sourceHandleOffset:").?;
    sel_setRasterizationEnabled_ = c.sel_registerName("setRasterizationEnabled:").?;
    sel_maxKernelBufferBindCount = c.sel_registerName("maxKernelBufferBindCount").?;
    sel_supportsBCTextureCompression = c.sel_registerName("supportsBCTextureCompression").?;
    sel_argumentBuffersSupport = c.sel_registerName("argumentBuffersSupport").?;
    sel_setStartOfFragmentSampleIndex_ = c.sel_registerName("setStartOfFragmentSampleIndex:").?;
    sel_setSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_newFunctionWithName_constantValues_completionHandler_ = c.sel_registerName("newFunctionWithName:constantValues:completionHandler:").?;
    sel_verticalSampleStorage = c.sel_registerName("verticalSampleStorage").?;
    sel_setPreprocessorMacros_ = c.sel_registerName("setPreprocessorMacros:").?;
    sel_setStageInputDescriptor_ = c.sel_registerName("setStageInputDescriptor:").?;
    sel_setCullMode_ = c.sel_registerName("setCullMode:").?;
    sel_motionTransformCount = c.sel_registerName("motionTransformCount").?;
    sel_maxCommandsInFlight = c.sel_registerName("maxCommandsInFlight").?;
    sel_setDepthCompareFunction_ = c.sel_registerName("setDepthCompareFunction:").?;
    sel_setDepthStencilPassOperation_ = c.sel_registerName("setDepthStencilPassOperation:").?;
    sel_setTileSamplerState_atIndex_ = c.sel_registerName("setTileSamplerState:atIndex:").?;
    sel_motionEndBorderMode = c.sel_registerName("motionEndBorderMode").?;
    sel_areRasterOrderGroupsSupported = c.sel_registerName("areRasterOrderGroupsSupported").?;
    sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ = c.sel_registerName("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:").?;
    sel_setPixelFormat_ = c.sel_registerName("setPixelFormat:").?;
    sel_setLibraries_ = c.sel_registerName("setLibraries:").?;
    sel_setTextureType_ = c.sel_registerName("setTextureType:").?;
    sel_newArgumentEncoderForBufferAtIndex_ = c.sel_registerName("newArgumentEncoderForBufferAtIndex:").?;
    sel_newFunctionWithDescriptor_completionHandler_ = c.sel_registerName("newFunctionWithDescriptor:completionHandler:").?;
    sel_newFunctionWithName_ = c.sel_registerName("newFunctionWithName:").?;
    sel_makeAliasable = c.sel_registerName("makeAliasable").?;
    sel_newIntersectionFunctionWithDescriptor_error_ = c.sel_registerName("newIntersectionFunctionWithDescriptor:error:").?;
    sel_bufferAlignment = c.sel_registerName("bufferAlignment").?;
    sel_isRemovable = c.sel_registerName("isRemovable").?;
    sel_dispatchThreads_threadsPerThreadgroup_ = c.sel_registerName("dispatchThreads:threadsPerThreadgroup:").?;
    sel_setIntersectionFunctionTable_atIndex_ = c.sel_registerName("setIntersectionFunctionTable:atIndex:").?;
    sel_clearDepth = c.sel_registerName("clearDepth").?;
    sel_rgbBlendOperation = c.sel_registerName("rgbBlendOperation").?;
    sel_getSamplePositions_count_ = c.sel_registerName("getSamplePositions:count:").?;
    sel_setDepthAttachmentPixelFormat_ = c.sel_registerName("setDepthAttachmentPixelFormat:").?;
    sel_dataSize = c.sel_registerName("dataSize").?;
    sel_sourceAlphaBlendFactor = c.sel_registerName("sourceAlphaBlendFactor").?;
    sel_threadExecutionWidth = c.sel_registerName("threadExecutionWidth").?;
    sel_supportsDynamicLibraries = c.sel_registerName("supportsDynamicLibraries").?;
    sel_setMeshTexture_atIndex_ = c.sel_registerName("setMeshTexture:atIndex:").?;
    sel_loadAction = c.sel_registerName("loadAction").?;
    sel_sampleCount = c.sel_registerName("sampleCount").?;
    sel_locationNumber = c.sel_registerName("locationNumber").?;
    sel_newAccelerationStructureWithSize_offset_ = c.sel_registerName("newAccelerationStructureWithSize:offset:").?;
    sel_isCapturing = c.sel_registerName("isCapturing").?;
    sel_bufferIndex = c.sel_registerName("bufferIndex").?;
    sel_index = c.sel_registerName("index").?;
    sel_recommendedMaxWorkingSetSize = c.sel_registerName("recommendedMaxWorkingSetSize").?;
    sel_arrayLength = c.sel_registerName("arrayLength").?;
    sel_newLibraryWithSource_options_error_ = c.sel_registerName("newLibraryWithSource:options:error:").?;
    sel_setSourceAlphaBlendFactor_ = c.sel_registerName("setSourceAlphaBlendFactor:").?;
    sel_newDynamicLibraryWithURL_error_ = c.sel_registerName("newDynamicLibraryWithURL:error:").?;
    sel_heapTextureSizeAndAlignWithDescriptor_ = c.sel_registerName("heapTextureSizeAndAlignWithDescriptor:").?;
    sel_stageInputAttributes = c.sel_registerName("stageInputAttributes").?;
    sel_members = c.sel_registerName("members").?;
    sel_setFragmentAdditionalBinaryFunctions_ = c.sel_registerName("setFragmentAdditionalBinaryFunctions:").?;
    sel_setTexture_atIndex_ = c.sel_registerName("setTexture:atIndex:").?;
    sel_captureObject = c.sel_registerName("captureObject").?;
    sel_addBarrier = c.sel_registerName("addBarrier").?;
    sel_supportArgumentBuffers = c.sel_registerName("supportArgumentBuffers").?;
    sel_vertexStride = c.sel_registerName("vertexStride").?;
    sel_setBoundingBoxStride_ = c.sel_registerName("setBoundingBoxStride:").?;
    sel_setStartOfEncoderSampleIndex_ = c.sel_registerName("setStartOfEncoderSampleIndex:").?;
    sel_setMagFilter_ = c.sel_registerName("setMagFilter:").?;
    sel_setArgumentIndex_ = c.sel_registerName("setArgumentIndex:").?;
    sel_parentRelativeLevel = c.sel_registerName("parentRelativeLevel").?;
    sel_newCaptureScopeWithCommandQueue_ = c.sel_registerName("newCaptureScopeWithCommandQueue:").?;
    sel_setSlice_ = c.sel_registerName("setSlice:").?;
    sel_pixelFormat = c.sel_registerName("pixelFormat").?;
    sel_argumentIndexStride = c.sel_registerName("argumentIndexStride").?;
    sel_kernelStartTime = c.sel_registerName("kernelStartTime").?;
    sel_destinationRGBBlendFactor = c.sel_registerName("destinationRGBBlendFactor").?;
    sel_rasterSampleCount = c.sel_registerName("rasterSampleCount").?;
    sel_maxArgumentBufferSamplerCount = c.sel_registerName("maxArgumentBufferSamplerCount").?;
    sel_argumentIndex = c.sel_registerName("argumentIndex").?;
    sel_newRenderPipelineStateWithDescriptor_options_reflection_error_ = c.sel_registerName("newRenderPipelineStateWithDescriptor:options:reflection:error:").?;
    sel_normalizedCoordinates = c.sel_registerName("normalizedCoordinates").?;
    sel_setVertexAccelerationStructure_atBufferIndex_ = c.sel_registerName("setVertexAccelerationStructure:atBufferIndex:").?;
    sel_heapBufferSizeAndAlignWithLength_options_ = c.sel_registerName("heapBufferSizeAndAlignWithLength:options:").?;
    sel_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:").?;
    sel_currentAllocatedSize = c.sel_registerName("currentAllocatedSize").?;
    sel_objectBuffers = c.sel_registerName("objectBuffers").?;
    sel_accelerationStructureCommandEncoderWithDescriptor_ = c.sel_registerName("accelerationStructureCommandEncoderWithDescriptor:").?;
    sel_drawPrimitives_vertexStart_vertexCount_ = c.sel_registerName("drawPrimitives:vertexStart:vertexCount:").?;
    sel_alignment = c.sel_registerName("alignment").?;
    sel_newRenderPipelineStateWithTileDescriptor_options_reflection_error_ = c.sel_registerName("newRenderPipelineStateWithTileDescriptor:options:reflection:error:").?;
    sel_resolveDepthPlane = c.sel_registerName("resolveDepthPlane").?;
    sel_threadgroupMemoryDataSize = c.sel_registerName("threadgroupMemoryDataSize").?;
    sel_setConstantValues_type_withRange_ = c.sel_registerName("setConstantValues:type:withRange:").?;
    sel_newComputePipelineStateWithDescriptor_options_reflection_error_ = c.sel_registerName("newComputePipelineStateWithDescriptor:options:reflection:error:").?;
    sel_fragmentLinkedFunctions = c.sel_registerName("fragmentLinkedFunctions").?;
    sel_setIndirectCommandBuffers_withRange_ = c.sel_registerName("setIndirectCommandBuffers:withRange:").?;
    sel_startCaptureWithDescriptor_error_ = c.sel_registerName("startCaptureWithDescriptor:error:").?;
    sel_function = c.sel_registerName("function").?;
    sel_intersectionFunctionTableOffset = c.sel_registerName("intersectionFunctionTableOffset").?;
    sel_fragmentAdditionalBinaryFunctions = c.sel_registerName("fragmentAdditionalBinaryFunctions").?;
    sel_blitPassDescriptor = c.sel_registerName("blitPassDescriptor").?;
    sel_preprocessorMacros = c.sel_registerName("preprocessorMacros").?;
    sel_sourceRGBBlendFactor = c.sel_registerName("sourceRGBBlendFactor").?;
    sel_blitCommandEncoder = c.sel_registerName("blitCommandEncoder").?;
    sel_setInstallName_ = c.sel_registerName("setInstallName:").?;
    sel_lodMaxClamp = c.sel_registerName("lodMaxClamp").?;
    sel_setVertexBuffers_ = c.sel_registerName("setVertexBuffers:").?;
    sel_defaultCaptureScope = c.sel_registerName("defaultCaptureScope").?;
    sel_signalEvent_value_ = c.sel_registerName("signalEvent:value:").?;
    sel_setEndOfFragmentSampleIndex_ = c.sel_registerName("setEndOfFragmentSampleIndex:").?;
    sel_tileBuffers = c.sel_registerName("tileBuffers").?;
    sel_vertexArguments = c.sel_registerName("vertexArguments").?;
    sel_setOutputNode_ = c.sel_registerName("setOutputNode:").?;
    sel_vertexFunction = c.sel_registerName("vertexFunction").?;
    sel_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ = c.sel_registerName("drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:").?;
    sel_required = c.sel_registerName("required").?;
    sel_setTessellationControlPointIndexType_ = c.sel_registerName("setTessellationControlPointIndexType:").?;
    sel_mipFilter = c.sel_registerName("mipFilter").?;
    sel_setInheritPipelineState_ = c.sel_registerName("setInheritPipelineState:").?;
    sel_maximumConcurrentCompilationTaskCount = c.sel_registerName("maximumConcurrentCompilationTaskCount").?;
    sel_setSAddressMode_ = c.sel_registerName("setSAddressMode:").?;
    sel_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ = c.sel_registerName("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:").?;
    sel_newIndirectCommandBufferWithDescriptor_maxCommandCount_options_ = c.sel_registerName("newIndirectCommandBufferWithDescriptor:maxCommandCount:options:").?;
    sel_indexType = c.sel_registerName("indexType").?;
    sel_setVertexBuffers_offsets_withRange_ = c.sel_registerName("setVertexBuffers:offsets:withRange:").?;
    sel_useHeaps_count_ = c.sel_registerName("useHeaps:count:").?;
    sel_resolveTexture = c.sel_registerName("resolveTexture").?;
    sel_waitForEvent_value_ = c.sel_registerName("waitForEvent:value:").?;
    sel_newHeapWithDescriptor_ = c.sel_registerName("newHeapWithDescriptor:").?;
    sel_setVertexAdditionalBinaryFunctions_ = c.sel_registerName("setVertexAdditionalBinaryFunctions:").?;
    sel_resolveSlice = c.sel_registerName("resolveSlice").?;
    sel_setFastMathEnabled_ = c.sel_registerName("setFastMathEnabled:").?;
    sel_setMaxCallStackDepth_ = c.sel_registerName("setMaxCallStackDepth:").?;
    sel_hazardTrackingMode = c.sel_registerName("hazardTrackingMode").?;
    sel_setFunctionGraphs_ = c.sel_registerName("setFunctionGraphs:").?;
    sel_setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ = c.sel_registerName("setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:").?;
    sel_layerAtIndex_ = c.sel_registerName("layerAtIndex:").?;
    sel_minimumTextureBufferAlignmentForPixelFormat_ = c.sel_registerName("minimumTextureBufferAlignmentForPixelFormat:").?;
    sel_setVertexBuffer_ = c.sel_registerName("setVertexBuffer:").?;
    sel_supportsQueryTextureLOD = c.sel_registerName("supportsQueryTextureLOD").?;
    sel_setVertexBufferOffset_atIndex_ = c.sel_registerName("setVertexBufferOffset:atIndex:").?;
    sel_setObjectBufferOffset_atIndex_ = c.sel_registerName("setObjectBufferOffset:atIndex:").?;
    sel_setMutability_ = c.sel_registerName("setMutability:").?;
    sel_vertexLinkedFunctions = c.sel_registerName("vertexLinkedFunctions").?;
    sel_newCaptureScopeWithDevice_ = c.sel_registerName("newCaptureScopeWithDevice:").?;
    sel_supportsRenderDynamicLibraries = c.sel_registerName("supportsRenderDynamicLibraries").?;
    sel_pointerType = c.sel_registerName("pointerType").?;
    sel_setFragmentBuffer_offset_atIndex_ = c.sel_registerName("setFragmentBuffer:offset:atIndex:").?;
    sel_bufferDataSize = c.sel_registerName("bufferDataSize").?;
    sel_setClearDepth_ = c.sel_registerName("setClearDepth:").?;
    sel_attributeIndex = c.sel_registerName("attributeIndex").?;
    sel_setArgumentBuffer_startOffset_arrayElement_ = c.sel_registerName("setArgumentBuffer:startOffset:arrayElement:").?;
    sel_resetTextureAccessCounters_region_mipLevel_slice_ = c.sel_registerName("resetTextureAccessCounters:region:mipLevel:slice:").?;
    sel_constantValues = c.sel_registerName("constantValues").?;
    sel_copyFromTexture_toTexture_ = c.sel_registerName("copyFromTexture:toTexture:").?;
    sel_setStencilAttachmentPixelFormat_ = c.sel_registerName("setStencilAttachmentPixelFormat:").?;
    sel_setMaxVertexBufferBindCount_ = c.sel_registerName("setMaxVertexBufferBindCount:").?;
    sel_error = c.sel_registerName("error").?;
    sel_instanceCount = c.sel_registerName("instanceCount").?;
    sel_fastMathEnabled = c.sel_registerName("fastMathEnabled").?;
    sel_drawPrimitives_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("drawPrimitives:indirectBuffer:indirectBufferOffset:").?;
    sel_concurrentDispatchThreads_threadsPerThreadgroup_ = c.sel_registerName("concurrentDispatchThreads:threadsPerThreadgroup:").?;
    sel_presentDrawable_atTime_ = c.sel_registerName("presentDrawable:atTime:").?;
    sel_newIntersectionFunctionTableWithDescriptor_stage_ = c.sel_registerName("newIntersectionFunctionTableWithDescriptor:stage:").?;
    sel_readWriteTextureSupport = c.sel_registerName("readWriteTextureSupport").?;
    sel_supportsShaderBarycentricCoordinates = c.sel_registerName("supportsShaderBarycentricCoordinates").?;
    sel_endEncoding = c.sel_registerName("endEncoding").?;
    sel_setDispatchType_ = c.sel_registerName("setDispatchType:").?;
    sel_useResources_count_usage_ = c.sel_registerName("useResources:count:usage:").?;
    sel_setVisibilityResultMode_offset_ = c.sel_registerName("setVisibilityResultMode:offset:").?;
    sel_renderTargetWidth = c.sel_registerName("renderTargetWidth").?;
    sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ = c.sel_registerName("drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:").?;
    sel_sAddressMode = c.sel_registerName("sAddressMode").?;
    sel_newRenderPipelineStateWithTileDescriptor_options_completionHandler_ = c.sel_registerName("newRenderPipelineStateWithTileDescriptor:options:completionHandler:").?;
    sel_startCaptureWithCommandQueue_ = c.sel_registerName("startCaptureWithCommandQueue:").?;
    sel_setMaxKernelBufferBindCount_ = c.sel_registerName("setMaxKernelBufferBindCount:").?;
    sel_peerGroupID = c.sel_registerName("peerGroupID").?;
    sel_initWithSampleCount_ = c.sel_registerName("initWithSampleCount:").?;
    sel_waitUntilCompleted = c.sel_registerName("waitUntilCompleted").?;
    sel_setBlendingEnabled_ = c.sel_registerName("setBlendingEnabled:").?;
    sel_size = c.sel_registerName("size").?;
    sel_setOpaque_ = c.sel_registerName("setOpaque:").?;
    sel_supportsRasterizationRateMapWithLayerCount_ = c.sel_registerName("supportsRasterizationRateMapWithLayerCount:").?;
    sel_storeAction = c.sel_registerName("storeAction").?;
    sel_setMotionStartBorderMode_ = c.sel_registerName("setMotionStartBorderMode:").?;
    sel_setWriteMask_ = c.sel_registerName("setWriteMask:").?;
    sel_newCounterSampleBufferWithDescriptor_error_ = c.sel_registerName("newCounterSampleBufferWithDescriptor:error:").?;
    sel_mapPhysicalToScreenCoordinates_forLayer_ = c.sel_registerName("mapPhysicalToScreenCoordinates:forLayer:").?;
    sel_setResolveLevel_ = c.sel_registerName("setResolveLevel:").?;
    sel_depthAttachmentPixelFormat = c.sel_registerName("depthAttachmentPixelFormat").?;
    sel_setName_ = c.sel_registerName("setName:").?;
    sel_fragmentPreloadedLibraries = c.sel_registerName("fragmentPreloadedLibraries").?;
    sel_setDepth_ = c.sel_registerName("setDepth:").?;
    sel_newTextureViewWithPixelFormat_ = c.sel_registerName("newTextureViewWithPixelFormat:").?;
    sel_vertexAdditionalBinaryFunctions = c.sel_registerName("vertexAdditionalBinaryFunctions").?;
    sel_setRAddressMode_ = c.sel_registerName("setRAddressMode:").?;
    sel_setTileIntersectionFunctionTable_atBufferIndex_ = c.sel_registerName("setTileIntersectionFunctionTable:atBufferIndex:").?;
    sel_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_functionGraphs = c.sel_registerName("functionGraphs").?;
    sel_computeCommandEncoderWithDescriptor_ = c.sel_registerName("computeCommandEncoderWithDescriptor:").?;
    sel_optimizeContentsForGPUAccess_ = c.sel_registerName("optimizeContentsForGPUAccess:").?;
    sel_depthResolveFilter = c.sel_registerName("depthResolveFilter").?;
    sel_setFunctionName_ = c.sel_registerName("setFunctionName:").?;
    sel_newSharedTextureHandle = c.sel_registerName("newSharedTextureHandle").?;
    sel_storageMode = c.sel_registerName("storageMode").?;
    sel_setSupportIndirectCommandBuffers_ = c.sel_registerName("setSupportIndirectCommandBuffers:").?;
    sel_setSamplerStates_withRange_ = c.sel_registerName("setSamplerStates:withRange:").?;
    sel_setMotionTransformCount_ = c.sel_registerName("setMotionTransformCount:").?;
    sel_encodeWaitForEvent_value_ = c.sel_registerName("encodeWaitForEvent:value:").?;
    sel_counterSets = c.sel_registerName("counterSets").?;
    sel_vertical = c.sel_registerName("vertical").?;
    sel_setSupportAddingBinaryFunctions_ = c.sel_registerName("setSupportAddingBinaryFunctions:").?;
    sel_newBufferWithBytesNoCopy_length_options_deallocator_ = c.sel_registerName("newBufferWithBytesNoCopy:length:options:deallocator:").?;
    sel_clearBarrier = c.sel_registerName("clearBarrier").?;
    sel_binaryFunctions = c.sel_registerName("binaryFunctions").?;
    sel_addRenderPipelineFunctionsWithDescriptor_error_ = c.sel_registerName("addRenderPipelineFunctionsWithDescriptor:error:").?;
    sel_setVertexPreloadedLibraries_ = c.sel_registerName("setVertexPreloadedLibraries:").?;
    sel_setVertexBufferOffset_ = c.sel_registerName("setVertexBufferOffset:").?;
    sel_vertexBufferOffset = c.sel_registerName("vertexBufferOffset").?;
    sel_newArgumentEncoderWithBufferBinding_ = c.sel_registerName("newArgumentEncoderWithBufferBinding:").?;
    sel_iosurface = c.sel_registerName("iosurface").?;
    sel_newRenderPipelineStateWithMeshDescriptor_options_completionHandler_ = c.sel_registerName("newRenderPipelineStateWithMeshDescriptor:options:completionHandler:").?;
    sel_imageblockSampleLength = c.sel_registerName("imageblockSampleLength").?;
    sel_instancedAccelerationStructures = c.sel_registerName("instancedAccelerationStructures").?;
    sel_url = c.sel_registerName("url").?;
    sel_setFragmentBufferOffset_atIndex_ = c.sel_registerName("setFragmentBufferOffset:atIndex:").?;
    sel_setVertexStride_ = c.sel_registerName("setVertexStride:").?;
    sel_writeCompactedAccelerationStructureSize_toBuffer_offset_ = c.sel_registerName("writeCompactedAccelerationStructureSize:toBuffer:offset:").?;
    sel_setTessellationPartitionMode_ = c.sel_registerName("setTessellationPartitionMode:").?;
    sel_setTileFunction_ = c.sel_registerName("setTileFunction:").?;
    sel_setFragmentLinkedFunctions_ = c.sel_registerName("setFragmentLinkedFunctions:").?;
    sel_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_ = c.sel_registerName("setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:").?;
    sel_setMotionKeyframeCount_ = c.sel_registerName("setMotionKeyframeCount:").?;
    sel_setViewports_count_ = c.sel_registerName("setViewports:count:").?;
    sel_newLibraryWithStitchedDescriptor_error_ = c.sel_registerName("newLibraryWithStitchedDescriptor:error:").?;
    sel_setBytes_length_atIndex_ = c.sel_registerName("setBytes:length:atIndex:").?;
    sel_resolveCounterRange_ = c.sel_registerName("resolveCounterRange:").?;
    sel_scratchBufferAllocator = c.sel_registerName("scratchBufferAllocator").?;
    sel_functionConstantsDictionary = c.sel_registerName("functionConstantsDictionary").?;
    sel_newSharedEvent = c.sel_registerName("newSharedEvent").?;
    sel_setMaxCommandBufferCount_ = c.sel_registerName("setMaxCommandBufferCount:").?;
    sel_supportsFeatureSet_ = c.sel_registerName("supportsFeatureSet:").?;
    sel_vertexAttributes = c.sel_registerName("vertexAttributes").?;
    sel_vertexDescriptor = c.sel_registerName("vertexDescriptor").?;
    sel_motionTransformBuffer = c.sel_registerName("motionTransformBuffer").?;
    sel_bindings = c.sel_registerName("bindings").?;
    sel_intersectionFunctionTableDescriptor = c.sel_registerName("intersectionFunctionTableDescriptor").?;
    sel_setFragmentVisibleFunctionTables_withBufferRange_ = c.sel_registerName("setFragmentVisibleFunctionTables:withBufferRange:").?;
    sel_renderTargetHeight = c.sel_registerName("renderTargetHeight").?;
    sel_setTessellationFactorScale_ = c.sel_registerName("setTessellationFactorScale:").?;
    sel_maxThreadsPerThreadgroup = c.sel_registerName("maxThreadsPerThreadgroup").?;
    sel_setSamplerState_atIndex_ = c.sel_registerName("setSamplerState:atIndex:").?;
    sel_setTexture_ = c.sel_registerName("setTexture:").?;
    sel_isLowPower = c.sel_registerName("isLowPower").?;
    sel_lodAverage = c.sel_registerName("lodAverage").?;
    sel_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_ = c.sel_registerName("replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:").?;
    sel_setFragmentBytes_length_atIndex_ = c.sel_registerName("setFragmentBytes:length:atIndex:").?;
    sel_newDepthStencilStateWithDescriptor_ = c.sel_registerName("newDepthStencilStateWithDescriptor:").?;
    sel_supportsDestination_ = c.sel_registerName("supportsDestination:").?;
    sel_triangleCount = c.sel_registerName("triangleCount").?;
    sel_newSamplerStateWithDescriptor_ = c.sel_registerName("newSamplerStateWithDescriptor:").?;
    sel_didModifyRange_ = c.sel_registerName("didModifyRange:").?;
    sel_patchType = c.sel_registerName("patchType").?;
    sel_rAddressMode = c.sel_registerName("rAddressMode").?;
    sel_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ = c.sel_registerName("copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:").?;
    sel_setIntersectionFunctionTableOffset_ = c.sel_registerName("setIntersectionFunctionTableOffset:").?;
    sel_setMaxTessellationFactor_ = c.sel_registerName("setMaxTessellationFactor:").?;
    sel_setLodMaxClamp_ = c.sel_registerName("setLodMaxClamp:").?;
    sel_setRenderTargetWidth_ = c.sel_registerName("setRenderTargetWidth:").?;
    sel_initWithArgumentIndex_ = c.sel_registerName("initWithArgumentIndex:").?;
    sel_outputNode = c.sel_registerName("outputNode").?;
    sel_setCompareFunction_ = c.sel_registerName("setCompareFunction:").?;
    sel_maxFragmentBufferBindCount = c.sel_registerName("maxFragmentBufferBindCount").?;
    sel_cpuCacheMode = c.sel_registerName("cpuCacheMode").?;
    sel_setCompileSymbolVisibility_ = c.sel_registerName("setCompileSymbolVisibility:").?;
    sel_setNodes_ = c.sel_registerName("setNodes:").?;
    sel_errorOptions = c.sel_registerName("errorOptions").?;
    sel_setInstanceDescriptorBuffer_ = c.sel_registerName("setInstanceDescriptorBuffer:").?;
    sel_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ = c.sel_registerName("drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:").?;
    sel_contents = c.sel_registerName("contents").?;
    sel_setFragmentPreloadedLibraries_ = c.sel_registerName("setFragmentPreloadedLibraries:").?;
    sel_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ = c.sel_registerName("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:").?;
    sel_maxTotalThreadsPerObjectThreadgroup = c.sel_registerName("maxTotalThreadsPerObjectThreadgroup").?;
    sel_setTileIntersectionFunctionTables_withBufferRange_ = c.sel_registerName("setTileIntersectionFunctionTables:withBufferRange:").?;
    sel_setBoundingBoxBufferOffset_ = c.sel_registerName("setBoundingBoxBufferOffset:").?;
    sel_setTileBytes_length_atIndex_ = c.sel_registerName("setTileBytes:length:atIndex:").?;
    sel_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_ = c.sel_registerName("loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:").?;
    sel_stageInputDescriptor = c.sel_registerName("stageInputDescriptor").?;
    sel_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_ = c.sel_registerName("drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:").?;
    sel_setKernelBuffer_offset_atIndex_ = c.sel_registerName("setKernelBuffer:offset:atIndex:").?;
    sel_newIOHandleWithURL_error_ = c.sel_registerName("newIOHandleWithURL:error:").?;
    sel_stepFunction = c.sel_registerName("stepFunction").?;
    sel_setMotionTransformBufferOffset_ = c.sel_registerName("setMotionTransformBufferOffset:").?;
    sel_newComputePipelineStateWithFunction_options_reflection_error_ = c.sel_registerName("newComputePipelineStateWithFunction:options:reflection:error:").?;
    sel_setConstantValue_type_atIndex_ = c.sel_registerName("setConstantValue:type:atIndex:").?;
    sel_newEvent = c.sel_registerName("newEvent").?;
    sel_setSupportRayTracing_ = c.sel_registerName("setSupportRayTracing:").?;
    sel_concurrentDispatchThreadgroups_threadsPerThreadgroup_ = c.sel_registerName("concurrentDispatchThreadgroups:threadsPerThreadgroup:").?;
    sel_setStencilStoreActionOptions_ = c.sel_registerName("setStencilStoreActionOptions:").?;
    sel_sparseTileSizeInBytesForSparsePageSize_ = c.sel_registerName("sparseTileSizeInBytesForSparsePageSize:").?;
    sel_newDefaultLibraryWithBundle_error_ = c.sel_registerName("newDefaultLibraryWithBundle:error:").?;
    sel_drawPrimitives_vertexStart_vertexCount_instanceCount_ = c.sel_registerName("drawPrimitives:vertexStart:vertexCount:instanceCount:").?;
    sel_replaceRegion_mipmapLevel_withBytes_bytesPerRow_ = c.sel_registerName("replaceRegion:mipmapLevel:withBytes:bytesPerRow:").?;
    sel_transformationMatrixBuffer = c.sel_registerName("transformationMatrixBuffer").?;
    sel_useResource_usage_ = c.sel_registerName("useResource:usage:").?;
    sel_setDepthFailureOperation_ = c.sel_registerName("setDepthFailureOperation:").?;
    sel_sparseTileSizeWithTextureType_pixelFormat_sampleCount_ = c.sel_registerName("sparseTileSizeWithTextureType:pixelFormat:sampleCount:").?;
    sel_nodes = c.sel_registerName("nodes").?;
    sel_setPrimitiveDataBuffer_ = c.sel_registerName("setPrimitiveDataBuffer:").?;
    sel_clearStencil = c.sel_registerName("clearStencil").?;
    sel_supportsRaytracing = c.sel_registerName("supportsRaytracing").?;
    sel_setLodAverage_ = c.sel_registerName("setLodAverage:").?;
    sel_setGroups_ = c.sel_registerName("setGroups:").?;
    sel_newTextureWithDescriptor_offset_bytesPerRow_ = c.sel_registerName("newTextureWithDescriptor:offset:bytesPerRow:").?;
    sel_optimizeIndirectCommandBuffer_withRange_ = c.sel_registerName("optimizeIndirectCommandBuffer:withRange:").?;
    sel_supportsVertexAmplificationCount_ = c.sel_registerName("supportsVertexAmplificationCount:").?;
    sel_setVertexLinkedFunctions_ = c.sel_registerName("setVertexLinkedFunctions:").?;
    sel_setThreadgroupSizeMatchesTileSize_ = c.sel_registerName("setThreadgroupSizeMatchesTileSize:").?;
    sel_setDepthAttachment_ = c.sel_registerName("setDepthAttachment:").?;
    sel_tessellationControlPointIndexType = c.sel_registerName("tessellationControlPointIndexType").?;
    sel_setVertexVisibleFunctionTable_atBufferIndex_ = c.sel_registerName("setVertexVisibleFunctionTable:atBufferIndex:").?;
    sel_addCompletedHandler_ = c.sel_registerName("addCompletedHandler:").?;
    sel_setResolveTexture_ = c.sel_registerName("setResolveTexture:").?;
    sel_setInstanceDescriptorType_ = c.sel_registerName("setInstanceDescriptorType:").?;
    sel_setTileTexture_atIndex_ = c.sel_registerName("setTileTexture:atIndex:").?;
    sel_setLodMinClamp_ = c.sel_registerName("setLodMinClamp:").?;
    sel_setGeometryDescriptors_ = c.sel_registerName("setGeometryDescriptors:").?;
    sel_setFragmentTextures_withRange_ = c.sel_registerName("setFragmentTextures:withRange:").?;
    sel_setArrayLength_ = c.sel_registerName("setArrayLength:").?;
    sel_supportsCounterSampling_ = c.sel_registerName("supportsCounterSampling:").?;
    sel_newBinaryArchiveWithDescriptor_error_ = c.sel_registerName("newBinaryArchiveWithDescriptor:error:").?;
    sel_setBorderColor_ = c.sel_registerName("setBorderColor:").?;
    sel_defaultRasterSampleCount = c.sel_registerName("defaultRasterSampleCount").?;
    sel_setTransformationMatrixBuffer_ = c.sel_registerName("setTransformationMatrixBuffer:").?;
    sel_setPrimitiveDataBufferOffset_ = c.sel_registerName("setPrimitiveDataBufferOffset:").?;
    sel_setIndexBuffer_ = c.sel_registerName("setIndexBuffer:").?;
    sel_access = c.sel_registerName("access").?;
    sel_setTileHeight_ = c.sel_registerName("setTileHeight:").?;
    sel_sparseTileSizeInBytes = c.sel_registerName("sparseTileSizeInBytes").?;
    sel_setAllowReferencingUndefinedSymbols_ = c.sel_registerName("setAllowReferencingUndefinedSymbols:").?;
    sel_memoryBarrierWithScope_afterStages_beforeStages_ = c.sel_registerName("memoryBarrierWithScope:afterStages:beforeStages:").?;
    sel_setConstantValues_ = c.sel_registerName("setConstantValues:").?;
    sel_resourceStatePassDescriptor = c.sel_registerName("resourceStatePassDescriptor").?;
    sel_resolveLevel = c.sel_registerName("resolveLevel").?;
    sel_inheritBuffers = c.sel_registerName("inheritBuffers").?;
    sel_length = c.sel_registerName("length").?;
    sel_maxTotalThreadsPerMeshThreadgroup = c.sel_registerName("maxTotalThreadsPerMeshThreadgroup").?;
    sel_bufferPointerType = c.sel_registerName("bufferPointerType").?;
    sel_accelerationStructureSizesWithDescriptor_ = c.sel_registerName("accelerationStructureSizesWithDescriptor:").?;
    sel_setObjectSamplerStates_withRange_ = c.sel_registerName("setObjectSamplerStates:withRange:").?;
    sel_maxVertexCallStackDepth = c.sel_registerName("maxVertexCallStackDepth").?;
    sel_rootResource = c.sel_registerName("rootResource").?;
    sel_lodMinClamp = c.sel_registerName("lodMinClamp").?;
    sel_bufferStructType = c.sel_registerName("bufferStructType").?;
    sel_setOffset_ = c.sel_registerName("setOffset:").?;
    sel_maxTessellationFactor = c.sel_registerName("maxTessellationFactor").?;
    sel_texture = c.sel_registerName("texture").?;
    sel_newComputePipelineStateWithAdditionalBinaryFunctions_error_ = c.sel_registerName("newComputePipelineStateWithAdditionalBinaryFunctions:error:").?;
    sel_newLibraryWithStitchedDescriptor_completionHandler_ = c.sel_registerName("newLibraryWithStitchedDescriptor:completionHandler:").?;
    sel_setBoundingBoxCount_ = c.sel_registerName("setBoundingBoxCount:").?;
    sel_functionHandleWithFunction_stage_ = c.sel_registerName("functionHandleWithFunction:stage:").?;
    sel_setThreadgroupMemoryLength_ = c.sel_registerName("setThreadgroupMemoryLength:").?;
    sel_addComputePipelineFunctionsWithDescriptor_error_ = c.sel_registerName("addComputePipelineFunctionsWithDescriptor:error:").?;
    sel_primitiveDataBufferOffset = c.sel_registerName("primitiveDataBufferOffset").?;
    sel_attributes = c.sel_registerName("attributes").?;
    sel_setOutputURL_ = c.sel_registerName("setOutputURL:").?;
    sel_priority = c.sel_registerName("priority").?;
    sel_enqueue = c.sel_registerName("enqueue").?;
    sel_setObjectBuffer_offset_atIndex_ = c.sel_registerName("setObjectBuffer:offset:atIndex:").?;
    sel_pushDebugGroup_ = c.sel_registerName("pushDebugGroup:").?;
    sel_setAccess_ = c.sel_registerName("setAccess:").?;
    sel_presentDrawable_ = c.sel_registerName("presentDrawable:").?;
    sel_setAlphaToCoverageEnabled_ = c.sel_registerName("setAlphaToCoverageEnabled:").?;
    sel_iosurfacePlane = c.sel_registerName("iosurfacePlane").?;
    sel_tessellationOutputWindingOrder = c.sel_registerName("tessellationOutputWindingOrder").?;
    sel_memberByName_ = c.sel_registerName("memberByName:").?;
}
