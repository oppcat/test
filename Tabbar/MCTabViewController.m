//
//  MCTabViewController.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-24.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "MCTabViewController.h"

@interface MCTabViewController ()

- (void)makeselfSet;

@end

@implementation MCTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self  makeselfSet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --

- (void)makeselfSet
{
    if (nil == _mctTabBar) {
        
        MCTabBar *tabBar = [MCTabBar tabBar];
        tabBar.frame=CGRectMake(0, kScreenHeight-49, 320, 49);
        tabBar.delegate = self;
        self.mctTabBar = tabBar;
        [self.view addSubview:self.mctTabBar];
    }
}

#pragma mark --Tabbar Delegate
- (void)tabBar:(MCTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{
    
    UIViewController *selectedViewController = [self.viewControllers objectAtIndex:index];
    
    [self setSelectedViewController:selectedViewController];
}
@end
