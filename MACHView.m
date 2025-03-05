#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import <CoreVideo/CVDisplayLink.h>

#import <QuartzCore/CAMetalLayer.h>
#import <QuartzCore/CAMetalDisplayLink.h>
#import <Metal/Metal.h>

// The protocol to provide resize and redraw callbacks to a delegate.
@protocol GameViewDelegate <NSObject>

- (void)drawableResize:(CGSize)size;

- (void)renderTo:(nonnull CAMetalLayer *)metalLayer
            with:(CAMetalDisplayLinkUpdate *_Nonnull)update
              at:(CFTimeInterval)deltaTime;

@end

@interface MACHView : NSView <CALayerDelegate, CAMetalDisplayLinkDelegate>
@property(nonatomic, nonnull, readonly) CAMetalLayer *metalLayer;
@property(nonatomic, getter=isPaused) BOOL paused;
@property(nonatomic, nullable) id<GameViewDelegate> delegate;

- (void)initCommon;

- (void)resizeDrawable:(CGFloat)scaleFactor;

- (void)stopRenderLoop;

- (void)renderUpdate:(CAMetalDisplayLinkUpdate *_Nonnull)update
                with:(CFTimeInterval)deltaTime;
@end

@implementation MACHView {
  void (^_keyDown_block)(NSEvent *);
  void (^_keyUp_block)(NSEvent *);
  void (^_flagsChanged_block)(NSEvent *);
  void (^_mouseMoved_block)(NSEvent *);
  void (^_mouseDown_block)(NSEvent *);
  void (^_mouseUp_block)(NSEvent *);
  void (^_scrollWheel_block)(NSEvent *);
  void (^_magnify_block)(NSEvent *);
  void (^_insertText_block)(NSEvent *, uint32_t);
  void (^_render_block)(void);
  NSTrackingArea *trackingArea;
  CFTimeInterval _previousTargetPresentationTimestamp;
  //dispatch_source_t _displaySource;
  CAMetalDisplayLink *_displayLink;

  // The secondary thread containing the render loop.
  NSThread *_renderThread;
    
  // The flag to indicate that rendering needs to cease on the main thread.
  BOOL _continueRunLoop;
}

- (BOOL)canBecomeKeyView {
  return YES;
}

- (BOOL)acceptsFirstResponder {
  return YES;
}

+ (Class)layerClass
{
    return [CAMetalLayer class];
}

- (CALayer *)makeBackingLayer
{
    return [CAMetalLayer layer];
}

- (void)initCommon
{
    self.wantsLayer = YES;
    
    self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawDuringViewResize;
    
    _metalLayer = (CAMetalLayer*)self.layer;
    
    self.layer.delegate = self;
}

// This overrides the default initializer and creates a tracking area over the
// views visible rect
- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self initCommon];

    // Create a new tracking area to monitor mouse movement
    NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited |
                                    NSTrackingMouseMoved |
                                    NSTrackingActiveInActiveApp;
    NSRect rect = self.visibleRect;
    trackingArea = [[NSTrackingArea alloc] initWithRect:rect
                                                options:options
                                                  owner:self
                                               userInfo:nil];
    [self addTrackingArea:trackingArea];
    
  }
  return self;
}

- (void)didMoveToWindow
{
    if (self.window == nil)
    {
        // If moving off of a window, destroy the display link.
        [_displayLink invalidate];
        _displayLink = nil;
        return;
    }
    
    [self movedToWindow];
}

- (void)viewDidMoveToWindow
{
    [self movedToWindow];
}

