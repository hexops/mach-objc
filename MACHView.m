#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MACHView : NSView
@end

@implementation MACHView {
    void (^_keyDown_block)(NSEvent *);
    void (^_keyUp_block)(NSEvent *);
}

- (BOOL)canBecomeKeyView {
    return YES;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)setBlock_keyDown:(void (^)(NSEvent *))keyDown_block __attribute__((objc_direct)) {
    _keyDown_block = keyDown_block;
}

- (void)setBlock_keyUp:(void (^)(NSEvent *))keyUp_block __attribute__((objc_direct)) {
    _keyUp_block = keyUp_block;
}

- (void)keyDown:(NSEvent *)event {
    if (_keyDown_block) _keyDown_block(event);
}

- (void)keyUp:(NSEvent *)event {
    if (_keyUp_block) _keyUp_block(event);
}



@end