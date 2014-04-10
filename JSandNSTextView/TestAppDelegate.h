//
//  TestAppDelegate.h
//  JSandNSTextView
//
//  Created by aaron on 4/8/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "TestTextView.h"


@interface TestAppDelegate : NSObject <NSApplicationDelegate>{
    IBOutlet id scriptTextView;
    IBOutlet TestTextView *textView;
	
	WebView *webView;
	WebScriptObject *scriptObject;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)run:(id)sender;
@end