- (void)movedToWindow
{
    [self setupCAMetalLink];

    @synchronized(self)
    {
        // Stop the animation loop, allowing it to complete if it's in progress.
        _continueRunLoop = NO;
    }
    
    // Create and start a secondary NSThread that has another run runloop. The NSThread
    // class calls the 'runThread' method at the start of the secondary thread's execution.
    _renderThread =  [[NSThread alloc] initWithTarget:self
                      selector:@selector(runThread)
                      object:nil];
    _continueRunLoop = YES;
    [_renderThread start];

    
    // Perform any actions that need to know the size and scale of the drawable. When UIKit calls
    // didMoveToWindow after the view initialization, this is the first opportunity to notify
    // components of the drawable's size.

    [self resizeDrawable:self.window.screen.backingScaleFactor];

    // Notify the delegate of the default drawable size when the system can calculate it.
    CGSize defaultDrawableSize = self.bounds.size;
    defaultDrawableSize.width *= self.layer.contentsScale;
    defaultDrawableSize.height *= self.layer.contentsScale;
    [self.delegate drawableResize:defaultDrawableSize];
}

- (void)setupCAMetalLink
{
    [self stopRenderLoop];
    [self makeMetalLink:self.metalLayer];

    // Register to receive a notification when the window closes so that you
    // can stop the display link.
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(windowWillClose:)
                               name:NSWindowWillCloseNotification
                             object:self.window];

}


- (void)windowWillClose:(NSNotification*)notification
{
    // Stop the display link when the window is closing because there's
    // no point in drawing something that you can't display.
    if (notification.object == self.window)
    {
        [self stopMetalLink];
    }
}


- (void)makeMetalLink:(nonnull CAMetalLayer *)metalLayer;
{
    // Create and configure the Metal display link.
    _displayLink = [[CAMetalDisplayLink alloc] initWithMetalLayer:metalLayer];
    _displayLink.preferredFrameRateRange = CAFrameRateRangeMake(120.0, 120.0, 120.0);
    _displayLink.preferredFrameLatency = 2;
    _displayLink.paused = NO;
    // Assign the delegate to receive the display update callback.
    _displayLink.delegate = self;
}

// This is automatically called each time the view size changes
- (void)updateTrackingAreas {
  // Remove any existing tracking area
  [self removeTrackingArea:trackingArea];
  // Create a new tracking area to monitor mouse movement
  NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited |
                                  NSTrackingMouseMoved |
                                  NSTrackingActiveInActiveApp;
  NSRect rect = self.visibleRect;
  trackingArea = [[NSTrackingArea alloc] initWithRect:rect
                                              options:options
                                                owner:self
                                             userInfo:nil];
  [self addTrackingArea:trackingArea];
}

- (void)metalDisplayLink:(CAMetalDisplayLink *)link
             needsUpdate:(CAMetalDisplayLinkUpdate *_Nonnull)update
{
    CFTimeInterval deltaTime = _previousTargetPresentationTimestamp - update.targetPresentationTimestamp;
    _previousTargetPresentationTimestamp = update.targetPresentationTimestamp;
    
    [self renderUpdate:update with:deltaTime];
}

- (void)startMetalLink
{
    _previousTargetPresentationTimestamp = CACurrentMediaTime();
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                       forMode:NSRunLoopCommonModes];
}

- (void)stopMetalLink
{
    [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop]
                            forMode:NSRunLoopCommonModes];
    [_displayLink invalidate];
}

- (void)stopRenderLoop
{
    [_displayLink invalidate];
}

- (void)dealloc
{
    [self stopRenderLoop];
}

