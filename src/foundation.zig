const c = @import("c.zig");
const objc = @import("objc.zig");
const system = @import("system.zig");

// ------------------------------------------------------------------------------------------------
// Types

pub const ErrorDomain = *String;
pub const ErrorUserInfoKey = *String;
pub const Integer = isize;
pub const NotificationName = *String;
pub const TimeInterval = f64;
pub const UInteger = usize;
pub const unichar = u16;

// ------------------------------------------------------------------------------------------------
// Blocks

pub const Block = system.Block;
pub const BlockLiteral = system.BlockLiteral;
pub const BlockLiteralWithSignature = system.BlockLiteralWithSignature;
pub const stackBlockLiteral = system.stackBlockLiteral;
pub const globalBlockLiteral = system.globalBlockLiteral;
pub const globalBlock = system.globalBlock;

// ------------------------------------------------------------------------------------------------
// Enumerations

pub const ActivityOptions = u64;
pub const ActivityIdleDisplaySleepDisabled: ActivityOptions = (1 << 40);
pub const ActivityIdleSystemSleepDisabled: ActivityOptions = (1 << 20);
pub const ActivitySuddenTerminationDisabled: ActivityOptions = (1 << 14);
pub const ActivityAutomaticTerminationDisabled: ActivityOptions = (1 << 15);
pub const ActivityUserInitiated: ActivityOptions = (0x00FFFFFF | ActivityIdleSystemSleepDisabled);
pub const ActivityUserInitiatedAllowingIdleSystemSleep: ActivityOptions = (ActivityUserInitiated & ~ActivityIdleSystemSleepDisabled);
pub const ActivityBackground: ActivityOptions = 0x000000FF;
pub const ActivityLatencyCritical: ActivityOptions = 0xFF00000000;

pub const ComparisonResult = Integer;
pub const OrderedAscending: ComparisonResult = -1;
pub const OrderedSame: ComparisonResult = 0;
pub const OrderedDescending: ComparisonResult = 0;

pub const ProcessInfoThermalState = Integer;
pub const ProcessInfoThermalStateNominal: ProcessInfoThermalState = 0;
pub const ProcessInfoThermalStateFair: ProcessInfoThermalState = 1;
pub const ProcessInfoThermalStateSerious: ProcessInfoThermalState = 2;
pub const ProcessInfoThermalStateCritical: ProcessInfoThermalState = 3;

pub const StringTransform = *String;
pub const StringEncoding = UInteger;
pub const StringEncodingDetectionOptionsKey = *String;
pub const ASCIIStringEncoding: StringEncoding = 1;
pub const NEXTSTEPStringEncoding: StringEncoding = 2;
pub const JapaneseEUCStringEncoding: StringEncoding = 3;
pub const UTF8StringEncoding: StringEncoding = 4;
pub const ISOLatin1StringEncoding: StringEncoding = 5;
pub const SymbolStringEncoding: StringEncoding = 6;
pub const NonLossyASCIIStringEncoding: StringEncoding = 7;
pub const ShiftJISStringEncoding: StringEncoding = 8;
pub const ISOLatin2StringEncoding: StringEncoding = 9;
pub const UnicodeStringEncoding: StringEncoding = 10;
pub const WindowsCP1251StringEncoding: StringEncoding = 11;
pub const WindowsCP1252StringEncoding: StringEncoding = 12;
pub const WindowsCP1253StringEncoding: StringEncoding = 13;
pub const WindowsCP1254StringEncoding: StringEncoding = 14;
pub const WindowsCP1250StringEncoding: StringEncoding = 15;
pub const ISO2022JPStringEncoding: StringEncoding = 21;
pub const MacOSRomanStringEncoding: StringEncoding = 30;
pub const UTF16StringEncoding: StringEncoding = UnicodeStringEncoding;
pub const UTF16BigEndianStringEncoding: StringEncoding = 0x90000100;
pub const UTF16LittleEndianStringEncoding: StringEncoding = 0x94000100;
pub const UTF32StringEncoding: StringEncoding = 0x8c000100;
pub const UTF32BigEndianStringEncoding: StringEncoding = 0x98000100;
pub const UTF32LittleEndianStringEncoding: StringEncoding = 0x9c000100;

pub const StringCompareOptions = UInteger;
pub const CaseInsensitiveSearch: StringCompareOptions = 1;
pub const LiteralSearch: StringCompareOptions = 2;
pub const BackwardsSearch: StringCompareOptions = 4;
pub const AnchoredSearch: StringCompareOptions = 8;
pub const NumericSearch: StringCompareOptions = 64;
pub const DiacriticInsensitiveSearch: StringCompareOptions = 128;
pub const WidthInsensitiveSearch: StringCompareOptions = 256;
pub const ForcedOrderingSearch: StringCompareOptions = 512;
pub const RegularExpressionSearch: StringCompareOptions = 1024;

// ------------------------------------------------------------------------------------------------
// Constants

// TODO

extern const CocoaErrorDomain: ErrorDomain;
extern const POSIXErrorDomain: ErrorDomain;
extern const OSStatusErrorDomain: ErrorDomain;
extern const MachErrorDomain: ErrorDomain;

extern const UnderlyingErrorKey: ErrorUserInfoKey;
extern const LocalizedDescriptionKey: ErrorUserInfoKey;
extern const LocalizedFailureReasonErrorKey: ErrorUserInfoKey;
extern const LocalizedRecoverySuggestionErrorKey: ErrorUserInfoKey;
extern const LocalizedRecoveryOptionsErrorKey: ErrorUserInfoKey;
extern const RecoveryAttempterErrorKey: ErrorUserInfoKey;
extern const HelpAnchorErrorKey: ErrorUserInfoKey;
extern const DebugDescriptionErrorKey: ErrorUserInfoKey;
extern const LocalizedFailureErrorKey: ErrorUserInfoKey;
extern const StringEncodingErrorKey: ErrorUserInfoKey;
extern const URLErrorKey: ErrorUserInfoKey;
extern const FilePathErrorKey: ErrorUserInfoKey;

extern const BundleDidLoadNotification: NotificationName;
extern const BundleResourceRequestLowDiskSpaceNotification: NotificationName;
extern const ProcessInfoThermalStateDidChangeNotification: NotificationName;
extern const ProcessInfoPowerStateDidChangeNotification: NotificationName;

// ------------------------------------------------------------------------------------------------
// Functions

pub fn LocalizedString(key: *String, _: *String) *String {
    return Bundle.mainBundle().localizedStringForKey_value_table(key, null, null);
}

pub fn LocalizedStringFromTable(key: *String, tbl: *String, _: *String) *String {
    return Bundle.mainBundle().localizedStringForKey_value_table(key, null, tbl);
}

pub fn LocalizedStringFromTableInBundle(key: *String, tbl: *String, bundle: *Bundle, _: *String) *String {
    return bundle.localizedStringForKey_value_table(key, null, tbl);
}

pub fn LocalizedStringWithDefaultValue(key: *String, tbl: *String, bundle: *Bundle, val: *String, _: *String) *String {
    return bundle.localizedStringForKey_value_table(key, val, tbl);
}

// ------------------------------------------------------------------------------------------------
// Structs

pub const OperatingSystemVersion = extern struct {
    majorVersion: Integer,
    minorVersion: Integer,
    patchVersion: Integer,
};

pub const Range = extern struct {
    location: UInteger,
    length: UInteger,

    pub fn init(loc: UInteger, len: UInteger) Range {
        return Range{ .location = loc, .length = len };
    }
    pub fn equal(self: *const Range, range: Range) bool {
        return (self.location == range.location) and (self.length == range.length);
    }

    pub fn locationInRange(self: *const Range, loc: UInteger) bool {
        return (!(loc < self.location)) and ((loc - self.location) < self.length);
    }

    pub fn max(self: *const Range) UInteger {
        return self.location + self.length;
    }
};

// ------------------------------------------------------------------------------------------------
// Classes

pub fn Array(comptime ObjectType: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSArray", @This(), ObjectInterface, .{Copying});
        pub const as = InternalInfo.as;
        pub usingnamespace Methods(@This());

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn array() *T {
                    return objc.msgSend(T.InternalInfo.class(), "array", *T, .{});
                }
                pub fn arrayWithObject(anObject_: *ObjectType) *T {
                    return objc.msgSend(T.InternalInfo.class(), "arrayWithObject:", *T, .{anObject_});
                }
                pub fn arrayWithObjects_count(objects_: **ObjectType, cnt_: UInteger) *T {
                    return objc.msgSend(T.InternalInfo.class(), "arrayWithObjects:count:", *T, .{ objects_, cnt_ });
                }
                pub fn initWithObjects_count(self_: *T, objects_: **ObjectType, cnt_: UInteger) *T {
                    return objc.msgSend(self_, "initWithObjects:count:", *T, .{ objects_, cnt_ });
                }
                pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                    return objc.msgSend(self_, "initWithCoder:", *T, .{coder_});
                }
                pub fn count(self_: *T) UInteger {
                    return objc.msgSend(self_, "count", UInteger, .{});
                }
                pub fn objectAtIndex(self_: *T, index_: UInteger) *ObjectType {
                    return objc.msgSend(self_, "objectAtIndex:", *ObjectType, .{index_});
                }
            };
        }
    };
}

