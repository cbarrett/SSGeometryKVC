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

- (id)initWithReceiver:(id)inReceiver key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiver = [inReceiver retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiver valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSCGPoint)) == 0) {
                objCType = @encode(NSCGPoint);
                NSCGPoint buffer;
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

- (void)notifyReceiver    
{
    if (!grouping) {
        if (rect) {
            [rect beginGroup];
            rect.x = x;
            rect.y = y;
            [rect commitGroup];
        } else if (objCType && strcmp(objCType, @encode(NSCGPoint)) == 0) {
            NSValue *value = [NSValue valueWithNSCGPoint:NSCGPointMake(x, y)];
            [receiver setValue:value forKey:key];
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
    [self notifyReceiver];
}

- (CGFloat)x { return x; }
- (void)setX:(CGFloat)inX { x = inX; [self notifyReceiver]; }

- (CGFloat)y { return y; }
- (void)setY:(CGFloat)inY { y = inY; [self notifyReceiver]; }

@end


@implementation NSObject (SSPoint)

- (SSPoint *)mutablePointValueForKey:(NSString *)key
{
    return [[[SSPoint alloc] initWithReceiver:self key:key] autorelease];
}

@end

