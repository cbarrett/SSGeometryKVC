//
//  SSGeometryKVC_iPhoneAppDelegate.m
//  SSGeometryKVC iPhone
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SSGeometryKVC_iPhoneAppDelegate.h"
#import "SSGeometry.h"

@implementation SSGeometryKVC_iPhoneAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 50.0, 50.0, 50.0)];
    [view setBackgroundColor:[UIColor greenColor]];
    [window addSubview:view];
    [view release];
    
    [UIView beginAnimations:@"" context:NULL];
    [view mutableRectValueForKey:@"frame"].x = 50.0;
    [UIView commitAnimations];
    
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