pub const Bundle = opaque {
    pub const InternalInfo = objc.ExternClass("", @This(), ObjectInterface, .{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn mainBundle() *Bundle {
                return objc.msgSend(T.InternalInfo.class(), "mainBundle", *Bundle, .{});
            }
            pub fn bundleWithPath(path_: *String) *T {
                return objc.msgSend(T.InternalInfo.class(), "bundleWithPath:", *T, .{path_});
            }
            pub fn bundleWithURL(url_: *URL) *T {
                return objc.msgSend(T.InternalInfo.class(), "bundleWithURL:", *T, .{url_});
            }
            pub fn initWithPath(self_: *T, path_: *String) *T {
                return objc.msgSend(self_, "initWithPath:", *T, .{path_});
            }
            pub fn initWithURL(self_: *T, url_: *URL) *T {
                return objc.msgSend(self_, "initWithURL:", *T, .{url_});
            }
            pub fn allBundles() *Array(*Bundle) {
                return objc.msgSend(T.InternalInfo.class(), "allBundles", *Array(*Bundle), .{});
            }
            pub fn allFrameworks() *Array(*Bundle) {
                return objc.msgSend(T.InternalInfo.class(), "allFrameworks", *Array(*Bundle), .{});
            }
            pub fn load(self_: *T) bool {
                return objc.msgSend(self_, "load", bool, .{});
            }
            pub fn unload(self_: *T) bool {
                return objc.msgSend(self_, "unload", bool, .{});
            }
            pub fn isLoaded(self_: *T) bool {
                return objc.msgSend(self_, "isLoaded", bool, .{});
            }
            pub fn preflightAndReturnError(self_: *T, error_: ?*?*Error) bool {
                return objc.msgSend(self_, "preflightAndReturnError:", bool, .{error_});
            }
            pub fn loadAndReturnError(self_: *T, error_: ?*?*Error) bool {
                return objc.msgSend(self_, "loadAndReturnError:", bool, .{error_});
            }
            pub fn bundleURL(self_: *T) *URL {
                return objc.msgSend(self_, "bundleURL", *URL, .{});
            }
            pub fn resourceURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "resourceURL", ?*URL, .{});
            }
            pub fn executableURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "executableURL", ?*URL, .{});
            }
            pub fn URLForAuxiliaryExecutable(self_: *T, executableName_: *String) ?*URL {
                return objc.msgSend(self_, "URLForAuxiliaryExecutable:", ?*URL, .{executableName_});
            }
            pub fn privateFrameworksURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "privateFrameworksURL", ?*URL, .{});
            }
            pub fn sharedFrameworksURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "sharedFrameworksURL", ?*URL, .{});
            }
            pub fn sharedSupportURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "sharedSupportURL", ?*URL, .{});
            }
            pub fn builtInPlugInsURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "builtInPlugInsURL", ?*URL, .{});
            }
            pub fn appStoreReceiptURL(self_: *T) ?*URL {
                return objc.msgSend(self_, "appStoreReceiptURL", ?*URL, .{});
            }
            pub fn bundlePath(self_: *T) *String {
                return objc.msgSend(self_, "bundlePath", *String, .{});
            }
            pub fn resourcePath(self_: *T) ?*String {
                return objc.msgSend(self_, "resourcePath", ?*String, .{});
            }
            pub fn executablePath(self_: *T) ?*String {
                return objc.msgSend(self_, "executablePath", ?*String, .{});
            }
            pub fn pathForAuxiliaryExecutable(self_: *T, executableName_: *String) ?*String {
                return objc.msgSend(self_, "pathForAuxiliaryExecutable:", ?*String, .{executableName_});
            }
            pub fn privateFrameworksPath(self_: *T) ?*String {
                return objc.msgSend(self_, "privateFrameworksPath", ?*String, .{});
            }
            pub fn sharedFrameworksPath(self_: *T) ?*String {
                return objc.msgSend(self_, "sharedFrameworksPath", ?*String, .{});
            }
            pub fn sharedSupportPath(self_: *T) ?*String {
                return objc.msgSend(self_, "sharedSupportPath", ?*String, .{});
            }
            pub fn builtInPlugInsPath(self_: *T) ?*String {
                return objc.msgSend(self_, "builtInPlugInsPath", ?*String, .{});
            }
            pub fn bundleIdentifier(self_: *T) ?*String {
                return objc.msgSend(self_, "bundleIdentifier", ?*String, .{});
            }
            pub fn infoDictionary(self_: *T) *Dictionary(ErrorUserInfoKey, *ObjectProtocol) {
                return objc.msgSend(self_, "infoDictionary", *Dictionary(ErrorUserInfoKey, *ObjectProtocol), .{});
            }
            pub fn localizedInfoDictionary(self_: *T) *Dictionary(ErrorUserInfoKey, *ObjectProtocol) {
                return objc.msgSend(self_, "localizedInfoDictionary", *Dictionary(ErrorUserInfoKey, *ObjectProtocol), .{});
            }
            pub fn objectForInfoDictionaryKey(self_: *T, key_: *String) *c.objc_object {
                return objc.msgSend(self_, "objectForInfoDictionaryKey:", *c.objc_object, .{key_});
            }
            pub fn localizedStringForKey_value_table(self_: *T, key_: *String, value_: ?*String, tableName_: ?*String) *String {
                return objc.msgSend(self_, "localizedStringForKey:value:table:", *String, .{ key_, value_, tableName_ });
            }
        };
    }
};

pub const Copying = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{ObjectProtocol});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        _ = T;
        return struct {};
    }
};

pub const Data = opaque {
    pub const InternalInfo = objc.ExternClass("NSData", @This(), ObjectInterface, &.{Copying});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn mutableBytes(self_: *T) *const anyopaque {
                return objc.msgSend(self_, "mutableBytes", *const anyopaque, .{});
            }
            pub fn length(self_: *T) UInteger {
                return objc.msgSend(self_, "length", UInteger, .{});
            }
        };
    }
};

pub const Date = opaque {
    pub const InternalInfo = objc.ExternClass("NSDate", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn dateWithTimeIntervalSinceNow(secs_: TimeInterval) *T {
                return objc.msgSend(T.InternalInfo.class(), "dateWithTimeIntervalSinceNow:", *T, .{secs_});
            }
        };
    }
};

pub fn Dictionary(comptime KeyType: type, comptime ObjectType: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSDictionary", @This(), ObjectInterface, &.{Copying});
        pub const as = InternalInfo.as;
        pub usingnamespace Methods(@This());

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn dictionary() *T {
                    return objc.msgSend(T.InternalInfo.class(), "dictionary", *T, .{});
                }
                pub fn dictionaryWithObject_forKey(object_: *ObjectType, key_: *KeyType) *T {
                    return objc.msgSend(T.InternalInfo.class(), "dictionaryWithObject:forKey:", *T, .{ object_, key_ });
                }
                pub fn dictionaryWithObjects_forKeys_count(objects_: **ObjectType, keys_: **KeyType, cnt_: UInteger) *T {
                    return objc.msgSend(T.InternalInfo.class(), "dictionaryWithObjects:forKeys:count:", *T, .{ objects_, keys_, cnt_ });
                }
                pub fn initWithObjects_forKeys_count(self_: *T, objects_: **ObjectType, keys_: **KeyType, cnt_: UInteger) *T {
                    return objc.msgSend(self_, "initWithObjects:forKeys:count:", *T, .{ objects_, keys_, cnt_ });
                }
                pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                    return objc.msgSend(self_, "initWithCoder:", *T, .{coder_});
                }
                pub fn keyEnumerator(self_: *T) *Enumerator(KeyType) {
                    return objc.msgSend(self_, "keyEnumerator", *Enumerator(KeyType), .{});
                }
                pub fn objectForKey(self_: *T, aKey_: *KeyType) *ObjectType {
                    return objc.msgSend(self_, "objectForKey:", *ObjectType, .{aKey_});
                }
                pub fn count(self_: *T) UInteger {
                    return objc.msgSend(self_, "count", UInteger, .{});
                }
            };
        }
    };
}

