//
//  PANavigationMenuButton.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-22.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PANavigationMenuButton : UIControl



@property (nonatomic, unsafe_unretained) BOOL isActive;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIImageView *arrow;

@end
