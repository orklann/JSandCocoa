//
//  TestTextView.m
//  JSandNSTextView
//
//  Created by aaron on 4/8/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import "TestTextView.h"

@implementation TestTextView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (NSString*)makeRectWithX:(int)x Y:(int)y Width:(int)w Height:(int)h{
    return NSStringFromRect(NSMakeRect(x, y, w, h));
}

- (void)log:(NSString*)message{
    NSLog(@"%@", message);
}

/* 
 * Selector with a string parameters will not be called,
 * coz NSTextView will not keep all codes ascii, so used NSTextField instead,
 * and it works well.
 */

- (void)insertText:(NSString*)insertString{
    NSLog(@"%@", insertString);
    [super insertText:insertString];
}
@end
