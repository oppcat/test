//
//  PANavigationMenuConfig.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-22.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "PANavigationMenuConfig.h"

@implementation PANavigationMenuConfig


+ (float)itemCellHeight
{
    return 41.0;
}

+ (float)menuWidth
{
    UIWindow *keyWindow=[[UIApplication sharedApplication]keyWindow];
    return CGRectGetWidth(keyWindow.frame);
}

+ (float)animationDuration
{
    return 0.3;
}


+ (float)arrowPadding
{
    return 13.0;
}
@end
