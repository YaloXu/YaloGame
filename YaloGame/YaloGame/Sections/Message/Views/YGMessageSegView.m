//
//  YGMessageSegView.m
//  test
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMessageSegView.h"

@interface YGMessageSegView()

@end

@implementation YGMessageSegView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = DefaultBackGroundColor;
        [self setUp];
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth = .5f;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
    
    CALayer *layer1 = [CALayer layer];
    [self.layer addSublayer:layer1];
    layer1.backgroundColor = self.layer.borderColor;
    layer1.frame = CGRectMake(CGRectGetMinX([self viewWithTag:1].frame), 0, 0.5, CGRectGetHeight(self.frame));
    
    CALayer *layer2 = [CALayer layer];
    [self.layer addSublayer:layer2];
    layer2.backgroundColor = self.layer.borderColor;
    layer2.frame = CGRectMake(CGRectGetMinX([self viewWithTag:2].frame), 0, 0.5, CGRectGetHeight(self.frame));
    
}

- (void)setUp {
    NSMutableArray <UIButton *> *buttons = [NSMutableArray new];
    NSArray <NSString *> *titles = @[@"站内信",@"公告",@"消息"];
    for (int i = 0; i < titles.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateSelected];
        button.tag = i;
        if (self.selectedIndex == i) {
            button.selected = YES;
        }
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [buttons addObject:button];
        [button setTitleColor:DefaultBackGroundColor forState:UIControlStateSelected];
        [button setTitleColor:UIColorFromRGBValue(0x333333) forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGBValue(0x333333) forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageWithColor:DefaultBackGroundColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:NavgationBgColor] forState:UIControlStateSelected];
         [button setBackgroundImage:[UIImage imageWithColor:NavgationBgColor] forState:UIControlStateHighlighted];
        [self addSubview:button];
//        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
        }];
    }
    [buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
}

- (void)buttonClick:(UIButton *)button {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag != button.tag) {
            ((UIButton *)view).selected = NO;
        } else {
            ((UIButton *)view).selected = YES;
        }
    }
    if (self.segDidSelctedHandler) {
        self.segDidSelctedHandler(button.tag);
    }
}

@end
