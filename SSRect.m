//
//  SSRectProxy.m
//  Rect Proxy
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

- (id)initWithReceiever:(id)inReceiever key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiever = [inReceiever retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiever valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSRect)) == 0) {
                objCType = @encode(NSRect);
                NSRect buffer;
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

- (void)notifyReceiever
{
    if (!grouping && strcmp(objCType, @encode(NSRect)) == 0) {
        NSValue *value = [NSValue valueWithRect:NSMakeRect(x, y, width, height)];
        [receiever setValue:value forKey:key];
    }
}

- (void)beginGroup
{
    grouping = YES;
}

- (void)commitGroup
{
    grouping = NO;
    [self notifyReceiever];
}

- (CGFloat)x { return x; }
- (void)setX:(CGFloat)inX { x = inX; [self notifyReceiever]; }

- (CGFloat)y { return y; }
- (void)setY:(CGFloat)inY { y = inY; [self notifyReceiever]; }

- (CGFloat)width { return width; }
- (void)setWidth:(CGFloat)inWidth { width = inWidth; [self notifyReceiever]; }

- (CGFloat)height { return height; }
- (void)setHeight:(CGFloat)inHeight { height = inHeight; [self notifyReceiever]; }

- (NSPoint)origin { return NSMakePoint(x, y); }
- (void)setOrigin:(NSPoint)inOrigin { x = inOrigin.x; y = inOrigin.y; [self notifyReceiever]; }

- (NSSize)size { return NSMakeSize(width, height); }
- (void)setSize:(NSSize)inSize { width = inSize.width; height = inSize.height; [self notifyReceiever]; }

- (CGPoint)originAsCGPoint { return NSPointToCGPoint([self origin]); }
- (void)setOriginAsCGPoint:(CGPoint)inCGPoint { [self setOrigin:NSPointFromCGPoint(inCGPoint)]; }

- (CGSize)sizeAsCGSize { return NSSizeToCGSize([self size]); }
- (void)setSizeAsCGSize:(CGSize)inCGSize { [self setSize:NSSizeFromCGSize(inCGSize)]; }

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
    return [[[SSRect alloc] initWithReceiever:self key:key] autorelease];
}

@end
