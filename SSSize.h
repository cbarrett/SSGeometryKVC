//
//  SSSize.h
//  Rect Proxy
//
//  Created by Colin Barrett on 1/13/10.
//  Copyright 2010 Springs & Struts. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SSRect;

@interface SSSize : NSObject {
@private
    id receiver;
    NSString *key;
    const char *objCType;
    BOOL grouping;
    SSRect *rect;
    
    CGFloat width;
    CGFloat height;    
}

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

- (void)beginGroup; // nesting groups has no effect
- (void)commitGroup;

@end

@interface NSObject (SSSize)
- (SSSize *)mutableSizeValueForKey:(NSString *)key;
@end
