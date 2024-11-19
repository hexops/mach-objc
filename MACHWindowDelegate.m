#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MACHWindowDelegate : NSObject
@end

@implementation MACHWindowDelegate {
    void (^_windowWillResize_toSize_block)(NSSize);
    bool (^_windowShouldClose_block)(void);
}

- (void)setBlock_windowWillResize_toSize:(void (^)(NSSize))windowWillResize_toSize_block __attribute__((objc_direct)) {
    _windowWillResize_toSize_block = windowWillResize_toSize_block;
}

- (void)setBlock_windowShouldClose:(bool (^)(void))windowShouldClose_block __attribute__((objc_direct)) {
    _windowShouldClose_block = windowShouldClose_block;
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    if (self->_windowWillResize_toSize_block) self->_windowWillResize_toSize_block(frameSize);
    return frameSize;
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    if (self->_windowShouldClose_block) self->_windowShouldClose_block();
    return NO;
}
@end
