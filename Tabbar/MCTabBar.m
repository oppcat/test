//
//  MCTabBar.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-24.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "MCTabBar.h"


@interface MCTabBar()
{
    UIImageView *activeImageView;
}

- (void)makeSelfUi;


- (void)addOperateButton;

- (void)defaultSelect;

@end


@implementation MCTabBar

#pragma mark -- init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self makeSelfUi];
    }
    return self;
}

-(UIButton *)whichButtonwithIndex:(NSInteger) aIndex {
	__block UIButton *selectButton =nil;
    if (!selectButton)
    {
        [[self subviews]enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton *button =(UIButton*)obj;
                NSInteger index =button.tag-KButtonTag;
                if (index ==aIndex) {
                    selectButton = button;
                }
            }
        }];
    }
    return selectButton;
}

-(void)Animation
{
    [UIView animateWithDuration:.5 animations:^{
        activeImageView.frame = CGRectMake(_selectedIndex*Mct_currentScreenWidth/4, 0,Mct_currentScreenWidth/4, Mct_currentTabbarHeight);
    }];
}
- (void)buttonDisplay
{
    [[self subviews]enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button =(UIButton*)obj;
            NSInteger index =button.tag-KButtonTag;
            if (index ==_selectedIndex) {
                button.enabled=NO;
            }
            else
            {
                button.enabled=YES;
            }
        }
    }];
    //Animation
    [self Animation];
}

+ (instancetype)tabBar
{

    MCTabBar *tabself=nil;
    
    if (!tabself) {
        tabself = [[self alloc]initWithFrame:CGRectMake(0, 0, Mct_currentScreenWidth, Mct_currentTabbarHeight)];
    }
    return tabself;
}


#pragma mark -- UI

- (void)makeSelfUi
{
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Mct_currentScreenWidth, Mct_currentTabbarHeight)];
//    bgImageView.image=[UIImage imageNamed:@""];
    bgImageView.backgroundColor=[UIColor grayColor];
    

    activeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,Mct_currentScreenWidth/4, Mct_currentTabbarHeight)];
//    activeImageView.image=[UIImage imageNamed:@""];
    activeImageView.backgroundColor=[UIColor greenColor];
    
    [self addSubview:bgImageView];
    [self addSubview:activeImageView];
    
    [self addOperateButton];
}

- (void)addOperateButton
{
    NSArray *nameArray =@[@"A",@"账单",@"Mount",@"我"];
    for (int i=0; i<4; i++) {
        
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.tag=KButtonTag+i;
        customBtn.frame =CGRectMake(i*Mct_currentScreenWidth/4, 0, Mct_currentScreenWidth/4, Mct_currentTabbarHeight);
        
        [customBtn setTitle:nameArray[i] forState:UIControlStateNormal];
        
        //font
        UIFont *textFont =[UIFont systemFontOfSize:12];
        [customBtn.titleLabel setFont:textFont];
        
        //textColor
        UIColor *textNormalColor = kButtonNormalTitleColor;
        UIColor *textDisableColr = kButtonDisableTitleColor;
        
        [customBtn setTitleColor:textNormalColor forState:UIControlStateNormal];
        [customBtn setTitleColor:textDisableColr forState:UIControlStateDisabled];
        [customBtn.titleLabel setText:nameArray[i]];
    
        [customBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:customBtn];
        

        
        [self defaultSelect];
    }
}

#pragma mark -- MCTActions

- (void)defaultSelect
{
    [self setSelectedIndex:0];
}

//Human set
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    UIButton *targetBtn =[self whichButtonwithIndex:selectedIndex];
    //Invocation Touch!
    [self buttonAction:targetBtn];
}

//click Human Touch
- (void)buttonAction:(UIButton*)sender
{
    NSInteger currentIndex =sender.tag-KButtonTag;
    _selectedIndex = currentIndex;
    //display ..
    [self buttonDisplay];
    
    if (_delegate&&[_delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        [_delegate tabBar:self didSelectItemAtIndex:_selectedIndex];
    }
}

#pragma mark -- BadgeView

- (void)badgeView:(BOOL)showOrHide atItemIndex:(NSUInteger)index
{
    
}
@end
