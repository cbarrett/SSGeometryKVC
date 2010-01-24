//
//  SSRectProxy.m
//  SSGeometryKVC
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "SSRect.h"
#import "SSPoint.h"
#import "SSSize.h"

@interface SSPoint (Internal)
- (id)initWithRect:(SSRect *)inRect;
@end

@implementation SSRect

- (id)initWithReceiver:(id)inReceiver key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiver = [inReceiver retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiver valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSCGRect)) == 0) {
                objCType = @encode(NSCGRect);
                NSCGRect buffer;
                [value getValue:&buffer];
                x = buffer.origin.x;
                y = buffer.origin.y;
                width = buffer.size.width;
                height = buffer.size.height;
            }
        }
    }
        
    return self;
}

- (void)notifyReceiver
{
    if (!grouping && objCType && strcmp(objCType, @encode(NSCGRect)) == 0) {
        NSValue *value = [NSValue valueWithNSCGRect:NSCGRectMake(x, y, width, height)];
        [receiver setValue:value forKey:key];
    }
}

- (void)beginGroup
{
    grouping = YES;
}

- (void)commitGroup
{
    grouping = NO;
    [self notifyReceiver];
}

- (CGFloat)x { return x; }
- (void)setX:(CGFloat)inX { x = inX; [self notifyReceiver]; }

- (CGFloat)y { return y; }
- (void)setY:(CGFloat)inY { y = inY; [self notifyReceiver]; }

- (CGFloat)width { return width; }
- (void)setWidth:(CGFloat)inWidth { width = inWidth; [self notifyReceiver]; }

- (CGFloat)height { return height; }
- (void)setHeight:(CGFloat)inHeight { height = inHeight; [self notifyReceiver]; }

- (NSCGPoint)origin { return NSCGPointMake(x, y); }
- (void)setOrigin:(NSCGPoint)inOrigin { x = inOrigin.x; y = inOrigin.y; [self notifyReceiver]; }

- (NSCGSize)size { return NSCGSizeMake(width, height); }
- (void)setSize:(NSCGSize)inSize { width = inSize.width; height = inSize.height; [self notifyReceiver]; }

#pragma mark -

- (SSPoint *)mutableOrigin
{
    return [[[SSPoint alloc] initWithRect:self] autorelease];
}

- (SSSize *)mutableSize
{
    return [[[SSSize alloc] initWithRect:self] autorelease];
}

@end

@implementation NSObject (SSRect)

- (SSRect *)mutableRectValueForKey:(NSString *)key
{
    return [[[SSRect alloc] initWithReceiver:self key:key] autorelease];
}

@end
