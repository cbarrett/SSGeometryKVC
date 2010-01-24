//
//  SSGeometryCompatibility.m
//  SSGeometryKVC iPhone
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SSGeometryCompatibility.h"

@implementation NSValue (SSGeometryCompatibility)

+ (id)valueWithNSCGRect:(NSCGRect)inRect
{
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    return [self valueWithCGRect:inRect];
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
    return [self valueWithRect:inRect];
#endif
}

+ (id)valueWithNSCGSize:(NSCGSize)inSize
{
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    return [self valueWithCGSize:inSize];
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
    return [self valueWithSize:inSize];
#endif    
}

+ (id)valueWithNSCGPoint:(NSCGPoint)inPoint;
{
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    return [self valueWithCGPoint:inPoint];
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
    return [self valueWithPoint:inPoint];
#endif    
}

@end
