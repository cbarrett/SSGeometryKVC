//
//  SSPoint.h
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

@class SSRect;

@interface SSPoint : NSObject {
@private
    id receiver;
    NSString *key;
    const char *objCType;
    BOOL grouping;
    SSRect *rect;
    
    CGFloat x;
    CGFloat y;    
}

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

- (void)beginGroup; // nesting groups has no effect
- (void)commitGroup;

@end

@interface NSObject (SSPoint)
- (SSPoint *)mutablePointValueForKey:(NSString *)key;
@end
