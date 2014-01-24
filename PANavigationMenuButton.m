//
//  PANavigationMenuButton.m
//  MenueModel
//
//  Created by yinjiwang on 14-1-22.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "PANavigationMenuButton.h"
#import "PANavigationMenuConfig.h"

@implementation PANavigationMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.title = [[UILabel alloc]initWithFrame:frame];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.backgroundColor = [UIColor clearColor];
        
        //dic @{key:value,key,value...};
        //set behavior you can init a dic!
        NSDictionary *currentStyle = @{UITextAttributeTextColor:kNavigationTitleColor,UITextAttributeFont:kNavigationBarTitleFont,UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero]};
        //form dic!
        // dic --> obj[key] = value
        self.title.textColor = currentStyle[UITextAttributeTextColor];
        self.title.font      = currentStyle[UITextAttributeFont];
        self.title.shadowColor = currentStyle[UITextAttributeTextShadowOffset];
        
        NSValue *shadowOffset =currentStyle[UITextAttributeTextShadowOffset];
        self.title.shadowOffset =shadowOffset.CGSizeValue;
        
        [self addSubview:self.title];
        
        self.arrow =[[UIImageView alloc]initWithImage:Img(@"AccountMenuArrow")];
    
        [self addSubview:self.arrow];
        
        
    }
    return self;
}

//when added subview
- (void)layoutSubviews
{
    [self.title sizeToFit];
    self.title.center = CGPointMake(self.frame.size.width, (self.frame.size.height-2)/2);
    self.arrow.center = CGPointMake(CGRectGetMaxX(self.title.frame)+[PANavigationMenuConfig arrowPadding], self.frame.size.height/2);
}


#pragma mark -
#pragma mark Tap Event
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    //
    self.isActive = !self.isActive;
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
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