pub fn Enumerator(comptime ObjectType: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSEnumerator", @This(), ObjectInterface, &.{});
        pub const as = InternalInfo.as;
        pub usingnamespace Methods(@This());

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn nextObject(self_: *T) *ObjectType {
                    return objc.msgSend(self_, "nextObject", *ObjectType, .{});
                }
                pub fn allObjects(self_: *T) *Array(ObjectType) {
                    return objc.msgSend(self_, "allObjects", *Array(ObjectType), .{});
                }
            };
        }
    };
}

pub const Error = opaque {
    pub const InternalInfo = objc.ExternClass("NSError", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn errorWithDomain_code_userInfo(domain_: ErrorDomain, code_: Integer, dict_: *Dictionary(ErrorUserInfoKey, ObjectProtocol)) *T {
                return objc.msgSend(T.InternalInfo.class(), "errorWithDomain:code:userInfo:", *T, .{ domain_, code_, dict_ });
            }
            pub fn initWithDomain_code_userInfo(self_: *T, domain_: ErrorDomain, code_: Integer, dict_: *Dictionary(ErrorUserInfoKey, ObjectProtocol)) *T {
                return objc.msgSend(self_, "initWithDomain:code:userInfo:", *T, .{ domain_, code_, dict_ });
            }
            pub fn code(self_: *T) Integer {
                return objc.msgSend(self_, "code", Integer, .{});
            }
            pub fn domain(self_: *T) ErrorDomain {
                return objc.msgSend(self_, "domain", ErrorDomain, .{});
            }
            pub fn userInfo(self_: *T) *Dictionary(ErrorUserInfoKey, ObjectProtocol) {
                return objc.msgSend(self_, "userInfo", *Dictionary(ErrorUserInfoKey, ObjectProtocol), .{});
            }
            pub fn localizedDescription(self_: *T) *String {
                return objc.msgSend(self_, "localizedDescription", *String, .{});
            }
            pub fn localizedRecoveryOptions(self_: *T) ?*Array(*String) {
                return objc.msgSend(self_, "localizedRecoveryOptions", ?*Array(*String), .{});
            }
            pub fn localizedRecoverySuggestion(self_: *T) ?*String {
                return objc.msgSend(self_, "localizedRecoverySuggestion", ?*String, .{});
            }
            pub fn localizedFailureReason(self_: *T) ?*String {
                return objc.msgSend(self_, "localizedFailureReason", ?*String, .{});
            }
        };
    }
};

pub const Notification = opaque {
    pub const InternalInfo = objc.ExternClass("NSNotification", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn name(self_: *T) NotificationName {
                return objc.msgSend(self_, "name", NotificationName, .{});
            }
            pub fn object(self_: *T) ?*ObjectProtocol {
                return objc.msgSend(self_, "object", ?*ObjectProtocol, .{});
            }
            pub fn userInfo(self_: *T) ?*Dictionary(ObjectProtocol, ObjectProtocol) {
                return objc.msgSend(self_, "userInfo", ?*Dictionary(ObjectProtocol, ObjectProtocol), .{});
            }
        };
    }
};

pub const Number = opaque {
    pub const InternalInfo = objc.ExternClass("NSNumber", @This(), ObjectInterface, &.{Copying});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Value.Methods(T);

            pub fn numberWithChar(value_: u8) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithChar:", *Number, .{value_});
            }
            pub fn numberWithUnsignedChar(value_: u8) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedChar:", *Number, .{value_});
            }
            pub fn numberWithShort(value_: c_short) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithShort:", *Number, .{value_});
            }
            pub fn numberWithUnsignedShort(value_: c_ushort) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedShort:", *Number, .{value_});
            }
            pub fn numberWithInt(value_: c_int) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithInt:", *Number, .{value_});
            }
            pub fn numberWithUnsignedInt(value_: c_uint) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedInt:", *Number, .{value_});
            }
            pub fn numberWithLong(value_: c_long) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithLong:", *Number, .{value_});
            }
            pub fn numberWithUnsignedLong(value_: c_ulong) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedLong:", *Number, .{value_});
            }
            pub fn numberWithLongLong(value_: c_longlong) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithLongLong:", *Number, .{value_});
            }
            pub fn numberWithUnsignedLongLong(value_: c_ulonglong) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedLongLong:", *Number, .{value_});
            }
            pub fn numberWithFloat(value_: f32) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithFloat:", *Number, .{value_});
            }
            pub fn numberWithDouble(value_: f64) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithDouble:", *Number, .{value_});
            }
            pub fn numberWithBool(value_: bool) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithBool:", *Number, .{value_});
            }
            pub fn numberWithInteger(value_: Integer) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithInteger:", *Number, .{value_});
            }
            pub fn numberWithUnsignedInteger(value_: UInteger) *Number {
                return objc.msgSend(T.InternalInfo.class(), "numberWithUnsignedInteger:", *Number, .{value_});
            }
            pub fn initWithChar(self_: *T, value_: u8) *Number {
                return objc.msgSend(self_, "initWithChar:", *Number, .{value_});
            }
            pub fn initWithUnsignedChar(self_: *T, value_: u8) *Number {
                return objc.msgSend(self_, "initWithUnsignedChar:", *Number, .{value_});
            }
            pub fn initWithShort(self_: *T, value_: c_short) *Number {
                return objc.msgSend(self_, "initWithShort:", *Number, .{value_});
            }
            pub fn initWithUnsignedShort(self_: *T, value_: c_ushort) *Number {
                return objc.msgSend(self_, "initWithUnsignedShort:", *Number, .{value_});
            }
            pub fn initWithInt(self_: *T, value_: c_int) *Number {
                return objc.msgSend(self_, "initWithInt:", *Number, .{value_});
            }
            pub fn initWithUnsignedInt(self_: *T, value_: c_uint) *Number {
                return objc.msgSend(self_, "initWithUnsignedInt:", *Number, .{value_});
            }
            pub fn initWithLong(self_: *T, value_: c_long) *Number {
                return objc.msgSend(self_, "initWithLong:", *Number, .{value_});
            }
            pub fn initWithUnsignedLong(self_: *T, value_: c_ulong) *Number {
                return objc.msgSend(self_, "initWithUnsignedLong:", *Number, .{value_});
            }
            pub fn initWithLongLong(self_: *T, value_: c_longlong) *Number {
                return objc.msgSend(self_, "initWithLongLong:", *Number, .{value_});
            }
            pub fn initWithUnsignedLongLong(self_: *T, value_: c_ulonglong) *Number {
                return objc.msgSend(self_, "initWithUnsignedLongLong:", *Number, .{value_});
            }
            pub fn initWithFloat(self_: *T, value_: f32) *Number {
                return objc.msgSend(self_, "initWithFloat:", *Number, .{value_});
            }
            pub fn initWithDouble(self_: *T, value_: f64) *Number {
                return objc.msgSend(self_, "initWithDouble:", *Number, .{value_});
            }
            pub fn initWithBool(self_: *T, value_: bool) *Number {
                return objc.msgSend(self_, "initWithBool:", *Number, .{value_});
            }
            pub fn initWithInteger(self_: *T, value_: Integer) *Number {
                return objc.msgSend(self_, "initWithInteger:", *Number, .{value_});
            }
            pub fn initWithUnsignedInteger(self_: *T, value_: UInteger) *Number {
                return objc.msgSend(self_, "initWithUnsignedInteger:", *Number, .{value_});
            }
            pub fn charValue(self_: *T) u8 {
                return objc.msgSend(self_, "charValue", u8, .{});
            }
            pub fn unsignedCharValue(self_: *T) u8 {
                return objc.msgSend(self_, "unsignedCharValue", u8, .{});
            }
            pub fn shortValue(self_: *T) c_short {
                return objc.msgSend(self_, "shortValue", c_short, .{});
            }
            pub fn unsignedShortValue(self_: *T) c_ushort {
                return objc.msgSend(self_, "unsignedShortValue", c_ushort, .{});
            }
            pub fn intValue(self_: *T) c_int {
                return objc.msgSend(self_, "intValue", c_int, .{});
            }
            pub fn unsignedIntValue(self_: *T) c_uint {
                return objc.msgSend(self_, "unsignedIntValue", c_uint, .{});
            }
            pub fn longValue(self_: *T) c_long {
                return objc.msgSend(self_, "longValue", c_long, .{});
            }
            pub fn unsignedLongValue(self_: *T) c_ulong {
                return objc.msgSend(self_, "unsignedLongValue", c_ulong, .{});
            }
            pub fn longLongValue(self_: *T) c_longlong {
                return objc.msgSend(self_, "longLongValue", c_longlong, .{});
            }
            pub fn unsignedLongLongValue(self_: *T) c_ulonglong {
                return objc.msgSend(self_, "unsignedLongLongValue", c_ulonglong, .{});
            }
            pub fn floatValue(self_: *T) f32 {
                return objc.msgSend(self_, "floatValue", f32, .{});
            }
            pub fn doubleValue(self_: *T) f64 {
                return objc.msgSend(self_, "doubleValue", f64, .{});
            }
            pub fn boolValue(self_: *T) bool {
                return objc.msgSend(self_, "boolValue", bool, .{});
            }
            pub fn integerValue(self_: *T) Integer {
                return objc.msgSend(self_, "integerValue", Integer, .{});
            }
            pub fn unsignedIntegerValue(self_: *T) UInteger {
                return objc.msgSend(self_, "unsignedIntegerValue", UInteger, .{});
            }
            pub fn stringValue(self_: *T) *String {
                return objc.msgSend(self_, "stringValue", *String, .{});
            }
            pub fn compare(self_: *T, otherNumber_: *Number) ComparisonResult {
                return objc.msgSend(self_, "compare:", ComparisonResult, .{otherNumber_});
            }
            pub fn isEqualToNumber(self_: *T, number_: *Number) bool {
                return objc.msgSend(self_, "isEqualToNumber:", bool, .{number_});
            }
            pub fn descriptionWithLocale(self_: *T, locale_: *c.objc_object) *String {
                return objc.msgSend(self_, "descriptionWithLocale:", *String, .{locale_});
            }
        };
    }
};

