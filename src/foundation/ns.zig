const c = @import("../c.zig");

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

pub const StringEncoding = UInteger;
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
        const Self = @This();
        pub const Super = ObjectInterface;
        pub usingnamespace Methods(Self);
        pub fn class() *c.objc_class {
            return class_Array;
        }

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn array() *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_array);
                }
                pub fn arrayWithObject(anObject_: *ObjectType) *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector, *ObjectType) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_arrayWithObject_, anObject_);
                }
                pub fn arrayWithObjects_count(objects_: **ObjectType, cnt_: UInteger) *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector, **ObjectType, UInteger) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_arrayWithObjects_count_, objects_, cnt_);
                }
                pub fn initWithObjects_count(self_: *T, objects_: **ObjectType, cnt_: UInteger) *T {
                    return @as(*const fn (*T, *c.objc_selector, **ObjectType, UInteger) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithObjects_count_, objects_, cnt_);
                }
                pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                    return @as(*const fn (*T, *c.objc_selector, *Coder) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithCoder_, coder_);
                }
                pub fn count(self_: *T) UInteger {
                    return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_count);
                }
                pub fn objectAtIndex(self_: *T, index_: UInteger) *ObjectType {
                    return @as(*const fn (*T, *c.objc_selector, UInteger) callconv(.C) *ObjectType, @ptrCast(&c.objc_msgSend))(self_, sel_objectAtIndex_, index_);
                }
            };
        }
    };
}

pub const AutoreleasePool = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_AutoreleasePool;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn addObject(self_: *T, anObject_: *c.objc_object) void {
                return @as(*const fn (*T, *c.objc_selector, *c.objc_object) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_addObject_, anObject_);
            }
            pub fn drain(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_drain);
            }
            pub fn showPools() void {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(T.class(), sel_showPools);
            }
        };
    }
};

pub const Bundle = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Bundle;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn mainBundle() *Bundle {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *Bundle, @ptrCast(&c.objc_msgSend))(T.class(), sel_mainBundle);
            }
            pub fn bundleWithPath(path_: *String) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_bundleWithPath_, path_);
            }
            pub fn bundleWithURL(url_: *URL) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, *URL) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_bundleWithURL_, url_);
            }
            pub fn initWithPath(self_: *T, path_: *String) *T {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithPath_, path_);
            }
            pub fn initWithURL(self_: *T, url_: *URL) *T {
                return @as(*const fn (*T, *c.objc_selector, *URL) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithURL_, url_);
            }
            pub fn allBundles() *Array(*Bundle) {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *Array(*Bundle), @ptrCast(&c.objc_msgSend))(T.class(), sel_allBundles);
            }
            pub fn allFrameworks() *Array(*Bundle) {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *Array(*Bundle), @ptrCast(&c.objc_msgSend))(T.class(), sel_allFrameworks);
            }
            pub fn load(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_load);
            }
            pub fn unload(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_unload);
            }
            pub fn isLoaded(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isLoaded);
            }
            pub fn preflightAndReturnError(self_: *T, error_: ?*?*Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*?*Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_preflightAndReturnError_, error_);
            }
            pub fn loadAndReturnError(self_: *T, error_: ?*?*Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*?*Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_loadAndReturnError_, error_);
            }
            pub fn bundleURL(self_: *T) *URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *URL, @ptrCast(&c.objc_msgSend))(self_, sel_bundleURL);
            }
            pub fn resourceURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_resourceURL);
            }
            pub fn executableURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_executableURL);
            }
            pub fn URLForAuxiliaryExecutable(self_: *T, executableName_: *String) ?*URL {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_URLForAuxiliaryExecutable_, executableName_);
            }
            pub fn privateFrameworksURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_privateFrameworksURL);
            }
            pub fn sharedFrameworksURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_sharedFrameworksURL);
            }
            pub fn sharedSupportURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_sharedSupportURL);
            }
            pub fn builtInPlugInsURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_builtInPlugInsURL);
            }
            pub fn appStoreReceiptURL(self_: *T) ?*URL {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*URL, @ptrCast(&c.objc_msgSend))(self_, sel_appStoreReceiptURL);
            }
            pub fn bundlePath(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_bundlePath);
            }
            pub fn resourcePath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_resourcePath);
            }
            pub fn executablePath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_executablePath);
            }
            pub fn pathForAuxiliaryExecutable(self_: *T, executableName_: *String) ?*String {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_pathForAuxiliaryExecutable_, executableName_);
            }
            pub fn privateFrameworksPath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_privateFrameworksPath);
            }
            pub fn sharedFrameworksPath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_sharedFrameworksPath);
            }
            pub fn sharedSupportPath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_sharedSupportPath);
            }
            pub fn builtInPlugInsPath(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_builtInPlugInsPath);
            }
            pub fn bundleIdentifier(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_bundleIdentifier);
            }
            pub fn infoDictionary(self_: *T) *Dictionary(ErrorUserInfoKey, *ObjectProtocol) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Dictionary(ErrorUserInfoKey, *ObjectProtocol), @ptrCast(&c.objc_msgSend))(self_, sel_infoDictionary);
            }
            pub fn localizedInfoDictionary(self_: *T) *Dictionary(ErrorUserInfoKey, *ObjectProtocol) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Dictionary(ErrorUserInfoKey, *ObjectProtocol), @ptrCast(&c.objc_msgSend))(self_, sel_localizedInfoDictionary);
            }
            pub fn objectForInfoDictionaryKey(self_: *T, key_: *String) *c.objc_object {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *c.objc_object, @ptrCast(&c.objc_msgSend))(self_, sel_objectForInfoDictionaryKey_, key_);
            }
            pub fn localizedStringForKey_value_table(self_: *T, key_: *String, value_: ?*String, tableName_: ?*String) *String {
                return @as(*const fn (*T, *c.objc_selector, *String, ?*String, ?*String) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_localizedStringForKey_value_table_, key_, value_, tableName_);
            }
        };
    }
};

pub const Coder = opaque {};

pub const Condition = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub const ConformsTo = &[_]type{Locking};
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Condition;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Locking.Methods(T);
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn wait(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_wait);
            }
            pub fn waitUntilDate(self_: *T, limit_: *Date) bool {
                return @as(*const fn (*T, *c.objc_selector, *Date) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_waitUntilDate_, limit_);
            }
            pub fn signal(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_signal);
            }
            pub fn broadcast(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_broadcast);
            }
        };
    }
};

pub const Copying = opaque {
    const Self = @This();
    pub usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return struct {};
    }
};

pub const Data = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Data;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn mutableBytes(self_: *T) *const anyopaque {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *const anyopaque, @ptrCast(&c.objc_msgSend))(self_, sel_mutableBytes);
            }
            pub fn length(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_length);
            }
        };
    }
};

pub const Date = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Date;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn dateWithTimeIntervalSinceNow(secs_: TimeInterval) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, TimeInterval) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_dateWithTimeIntervalSinceNow_, secs_);
            }
        };
    }
};

