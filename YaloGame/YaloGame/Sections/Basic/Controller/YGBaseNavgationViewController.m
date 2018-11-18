//
//  YGBaseNavgationViewController.m
//  YaloGame
//
//  Created by maomao on 2018/11/16.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGBaseNavgationViewController.h"

@interface YGBaseNavgationViewController ()

@end

@implementation YGBaseNavgationViewController
+ (void)load
{
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=TitleFontSize;
    dic[NSForegroundColorAttributeName]=NavgationTitleColor;
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage imageWithColor:NavgationBgColor] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    dicBar[NSFontAttributeName]=TitleFontSize;
    [bar setTitleTextAttributes:dic];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super pushViewController:viewController animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController* topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}


@end
