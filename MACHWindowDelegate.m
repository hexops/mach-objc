#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MACHWindowDelegate : NSObject
@end

@implementation MACHWindowDelegate {
    void (^_windowDidResize_block)(void);
    bool (^_windowShouldClose_block)(void);
}

- (void)setBlock_windowDidResize:(void (^)(void))windowDidResize_block __attribute__((objc_direct)) {
    _windowDidResize_block = windowDidResize_block;
}

- (void)setBlock_windowShouldClose:(bool (^)(void))windowShouldClose_block __attribute__((objc_direct)) {
    _windowShouldClose_block = windowShouldClose_block;
}

- (void) windowDidResize:(NSNotification *) notification {
    if (self->_windowDidResize_block) self->_windowDidResize_block();
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    if (self->_windowShouldClose_block) self->_windowShouldClose_block();
    return NO;
}

- (void)windowWillClose:(NSNotification *)notification {
    //NSLog(@"windowWillClose");
}
@end