- (void)runThread
{
    // Set the display link to the run loop of this thread so its callback occurs on this thread.
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [self startMetalLink];
    
    // The system sets the '_continueRunLoop' ivar outside this thread, so it needs to synchronize. Create a
    // 'continueRunLoop' local var that the system can set from the _continueRunLoop ivar in a @synchronized block.
    BOOL continueRunLoop = YES;
    
    // Begin the run loop.
    while (continueRunLoop)
    {
        // Create the autorelease pool for the current iteration of the loop.
        @autoreleasepool
        {
            // Run the loop once accepting input only from the display link.
            [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        // Synchronize this with the _continueRunLoop ivar, which is set on another thread.
        @synchronized(self)
        {
            [self render];
            // When accessing anything outside the thread, such as the '_continueRunLoop' ivar,
            // the system reads it inside the synchronized block to ensure it writes fully/atomically.
            continueRunLoop = _continueRunLoop;
        }
    }
}

- (void)resizeDrawable:(CGFloat)scaleFactor
{
    CGSize newSize = self.bounds.size;
    newSize.width *= scaleFactor;
    newSize.height *= scaleFactor;
    
    if(newSize.width <= 0 || newSize.width <= 0)
    {
        return;
    }
  
    // The system calls all AppKit and UIKit calls that notify of a resize on the main thread. Use
    // a synchronized block to ensure that resize notifications on the delegate are atomic.
    @synchronized(_metalLayer)
    {
        if(newSize.width == _metalLayer.drawableSize.width &&
           newSize.height == _metalLayer.drawableSize.height)
        {
            return;
        }
        
        _metalLayer.drawableSize = newSize;
        
        [_delegate drawableResize:newSize];
    }
}

- (void)renderUpdate:(CAMetalDisplayLinkUpdate *_Nonnull)update
                with:(CFTimeInterval)deltaTime
{
    // You need to synchronize if rendering on the background thread to ensure resize operations from the
    // main thread are complete before any rendering that depends on the size occurs.
    @synchronized(_metalLayer)
    {
        [_delegate renderTo:_metalLayer
                       with:update
                         at:deltaTime];
    }
}

// - (void)dealloc
// {
//     [self stopRenderLoop];
// }

// - (void)viewDidMoveToWindow
// {
//     [super viewDidMoveToWindow];
//     [self stopRenderLoop];

//     if (self.window)
//     {
//         _displaySource = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0,
//             0, dispatch_get_main_queue());
//         dispatch_source_set_event_handler(_displaySource, ^() { [self render]; });
//         dispatch_resume(_displaySource);

//         CVDisplayLinkCreateWithActiveCGDisplays(&_displayLink);
//         CVDisplayLinkSetOutputCallback(_displayLink, &displayLinkCallback, (__bridge void*)_displaySource);
//         CVDisplayLinkStart(_displayLink);
//     }
// }

// static CVReturn displayLinkCallback(
//     CVDisplayLinkRef displayLink,
//     const CVTimeStamp* now,
//     const CVTimeStamp* outputTime,
//     CVOptionFlags flagsIn,
//     CVOptionFlags* flagsOut,
//     void* displayLinkContext)
// {
//     @autoreleasepool
//     {

     
//         dispatch_source_t source = (__bridge dispatch_source_t)displayLinkContext;
//         dispatch_source_merge_data(source, 1);
//         return kCVReturnSuccess;
//     }
// }

- (void)render
{
  if (_render_block)
    _render_block();
}

// - (void)stopRenderLoop
// {
//     if (_displaySource)
//     {
//         dispatch_source_cancel(_displaySource);
//         _displaySource = nil;
//     }

//     if (_displayLink)
//     {
//         CVDisplayLinkStop(_displayLink);
//         CVDisplayLinkRelease(_displayLink);
//         _displayLink = nil;
//     }
// }

- (void)setBlock_render:(void (^)(void))render_block
    __attribute__((objc_direct)) {
  _render_block = render_block;
}

- (void)setBlock_keyDown:(void (^)(NSEvent *))keyDown_block
    __attribute__((objc_direct)) {
  _keyDown_block = keyDown_block;
}

- (void)setBlock_keyUp:(void (^)(NSEvent *))keyUp_block
    __attribute__((objc_direct)) {
  _keyUp_block = keyUp_block;
}

- (void)setBlock_mouseMoved:(void (^)(NSEvent *))mouseMoved_block
    __attribute__((objc_direct)) {
  _mouseMoved_block = mouseMoved_block;
}

- (void)setBlock_mouseDown:(void (^)(NSEvent *))mouseDown_block
    __attribute__((objc_direct)) {
  _mouseDown_block = mouseDown_block;
}

- (void)setBlock_mouseUp:(void (^)(NSEvent *))mouseUp_block
    __attribute__((objc_direct)) {
  _mouseUp_block = mouseUp_block;
}

- (void)setBlock_scrollWheel:(void (^)(NSEvent *))scrollWheel_block
    __attribute__((objc_direct)) {
  _scrollWheel_block = scrollWheel_block;
}

- (void)setBlock_flagsChanged:(void (^)(NSEvent *))flagsChanged_block
    __attribute__((objc_direct)) {
  _flagsChanged_block = flagsChanged_block;
}

- (void)setBlock_insertText:(void (^)(NSEvent *, uint32_t))insertText_block
    __attribute__((objc_direct)) {
  _insertText_block = insertText_block;
}

- (void)setBlock_magnify:(void (^)(NSEvent *))magnify_block
    __attribute__((objc_direct)) {
  _magnify_block = magnify_block;
}

- (void)keyDown:(NSEvent *)event {
  if (_keyDown_block)
    _keyDown_block(event);

  [self interpretKeyEvents:@[ event ]];
}

- (void)insertText:(id)string {
  NSString *characters;
  NSEvent *event = [NSApp currentEvent];

  if ([string isKindOfClass:[NSAttributedString class]])
    characters = [string string];
  else
    characters = (NSString *)string;

  NSRange range = NSMakeRange(0, [characters length]);
  while (range.length) {
    uint32_t codepoint = 0;

    if ([characters getBytes:&codepoint
                   maxLength:sizeof(codepoint)
                  usedLength:NULL
                    encoding:NSUTF32StringEncoding
                     options:0
                       range:range
              remainingRange:&range]) {
      if (codepoint >= 0xf700 && codepoint <= 0xf7ff) {
        continue;
      }
      if (_insertText_block)
        _insertText_block(event, codepoint);
    }
  }
}

- (void)keyUp:(NSEvent *)event {
  if (_keyUp_block)
    _keyUp_block(event);
}

- (void)flagsChanged:(NSEvent *)event {
  if (_flagsChanged_block)
    _flagsChanged_block(event);
}

- (void)mouseMoved:(NSEvent *)event {
  if (_mouseMoved_block)
    _mouseMoved_block(event);
}

- (void)mouseDragged:(NSEvent *)event {
  if (_mouseMoved_block)
    _mouseMoved_block(event);
}

- (void)rightMouseDragged:(NSEvent *)event {
  if (_mouseMoved_block)
    _mouseMoved_block(event);
}

- (void)otherMouseDragged:(NSEvent *)event {
  if (_mouseMoved_block)
    _mouseMoved_block(event);
}

- (void)mouseDown:(NSEvent *)event {
  if (_mouseDown_block)
    _mouseDown_block(event);
}

- (void)rightMouseDown:(NSEvent *)event {
  if (_mouseDown_block)
    _mouseDown_block(event);
}

- (void)otherMouseDown:(NSEvent *)event {
  if (_mouseDown_block)
    _mouseDown_block(event);
}

- (void)mouseUp:(NSEvent *)event {
  if (_mouseUp_block)
    _mouseUp_block(event);
}

- (void)rightMouseUp:(NSEvent *)event {
  if (_mouseUp_block)
    _mouseUp_block(event);
}

- (void)otherMouseUp:(NSEvent *)event {
  if (_mouseUp_block)
    _mouseUp_block(event);
}

- (void)scrollWheel:(NSEvent *)event {
  if (_scrollWheel_block)
    _scrollWheel_block(event);
}

- (void)magnifyWithEvent:(NSEvent *)event {
  if (_magnify_block)
    _magnify_block(event);
}

// Add this method to prevent default macos keybind operations
// such as escape pulling the window out of fullscreen
- (void)doCommandBySelector:(SEL)selector
{
}







@end