//
//  YGTabBar.m
//  YaloGame
//
//  Created by maomao on 2018/11/21.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGTabBar.h"

@implementation YGTabBar
- (instancetype)init{
    if (self = [super init]){
        [self initView];
    }
    return self;
    
}
- (void)initView{
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = [UIImage imageNamed:@"tabbar_discovery"];
    _centerBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [_centerBtn setImage:normalImage forState:UIControlStateNormal];
    _centerBtn.adjustsImageWhenHighlighted = NO;
    _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width)/2.0, - normalImage.size.height/2.0, normalImage.size.width, normalImage.size.height);
    [self addSubview:_centerBtn];
    
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            return _centerBtn;
        }
    }
    return view;
}
    


@end
