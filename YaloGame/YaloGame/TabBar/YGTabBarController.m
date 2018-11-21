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
#define ItemSize 60
@interface YGTabBarController ()
@property (nonatomic ,strong) UIImageView  * item2Image;

@end

@implementation YGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子VC
    [[UITabBar appearance] setTranslucent:NO];
    [self addSubVC];
}

- (void)addSubVC {
    YGHomeViewController       *homeVC      = [YGHomeViewController new];
    YGAccountViewController    *accountVC   = [YGAccountViewController new];
    YGDiscoveryViewController  *disconveryVC= [YGDiscoveryViewController new];
    YGMessageViewController    *messageVC   = [YGMessageViewController new];
    YGMineViewController       *mineVC      = [YGMineViewController new];

    YGBaseNavgationViewController *homeNav     = [self navigationControllerWithRootController:homeVC];
    YGBaseNavgationViewController *accountNav = [self navigationControllerWithRootController:accountVC];
    YGBaseNavgationViewController *disconveryNav = [self navigationControllerWithRootController:disconveryVC];
    YGBaseNavgationViewController *messageNav = [self navigationControllerWithRootController:messageVC];
    YGBaseNavgationViewController *mineNav    = [self navigationControllerWithRootController:mineVC];

    self.item2Image = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-ItemSize)/2, -35, ItemSize, ItemSize)];
    self.item2Image.image = [UIImage imageNamed:@"tabbar_discovery"];
    self.item2Image.contentMode = UIViewContentModeScaleAspectFit;
    self.delegate = self;

    self.viewControllers = @[homeNav,accountNav,disconveryNav,messageNav,mineNav];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    accountNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"金币" image:[[UIImage imageNamed:@"tabbar_coin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_coin_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    disconveryNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:nil selectedImage:nil];
    messageNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[[UIImage imageNamed:@"tabbar_message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_message_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    for(UIViewController *tab in self.viewControllers)
    {
        UIColor *selectedColor = TabBarTitleColorSelected;
        if([tab isEqual:disconveryNav]) selectedColor = UIColorFromRGBValue(0Xe3c793);
        [tab.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                ContentFontSize, NSFontAttributeName,TabBarTitleColorUnSelected,NSForegroundColorAttributeName,nil]
                                      forState:UIControlStateNormal];
        [tab.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                ContentFontSize, NSFontAttributeName,selectedColor,NSForegroundColorAttributeName,nil]
                                      forState:UIControlStateSelected];
    }

    [self.tabBar addSubview:self.item2Image];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex==2) {
        self.item2Image.image = [[UIImage imageNamed:@"tabbar_discovery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        self.item2Image.image = [[UIImage imageNamed:@"tabbar_discovery"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}
- (YGBaseNavgationViewController *)navigationControllerWithRootController:(UIViewController *)controller {
    YGBaseNavgationViewController *nav = [[YGBaseNavgationViewController alloc] initWithRootViewController:controller];
    return nav;
}

@end

