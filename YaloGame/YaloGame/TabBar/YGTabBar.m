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
    if (self.isHidden == NO) {
        CGPoint newP = [self convertPoint:point toView:self.centerBtn];
        if ( [self.centerBtn pointInside:newP withEvent:event]) {
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }else{
        return [super hitTest:point withEvent:event];
    }
}
    


@end
