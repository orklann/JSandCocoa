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


- (void)log:(NSString *)message{
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

+ (NSString *)webScriptNameForSelector:(SEL)sel
{
    NSString *selString = NSStringFromSelector(sel);
    NSArray *comps = [selString componentsSeparatedByString:@":"];

    NSString *retSelString = @"";
    int index = 0;
    for (index = 0; index < [comps count]; index++) {
        NSString *comp = [comps objectAtIndex:index];
        if ([comp length] <= 0) continue;
        if (index == 0) { /* skip first components, this is for cammel case */
            
        }else{
            comp = [NSString stringWithFormat:@"%@%@",[[comp substringToIndex:1] uppercaseString],[comp substringFromIndex:1]];
        }

        retSelString = [retSelString stringByAppendingString:comp];
    }
    return retSelString;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector {
    if (aSelector == nil) {
        NSLog(@"Nil selector");
    }
    return NO;
}
+ (BOOL)isKeyExcludedFromWebScript:(const char *)name { return NO; }

@end