pub const ObjectProtocol = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn cast(self: *T, comptime U: type) *U {
                // TODO
                return @as(*U, @ptrCast(self));
            }
            pub fn retain(self_: *T) *T {
                return objc.msgSend(self_, "retain", *T, .{});
            }
            pub fn release(self_: *T) void {
                return objc.msgSend(self_, "release", void, .{});
            }
            pub fn autorelease(self_: *T) *T {
                return objc.msgSend(self_, "autorelease", *T, .{});
            }
            pub fn retainCount(self_: *T) UInteger {
                return objc.msgSend(self_, "retainCount", UInteger, .{});
            }
            pub fn hash(self_: *T) UInteger {
                return objc.msgSend(self_, "hash", UInteger, .{});
            }
            pub fn isEqual(self_: *T, object_: *c.objc_object) bool {
                return objc.msgSend(self_, "isEqual:", bool, .{object_});
            }
            pub fn description(self_: *T) *String {
                return objc.msgSend(self_, "description", *String, .{});
            }
            pub fn debugDescription(self_: *T) *String {
                return objc.msgSend(self_, "debugDescription", *String, .{});
            }
        };
    }
};

pub const ObjectInterface = opaque {
    pub const InternalInfo = objc.ExternClass("NSObject", @This(), c.objc_object, &.{ObjectProtocol});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectProtocol.Methods(T);

            pub fn init(self_: *T) *T {
                return objc.msgSend(self_, "init", *T, .{});
            }
            pub fn new() *T {
                return objc.msgSend(T.InternalInfo.class(), "new", *T, .{});
            }
            pub fn alloc() *T {
                return objc.msgSend(T.InternalInfo.class(), "alloc", *T, .{});
            }
        };
    }
};

pub const ProcessInfo = opaque {
    pub const InternalInfo = objc.ExternClass("NSProcessInfo", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn processInfo() *ProcessInfo {
                return objc.msgSend(T.InternalInfo.class(), "processInfo", *ProcessInfo, .{});
            }
            pub fn arguments(self_: *T) *Array(String) {
                return objc.msgSend(self_, "arguments", *Array(String), .{});
            }
            pub fn environment(self_: *T) *Dictionary(String, String) {
                return objc.msgSend(self_, "environment", *Dictionary(String, String), .{});
            }
            pub fn hostName(self_: *T) *String {
                return objc.msgSend(self_, "hostName", *String, .{});
            }
            pub fn processName(self_: *T) *String {
                return objc.msgSend(self_, "processName", *String, .{});
            }
            pub fn setProcessName(self_: *T, processName_: *String) void {
                return objc.msgSend(self_, "setProcessName:", void, .{processName_});
            }
            pub fn processIdentifier(self_: *T) c_int {
                return objc.msgSend(self_, "processIdentifier", c_int, .{});
            }
            pub fn globallyUniqueString(self_: *T) *String {
                return objc.msgSend(self_, "globallyUniqueString", *String, .{});
            }
            pub fn userName(self_: *T) *String {
                return objc.msgSend(self_, "userName", *String, .{});
            }
            pub fn fullUserName(self_: *T) *String {
                return objc.msgSend(self_, "fullUserName", *String, .{});
            }
            pub fn operatingSystem(self_: *T) UInteger {
                return objc.msgSend(self_, "operatingSystem", UInteger, .{});
            }
            pub fn operatingSystemVersion(self_: *T) OperatingSystemVersion {
                return objc.msgSend(self_, "operatingSystemVersion", OperatingSystemVersion, .{});
            }
            pub fn operatingSystemVersionString(self_: *T) *String {
                return objc.msgSend(self_, "operatingSystemVersionString", *String, .{});
            }
            pub fn isOperatingSystemAtLeastVersion(self_: *T, version_: OperatingSystemVersion) bool {
                return objc.msgSend(self_, "isOperatingSystemAtLeastVersion:", bool, .{version_});
            }
            pub fn processorCount(self_: *T) UInteger {
                return objc.msgSend(self_, "processorCount", UInteger, .{});
            }
            pub fn activeProcessorCount(self_: *T) UInteger {
                return objc.msgSend(self_, "activeProcessorCount", UInteger, .{});
            }
            pub fn physicalMemory(self_: *T) c_ulonglong {
                return objc.msgSend(self_, "physicalMemory", c_ulonglong, .{});
            }
            pub fn systemUptime(self_: *T) TimeInterval {
                return objc.msgSend(self_, "systemUptime", TimeInterval, .{});
            }
            pub fn disableSuddenTermination(self_: *T) void {
                return objc.msgSend(self_, "disableSuddenTermination", void, .{});
            }
            pub fn enableSuddenTermination(self_: *T) void {
                return objc.msgSend(self_, "enableSuddenTermination", void, .{});
            }
            pub fn disableAutomaticTermination(self_: *T, reason_: *String) void {
                return objc.msgSend(self_, "disableAutomaticTermination:", void, .{reason_});
            }
            pub fn enableAutomaticTermination(self_: *T, reason_: *String) void {
                return objc.msgSend(self_, "enableAutomaticTermination:", void, .{reason_});
            }
            pub fn automaticTerminationSupportEnabled(self_: *T) bool {
                return objc.msgSend(self_, "automaticTerminationSupportEnabled", bool, .{});
            }
            pub fn setAutomaticTerminationSupportEnabled(self_: *T, automaticTerminationSupportEnabled_: bool) void {
                return objc.msgSend(self_, "setAutomaticTerminationSupportEnabled:", void, .{automaticTerminationSupportEnabled_});
            }
            pub fn beginActivityWithOptions_reason(self_: *T, options_: ActivityOptions, reason_: *String) *ObjectProtocol {
                return objc.msgSend(self_, "beginActivityWithOptions:reason:", *ObjectProtocol, .{ options_, reason_ });
            }
            pub fn endActivity(self_: *T, activity_: *ObjectProtocol) void {
                return objc.msgSend(self_, "endActivity:", void, .{activity_});
            }
            // pub fn performActivityWithOptions_reason_usingBlock(self_: *T, options_: ActivityOptions, reason_: *String, block_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, ActivityOptions, *String, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, "performActivityWithOptions:reason:usingBlock:", options_, reason_, block_);
            // }
            // pub fn performExpiringActivityWithReason_usingBlock(self_: *T, reason_: *String, block_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, *String, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, "performExpiringActivityWithReason:usingBlock:", reason_, block_);
            // }
            pub fn thermalState(self_: *T) ProcessInfoThermalState {
                return objc.msgSend(self_, "thermalState", ProcessInfoThermalState, .{});
            }
            pub fn isLowPowerModeEnabled(self_: *T) bool {
                return objc.msgSend(self_, "isLowPowerModeEnabled", bool, .{});
            }
            pub fn isiOSAppOnMac(self_: *T) bool {
                return objc.msgSend(self_, "isiOSAppOnMac", bool, .{});
            }
            pub fn isMacCatalystApp(self_: *T) bool {
                return objc.msgSend(self_, "isMacCatalystApp", bool, .{});
            }
        };
    }
};

pub const SecureCoding = opaque {
    const Self = @This();
    pub usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return struct {};
    }
};

