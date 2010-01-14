//
//  SSRectProxy.h
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
#   import <UIKit/UIKit.h>
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
#   import <Cocoa/Cocoa.h>
#endif

#import "SSGeometryCompatibility.h"

@class SSPoint;
@class SSSize;

@interface SSRect : NSObject {
@private
    id receiver;
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

@property (nonatomic, assign) NSCGPoint origin;
@property (nonatomic, assign) NSCGSize size;

@property (nonatomic, assign, readonly) SSPoint *mutableOrigin;
@property (nonatomic, assign, readonly) SSSize *mutableSize;

- (void)beginGroup; // nesting groups has no effect
- (void)commitGroup;

@end

@interface NSObject (SSRect)
- (SSRect *)mutableRectValueForKey:(NSString *)key;
@end
