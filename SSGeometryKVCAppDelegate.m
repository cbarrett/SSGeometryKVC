//
//  SSGeometryKVCAppDelegate.m
//  SSGeometryKVC
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "SSGeometryKVCAppDelegate.h"
#import "SSGeometry.h"

@implementation SSGeometryKVCAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [window mutableRectValueForKey:@"frame"].x = 20.0;
}

@end
