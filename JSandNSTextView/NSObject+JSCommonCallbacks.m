//
//  NSObject+JSCommonHelper.m
//  JSandNSTextView
//
//  Created by aaron on 4/26/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import "NSObject+JSCommonCallbacks.h"

@implementation NSObject (JSCommonHelpers)

/* ===== Common methods ==== */
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
