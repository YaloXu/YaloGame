//
//  UITableViewCell+Arrow.m
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "UITableViewCell+Arrow.h"
#import <objc/runtime.h>

@implementation UITableViewCell (Arrow)


- (void)setCustomArrow:(BOOL)customArrow {
    if (customArrow) {
        [self configCustomView];
    } else {
        self.accessoryView = nil;
    }
    objc_setAssociatedObject(self, @selector(customArrow), @(customArrow), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)configCustomView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recharge_right"]];
    self.accessoryView = imageView;
}

- (BOOL)customArrow {
    return [objc_getAssociatedObject(self, @selector(customArrow)) boolValue];
}


@end