pub fn Dictionary(comptime KeyType: type, comptime ObjectType: type) type {
    return opaque {
        const Self = @This();
        pub const Super = ObjectInterface;
        pub usingnamespace Methods(Self);
        pub fn class() *c.objc_class {
            return class_Dictionary;
        }

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn dictionary() *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_dictionary);
                }
                pub fn dictionaryWithObject_forKey(object_: *ObjectType, key_: *KeyType) *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector, *ObjectType, *KeyType) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_dictionaryWithObject_forKey_, object_, key_);
                }
                pub fn dictionaryWithObjects_forKeys_count(objects_: **ObjectType, keys_: **KeyType, cnt_: UInteger) *T {
                    return @as(*const fn (*c.objc_class, *c.objc_selector, *ObjectType, *KeyType, UInteger) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_dictionaryWithObjects_forKeys_count_, objects_, keys_, cnt_);
                }
                pub fn initWithObjects_forKeys_count(self_: *T, objects_: **ObjectType, keys_: **KeyType, cnt_: UInteger) *T {
                    return @as(*const fn (*T, *c.objc_selector, **ObjectType, **KeyType, UInteger) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithObjects_forKeys_count_, objects_, keys_, cnt_);
                }
                pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                    return @as(*const fn (*T, *c.objc_selector, *Coder) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithCoder_, coder_);
                }
                pub fn keyEnumerator(self_: *T) *Enumerator(KeyType) {
                    return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Enumerator(KeyType), @ptrCast(&c.objc_msgSend))(self_, sel_keyEnumerator);
                }
                pub fn objectForKey(self_: *T, aKey_: *KeyType) *ObjectType {
                    return @as(*const fn (*T, *c.objc_selector, *KeyType) callconv(.C) *ObjectType, @ptrCast(&c.objc_msgSend))(self_, sel_objectForKey_, aKey_);
                }
                pub fn count(self_: *T) UInteger {
                    return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_count);
                }
            };
        }
    };
}

pub fn Enumerator(comptime ObjectType: type) type {
    return opaque {
        const Self = @This();
        pub const Super = ObjectInterface;
        pub usingnamespace Methods(Self);
        pub fn class() *c.objc_class {
            return class_Enumerator;
        }

        pub fn Methods(comptime T: type) type {
            return struct {
                pub usingnamespace ObjectInterface.Methods(T);

                pub fn nextObject(self_: *T) *ObjectType {
                    return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ObjectType, @ptrCast(&c.objc_msgSend))(self_, sel_nextObject);
                }
                pub fn allObjects(self_: *T) *Array(ObjectType) {
                    return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Array(ObjectType), @ptrCast(&c.objc_msgSend))(self_, sel_allObjects);
                }
            };
        }
    };
}

pub const Error = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Error;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn errorWithDomain_code_userInfo(domain_: ErrorDomain, code_: Integer, dict_: *Dictionary(ErrorUserInfoKey, ObjectProtocol)) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, ErrorDomain, Integer, *Dictionary(ErrorUserInfoKey, ObjectProtocol)) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_errorWithDomain_code_userInfo_, domain_, code_, dict_);
            }
            pub fn initWithDomain_code_userInfo(self_: *T, domain_: ErrorDomain, code_: Integer, dict_: *Dictionary(ErrorUserInfoKey, ObjectProtocol)) *T {
                return @as(*const fn (*T, *c.objc_selector, ErrorDomain, Integer, *Dictionary(ErrorUserInfoKey, ObjectProtocol)) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithDomain_code_userInfo_, domain_, code_, dict_);
            }
            pub fn code(self_: *T) Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Integer, @ptrCast(&c.objc_msgSend))(self_, sel_code);
            }
            pub fn domain(self_: *T) ErrorDomain {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ErrorDomain, @ptrCast(&c.objc_msgSend))(self_, sel_domain);
            }
            pub fn userInfo(self_: *T) *Dictionary(ErrorUserInfoKey, ObjectProtocol) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Dictionary(ErrorUserInfoKey, ObjectProtocol), @ptrCast(&c.objc_msgSend))(self_, sel_userInfo);
            }
            pub fn localizedDescription(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_localizedDescription);
            }
            pub fn localizedRecoveryOptions(self_: *T) ?*Array(*String) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Array(*String), @ptrCast(&c.objc_msgSend))(self_, sel_localizedRecoveryOptions);
            }
            pub fn localizedRecoverySuggestion(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_localizedRecoverySuggestion);
            }
            pub fn localizedFailureReason(self_: *T) ?*String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*String, @ptrCast(&c.objc_msgSend))(self_, sel_localizedFailureReason);
            }
        };
    }
};

pub const FastEnumeration = opaque {
    const Self = @This();
    pub usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        _ = T;
        return struct {};
    }
};

pub const Locking = opaque {
    const Self = @This();
    pub usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn lock(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_lock);
            }
            pub fn unlock(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_unlock);
            }
        };
    }
};

pub const Notification = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Notification;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn name(self_: *T) NotificationName {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) NotificationName, @ptrCast(&c.objc_msgSend))(self_, sel_name);
            }
            pub fn object(self_: *T) ?*ObjectProtocol {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ObjectProtocol, @ptrCast(&c.objc_msgSend))(self_, sel_object);
            }
            pub fn userInfo(self_: *T) ?*Dictionary(ObjectProtocol, ObjectProtocol) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*Dictionary(ObjectProtocol, ObjectProtocol), @ptrCast(&c.objc_msgSend))(self_, sel_userInfo);
            }
        };
    }
};

