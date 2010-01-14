//
//  SSSize.m
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "SSSize.h"
#import "SSRect.h"

@implementation SSSize

- (id)initWithReceiever:(id)inReceiever key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiever = [inReceiever retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiever valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSSize)) == 0) {
                objCType = @encode(NSSize);
                NSSize buffer;
                [value getValue:&buffer];
                width = buffer.width;
                height = buffer.height;
            }
        }
    }
    
    return self;
}

- (id)initWithRect:(SSRect *)inRect
{
    if ((self == [super init])) {
        rect = inRect;
        width = rect.width;
        height = rect.height;
    }
    
    return self;
}

- (void)notifyReceiever    
{
    if (!grouping) {
        if (rect) {
            [rect beginGroup];
            rect.width = width;
            rect.height = height;
            [rect commitGroup];
        } else if (strcmp(objCType, @encode(NSSize)) == 0) {
            NSValue *value = [NSValue valueWithSize:NSMakeSize(width, height)];
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

- (CGFloat)width { return width; }
- (void)setWidth:(CGFloat)inWidth { width = inWidth; [self notifyReceiever]; }

- (CGFloat)height { return height; }
- (void)setHeight:(CGFloat)inHeight { height = inHeight; [self notifyReceiever]; }

@end

@implementation NSObject (SSSize)

- (SSSize *)mutableSizeValueForKey:(NSString *)key
{
    return [[[SSSize alloc] initWithReceiever:self key:key] autorelease];
}

@end
