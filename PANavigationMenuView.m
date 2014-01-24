//
//  PANavigationMenuView.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-22.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "PANavigationMenuView.h"
#import "PANavigationMenuConfig.h"

#import "PANavigationMenuButton.h"


/*
 btn
 tableview
 config
 */

@interface PANavigationMenuView()

@property (nonatomic, strong) PANavigationMenuButton *menuButton;


- (void)handleTap;

@end

@implementation PANavigationMenuView

- (id)initWithFrame:(CGRect)frame title:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.menuButton = [[PANavigationMenuButton alloc]initWithFrame:frame];
        self.menuButton.title.text =title;
        
//        [self.menuButton whenTapped:^{
//            [self handleTap];
//        }];
        [self addSubview:self.menuButton];
    }
    return self;
}

- (void)handleTap
{
    if (self.menuButton.isActive) {
        [self showMenu];
    }
}

- (void)showMenu
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