pub const Number = opaque {
    const Self = @This();
    pub const Super = Value;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Number;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace Value.Methods(T);

            pub fn numberWithChar(value_: u8) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, u8) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithChar_, value_);
            }
            pub fn numberWithUnsignedChar(value_: u8) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, u8) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedChar_, value_);
            }
            pub fn numberWithShort(value_: c_short) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_short) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithShort_, value_);
            }
            pub fn numberWithUnsignedShort(value_: c_ushort) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_ushort) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedShort_, value_);
            }
            pub fn numberWithInt(value_: c_int) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_int) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithInt_, value_);
            }
            pub fn numberWithUnsignedInt(value_: c_uint) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_uint) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedInt_, value_);
            }
            pub fn numberWithLong(value_: c_long) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_long) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithLong_, value_);
            }
            pub fn numberWithUnsignedLong(value_: c_ulong) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_ulong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedLong_, value_);
            }
            pub fn numberWithLongLong(value_: c_longlong) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_longlong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithLongLong_, value_);
            }
            pub fn numberWithUnsignedLongLong(value_: c_ulonglong) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, c_ulonglong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedLongLong_, value_);
            }
            pub fn numberWithFloat(value_: f32) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, f32) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithFloat_, value_);
            }
            pub fn numberWithDouble(value_: f64) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, f64) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithDouble_, value_);
            }
            pub fn numberWithBool(value_: bool) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, bool) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithBool_, value_);
            }
            pub fn numberWithInteger(value_: Integer) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, Integer) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithInteger_, value_);
            }
            pub fn numberWithUnsignedInteger(value_: UInteger) *Number {
                return @as(*const fn (*c.objc_class, *c.objc_selector, UInteger) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(T.class(), sel_numberWithUnsignedInteger_, value_);
            }
            pub fn initWithChar(self_: *T, value_: u8) *Number {
                return @as(*const fn (*T, *c.objc_selector, u8) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithChar_, value_);
            }
            pub fn initWithUnsignedChar(self_: *T, value_: u8) *Number {
                return @as(*const fn (*T, *c.objc_selector, u8) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedChar_, value_);
            }
            pub fn initWithShort(self_: *T, value_: c_short) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_short) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithShort_, value_);
            }
            pub fn initWithUnsignedShort(self_: *T, value_: c_ushort) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_ushort) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedShort_, value_);
            }
            pub fn initWithInt(self_: *T, value_: c_int) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_int) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithInt_, value_);
            }
            pub fn initWithUnsignedInt(self_: *T, value_: c_uint) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_uint) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedInt_, value_);
            }
            pub fn initWithLong(self_: *T, value_: c_long) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_long) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithLong_, value_);
            }
            pub fn initWithUnsignedLong(self_: *T, value_: c_ulong) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_ulong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedLong_, value_);
            }
            pub fn initWithLongLong(self_: *T, value_: c_longlong) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_longlong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithLongLong_, value_);
            }
            pub fn initWithUnsignedLongLong(self_: *T, value_: c_ulonglong) *Number {
                return @as(*const fn (*T, *c.objc_selector, c_ulonglong) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedLongLong_, value_);
            }
            pub fn initWithFloat(self_: *T, value_: f32) *Number {
                return @as(*const fn (*T, *c.objc_selector, f32) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithFloat_, value_);
            }
            pub fn initWithDouble(self_: *T, value_: f64) *Number {
                return @as(*const fn (*T, *c.objc_selector, f64) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithDouble_, value_);
            }
            pub fn initWithBool(self_: *T, value_: bool) *Number {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithBool_, value_);
            }
            pub fn initWithInteger(self_: *T, value_: Integer) *Number {
                return @as(*const fn (*T, *c.objc_selector, Integer) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithInteger_, value_);
            }
            pub fn initWithUnsignedInteger(self_: *T, value_: UInteger) *Number {
                return @as(*const fn (*T, *c.objc_selector, UInteger) callconv(.C) *Number, @ptrCast(&c.objc_msgSend))(self_, sel_initWithUnsignedInteger_, value_);
            }
            pub fn charValue(self_: *T) u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u8, @ptrCast(&c.objc_msgSend))(self_, sel_charValue);
            }
            pub fn unsignedCharValue(self_: *T) u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) u8, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedCharValue);
            }
            pub fn shortValue(self_: *T) c_short {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_short, @ptrCast(&c.objc_msgSend))(self_, sel_shortValue);
            }
            pub fn unsignedShortValue(self_: *T) c_ushort {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_ushort, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedShortValue);
            }
            pub fn intValue(self_: *T) c_int {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_int, @ptrCast(&c.objc_msgSend))(self_, sel_intValue);
            }
            pub fn unsignedIntValue(self_: *T) c_uint {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_uint, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedIntValue);
            }
            pub fn longValue(self_: *T) c_long {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_long, @ptrCast(&c.objc_msgSend))(self_, sel_longValue);
            }
            pub fn unsignedLongValue(self_: *T) c_ulong {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_ulong, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedLongValue);
            }
            pub fn longLongValue(self_: *T) c_longlong {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_longlong, @ptrCast(&c.objc_msgSend))(self_, sel_longLongValue);
            }
            pub fn unsignedLongLongValue(self_: *T) c_ulonglong {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_ulonglong, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedLongLongValue);
            }
            pub fn floatValue(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_floatValue);
            }
            pub fn doubleValue(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_doubleValue);
            }
            pub fn boolValue(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_boolValue);
            }
            pub fn integerValue(self_: *T) Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) Integer, @ptrCast(&c.objc_msgSend))(self_, sel_integerValue);
            }
            pub fn unsignedIntegerValue(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_unsignedIntegerValue);
            }
            pub fn stringValue(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_stringValue);
            }
            pub fn compare(self_: *T, otherNumber_: *Number) ComparisonResult {
                return @as(*const fn (*T, *c.objc_selector, *Number) callconv(.C) ComparisonResult, @ptrCast(&c.objc_msgSend))(self_, sel_compare_, otherNumber_);
            }
            pub fn isEqualToNumber(self_: *T, number_: *Number) bool {
                return @as(*const fn (*T, *c.objc_selector, *Number) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isEqualToNumber_, number_);
            }
            pub fn descriptionWithLocale(self_: *T, locale_: *c.objc_object) *String {
                return @as(*const fn (*T, *c.objc_selector, *c.objc_object) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_descriptionWithLocale_, locale_);
            }
        };
    }
};

pub const ObjectProtocol = opaque {
    const Self = @This();
    pub usingnamespace Methods(Self);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub fn cast(self: *T, comptime U: type) *U {
                // TODO
                return @as(*U, @ptrCast(self));
            }
            pub fn retain(self_: *T) *T {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_retain);
            }
            pub fn release(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_release);
            }
            pub fn autorelease(self_: *T) *T {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_autorelease);
            }
            pub fn retainCount(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_retainCount);
            }
            pub fn hash(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_hash);
            }
            pub fn isEqual(self_: *T, object_: *c.objc_object) bool {
                return @as(*const fn (*T, *c.objc_selector, *c.objc_object) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isEqual_, object_);
            }
            pub fn description(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_description);
            }
            pub fn debugDescription(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_debugDescription);
            }
        };
    }
};

pub const ObjectInterface = opaque {
    const Self = @This();
    pub const ConformsTo = &[_]type{ObjectProtocol};
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Object;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectProtocol.Methods(T);

            pub fn init(self_: *T) *T {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_init);
            }
            pub fn new() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_new);
            }
            pub fn alloc() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_alloc);
            }
        };
    }
};

