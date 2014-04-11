//
//  TestTextView.h
//  JSandNSTextView
//
//  Created by aaron on 4/8/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TestTextView : NSTextView
{

}

- (void)insertText:(NSString *)insertString;
- (void)log:(NSString *)message;
@end
