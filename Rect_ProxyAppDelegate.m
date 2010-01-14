//
//  Rect_ProxyAppDelegate.m
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "Rect_ProxyAppDelegate.h"
#import "SSGeometry.h"

@implementation Rect_ProxyAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window mutableRectValueForKey:@"frame"].x = 20.0;
}

@end
