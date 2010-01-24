//
//  SSGeometryCompatibility.h
//  SSGeometryKVC iPhone
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#   import <UIKit/UIKit.h>
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
#   import <Cocoa/Cocoa.h>
#endif

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#   define NSCGRect CGRect
#   define NSCGRectMake CGRectMake
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
#   define NSCGRect NSRect
#   define NSCGRectMake NSMakeRect
#endif

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#   define NSCGSize CGSize
#   define NSCGSizeMake CGSizeMake
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
#   define NSCGSize NSSize
#   define NSCGSizeMake NSMakeSize
#endif

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#   define NSCGPoint CGPoint
#   define NSCGPointMake CGPointMake
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
#   define NSCGPoint NSPoint
#   define NSCGPointMake NSMakePoint
#endif

@interface NSValue (SSGeometryCompatibility)
+ (id)valueWithNSCGRect:(NSCGRect)inRect;
+ (id)valueWithNSCGSize:(NSCGSize)inSize;
+ (id)valueWithNSCGPoint:(NSCGPoint)inPoint;
@end
