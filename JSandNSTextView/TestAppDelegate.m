//
//  TestAppDelegate.m
//  JSandNSTextView
//
//  Created by aaron on 4/8/14.
//  Copyright (c) 2014 PixelEgg. All rights reserved.
//

#import "TestAppDelegate.h"
#import "JSURL.h"

@implementation TestAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    webView = [[WebView alloc] init];
    // load a blank page
 	[[webView mainFrame] loadHTMLString:@"" baseURL:NULL];
    
	// grab the script object
	scriptObject = [webView windowScriptObject];
    
    // add the turtleView as an object in javascript
    /*
     * We can then access turtleView in Javascript as turtle.
     * Ex: turtle.reset(); => [turtleView reset];
     */
	[scriptObject setValue:textView forKey:@"$"];
    JSURL *url = [[JSURL alloc] init];
    [scriptObject setValue:url forKey:@"URL"];
}

- (IBAction)run:(id)sender
{
    // wrap it in a try-catch block so that we can access errors
    NSString *code = [scriptTextView stringValue];
	NSString* script = [NSString stringWithFormat:@"try { %@ } catch (e) { e.toString() }", code];
    
    Class windowClass = NSClassFromString(@"NSWindow");
    
    [scriptObject setValue:windowClass forKey:@"NSWindow"];
    
    // run it
	id data = [scriptObject evaluateWebScript:script];
	if(![data isMemberOfClass:[WebUndefined class]]) {
		NSLog(@"%@", data);
    }
}
@end
