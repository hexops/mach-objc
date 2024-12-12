#import <Foundation/Foundation.h>

#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

@interface MACHAppDelegate : NSObject
@end

#if TARGET_OS_OSX
@interface MACHAppDelegate () <NSApplicationDelegate>
#else
@interface MACHAppDelegate () <UIApplicationDelegate>
#endif
@end

@implementation MACHAppDelegate {
    dispatch_block_t _runBlock;
}

- (void)setRunBlock:(dispatch_block_t)runBlock __attribute__((objc_direct)) {
    _runBlock = runBlock;
}

#if TARGET_OS_OSX
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    if (self->_runBlock) self->_runBlock();
}
#else
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    if (self->_runBlock) self->_runBlock();
    return YES;
}
#endif

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    return NSTerminateCancel;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
