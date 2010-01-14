//
//  SSRectProxy.h
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SSPoint;
@class SSSize;

@interface SSRect : NSObject {
@private
    id receiever;
    NSString *key;
    const char *objCType;
    BOOL grouping;
    
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
}

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) NSPoint origin;
@property (nonatomic, assign) NSSize size;

@property (nonatomic, assign) CGPoint originAsCGPoint;
@property (nonatomic, assign) CGSize sizeAsCGSize;

@property (nonatomic, assign, readonly) SSPoint *mutableOrigin;
@property (nonatomic, assign, readonly) SSSize *mutableSize;

- (void)beginGroup; // nesting groups has no effect
- (void)commitGroup;

@end

@interface NSObject (SSRect)
- (SSRect *)mutableRectValueForKey:(NSString *)key;
@end
