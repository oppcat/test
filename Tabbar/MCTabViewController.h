//
//  MCTabViewController.h
//  MenueModel
//
//  Created by yinjiwang on 14-1-24.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

/*
 window.rootviewcontroller->MCTabbarController
 
 MCTabbarController->viewcontrollers->UINavigationController
 
 self View change
 
 tabDelegate
 

 */
#import <UIKit/UIKit.h>

#import "MCTabBar.h"

@interface MCTabViewController : UITabBarController<MCTabBarDelegate>


@property (nonatomic,weak) MCTabBar *mctTabBar;
@end