pub const ProcessInfo = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_ProcessInfo;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn processInfo() *ProcessInfo {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *ProcessInfo, @ptrCast(&c.objc_msgSend))(T.class(), sel_processInfo);
            }
            pub fn arguments(self_: *T) *Array(String) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Array(String), @ptrCast(&c.objc_msgSend))(self_, sel_arguments);
            }
            pub fn environment(self_: *T) *Dictionary(String, String) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *Dictionary(String, String), @ptrCast(&c.objc_msgSend))(self_, sel_environment);
            }
            pub fn hostName(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_hostName);
            }
            pub fn processName(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_processName);
            }
            pub fn setProcessName(self_: *T, processName_: *String) void {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setProcessName_, processName_);
            }
            pub fn processIdentifier(self_: *T) c_int {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_int, @ptrCast(&c.objc_msgSend))(self_, sel_processIdentifier);
            }
            pub fn globallyUniqueString(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_globallyUniqueString);
            }
            pub fn userName(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_userName);
            }
            pub fn fullUserName(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_fullUserName);
            }
            pub fn operatingSystem(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_operatingSystem);
            }
            pub fn operatingSystemVersion(self_: *T) OperatingSystemVersion {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) OperatingSystemVersion, @ptrCast(&c.objc_msgSend))(self_, sel_operatingSystemVersion);
            }
            pub fn operatingSystemVersionString(self_: *T) *String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_operatingSystemVersionString);
            }
            pub fn isOperatingSystemAtLeastVersion(self_: *T, version_: OperatingSystemVersion) bool {
                return @as(*const fn (*T, *c.objc_selector, OperatingSystemVersion) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isOperatingSystemAtLeastVersion_, version_);
            }
            pub fn processorCount(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_processorCount);
            }
            pub fn activeProcessorCount(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_activeProcessorCount);
            }
            pub fn physicalMemory(self_: *T) c_ulonglong {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) c_ulonglong, @ptrCast(&c.objc_msgSend))(self_, sel_physicalMemory);
            }
            pub fn systemUptime(self_: *T) TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_systemUptime);
            }
            pub fn disableSuddenTermination(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_disableSuddenTermination);
            }
            pub fn enableSuddenTermination(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_enableSuddenTermination);
            }
            pub fn disableAutomaticTermination(self_: *T, reason_: *String) void {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_disableAutomaticTermination_, reason_);
            }
            pub fn enableAutomaticTermination(self_: *T, reason_: *String) void {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_enableAutomaticTermination_, reason_);
            }
            pub fn automaticTerminationSupportEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_automaticTerminationSupportEnabled);
            }
            pub fn setAutomaticTerminationSupportEnabled(self_: *T, automaticTerminationSupportEnabled_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setAutomaticTerminationSupportEnabled_, automaticTerminationSupportEnabled_);
            }
            pub fn beginActivityWithOptions_reason(self_: *T, options_: ActivityOptions, reason_: *String) *ObjectProtocol {
                return @as(*const fn (*T, *c.objc_selector, ActivityOptions, *String) callconv(.C) *ObjectProtocol, @ptrCast(&c.objc_msgSend))(self_, sel_beginActivityWithOptions_reason_, options_, reason_);
            }
            pub fn endActivity(self_: *T, activity_: *ObjectProtocol) void {
                return @as(*const fn (*T, *c.objc_selector, *ObjectProtocol) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_endActivity_, activity_);
            }
            // pub fn performActivityWithOptions_reason_usingBlock(self_: *T, options_: ActivityOptions, reason_: *String, block_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, ActivityOptions, *String, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_performActivityWithOptions_reason_usingBlock_, options_, reason_, block_);
            // }
            // pub fn performExpiringActivityWithReason_usingBlock(self_: *T, reason_: *String, block_: void) void {
            //     return @as(*const fn (*T, *c.objc_selector, *String, void) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_performExpiringActivityWithReason_usingBlock_, reason_, block_);
            // }
            pub fn thermalState(self_: *T) ProcessInfoThermalState {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ProcessInfoThermalState, @ptrCast(&c.objc_msgSend))(self_, sel_thermalState);
            }
            pub fn isLowPowerModeEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isLowPowerModeEnabled);
            }
            pub fn isiOSAppOnMac(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isiOSAppOnMac);
            }
            pub fn isMacCatalystApp(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isMacCatalystApp);
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
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_String;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn string() *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_string);
            }
            pub fn stringWithString(string_: *String) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_stringWithString_, string_);
            }
            pub fn stringWithCString_encoding(cString_: [*:0]const u8, enc_: StringEncoding) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, [*:0]const u8, StringEncoding) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_stringWithCString_encoding_, cString_, enc_);
            }
            pub fn stringWithUTF8String(cString_: [*:0]const u8) *T {
                return @as(*const fn (*c.objc_class, *c.objc_selector, [*:0]const u8) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(T.class(), sel_stringWithUTF8String_, cString_);
            }
            pub fn initWithString(self_: *T, aString_: *String) *T {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithString_, aString_);
            }
            pub fn initWithCString_encoding(self_: *T, nullTerminatedCString_: [*:0]const u8, encoding_: StringEncoding) *T {
                return @as(*const fn (*T, *c.objc_selector, [*:0]const u8, StringEncoding) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithCString_encoding_, nullTerminatedCString_, encoding_);
            }
            pub fn initWithBytesNoCopy_length_encoding_freeWhenDone(self_: *T, bytes_: *anyopaque, len_: UInteger, encoding_: StringEncoding, freeBuffer_: bool) *T {
                return @as(*const fn (*T, *c.objc_selector, *anyopaque, UInteger, StringEncoding, bool) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithBytesNoCopy_length_encoding_freeWhenDone_, bytes_, len_, encoding_, freeBuffer_);
            }
            pub fn characterAtIndex(self_: *T, index_: UInteger) unichar {
                return @as(*const fn (*T, *c.objc_selector, UInteger) callconv(.C) unichar, @ptrCast(&c.objc_msgSend))(self_, sel_characterAtIndex_, index_);
            }
            pub fn length(self_: *T) UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_length);
            }
            pub fn cStringUsingEncoding(self_: *T, encoding_: StringEncoding) ?[*:0]const u8 {
                return @as(*const fn (*T, *c.objc_selector, StringEncoding) callconv(.C) ?[*:0]const u8, @ptrCast(&c.objc_msgSend))(self_, sel_cStringUsingEncoding_, encoding_);
            }
            pub fn utf8String(self_: *T) [*:0]const u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) [*:0]const u8, @ptrCast(&c.objc_msgSend))(self_, sel_UTF8String);
            }
            pub fn maximumLengthOfBytesUsingEncoding(self_: *T, enc_: StringEncoding) UInteger {
                return @as(*const fn (*T, *c.objc_selector, StringEncoding) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_maximumLengthOfBytesUsingEncoding_, enc_);
            }
            pub fn lengthOfBytesUsingEncoding(self_: *T, enc_: StringEncoding) UInteger {
                return @as(*const fn (*T, *c.objc_selector, StringEncoding) callconv(.C) UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_lengthOfBytesUsingEncoding_, enc_);
            }
            pub fn isEqualToString(self_: *T, aString_: *String) bool {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isEqualToString_, aString_);
            }
            pub fn rangeOfString_options(self_: *T, searchString_: *String, mask_: StringCompareOptions) Range {
                return @as(*const fn (*T, *c.objc_selector, *String, StringCompareOptions) callconv(.C) Range, @ptrCast(&c.objc_msgSend))(self_, sel_rangeOfString_options_, searchString_, mask_);
            }
            pub fn fileSystemRepresentation(self_: *T) [*:0]const u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) [*:0]const u8, @ptrCast(&c.objc_msgSend))(self_, sel_fileSystemRepresentation);
            }
            pub fn stringByAppendingString(self_: *T, aString_: *String) *String {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *String, @ptrCast(&c.objc_msgSend))(self_, sel_stringByAppendingString_, aString_);
            }
        };
    }
};

pub const URL = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_URL;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn fileURLWithPath(path_: *String) *URL {
                return @as(*const fn (*c.objc_class, *c.objc_selector, *String) callconv(.C) *URL, @ptrCast(&c.objc_msgSend))(T.class(), sel_fileURLWithPath_, path_);
            }
            pub fn initWithString(self_: *T, URLString_: *String) *T {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithString_, URLString_);
            }
            pub fn initFileURLWithPath(self_: *T, path_: *String) *T {
                return @as(*const fn (*T, *c.objc_selector, *String) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initFileURLWithPath_, path_);
            }
            pub fn fileSystemRepresentation(self_: *T) [*:0]const u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) [*:0]const u8, @ptrCast(&c.objc_msgSend))(self_, sel_fileSystemRepresentation);
            }
        };
    }
};

pub const Value = opaque {
    const Self = @This();
    pub const Super = ObjectInterface;
    pub usingnamespace Methods(Self);
    pub fn class() *c.objc_class {
        return class_Value;
    }

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ObjectInterface.Methods(T);

            pub fn valueWithBytes_objCType(value_: *const anyopaque, type_: [*:0]const u8) *Value {
                return @as(*const fn (*c.objc_class, *c.objc_selector, *const anyopaque, [*:0]const u8) callconv(.C) *Value, @ptrCast(&c.objc_msgSend))(T.class(), sel_valueWithBytes_objCType_, value_, type_);
            }
            pub fn valueWithPointer(pointer_: ?*const anyopaque) *Value {
                return @as(*const fn (*c.objc_class, *c.objc_selector, ?*const anyopaque) callconv(.C) *Value, @ptrCast(&c.objc_msgSend))(T.class(), sel_valueWithPointer_, pointer_);
            }
            pub fn initWithBytes_objCType(self_: *T, value_: *const anyopaque, type_: [*:0]const u8) *T {
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque, [*:0]const u8) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithBytes_objCType_, value_, type_);
            }
            pub fn initWithCoder(self_: *T, coder_: *Coder) *T {
                return @as(*const fn (*T, *c.objc_selector, *Coder) callconv(.C) *T, @ptrCast(&c.objc_msgSend))(self_, sel_initWithCoder_, coder_);
            }
            pub fn getValue_size(self_: *T, value_: *anyopaque, size_: UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, *anyopaque, UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_getValue_size_, value_, size_);
            }
            pub fn objCType(self_: *T) [*:0]const u8 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) [*:0]const u8, @ptrCast(&c.objc_msgSend))(self_, sel_objCType);
            }
            pub fn isEqualToValue(self_: *T, value_: *Value) bool {
                return @as(*const fn (*T, *c.objc_selector, *Value) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isEqualToValue_, value_);
            }
            pub fn pointerValue(self_: *T) ?*anyopaque {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*anyopaque, @ptrCast(&c.objc_msgSend))(self_, sel_pointerValue);
            }
        };
    }
};

