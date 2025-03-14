#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import <CoreVideo/CVDisplayLink.h>

@interface MACHView : NSView
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
  dispatch_source_t m_displaySource;
  CVDisplayLinkRef m_displayLink;
  BOOL _hasRenderLoop;
}

- (BOOL)canBecomeKeyView {
  return YES;
}

- (BOOL)acceptsFirstResponder {
  return YES;
}

- (void)dealloc
{   
  if (self->_hasRenderLoop) {
    [self stopRenderLoop];
  }
}

- (void)viewDidMoveToWindow
{
    [super viewDidMoveToWindow];

    if (self->_hasRenderLoop) {

      [self stopRenderLoop];

      if (self.window)
      {
          m_displaySource = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0,
              0, dispatch_get_main_queue());
          dispatch_source_set_event_handler(m_displaySource, ^() { [self render]; });
          dispatch_resume(m_displaySource);

          CVDisplayLinkCreateWithActiveCGDisplays(&m_displayLink);
          CVDisplayLinkSetOutputCallback(m_displayLink, &displayLinkCallback, (__bridge void*)m_displaySource);
          CVDisplayLinkStart(m_displayLink);
      }
    }
}

static CVReturn displayLinkCallback(
    CVDisplayLinkRef displayLink,
    const CVTimeStamp* now,
    const CVTimeStamp* outputTime,
    CVOptionFlags flagsIn,
    CVOptionFlags* flagsOut,
    void* displayLinkContext)
{
    @autoreleasepool
    {
        dispatch_source_t source = (__bridge dispatch_source_t)displayLinkContext;
        dispatch_source_merge_data(source, 1);
        return kCVReturnSuccess;
    }
}

- (void)render
{
  if (_render_block)
    _render_block();
}

- (void)stopRenderLoop
{
    if (m_displaySource)
    {
        dispatch_source_cancel(m_displaySource);
        m_displaySource = nil;
    }

    if (m_displayLink)
    {
        CVDisplayLinkStop(m_displayLink);
        CVDisplayLinkRelease(m_displayLink);
        m_displayLink = nil;
    }
}

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


-(id)initWithFrame:(NSRect)frame withRenderLoop:(BOOL)loop {
  self = [self initWithFrame:frame];
  self->_hasRenderLoop = loop;
  return self;
}

// This overrides the default initializer and creates a tracking area over the
// views visible rect
- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
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






@end