pub const String = opaque {
    pub const InternalInfo = objc.ExternClass("NSString", @This(), ObjectInterface, &.{Copying});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(String);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn characterAtIndex(self_: *T, index_: UInteger) unichar {
                return objc.msgSend(self_, "characterAtIndex:", unichar, .{index_});
            }
            pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                return objc.msgSend(self_, "initWithCoder:", *T, .{coder_});
            }
            pub fn length(self_: *T) UInteger {
                return objc.msgSend(self_, "length", UInteger, .{});
            }
            pub fn substringFromIndex(self_: *T, from_: UInteger) *String {
                return objc.msgSend(self_, "substringFromIndex:", *String, .{from_});
            }
            pub fn substringToIndex(self_: *T, to_: UInteger) *String {
                return objc.msgSend(self_, "substringToIndex:", *String, .{to_});
            }
            pub fn substringWithRange(self_: *T, range_: Range) *String {
                return objc.msgSend(self_, "substringWithRange:", *String, .{range_});
            }
            pub fn getCharacters_range(self_: *T, buffer_: *unichar, range_: Range) void {
                return objc.msgSend(self_, "getCharacters:range:", void, .{ buffer_, range_ });
            }
            pub fn compare(self_: *T, string_: *String) ComparisonResult {
                return objc.msgSend(self_, "compare:", ComparisonResult, .{string_});
            }
            pub fn compare_options(self_: *T, string_: *String, mask_: StringCompareOptions) ComparisonResult {
                return objc.msgSend(self_, "compare:options:", ComparisonResult, .{ string_, mask_ });
            }
            pub fn compare_options_range(self_: *T, string_: *String, mask_: StringCompareOptions, rangeOfReceiverToCompare_: Range) ComparisonResult {
                return objc.msgSend(self_, "compare:options:range:", ComparisonResult, .{ string_, mask_, rangeOfReceiverToCompare_ });
            }
            pub fn compare_options_range_locale(self_: *T, string_: *String, mask_: StringCompareOptions, rangeOfReceiverToCompare_: Range, locale_: ?*c.objc_object) ComparisonResult {
                return objc.msgSend(self_, "compare:options:range:locale:", ComparisonResult, .{ string_, mask_, rangeOfReceiverToCompare_, locale_ });
            }
            pub fn caseInsensitiveCompare(self_: *T, string_: *String) ComparisonResult {
                return objc.msgSend(self_, "caseInsensitiveCompare:", ComparisonResult, .{string_});
            }
            pub fn localizedCompare(self_: *T, string_: *String) ComparisonResult {
                return objc.msgSend(self_, "localizedCompare:", ComparisonResult, .{string_});
            }
            pub fn localizedCaseInsensitiveCompare(self_: *T, string_: *String) ComparisonResult {
                return objc.msgSend(self_, "localizedCaseInsensitiveCompare:", ComparisonResult, .{string_});
            }
            pub fn localizedStandardCompare(self_: *T, string_: *String) ComparisonResult {
                return objc.msgSend(self_, "localizedStandardCompare:", ComparisonResult, .{string_});
            }
            pub fn isEqualToString(self_: *T, aString_: *String) bool {
                return objc.msgSend(self_, "isEqualToString:", bool, .{aString_});
            }
            pub fn hasPrefix(self_: *T, str_: *String) bool {
                return objc.msgSend(self_, "hasPrefix:", bool, .{str_});
            }
            pub fn hasSuffix(self_: *T, str_: *String) bool {
                return objc.msgSend(self_, "hasSuffix:", bool, .{str_});
            }
            pub fn commonPrefixWithString_options(self_: *T, str_: *String, mask_: StringCompareOptions) *String {
                return objc.msgSend(self_, "commonPrefixWithString:options:", *String, .{ str_, mask_ });
            }
            pub fn containsString(self_: *T, str_: *String) bool {
                return objc.msgSend(self_, "containsString:", bool, .{str_});
            }
            pub fn localizedCaseInsensitiveContainsString(self_: *T, str_: *String) bool {
                return objc.msgSend(self_, "localizedCaseInsensitiveContainsString:", bool, .{str_});
            }
            pub fn localizedStandardContainsString(self_: *T, str_: *String) bool {
                return objc.msgSend(self_, "localizedStandardContainsString:", bool, .{str_});
            }
            pub fn localizedStandardRangeOfString(self_: *T, str_: *String) Range {
                return objc.msgSend(self_, "localizedStandardRangeOfString:", Range, .{str_});
            }
            pub fn rangeOfString(self_: *T, searchString_: *String) Range {
                return objc.msgSend(self_, "rangeOfString:", Range, .{searchString_});
            }
            pub fn rangeOfString_options(self_: *T, searchString_: *String, mask_: StringCompareOptions) Range {
                return objc.msgSend(self_, "rangeOfString:options:", Range, .{ searchString_, mask_ });
            }
            pub fn rangeOfString_options_range(self_: *T, searchString_: *String, mask_: StringCompareOptions, rangeOfReceiverToSearch_: Range) Range {
                return objc.msgSend(self_, "rangeOfString:options:range:", Range, .{ searchString_, mask_, rangeOfReceiverToSearch_ });
            }
            // pub fn rangeOfString_options_range_locale(self_: *T, searchString_: *String, mask_: StringCompareOptions, rangeOfReceiverToSearch_: Range, locale_: ?*Locale) Range {
            //     return @as(*const fn (*T, *c.objc_selector, *String, StringCompareOptions, Range, ?*Locale) callconv(.C) Range, @ptrCast(&c.objc_msgSend))(self_, "rangeOfString:options:range:locale:", searchString_, mask_, rangeOfReceiverToSearch_, locale_);
            // }
            // pub fn rangeOfCharacterFromSet(self_: *T, searchSet_: *CharacterSet) Range {
            //     return @as(*const fn (*T, *c.objc_selector, *CharacterSet) callconv(.C) Range, @ptrCast(&c.objc_msgSend))(self_, "rangeOfCharacterFromSet:", searchSet_);
            // }
            // pub fn rangeOfCharacterFromSet_options(self_: *T, searchSet_: *CharacterSet, mask_: StringCompareOptions) Range {
            //     return @as(*const fn (*T, *c.objc_selector, *CharacterSet, StringCompareOptions) callconv(.C) Range, @ptrCast(&c.objc_msgSend))(self_, "rangeOfCharacterFromSet:options:", searchSet_, mask_);
            // }
            // pub fn rangeOfCharacterFromSet_options_range(self_: *T, searchSet_: *CharacterSet, mask_: StringCompareOptions, rangeOfReceiverToSearch_: Range) Range {
            //     return @as(*const fn (*T, *c.objc_selector, *CharacterSet, StringCompareOptions, Range) callconv(.C) Range, @ptrCast(&c.objc_msgSend))(self_, "rangeOfCharacterFromSet:options:range:", searchSet_, mask_, rangeOfReceiverToSearch_);
            // }
            pub fn rangeOfComposedCharacterSequenceAtIndex(self_: *T, index_: UInteger) Range {
                return objc.msgSend(self_, "rangeOfComposedCharacterSequenceAtIndex:", Range, .{index_});
            }
            pub fn rangeOfComposedCharacterSequencesForRange(self_: *T, range_: Range) Range {
                return objc.msgSend(self_, "rangeOfComposedCharacterSequencesForRange:", Range, .{range_});
            }
            pub fn stringByAppendingString(self_: *T, aString_: *String) *String {
                return objc.msgSend(self_, "stringByAppendingString:", *String, .{aString_});
            }
            pub fn stringByAppendingFormat(self_: *T, format_: *String) *String {
                return objc.msgSend(self_, "stringByAppendingFormat:", *String, .{format_});
            }
            // pub fn uppercaseStringWithLocale(self_: *T, locale_: ?*Locale) *String {
            //     return @as(*const fn (*T, *c.objc_selector, ?*Locale) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, "uppercaseStringWithLocale:", locale_);
            // }
            // pub fn lowercaseStringWithLocale(self_: *T, locale_: ?*Locale) *String {
            //     return @as(*const fn (*T, *c.objc_selector, ?*Locale) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, "lowercaseStringWithLocale:", locale_);
            // }
            // pub fn capitalizedStringWithLocale(self_: *T, locale_: ?*Locale) *String {
            //     return @as(*const fn (*T, *c.objc_selector, ?*Locale) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, "capitalizedStringWithLocale:", locale_);
            // }
            pub fn getLineStart_end_contentsEnd_forRange(self_: *T, startPtr_: ?*UInteger, lineEndPtr_: ?*UInteger, contentsEndPtr_: ?*UInteger, range_: Range) void {
                return objc.msgSend(self_, "getLineStart:end:contentsEnd:forRange:", void, .{ startPtr_, lineEndPtr_, contentsEndPtr_, range_ });
            }
            pub fn lineRangeForRange(self_: *T, range_: Range) Range {
                return objc.msgSend(self_, "lineRangeForRange:", Range, .{range_});
            }
            pub fn getParagraphStart_end_contentsEnd_forRange(self_: *T, startPtr_: ?*UInteger, parEndPtr_: ?*UInteger, contentsEndPtr_: ?*UInteger, range_: Range) void {
                return objc.msgSend(self_, "getParagraphStart:end:contentsEnd:forRange:", void, .{ startPtr_, parEndPtr_, contentsEndPtr_, range_ });
            }
            pub fn paragraphRangeForRange(self_: *T, range_: Range) Range {
                return objc.msgSend(self_, "paragraphRangeForRange:", Range, .{range_});
            }
            // pub fn enumerateSubstringsInRange_options_usingBlock(self_: *T, range_: Range, opts_: StringEnumerationOptions, context: anytype, comptime block_: fn (ctx: @TypeOf(context), _: ?*String, _: Range, _: Range, _: *bool) void) void {
            //     const Literal = BlockLiteral(@TypeOf(context));
            //     const Helper = struct {
            //         pub fn cCallback(literal: *Literal, a0: ?*String, a1: Range, a2: Range, a3: *bool) callconv(.C) void {
            //             block_(literal.context, a0, a1, a2, a3);
            //         }
            //     };
            //     const descriptor = BlockDescriptor{ .reserved = 0, .size = @sizeOf(Literal) };
            //     const block = Literal{ .isa = _NSConcreteStackBlock, .flags = 0, .reserved = 0, .invoke = @ptrCast(&Helper.cCallback), .descriptor = &descriptor, .context = context };
            //     return @as(*const fn (*T, *c.objc_selector, Range, StringEnumerationOptions, *const anyopaque) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, "enumerateSubstringsInRange:options:usingBlock:", range_, opts_, @ptrCast(&block));
            // }
            pub fn enumerateLinesUsingBlock(self_: *T, block_: *Block(fn (*String, bool) void)) void {
                return objc.msgSend(self_, "enumerateLinesUsingBlock:", void, .{block_});
            }
            pub fn dataUsingEncoding_allowLossyConversion(self_: *T, encoding_: StringEncoding, lossy_: bool) ?*Data {
                return objc.msgSend(self_, "dataUsingEncoding:allowLossyConversion:", ?*Data, .{ encoding_, lossy_ });
            }
            pub fn dataUsingEncoding(self_: *T, encoding_: StringEncoding) ?*Data {
                return objc.msgSend(self_, "dataUsingEncoding:", ?*Data, .{encoding_});
            }
            pub fn canBeConvertedToEncoding(self_: *T, encoding_: StringEncoding) bool {
                return objc.msgSend(self_, "canBeConvertedToEncoding:", bool, .{encoding_});
            }
            pub fn cStringUsingEncoding(self_: *T, encoding_: StringEncoding) ?*const u8 {
                return objc.msgSend(self_, "cStringUsingEncoding:", ?*const u8, .{encoding_});
            }
            pub fn getCString_maxLength_encoding(self_: *T, buffer_: *u8, maxBufferCount_: UInteger, encoding_: StringEncoding) bool {
                return objc.msgSend(self_, "getCString:maxLength:encoding:", bool, .{ buffer_, maxBufferCount_, encoding_ });
            }
            // pub fn getBytes_maxLength_usedLength_encoding_options_range_remainingRange(self_: *T, buffer_: ?*anyopaque, maxBufferCount_: UInteger, usedBufferCount_: ?*UInteger, encoding_: StringEncoding, options_: StringEncodingConversionOptions, range_: Range, leftover_: RangePointer) bool {
            //     return @as(*const fn (*T, *c.objc_selector, ?*anyopaque, UInteger, ?*UInteger, StringEncoding, StringEncodingConversionOptions, Range, RangePointer) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buffer_, maxBufferCount_, usedBufferCount_, encoding_, options_, range_, leftover_);
            // }
            pub fn maximumLengthOfBytesUsingEncoding(self_: *T, enc_: StringEncoding) UInteger {
                return objc.msgSend(self_, "maximumLengthOfBytesUsingEncoding:", UInteger, .{enc_});
            }
            pub fn lengthOfBytesUsingEncoding(self_: *T, enc_: StringEncoding) UInteger {
                return objc.msgSend(self_, "lengthOfBytesUsingEncoding:", UInteger, .{enc_});
            }
            pub fn localizedNameOfStringEncoding(encoding_: StringEncoding) *String {
                return objc.msgSend(T.InternalInfo.class(), "localizedNameOfStringEncoding:", *String, .{encoding_});
            }
            pub fn componentsSeparatedByString(self_: *T, separator_: *String) *Array(*String) {
                return objc.msgSend(self_, "componentsSeparatedByString:", *Array(*String), .{separator_});
            }
            // pub fn componentsSeparatedByCharactersInSet(self_: *T, separator_: *CharacterSet) *Array(*String) {
            //     return @as(*const fn (*T, *c.objc_selector, *CharacterSet) callconv(.C) *Array(*String), @ptrCast(&c.objc_msgSend))(self_, "componentsSeparatedByCharactersInSet:", separator_);
            // }
            // pub fn stringByTrimmingCharactersInSet(self_: *T, set_: *CharacterSet) *String {
            //     return @as(*const fn (*T, *c.objc_selector, *CharacterSet) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, "stringByTrimmingCharactersInSet:", set_);
            // }
            pub fn stringByPaddingToLength_withString_startingAtIndex(self_: *T, newLength_: UInteger, padString_: *String, padIndex_: UInteger) *String {
                return objc.msgSend(self_, "stringByPaddingToLength:withString:startingAtIndex:", *String, .{ newLength_, padString_, padIndex_ });
            }
            // pub fn stringByFoldingWithOptions_locale(self_: *T, options_: StringCompareOptions, locale_: ?*Locale) *String {
            //     return @as(*const fn (*T, *c.objc_selector, StringCompareOptions, ?*Locale) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, "stringByFoldingWithOptions:locale:", options_, locale_);
            // }
            pub fn stringByReplacingOccurrencesOfString_withString_options_range(self_: *T, target_: *String, replacement_: *String, options_: StringCompareOptions, searchRange_: Range) *String {
                return objc.msgSend(self_, "stringByReplacingOccurrencesOfString:withString:options:range:", *String, .{ target_, replacement_, options_, searchRange_ });
            }
            pub fn stringByReplacingOccurrencesOfString_withString(self_: *T, target_: *String, replacement_: *String) *String {
                return objc.msgSend(self_, "stringByReplacingOccurrencesOfString:withString:", *String, .{ target_, replacement_ });
            }
            pub fn stringByReplacingCharactersInRange_withString(self_: *T, range_: Range, replacement_: *String) *String {
                return objc.msgSend(self_, "stringByReplacingCharactersInRange:withString:", *String, .{ range_, replacement_ });
            }
            // pub fn stringByApplyingTransform_reverse(self_: *T, transform_: StringTransform, reverse_: bool) ?*String {
            //     return @as(*const fn (*T, *c.objc_selector, StringTransform, bool) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, "stringByApplyingTransform:reverse:", transform_, reverse_);
            // }
            pub fn writeToURL_atomically_encoding_error(self_: *T, url_: *URL, useAuxiliaryFile_: bool, enc_: StringEncoding, error_: ?*?*Error) bool {
                return objc.msgSend(self_, "writeToURL:atomically:encoding:error:", bool, .{ url_, useAuxiliaryFile_, enc_, error_ });
            }
            pub fn writeToFile_atomically_encoding_error(self_: *T, path_: *String, useAuxiliaryFile_: bool, enc_: StringEncoding, error_: ?*?*Error) bool {
                return objc.msgSend(self_, "writeToFile:atomically:encoding:error:", bool, .{ path_, useAuxiliaryFile_, enc_, error_ });
            }
            pub fn initWithCharactersNoCopy_length_freeWhenDone(self_: *T, characters_: *unichar, length_: UInteger, freeBuffer_: bool) *T {
                return objc.msgSend(self_, "initWithCharactersNoCopy:length:freeWhenDone:", *T, .{ characters_, length_, freeBuffer_ });
            }
            pub fn initWithCharactersNoCopy_length_deallocator(self_: *T, chars_: *unichar, len_: UInteger, deallocator_: *Block(fn (*unichar, UInteger) void)) *T {
                return objc.msgSend(self_, "initWithCharactersNoCopy:length:deallocator:", *T, .{ chars_, len_, deallocator_ });
            }
            pub fn initWithCharacters_length(self_: *T, characters_: *const unichar, length_: UInteger) *T {
                return objc.msgSend(self_, "initWithCharacters:length:", *T, .{ characters_, length_ });
            }
            pub fn initWithUTF8String(self_: *T, nullTerminatedCString_: [*:0]const u8) *T {
                return objc.msgSend(self_, "initWithUTF8String:", *T, .{nullTerminatedCString_});
            }
            pub fn initWithString(self_: *T, aString_: *String) *T {
                return objc.msgSend(self_, "initWithString:", *T, .{aString_});
            }
            pub fn initWithFormat(self_: *T, format_: *String) *T {
                return objc.msgSend(self_, "initWithFormat:", *T, .{format_});
            }
            // pub fn initWithFormat_arguments(self_: *T, format_: *String, argList_: va_list) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *String, va_list) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, "initWithFormat:arguments:", format_, argList_);
            // }
            pub fn initWithFormat_locale(self_: *T, format_: *String, locale_: ?*c.objc_object) *T {
                return objc.msgSend(self_, "initWithFormat:locale:", *T, .{ format_, locale_ });
            }
            // pub fn initWithFormat_locale_arguments(self_: *T, format_: *String, locale_: ?*c.objc_object, argList_: va_list) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *String, ?*c.objc_object, va_list) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, "initWithFormat:locale:arguments:", format_, locale_, argList_);
            // }
            pub fn initWithValidatedFormat_validFormatSpecifiers_error(self_: *T, format_: *String, validFormatSpecifiers_: *String, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithValidatedFormat:validFormatSpecifiers:error:", *T, .{ format_, validFormatSpecifiers_, error_ });
            }
            pub fn initWithValidatedFormat_validFormatSpecifiers_locale_error(self_: *T, format_: *String, validFormatSpecifiers_: *String, locale_: ?*c.objc_object, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithValidatedFormat:validFormatSpecifiers:locale:error:", *T, .{ format_, validFormatSpecifiers_, locale_, error_ });
            }
            // pub fn initWithValidatedFormat_validFormatSpecifiers_arguments_error(self_: *T, format_: *String, validFormatSpecifiers_: *String, argList_: va_list, error_: ?*?*Error) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *String, *String, va_list, ?*?*Error) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, "initWithValidatedFormat:validFormatSpecifiers:arguments:error:", format_, validFormatSpecifiers_, argList_, error_);
            // }
            // pub fn initWithValidatedFormat_validFormatSpecifiers_locale_arguments_error(self_: *T, format_: *String, validFormatSpecifiers_: *String, locale_: ?*c.objc_object, argList_: va_list, error_: ?*?*Error) *T {
            //     return @as(*const fn (*T, *c.objc_selector, *String, *String, ?*c.objc_object, va_list, ?*?*Error) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format_, validFormatSpecifiers_, locale_, argList_, error_);
            // }
            pub fn initWithData_encoding(self_: *T, data_: *Data, encoding_: StringEncoding) *T {
                return objc.msgSend(self_, "initWithData:encoding:", *T, .{ data_, encoding_ });
            }
            pub fn initWithBytes_length_encoding(self_: *T, bytes_: *const anyopaque, len_: UInteger, encoding_: StringEncoding) *T {
                return objc.msgSend(self_, "initWithBytes:length:encoding:", *T, .{ bytes_, len_, encoding_ });
            }
            pub fn initWithBytesNoCopy_length_encoding_freeWhenDone(self_: *T, bytes_: *anyopaque, len_: UInteger, encoding_: StringEncoding, freeBuffer_: bool) *T {
                return objc.msgSend(self_, "initWithBytesNoCopy:length:encoding:freeWhenDone:", *T, .{ bytes_, len_, encoding_, freeBuffer_ });
            }
            pub fn initWithBytesNoCopy_length_encoding_deallocator(self_: *T, bytes_: *anyopaque, len_: UInteger, encoding_: StringEncoding, deallocator_: *Block(fn (*anyopaque, UInteger) void)) *T {
                return objc.msgSend(self_, "initWithBytesNoCopy:length:encoding:deallocator:", *T, .{ bytes_, len_, encoding_, deallocator_ });
            }
            pub fn string() *T {
                return objc.msgSend(T.InternalInfo.class(), "string", *T, .{});
            }
            pub fn stringWithString(string_: *String) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithString:", *T, .{string_});
            }
            pub fn stringWithCharacters_length(characters_: *const unichar, length_: UInteger) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithCharacters:length:", *T, .{ characters_, length_ });
            }
            pub fn stringWithUTF8String(nullTerminatedCString_: [*:0]const u8) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithUTF8String:", *T, .{nullTerminatedCString_});
            }
            pub fn stringWithFormat(format_: *String) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithFormat:", *T, .{format_});
            }
            pub fn localizedStringWithFormat(format_: *String) *T {
                return objc.msgSend(T.InternalInfo.class(), "localizedStringWithFormat:", *T, .{format_});
            }
            pub fn stringWithValidatedFormat_validFormatSpecifiers_error(format_: *String, validFormatSpecifiers_: *String, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithValidatedFormat:validFormatSpecifiers:error:", *T, .{ format_, validFormatSpecifiers_, error_ });
            }
            pub fn localizedStringWithValidatedFormat_validFormatSpecifiers_error(format_: *String, validFormatSpecifiers_: *String, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", *T, .{ format_, validFormatSpecifiers_, error_ });
            }
            pub fn initWithCString_encoding(self_: *T, nullTerminatedCString_: *const u8, encoding_: StringEncoding) *T {
                return objc.msgSend(self_, "initWithCString:encoding:", *T, .{ nullTerminatedCString_, encoding_ });
            }
            pub fn stringWithCString_encoding(cString_: *const u8, enc_: StringEncoding) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithCString:encoding:", *T, .{ cString_, enc_ });
            }
            pub fn initWithContentsOfURL_encoding_error(self_: *T, url_: *URL, enc_: StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithContentsOfURL:encoding:error:", *T, .{ url_, enc_, error_ });
            }
            pub fn initWithContentsOfFile_encoding_error(self_: *T, path_: *String, enc_: StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithContentsOfFile:encoding:error:", *T, .{ path_, enc_, error_ });
            }
            pub fn stringWithContentsOfURL_encoding_error(url_: *URL, enc_: StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfURL:encoding:error:", *T, .{ url_, enc_, error_ });
            }
            pub fn stringWithContentsOfFile_encoding_error(path_: *String, enc_: StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfFile:encoding:error:", *T, .{ path_, enc_, error_ });
            }
            pub fn initWithContentsOfURL_usedEncoding_error(self_: *T, url_: *URL, enc_: ?*StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithContentsOfURL:usedEncoding:error:", *T, .{ url_, enc_, error_ });
            }
            pub fn initWithContentsOfFile_usedEncoding_error(self_: *T, path_: *String, enc_: ?*StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(self_, "initWithContentsOfFile:usedEncoding:error:", *T, .{ path_, enc_, error_ });
            }
            pub fn stringWithContentsOfURL_usedEncoding_error(url_: *URL, enc_: ?*StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfURL:usedEncoding:error:", *T, .{ url_, enc_, error_ });
            }
            pub fn stringWithContentsOfFile_usedEncoding_error(path_: *String, enc_: ?*StringEncoding, error_: ?*?*Error) *T {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfFile:usedEncoding:error:", *T, .{ path_, enc_, error_ });
            }
            pub fn doubleValue(self_: *T) f64 {
                return objc.msgSend(self_, "doubleValue", f64, .{});
            }
            pub fn floatValue(self_: *T) f32 {
                return objc.msgSend(self_, "floatValue", f32, .{});
            }
            pub fn intValue(self_: *T) c_int {
                return objc.msgSend(self_, "intValue", c_int, .{});
            }
            pub fn integerValue(self_: *T) Integer {
                return objc.msgSend(self_, "integerValue", Integer, .{});
            }
            pub fn longLongValue(self_: *T) c_longlong {
                return objc.msgSend(self_, "longLongValue", c_longlong, .{});
            }
            pub fn boolValue(self_: *T) bool {
                return objc.msgSend(self_, "boolValue", bool, .{});
            }
            pub fn uppercaseString(self_: *T) *String {
                return objc.msgSend(self_, "uppercaseString", *String, .{});
            }
            pub fn lowercaseString(self_: *T) *String {
                return objc.msgSend(self_, "lowercaseString", *String, .{});
            }
            pub fn capitalizedString(self_: *T) *String {
                return objc.msgSend(self_, "capitalizedString", *String, .{});
            }
            pub fn localizedUppercaseString(self_: *T) *String {
                return objc.msgSend(self_, "localizedUppercaseString", *String, .{});
            }
            pub fn localizedLowercaseString(self_: *T) *String {
                return objc.msgSend(self_, "localizedLowercaseString", *String, .{});
            }
            pub fn localizedCapitalizedString(self_: *T) *String {
                return objc.msgSend(self_, "localizedCapitalizedString", *String, .{});
            }
            pub fn UTF8String(self_: *T) [*:0]const u8 {
                return objc.msgSend(self_, "UTF8String", [*:0]const u8, .{});
            }
            pub fn fastestEncoding(self_: *T) StringEncoding {
                return objc.msgSend(self_, "fastestEncoding", StringEncoding, .{});
            }
            pub fn smallestEncoding(self_: *T) StringEncoding {
                return objc.msgSend(self_, "smallestEncoding", StringEncoding, .{});
            }
            pub fn availableStringEncodings() *const StringEncoding {
                return objc.msgSend(T.InternalInfo.class(), "availableStringEncodings", *const StringEncoding, .{});
            }
            pub fn defaultCStringEncoding() StringEncoding {
                return objc.msgSend(T.InternalInfo.class(), "defaultCStringEncoding", StringEncoding, .{});
            }
            pub fn decomposedStringWithCanonicalMapping(self_: *T) *String {
                return objc.msgSend(self_, "decomposedStringWithCanonicalMapping", *String, .{});
            }
            pub fn precomposedStringWithCanonicalMapping(self_: *T) *String {
                return objc.msgSend(self_, "precomposedStringWithCanonicalMapping", *String, .{});
            }
            pub fn decomposedStringWithCompatibilityMapping(self_: *T) *String {
                return objc.msgSend(self_, "decomposedStringWithCompatibilityMapping", *String, .{});
            }
            pub fn precomposedStringWithCompatibilityMapping(self_: *T) *String {
                return objc.msgSend(self_, "precomposedStringWithCompatibilityMapping", *String, .{});
            }
            // pub fn stringEncodingForData_encodingOptions_convertedString_usedLossyConversion(data_: *Data, opts_: ?*Dictionary(StringEncodingDetectionOptionsKey, *c.objc_object), string_: ?*?*String, usedLossyConversion_: ?*bool) StringEncoding {
            //     return @as(*const fn (*c.objc_class, *c.objc_selector, *Data, ?*Dictionary(StringEncodingDetectionOptionsKey, *c.objc_object), ?*?*String, ?*bool) callconv(.C) StringEncoding, @ptrCast(&c.objc_msgSend))(T.InternalInfo.class(), "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", data_, opts_, string_, usedLossyConversion_);
            // }
            pub fn propertyList(self_: *T) *c.objc_object {
                return objc.msgSend(self_, "propertyList", *c.objc_object, .{});
            }
            // pub fn propertyListFromStringsFileFormat(self_: *T) ?*Dictionary {
            //     return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Dictionary, @ptrCast(&c.objc_msgSend))(self_, "propertyListFromStringsFileFormat);"
            // }
            pub fn cString(self_: *T) ?*const u8 {
                return objc.msgSend(self_, "cString", ?*const u8, .{});
            }
            pub fn lossyCString(self_: *T) ?*const u8 {
                return objc.msgSend(self_, "lossyCString", ?*const u8, .{});
            }
            pub fn cStringLength(self_: *T) UInteger {
                return objc.msgSend(self_, "cStringLength", UInteger, .{});
            }
            pub fn getCString(self_: *T, bytes_: *u8) void {
                return objc.msgSend(self_, "getCString:", void, .{bytes_});
            }
            pub fn getCString_maxLength(self_: *T, bytes_: *u8, maxLength_: UInteger) void {
                return objc.msgSend(self_, "getCString:maxLength:", void, .{ bytes_, maxLength_ });
            }
            // pub fn getCString_maxLength_range_remainingRange(self_: *T, bytes_: *u8, maxLength_: UInteger, aRange_: Range, leftoverRange_: RangePointer) void {
            //     return @as(*const fn (*T, *c.objc_selector, *u8, UInteger, Range, RangePointer) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, "getCString:maxLength:range:remainingRange:", bytes_, maxLength_, aRange_, leftoverRange_);
            // }
            pub fn writeToFile_atomically(self_: *T, path_: *String, useAuxiliaryFile_: bool) bool {
                return objc.msgSend(self_, "writeToFile:atomically:", bool, .{ path_, useAuxiliaryFile_ });
            }
            pub fn writeToURL_atomically(self_: *T, url_: *URL, atomically_: bool) bool {
                return objc.msgSend(self_, "writeToURL:atomically:", bool, .{ url_, atomically_ });
            }
            pub fn initWithContentsOfFile(self_: *T, path_: *String) ?*c.objc_object {
                return objc.msgSend(self_, "initWithContentsOfFile:", ?*c.objc_object, .{path_});
            }
            pub fn initWithContentsOfURL(self_: *T, url_: *URL) ?*c.objc_object {
                return objc.msgSend(self_, "initWithContentsOfURL:", ?*c.objc_object, .{url_});
            }
            pub fn stringWithContentsOfFile(path_: *String) ?*c.objc_object {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfFile:", ?*c.objc_object, .{path_});
            }
            pub fn stringWithContentsOfURL(url_: *URL) ?*c.objc_object {
                return objc.msgSend(T.InternalInfo.class(), "stringWithContentsOfURL:", ?*c.objc_object, .{url_});
            }
            pub fn initWithCStringNoCopy_length_freeWhenDone(self_: *T, bytes_: *u8, length_: UInteger, freeBuffer_: bool) ?*c.objc_object {
                return objc.msgSend(self_, "initWithCStringNoCopy:length:freeWhenDone:", ?*c.objc_object, .{ bytes_, length_, freeBuffer_ });
            }
            pub fn initWithCString_length(self_: *T, bytes_: *const u8, length_: UInteger) ?*c.objc_object {
                return objc.msgSend(self_, "initWithCString:length:", ?*c.objc_object, .{ bytes_, length_ });
            }
            pub fn initWithCString(self_: *T, bytes_: *const u8) ?*c.objc_object {
                return objc.msgSend(self_, "initWithCString:", ?*c.objc_object, .{bytes_});
            }
            pub fn stringWithCString_length(bytes_: *const u8, length_: UInteger) ?*c.objc_object {
                return objc.msgSend(T.InternalInfo.class(), "stringWithCString:length:", ?*c.objc_object, .{ bytes_, length_ });
            }
            pub fn stringWithCString(bytes_: *const u8) ?*c.objc_object {
                return objc.msgSend(T.InternalInfo.class(), "stringWithCString:", ?*c.objc_object, .{bytes_});
            }
            pub fn getCharacters(self_: *T, buffer_: *unichar) void {
                return objc.msgSend(self_, "getCharacters:", void, .{buffer_});
            }
        };
    }
};

