//
//  SSPoint.m
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "SSPoint.h"
#import "SSRect.h"

@implementation SSPoint

- (id)initWithReceiever:(id)inReceiever key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiever = [inReceiever retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiever valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSPoint)) == 0) {
                objCType = @encode(NSPoint);
                NSPoint buffer;
                [value getValue:&buffer];
                x = buffer.x;
                y = buffer.y;
            }
        }
    }
    
    return self;
}

- (id)initWithRect:(SSRect *)inRect
{
    if ((self == [super init])) {
        rect = inRect;
        x = rect.x;
        y = rect.y;
    }
    
    return self;
}

- (void)notifyReceiever    
{
    if (!grouping) {
        if (rect) {
            [rect beginGroup];
            rect.x = x;
            rect.y = y;
            [rect commitGroup];
        } else if (strcmp(objCType, @encode(NSPoint)) == 0) {
            NSValue *value = [NSValue valueWithPoint:NSMakePoint(x, y)];
            [receiever setValue:value forKey:key];
        }
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

@end


@implementation NSObject (SSPoint)

- (SSPoint *)mutablePointValueForKey:(NSString *)key
{
    return [[[SSPoint alloc] initWithReceiever:self key:key] autorelease];
}

@end

