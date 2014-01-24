//
//  MCTabBar.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-24.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

//#define Mct_currentScreenWidth  [[UIScreen mainScreen] bounds].size.width

#define Mct_currentScreenWidth 320

#define Mct_currentTabbarHeight 49


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kButtonNormalTitleColor  [UIColor  blackColor]

#define kButtonDisableTitleColor UIColorFromRGB(0xcacaca)//按钮不可用时title色

#define KButtonTag               10001000
@class MCTabBar;


@protocol MCTabBarDelegate <NSObject>

@required

- (void)tabBar:(MCTabBar*)tabBar didSelectItemAtIndex:(NSInteger)index;

@end


#import <UIKit/UIKit.h>

@interface MCTabBar : UIView



@property (nonatomic, weak) id<MCTabBarDelegate> delegate;


@property (nonatomic) NSUInteger selectedIndex;

+ (instancetype)tabBar;

- (void)badgeView:(BOOL)showOrHide atItemIndex:(NSUInteger)index;

@end