pub const URL = opaque {
    pub const InternalInfo = objc.ExternClass("NSURL", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn fileURLWithPath(path_: *String) *URL {
                return objc.msgSend(T.InternalInfo.class(), "fileURLWithPath:", *URL, .{path_});
            }
            pub fn initWithString(self_: *T, URLString_: *String) *T {
                return objc.msgSend(self_, "initWithString:", *T, .{URLString_});
            }
            pub fn initFileURLWithPath(self_: *T, path_: *String) *T {
                return objc.msgSend(self_, "initFileURLWithPath:", *T, .{path_});
            }
            pub fn fileSystemRepresentation(self_: *T) [*:0]const u8 {
                return objc.msgSend(self_, "fileSystemRepresentation", [*:0]const u8, .{});
            }
        };
    }
};

pub const Value = opaque {
    pub const InternalInfo = objc.ExternClass("NSValue", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub usingnamespace Methods(@This());

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn valueWithBytes_objCType(value_: *const anyopaque, type_: [*:0]const u8) *Value {
                return objc.msgSend(T.InternalInfo.class(), "valueWithBytes:objCType:", *Value, .{ value_, type_ });
            }
            pub fn valueWithPointer(pointer_: ?*const anyopaque) *Value {
                return objc.msgSend(T.InternalInfo.class(), "valueWithPointer:", *Value, .{pointer_});
            }
            pub fn initWithBytes_objCType(self_: *T, value_: *const anyopaque, type_: [*:0]const u8) *T {
                return objc.msgSend(self_, "initWithBytes:objCType:", *T, .{ value_, type_ });
            }
            pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                return objc.msgSend(self_, "initWithCoder:", *T, .{coder_});
            }
            pub fn getValue_size(self_: *T, value_: *anyopaque, size_: UInteger) void {
                return objc.msgSend(self_, "getValue:size:", void, .{ value_, size_ });
            }
            pub fn objCType(self_: *T) [*:0]const u8 {
                return objc.msgSend(self_, "objCType", [*:0]const u8, .{});
            }
            pub fn isEqualToValue(self_: *T, value_: *Value) bool {
                return objc.msgSend(self_, "isEqualToValue:", bool, .{value_});
            }
            pub fn pointerValue(self_: *T) ?*anyopaque {
                return objc.msgSend(self_, "pointerValue", ?*anyopaque, .{});
            }
        };
    }
};
