//
//  YGTabBarController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGTabBarController.h"
#import "YGHomeViewController.h"
#import "YGDiscoveryViewController.h"
#import "YGMessageViewController.h"
#import "YGMineViewController.h"
#import "YGAccountViewController.h"
#import "YGBaseNavgationViewController.h"
#import "YGTabBar.h"
#define ItemSize 45
@interface YGTabBarController ()
//@property (nonatomic ,strong) YGTabBar   *ygTabbar;
//@property (nonatomic ,strong) YGBaseNavgationViewController *disconveryNav;

@end

@implementation YGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _ygTabbar = [[YGTabBar alloc]init];
    self.tabBar.translucent = NO;
//    [_ygTabbar.centerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.selectedIndex = 0;
    [self addSubVC];
}

- (void)addSubVC {
    YGHomeViewController       *homeVC      = [YGHomeViewController new];
//    YGAccountViewController    *accountVC   = [YGAccountViewController new];
    YGDiscoveryViewController  *disconveryVC= [YGDiscoveryViewController new];
    YGMessageViewController    *messageVC   = [YGMessageViewController new];
    YGMineViewController       *mineVC      = [YGMineViewController new];

    YGBaseNavgationViewController *homeNav     = [self navigationControllerWithRootController:homeVC];
//    YGBaseNavgationViewController *accountNav = [self navigationControllerWithRootController:accountVC];
    YGBaseNavgationViewController *disconveryNav = [self navigationControllerWithRootController:disconveryVC];
    YGBaseNavgationViewController *messageNav = [self navigationControllerWithRootController:messageVC];
    YGBaseNavgationViewController *mineNav    = [self navigationControllerWithRootController:mineVC];

//    [self setValue:_ygTabbar forKey:@"tabBar"];
//    self.delegate = self;

    self.viewControllers = @[homeNav,disconveryNav,messageNav,mineNav];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    accountNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"金币" image:[[UIImage imageNamed:@"tabbar_coin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_coin_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    disconveryNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[[UIImage imageNamed:@"tabbar_discovery"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_discovery _selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    messageNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"tabbar_message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    for(UIViewController *tab in self.viewControllers)
    {
        UIColor *selectedColor = TabBarTitleColorSelected;
//        if([tab isEqual:self.disconveryNav]) selectedColor = UIColorFromRGBValue(0XE9A400);
        [tab.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                ContentFontSize, NSFontAttributeName,TabBarTitleColorUnSelected,NSForegroundColorAttributeName,nil]
                                      forState:UIControlStateNormal];
        [tab.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                ContentFontSize, NSFontAttributeName,selectedColor,NSForegroundColorAttributeName,nil]
                                      forState:UIControlStateSelected];
    }
}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (tabBarController.selectedIndex==2) {
//        [self.ygTabbar.centerBtn setImage:[[UIImage imageNamed:@"tabbar_discovery_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }else{
//        [self.ygTabbar.centerBtn setImage:[[UIImage imageNamed:@"tabbar_discovery"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }
//}
//-(void)btnClick:(UIButton*)btn{
//    if (self.parentViewController.childViewControllers.count>1) {
//        return;
//    }
//    if (self.tabBarController.selectedIndex !=2) {
//        self.selectedViewController = self.disconveryNav;
//        [self.ygTabbar.centerBtn setImage:[[UIImage imageNamed:@"tabbar_discovery_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }
//}
- (YGBaseNavgationViewController *)navigationControllerWithRootController:(UIViewController *)controller {
    YGBaseNavgationViewController *nav = [[YGBaseNavgationViewController alloc] initWithRootViewController:controller];
    return nav;
}

@end

