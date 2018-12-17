//
//  YGBaseNavgationViewController.m
//  YaloGame
//
//  Created by maomao on 2018/11/16.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGBaseNavgationViewController.h"

@interface YGBaseNavgationViewController () <UINavigationControllerDelegate> {
    BOOL _flag;
}

@end

@implementation YGBaseNavgationViewController
+ (void)load
{
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=TitleFontSize;
    dic[NSForegroundColorAttributeName]=NavgationTitleColor;
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage imageWithColor:NavgationBgColor] forBarMetrics:UIBarMetricsDefault];
    [bar setTintColor:NavgationTitleColor];
    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
    dicBar[NSFontAttributeName]=TitleFontSize;
    [bar setTitleTextAttributes:dic];
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (_flag || !viewController) {
        return;
    }
    _flag = YES;
    viewController.hidesBottomBarWhenPushed = self.childViewControllers.count;
    return [super pushViewController:viewController animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController* topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _flag = NO;
}

@end
