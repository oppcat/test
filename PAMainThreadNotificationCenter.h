//
//  PAMainThreadNotificationCenter.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-23.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAMainThreadNotificationCenter : NSObject

+ (instancetype) shared;

/*
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(id)anObject;
- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
*/


//postNotification in Main thread!
- (void)postNotificationAsync:(NSNotification *)notification;
- (void)postNotificationNameAsync:(NSString *)aName object:(id)anObject;
- (void)postNotificationNameAsync:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

@end
