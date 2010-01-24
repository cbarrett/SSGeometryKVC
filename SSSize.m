//
//  SSSize.m
//  SSGeometryKVC
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import "SSSize.h"
#import "SSRect.h"

@implementation SSSize

- (id)initWithReceiver:(id)inReceiver key:(NSString *)inKey
{
    if ((self = [super init])) {
        receiver = [inReceiver retain];
        key = [inKey copy];
        
        NSValue *value = [inReceiver valueForKey:inKey];
        if ([value isKindOfClass:[NSValue class]]) {
            if (strcmp([value objCType], @encode(NSCGSize)) == 0) {
                objCType = @encode(NSCGSize);
                NSCGSize buffer;
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

- (void)notifyReceiver    
{
    if (!grouping) {
        if (rect) {
            [rect beginGroup];
            rect.width = width;
            rect.height = height;
            [rect commitGroup];
        } else if (objCType && strcmp(objCType, @encode(NSCGSize)) == 0) {
            NSValue *value = [NSValue valueWithNSCGSize:NSCGSizeMake(width, height)];
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

- (CGFloat)width { return width; }
- (void)setWidth:(CGFloat)inWidth { width = inWidth; [self notifyReceiver]; }

- (CGFloat)height { return height; }
- (void)setHeight:(CGFloat)inHeight { height = inHeight; [self notifyReceiver]; }

@end

@implementation NSObject (SSSize)

- (SSSize *)mutableSizeValueForKey:(NSString *)key
{
    return [[[SSSize alloc] initWithReceiver:self key:key] autorelease];
}

@end
