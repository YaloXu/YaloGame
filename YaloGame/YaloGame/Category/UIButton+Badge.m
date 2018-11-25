//
//  UIButton+Bage.m
//  YaloGame
//
//  Created by C on 2018/11/25.
//  Copyright © 2018 C. All rights reserved.
//

#import "UIButton+Badge.h"
#import <objc/runtime.h>

@implementation UIButton (Badge)

- (void)setBadge:(NSInteger)badge {
    objc_setAssociatedObject(self, @selector(badge), @(badge), OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (badge > 0) {
        [self text:badge];
    }
}

- (NSInteger)badge {
    return [objc_getAssociatedObject(self, @selector(badge)) integerValue];
}

- (void)text:(NSInteger)bagde {
    UILabel *label = [UILabel new];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 10;
    label.layer.borderWidth = 1;
    label.layer.borderColor = UIColor.whiteColor.CGColor;
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:16];
    label.text = [NSString stringWithFormat:@"%ld",bagde];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(@(-3));
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}

@end
