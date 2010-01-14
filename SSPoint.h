//
//  SSPoint.h
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import <Cocoa/Cocoa.h>

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
