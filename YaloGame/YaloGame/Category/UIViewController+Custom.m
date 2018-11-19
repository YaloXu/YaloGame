//
//  UIViewController+Custom.m
//  YaloGame
//
//  Created by maomao on 2018/11/19.
//  Copyright © 2018年 C. All rights reserved.
//

#import "UIViewController+Custom.h"

@implementation UIViewController (Custom)
- (void)autoLayoutSizeContentView:(UIScrollView *)scrollView {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        if ([scrollView isKindOfClass:[UITableView class]]) {
            ((UITableView *)scrollView).estimatedSectionHeaderHeight = 0;
            ((UITableView *)scrollView).estimatedSectionFooterHeight = 0;
        }
    }
#endif
}
@end
