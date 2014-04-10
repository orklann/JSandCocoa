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

/* 
 * Selector with a string parameters will not be called,
 * coz NSTextView will not keep all codes ascii, so used NSTextField instead,
 * and it works well.
 */

- (void)insertText:(NSString*)insertString{
    NSLog(@"%@", insertString);
    [super insertText:insertString];
}

+ (NSString *)webScriptNameForSelector:(SEL)sel
{
    // change the javascript name from 'forward_' to 'forward' ...
	if(sel == @selector(insertText:))
        return @"insertText";
 
	return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector {
    if (aSelector == nil) {
        NSLog(@"Nil selector");
    }
    NSLog(@"hi there...");
    return NO;
}
+ (BOOL)isKeyExcludedFromWebScript:(const char *)name { return NO; }

@end
