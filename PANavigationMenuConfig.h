//
//  PANavigationMenuConfig.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-22.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//


// define marco should xx config.?
// config is much better!

#define kNavigationBarTitleFont [UIFont boldSystemFontOfSize:17] //标题字体

#define kNavigationTitleColor   [UIColor whiteColor]

#define Img(img) [UIImage imageNamed:img]

#import <Foundation/Foundation.h>

@interface PANavigationMenuConfig : NSObject


+ (float)itemCellHeight;

+ (float)menuWidth;

+ (float)animationDuration;

+ (float)arrowPadding;

@end