// ------------------------------------------------------------------------------------------------
var class_Array: *c.objc_class = undefined;
var class_AutoreleasePool: *c.objc_class = undefined;
var class_Bundle: *c.objc_class = undefined;
var class_Condition: *c.objc_class = undefined;
var class_Data: *c.objc_class = undefined;
var class_Date: *c.objc_class = undefined;
var class_Dictionary: *c.objc_class = undefined;
var class_Enumerator: *c.objc_class = undefined;
var class_Error: *c.objc_class = undefined;
var class_Notification: *c.objc_class = undefined;
var class_Number: *c.objc_class = undefined;
var class_Object: *c.objc_class = undefined;
var class_ProcessInfo: *c.objc_class = undefined;
var class_String: *c.objc_class = undefined;
var class_URL: *c.objc_class = undefined;
var class_Value: *c.objc_class = undefined;

var sel_activeProcessorCount: *c.objc_selector = undefined;
var sel_addObject_: *c.objc_selector = undefined;
var sel_allBundles: *c.objc_selector = undefined;
var sel_allFrameworks: *c.objc_selector = undefined;
var sel_allObjects: *c.objc_selector = undefined;
var sel_alloc: *c.objc_selector = undefined;
var sel_appStoreReceiptURL: *c.objc_selector = undefined;
var sel_arguments: *c.objc_selector = undefined;
var sel_array: *c.objc_selector = undefined;
var sel_arrayWithObject_: *c.objc_selector = undefined;
var sel_arrayWithObjects_count_: *c.objc_selector = undefined;
var sel_automaticTerminationSupportEnabled: *c.objc_selector = undefined;
var sel_autorelease: *c.objc_selector = undefined;
var sel_beginActivityWithOptions_reason_: *c.objc_selector = undefined;
var sel_boolValue: *c.objc_selector = undefined;
var sel_broadcast: *c.objc_selector = undefined;
var sel_builtInPlugInsPath: *c.objc_selector = undefined;
var sel_builtInPlugInsURL: *c.objc_selector = undefined;
var sel_bundleIdentifier: *c.objc_selector = undefined;
var sel_bundlePath: *c.objc_selector = undefined;
var sel_bundleURL: *c.objc_selector = undefined;
var sel_bundleWithPath_: *c.objc_selector = undefined;
var sel_bundleWithURL_: *c.objc_selector = undefined;
var sel_characterAtIndex_: *c.objc_selector = undefined;
var sel_charValue: *c.objc_selector = undefined;
var sel_code: *c.objc_selector = undefined;
var sel_compare_: *c.objc_selector = undefined;
var sel_count: *c.objc_selector = undefined;
var sel_cStringUsingEncoding_: *c.objc_selector = undefined;
var sel_dateWithTimeIntervalSinceNow_: *c.objc_selector = undefined;
var sel_debugDescription: *c.objc_selector = undefined;
var sel_description: *c.objc_selector = undefined;
var sel_descriptionWithLocale_: *c.objc_selector = undefined;
var sel_dictionary: *c.objc_selector = undefined;
var sel_dictionaryWithObject_forKey_: *c.objc_selector = undefined;
var sel_dictionaryWithObjects_forKeys_count_: *c.objc_selector = undefined;
var sel_disableAutomaticTermination_: *c.objc_selector = undefined;
var sel_disableSuddenTermination: *c.objc_selector = undefined;
var sel_domain: *c.objc_selector = undefined;
var sel_doubleValue: *c.objc_selector = undefined;
var sel_drain: *c.objc_selector = undefined;
var sel_enableAutomaticTermination_: *c.objc_selector = undefined;
var sel_enableSuddenTermination: *c.objc_selector = undefined;
var sel_endActivity_: *c.objc_selector = undefined;
var sel_environment: *c.objc_selector = undefined;
var sel_errorWithDomain_code_userInfo_: *c.objc_selector = undefined;
var sel_executablePath: *c.objc_selector = undefined;
var sel_executableURL: *c.objc_selector = undefined;
var sel_fileSystemRepresentation: *c.objc_selector = undefined;
var sel_fileURLWithPath_: *c.objc_selector = undefined;
var sel_floatValue: *c.objc_selector = undefined;
var sel_fullUserName: *c.objc_selector = undefined;
var sel_getValue_size_: *c.objc_selector = undefined;
var sel_globallyUniqueString: *c.objc_selector = undefined;
var sel_hash: *c.objc_selector = undefined;
var sel_hostName: *c.objc_selector = undefined;
var sel_infoDictionary: *c.objc_selector = undefined;
var sel_init: *c.objc_selector = undefined;
var sel_initFileURLWithPath_: *c.objc_selector = undefined;
var sel_initWithBool_: *c.objc_selector = undefined;
var sel_initWithBytes_objCType_: *c.objc_selector = undefined;
var sel_initWithBytesNoCopy_length_encoding_freeWhenDone_: *c.objc_selector = undefined;
var sel_initWithChar_: *c.objc_selector = undefined;
var sel_initWithCoder_: *c.objc_selector = undefined;
var sel_initWithCString_encoding_: *c.objc_selector = undefined;
var sel_initWithDomain_code_userInfo_: *c.objc_selector = undefined;
var sel_initWithDouble_: *c.objc_selector = undefined;
var sel_initWithFloat_: *c.objc_selector = undefined;
var sel_initWithInt_: *c.objc_selector = undefined;
var sel_initWithInteger_: *c.objc_selector = undefined;
var sel_initWithLong_: *c.objc_selector = undefined;
var sel_initWithLongLong_: *c.objc_selector = undefined;
var sel_initWithObjects_count_: *c.objc_selector = undefined;
var sel_initWithObjects_forKeys_count_: *c.objc_selector = undefined;
var sel_initWithPath_: *c.objc_selector = undefined;
var sel_initWithShort_: *c.objc_selector = undefined;
var sel_initWithString_: *c.objc_selector = undefined;
var sel_initWithUnsignedChar_: *c.objc_selector = undefined;
var sel_initWithUnsignedInt_: *c.objc_selector = undefined;
var sel_initWithUnsignedInteger_: *c.objc_selector = undefined;
var sel_initWithUnsignedLong_: *c.objc_selector = undefined;
var sel_initWithUnsignedLongLong_: *c.objc_selector = undefined;
var sel_initWithUnsignedShort_: *c.objc_selector = undefined;
var sel_initWithURL_: *c.objc_selector = undefined;
var sel_integerValue: *c.objc_selector = undefined;
var sel_intValue: *c.objc_selector = undefined;
var sel_isEqual_: *c.objc_selector = undefined;
var sel_isEqualToNumber_: *c.objc_selector = undefined;
var sel_isEqualToString_: *c.objc_selector = undefined;
var sel_isEqualToValue_: *c.objc_selector = undefined;
var sel_isiOSAppOnMac: *c.objc_selector = undefined;
var sel_isLoaded: *c.objc_selector = undefined;
var sel_isLowPowerModeEnabled: *c.objc_selector = undefined;
var sel_isMacCatalystApp: *c.objc_selector = undefined;
var sel_isOperatingSystemAtLeastVersion_: *c.objc_selector = undefined;
var sel_keyEnumerator: *c.objc_selector = undefined;
var sel_length: *c.objc_selector = undefined;
var sel_lengthOfBytesUsingEncoding_: *c.objc_selector = undefined;
var sel_load: *c.objc_selector = undefined;
var sel_loadAndReturnError_: *c.objc_selector = undefined;
var sel_localizedDescription: *c.objc_selector = undefined;
var sel_localizedFailureReason: *c.objc_selector = undefined;
var sel_localizedInfoDictionary: *c.objc_selector = undefined;
var sel_localizedRecoveryOptions: *c.objc_selector = undefined;
var sel_localizedRecoverySuggestion: *c.objc_selector = undefined;
var sel_localizedStringForKey_value_table_: *c.objc_selector = undefined;
var sel_lock: *c.objc_selector = undefined;
var sel_longLongValue: *c.objc_selector = undefined;
var sel_longValue: *c.objc_selector = undefined;
var sel_mainBundle: *c.objc_selector = undefined;
var sel_maximumLengthOfBytesUsingEncoding_: *c.objc_selector = undefined;
var sel_mutableBytes: *c.objc_selector = undefined;
var sel_name: *c.objc_selector = undefined;
var sel_new: *c.objc_selector = undefined;
var sel_nextObject: *c.objc_selector = undefined;
var sel_numberWithBool_: *c.objc_selector = undefined;
var sel_numberWithChar_: *c.objc_selector = undefined;
var sel_numberWithDouble_: *c.objc_selector = undefined;
var sel_numberWithFloat_: *c.objc_selector = undefined;
var sel_numberWithInt_: *c.objc_selector = undefined;
var sel_numberWithInteger_: *c.objc_selector = undefined;
var sel_numberWithLong_: *c.objc_selector = undefined;
var sel_numberWithLongLong_: *c.objc_selector = undefined;
var sel_numberWithShort_: *c.objc_selector = undefined;
var sel_numberWithUnsignedChar_: *c.objc_selector = undefined;
var sel_numberWithUnsignedInt_: *c.objc_selector = undefined;
var sel_numberWithUnsignedInteger_: *c.objc_selector = undefined;
var sel_numberWithUnsignedLong_: *c.objc_selector = undefined;
var sel_numberWithUnsignedLongLong_: *c.objc_selector = undefined;
var sel_numberWithUnsignedShort_: *c.objc_selector = undefined;
var sel_objCType: *c.objc_selector = undefined;
var sel_object: *c.objc_selector = undefined;
var sel_objectAtIndex_: *c.objc_selector = undefined;
var sel_objectForInfoDictionaryKey_: *c.objc_selector = undefined;
var sel_objectForKey_: *c.objc_selector = undefined;
var sel_operatingSystem: *c.objc_selector = undefined;
var sel_operatingSystemVersion: *c.objc_selector = undefined;
var sel_operatingSystemVersionString: *c.objc_selector = undefined;
var sel_pathForAuxiliaryExecutable_: *c.objc_selector = undefined;
var sel_performActivityWithOptions_reason_usingBlock_: *c.objc_selector = undefined;
var sel_performExpiringActivityWithReason_usingBlock_: *c.objc_selector = undefined;
var sel_physicalMemory: *c.objc_selector = undefined;
var sel_pointerValue: *c.objc_selector = undefined;
var sel_preflightAndReturnError_: *c.objc_selector = undefined;
var sel_privateFrameworksPath: *c.objc_selector = undefined;
var sel_privateFrameworksURL: *c.objc_selector = undefined;
var sel_processIdentifier: *c.objc_selector = undefined;
var sel_processInfo: *c.objc_selector = undefined;
var sel_processName: *c.objc_selector = undefined;
var sel_processorCount: *c.objc_selector = undefined;
var sel_rangeOfString_options_: *c.objc_selector = undefined;
var sel_release: *c.objc_selector = undefined;
var sel_resourcePath: *c.objc_selector = undefined;
var sel_resourceURL: *c.objc_selector = undefined;
var sel_retain: *c.objc_selector = undefined;
var sel_retainCount: *c.objc_selector = undefined;
var sel_setAutomaticTerminationSupportEnabled_: *c.objc_selector = undefined;
var sel_setProcessName_: *c.objc_selector = undefined;
var sel_sharedFrameworksPath: *c.objc_selector = undefined;
var sel_sharedFrameworksURL: *c.objc_selector = undefined;
var sel_sharedSupportPath: *c.objc_selector = undefined;
var sel_sharedSupportURL: *c.objc_selector = undefined;
var sel_shortValue: *c.objc_selector = undefined;
var sel_showPools: *c.objc_selector = undefined;
var sel_signal: *c.objc_selector = undefined;
var sel_string: *c.objc_selector = undefined;
var sel_stringByAppendingString_: *c.objc_selector = undefined;
var sel_stringValue: *c.objc_selector = undefined;
var sel_stringWithCString_encoding_: *c.objc_selector = undefined;
var sel_stringWithString_: *c.objc_selector = undefined;
var sel_stringWithUTF8String_: *c.objc_selector = undefined;
var sel_systemUptime: *c.objc_selector = undefined;
var sel_thermalState: *c.objc_selector = undefined;
var sel_unload: *c.objc_selector = undefined;
var sel_unlock: *c.objc_selector = undefined;
var sel_unsignedCharValue: *c.objc_selector = undefined;
var sel_unsignedIntegerValue: *c.objc_selector = undefined;
var sel_unsignedIntValue: *c.objc_selector = undefined;
var sel_unsignedLongLongValue: *c.objc_selector = undefined;
var sel_unsignedLongValue: *c.objc_selector = undefined;
var sel_unsignedShortValue: *c.objc_selector = undefined;
var sel_URLForAuxiliaryExecutable_: *c.objc_selector = undefined;
var sel_userInfo: *c.objc_selector = undefined;
var sel_userName: *c.objc_selector = undefined;
var sel_UTF8String: *c.objc_selector = undefined;
var sel_valueWithBytes_objCType_: *c.objc_selector = undefined;
var sel_valueWithPointer_: *c.objc_selector = undefined;
var sel_wait: *c.objc_selector = undefined;
var sel_waitUntilDate_: *c.objc_selector = undefined;

