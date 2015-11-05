


//
//  PAMainThreadNotificationCenter.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-23.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "PAMainThreadNotificationCenter.h"

static PAMainThreadNotificationCenter *_instance=nil;

@interface PAMainThreadNotificationCenter()
{
    NSNotificationCenter *_defaultCenter;
}
@end

@implementation PAMainThreadNotificationCenter

+ (instancetype) shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[[self class]alloc]init];
    });
    return _instance;
}


- (instancetype) init
{
    self = [super init];
    if (self) {
        _defaultCenter=[NSNotificationCenter defaultCenter];
    }
    return self;
}


//incase _default .. Bad_exec
//动态抉择begin
- (BOOL) respondsToSelector:(SEL)aSelector
{
    if ([_defaultCenter respondsToSelector:aSelector]) {
        return YES;
    }
    return NO;
}

- (void) forwardInvocation:(NSInvocation *)anInvocation
{
    if ([NSThread isMainThread]) {
        [anInvocation invokeWithTarget:_defaultCenter];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [anInvocation invokeWithTarget:_defaultCenter];
        });
    }
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)aSelector
{
    return [_defaultCenter methodSignatureForSelector:aSelector];
}
//动态抉择end


//Compare..
- (void)postNotificationAsync:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_defaultCenter postNotification:notification];
    });
}

-(void) postNotificationNameAsync:(NSString *)aName object:(id)anObject
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_defaultCenter postNotificationName:aName object:anObject];
    });
}

-(void) postNotificationNameAsync:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_defaultCenter postNotificationName:aName object:anObject userInfo:aUserInfo];
    });
}

@end
