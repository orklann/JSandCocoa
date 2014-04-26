//
//  JSURL.m
//  JSandNSTextView
//
//  Created by aaron on 4/26/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import "JSURL.h"

@implementation JSURL

- (NSString *)get:(NSString *)url{
    NSURL *URL = [NSURL URLWithString:url];
    NSString *content = [NSString stringWithContentsOfURL:URL encoding:NSASCIIStringEncoding error:NULL];
    return content;
}

@end