pub fn init() void {
    class_Array = c.objc_getClass("NSArray").?;
    class_AutoreleasePool = c.objc_getClass("NSAutoreleasePool").?;
    class_Bundle = c.objc_getClass("NSBundle").?;
    class_Condition = c.objc_getClass("NSCondition").?;
    class_Data = c.objc_getClass("NSData").?;
    class_Date = c.objc_getClass("NSDate").?;
    class_Dictionary = c.objc_getClass("NSDictionary").?;
    class_Enumerator = c.objc_getClass("NSEnumerator").?;
    class_Error = c.objc_getClass("NSError").?;
    class_Notification = c.objc_getClass("NSNotification").?;
    class_Number = c.objc_getClass("NSNumber").?;
    class_Object = c.objc_getClass("NSObject").?;
    class_ProcessInfo = c.objc_getClass("NSProcessInfo").?;
    class_String = c.objc_getClass("NSString").?;
    class_URL = c.objc_getClass("NSURL").?;
    class_Value = c.objc_getClass("NSValue").?;

    sel_activeProcessorCount = c.sel_registerName("activeProcessorCount").?;
    sel_addObject_ = c.sel_registerName("addObject:").?;
    sel_allBundles = c.sel_registerName("allBundles").?;
    sel_allFrameworks = c.sel_registerName("allFrameworks").?;
    sel_allObjects = c.sel_registerName("allObjects").?;
    sel_alloc = c.sel_registerName("alloc").?;
    sel_arguments = c.sel_registerName("arguments").?;
    sel_array = c.sel_registerName("array").?;
    sel_arrayWithObject_ = c.sel_registerName("arrayWithObject:").?;
    sel_arrayWithObjects_count_ = c.sel_registerName("arrayWithObjects:count:").?;
    sel_automaticTerminationSupportEnabled = c.sel_registerName("automaticTerminationSupportEnabled").?;
    sel_autorelease = c.sel_registerName("autorelease").?;
    sel_beginActivityWithOptions_reason_ = c.sel_registerName("beginActivityWithOptions:reason:").?;
    sel_boolValue = c.sel_registerName("boolValue").?;
    sel_broadcast = c.sel_registerName("broadcast").?;
    sel_builtInPlugInsPath = c.sel_registerName("builtInPlugInsPath").?;
    sel_builtInPlugInsURL = c.sel_registerName("builtInPlugInsURL").?;
    sel_bundleIdentifier = c.sel_registerName("bundleIdentifier").?;
    sel_bundlePath = c.sel_registerName("bundlePath").?;
    sel_bundleURL = c.sel_registerName("bundleURL").?;
    sel_bundleWithPath_ = c.sel_registerName("bundleWithPath:").?;
    sel_bundleWithURL_ = c.sel_registerName("bundleWithURL:").?;
    sel_characterAtIndex_ = c.sel_registerName("characterAtIndex:").?;
    sel_charValue = c.sel_registerName("charValue").?;
    sel_code = c.sel_registerName("code").?;
    sel_compare_ = c.sel_registerName("compare:").?;
    sel_count = c.sel_registerName("count").?;
    sel_cStringUsingEncoding_ = c.sel_registerName("cStringUsingEncoding:").?;
    sel_dateWithTimeIntervalSinceNow_ = c.sel_registerName("dateWithTimeIntervalSinceNow:").?;
    sel_debugDescription = c.sel_registerName("debugDescription").?;
    sel_description = c.sel_registerName("description").?;
    sel_descriptionWithLocale_ = c.sel_registerName("descriptionWithLocale:").?;
    sel_dictionary = c.sel_registerName("dictionary").?;
    sel_dictionaryWithObject_forKey_ = c.sel_registerName("dictionaryWithObject:forKey:").?;
    sel_dictionaryWithObjects_forKeys_count_ = c.sel_registerName("dictionaryWithObjects:forKeys:count:").?;
    sel_disableAutomaticTermination_ = c.sel_registerName("disableAutomaticTermination:").?;
    sel_disableSuddenTermination = c.sel_registerName("disableSuddenTermination").?;
    sel_domain = c.sel_registerName("domain").?;
    sel_doubleValue = c.sel_registerName("doubleValue").?;
    sel_drain = c.sel_registerName("drain").?;
    sel_enableAutomaticTermination_ = c.sel_registerName("enableAutomaticTermination:").?;
    sel_enableSuddenTermination = c.sel_registerName("enableSuddenTermination").?;
    sel_endActivity_ = c.sel_registerName("endActivity:").?;
    sel_environment = c.sel_registerName("environment").?;
    sel_errorWithDomain_code_userInfo_ = c.sel_registerName("errorWithDomain:code:userInfo:").?;
    sel_executablePath = c.sel_registerName("executablePath").?;
    sel_executableURL = c.sel_registerName("executableURL").?;
    sel_fileURLWithPath_ = c.sel_registerName("fileURLWithPath:").?;
    sel_floatValue = c.sel_registerName("floatValue").?;
    sel_fullUserName = c.sel_registerName("fullUserName").?;
    sel_getValue_size_ = c.sel_registerName("getValue:size:").?;
    sel_globallyUniqueString = c.sel_registerName("globallyUniqueString").?;
    sel_hash = c.sel_registerName("hash").?;
    sel_hostName = c.sel_registerName("hostName").?;
    sel_infoDictionary = c.sel_registerName("infoDictionary").?;
    sel_init = c.sel_registerName("init").?;
    sel_initFileURLWithPath_ = c.sel_registerName("initFileURLWithPath:").?;
    sel_initWithBool_ = c.sel_registerName("initWithBool:").?;
    sel_initWithBytes_objCType_ = c.sel_registerName("initWithBytes:objCType:").?;
    sel_initWithBytesNoCopy_length_encoding_freeWhenDone_ = c.sel_registerName("initWithBytesNoCopy:length:encoding:freeWhenDone:").?;
    sel_initWithChar_ = c.sel_registerName("initWithChar:").?;
    sel_initWithCoder_ = c.sel_registerName("initWithCoder:").?;
    sel_initWithCString_encoding_ = c.sel_registerName("initWithCString:encoding:").?;
    sel_initWithDomain_code_userInfo_ = c.sel_registerName("initWithDomain:code:userInfo:").?;
    sel_initWithDouble_ = c.sel_registerName("initWithDouble:").?;
    sel_initWithFloat_ = c.sel_registerName("initWithFloat:").?;
    sel_initWithInt_ = c.sel_registerName("initWithInt:").?;
    sel_initWithInteger_ = c.sel_registerName("initWithInteger:").?;
    sel_initWithLong_ = c.sel_registerName("initWithLong:").?;
    sel_initWithLongLong_ = c.sel_registerName("initWithLongLong:").?;
    sel_initWithObjects_count_ = c.sel_registerName("initWithObjects:count:").?;
    sel_initWithObjects_forKeys_count_ = c.sel_registerName("initWithObjects:forKeys:count:").?;
    sel_initWithPath_ = c.sel_registerName("initWithPath:").?;
    sel_initWithShort_ = c.sel_registerName("initWithShort:").?;
    sel_initWithString_ = c.sel_registerName("initWithString:").?;
    sel_initWithUnsignedChar_ = c.sel_registerName("initWithUnsignedChar:").?;
    sel_initWithUnsignedInt_ = c.sel_registerName("initWithUnsignedInt:").?;
    sel_initWithUnsignedInteger_ = c.sel_registerName("initWithUnsignedInteger:").?;
    sel_initWithUnsignedLong_ = c.sel_registerName("initWithUnsignedLong:").?;
    sel_initWithUnsignedLongLong_ = c.sel_registerName("initWithUnsignedLongLong:").?;
    sel_initWithUnsignedShort_ = c.sel_registerName("initWithUnsignedShort:").?;
    sel_initWithURL_ = c.sel_registerName("initWithURL:").?;
    sel_integerValue = c.sel_registerName("integerValue").?;
    sel_intValue = c.sel_registerName("intValue").?;
    sel_isEqual_ = c.sel_registerName("isEqual:").?;
    sel_isEqualToNumber_ = c.sel_registerName("isEqualToNumber:").?;
    sel_isEqualToString_ = c.sel_registerName("isEqualToString:").?;
    sel_isEqualToValue_ = c.sel_registerName("isEqualToValue:").?;
    sel_isiOSAppOnMac = c.sel_registerName("isiOSAppOnMac").?;
    sel_isLoaded = c.sel_registerName("isLoaded").?;
    sel_isLowPowerModeEnabled = c.sel_registerName("isLowPowerModeEnabled").?;
    sel_isMacCatalystApp = c.sel_registerName("isMacCatalystApp").?;
    sel_isOperatingSystemAtLeastVersion_ = c.sel_registerName("isOperatingSystemAtLeastVersion:").?;
    sel_keyEnumerator = c.sel_registerName("keyEnumerator").?;
    sel_length = c.sel_registerName("length").?;
    sel_lengthOfBytesUsingEncoding_ = c.sel_registerName("lengthOfBytesUsingEncoding:").?;
    sel_load = c.sel_registerName("load").?;
    sel_loadAndReturnError_ = c.sel_registerName("loadAndReturnError:").?;
    sel_localizedDescription = c.sel_registerName("localizedDescription").?;
    sel_localizedFailureReason = c.sel_registerName("localizedFailureReason").?;
    sel_localizedInfoDictionary = c.sel_registerName("localizedInfoDictionary").?;
    sel_localizedRecoveryOptions = c.sel_registerName("localizedRecoveryOptions").?;
    sel_localizedRecoverySuggestion = c.sel_registerName("localizedRecoverySuggestion").?;
    sel_localizedStringForKey_value_table_ = c.sel_registerName("localizedStringForKey:value:table:").?;
    sel_lock = c.sel_registerName("lock").?;
    sel_longLongValue = c.sel_registerName("longLongValue").?;
    sel_longValue = c.sel_registerName("longValue").?;
    sel_mainBundle = c.sel_registerName("mainBundle").?;
    sel_maximumLengthOfBytesUsingEncoding_ = c.sel_registerName("maximumLengthOfBytesUsingEncoding:").?;
    sel_mutableBytes = c.sel_registerName("mutableBytes").?;
    sel_name = c.sel_registerName("name").?;
    sel_new = c.sel_registerName("new").?;
    sel_nextObject = c.sel_registerName("nextObject").?;
    sel_numberWithBool_ = c.sel_registerName("numberWithBool:").?;
    sel_numberWithChar_ = c.sel_registerName("numberWithChar:").?;
    sel_numberWithDouble_ = c.sel_registerName("numberWithDouble:").?;
    sel_numberWithFloat_ = c.sel_registerName("numberWithFloat:").?;
    sel_numberWithInt_ = c.sel_registerName("numberWithInt:").?;
    sel_numberWithInteger_ = c.sel_registerName("numberWithInteger:").?;
    sel_numberWithLong_ = c.sel_registerName("numberWithLong:").?;
    sel_numberWithLongLong_ = c.sel_registerName("numberWithLongLong:").?;
    sel_numberWithShort_ = c.sel_registerName("numberWithShort:").?;
    sel_numberWithUnsignedChar_ = c.sel_registerName("numberWithUnsignedChar:").?;
    sel_numberWithUnsignedInt_ = c.sel_registerName("numberWithUnsignedInt:").?;
    sel_numberWithUnsignedInteger_ = c.sel_registerName("numberWithUnsignedInteger:").?;
    sel_numberWithUnsignedLong_ = c.sel_registerName("numberWithUnsignedLong:").?;
    sel_numberWithUnsignedLongLong_ = c.sel_registerName("numberWithUnsignedLongLong:").?;
    sel_numberWithUnsignedShort_ = c.sel_registerName("numberWithUnsignedShort:").?;
    sel_objCType = c.sel_registerName("objCType").?;
    sel_object = c.sel_registerName("object").?;
    sel_objectAtIndex_ = c.sel_registerName("objectAtIndex:").?;
    sel_objectForInfoDictionaryKey_ = c.sel_registerName("objectForInfoDictionaryKey:").?;
    sel_objectForKey_ = c.sel_registerName("objectForKey:").?;
    sel_operatingSystem = c.sel_registerName("operatingSystem").?;
    sel_operatingSystemVersion = c.sel_registerName("operatingSystemVersion").?;
    sel_operatingSystemVersionString = c.sel_registerName("operatingSystemVersionString").?;
    sel_pathForAuxiliaryExecutable_ = c.sel_registerName("pathForAuxiliaryExecutable:").?;
    sel_performActivityWithOptions_reason_usingBlock_ = c.sel_registerName("performActivityWithOptions:reason:usingBlock:").?;
    sel_performExpiringActivityWithReason_usingBlock_ = c.sel_registerName("performExpiringActivityWithReason:usingBlock:").?;
    sel_physicalMemory = c.sel_registerName("physicalMemory").?;
    sel_pointerValue = c.sel_registerName("pointerValue").?;
    sel_preflightAndReturnError_ = c.sel_registerName("preflightAndReturnError:").?;
    sel_privateFrameworksPath = c.sel_registerName("privateFrameworksPath").?;
    sel_privateFrameworksURL = c.sel_registerName("privateFrameworksURL").?;
    sel_processIdentifier = c.sel_registerName("processIdentifier").?;
    sel_processInfo = c.sel_registerName("processInfo").?;
    sel_processName = c.sel_registerName("processName").?;
    sel_processorCount = c.sel_registerName("processorCount").?;
    sel_rangeOfString_options_ = c.sel_registerName("rangeOfString:options:").?;
    sel_release = c.sel_registerName("release").?;
    sel_resourcePath = c.sel_registerName("resourcePath").?;
    sel_resourceURL = c.sel_registerName("resourceURL").?;
    sel_retain = c.sel_registerName("retain").?;
    sel_retainCount = c.sel_registerName("retainCount").?;
    sel_setAutomaticTerminationSupportEnabled_ = c.sel_registerName("setAutomaticTerminationSupportEnabled:").?;
    sel_setProcessName_ = c.sel_registerName("setProcessName:").?;
    sel_sharedFrameworksPath = c.sel_registerName("sharedFrameworksPath").?;
    sel_sharedFrameworksURL = c.sel_registerName("sharedFrameworksURL").?;
    sel_sharedSupportPath = c.sel_registerName("sharedSupportPath").?;
    sel_sharedSupportURL = c.sel_registerName("sharedSupportURL").?;
    sel_shortValue = c.sel_registerName("shortValue").?;
    sel_showPools = c.sel_registerName("showPools").?;
    sel_signal = c.sel_registerName("signal").?;
    sel_string = c.sel_registerName("string").?;
    sel_stringByAppendingString_ = c.sel_registerName("stringByAppendingString:").?;
    sel_stringValue = c.sel_registerName("stringValue").?;
    sel_stringWithCString_encoding_ = c.sel_registerName("stringWithCString:encoding:").?;
    sel_stringWithString_ = c.sel_registerName("stringWithString:").?;
    sel_stringWithUTF8String_ = c.sel_registerName("stringWithUTF8String:").?;
    sel_systemUptime = c.sel_registerName("systemUptime").?;
    sel_thermalState = c.sel_registerName("thermalState").?;
    sel_unload = c.sel_registerName("unload").?;
    sel_unlock = c.sel_registerName("unlock").?;
    sel_unsignedCharValue = c.sel_registerName("unsignedCharValue").?;
    sel_unsignedIntegerValue = c.sel_registerName("unsignedIntegerValue").?;
    sel_unsignedIntValue = c.sel_registerName("unsignedIntValue").?;
    sel_unsignedLongLongValue = c.sel_registerName("unsignedLongLongValue").?;
    sel_unsignedLongValue = c.sel_registerName("unsignedLongValue").?;
    sel_unsignedShortValue = c.sel_registerName("unsignedShortValue").?;
    sel_URLForAuxiliaryExecutable_ = c.sel_registerName("URLForAuxiliaryExecutable:").?;
    sel_userInfo = c.sel_registerName("userInfo").?;
    sel_userName = c.sel_registerName("userName").?;
    sel_UTF8String = c.sel_registerName("UTF8String").?;
    sel_valueWithBytes_objCType_ = c.sel_registerName("valueWithBytes:objCType:").?;
    sel_valueWithPointer_ = c.sel_registerName("valueWithPointer:").?;
    sel_wait = c.sel_registerName("wait").?;
    sel_waitUntilDate_ = c.sel_registerName("waitUntilDate:").?;
}
