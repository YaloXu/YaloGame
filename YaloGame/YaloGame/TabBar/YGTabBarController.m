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

@interface YGTabBarController ()

@end

@implementation YGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubVC];
}

- (void)addSubVC {
    YGHomeViewController *homeVC = [YGHomeViewController new];
    UINavigationController *homeNav = [self navigationControllerWithRootController:homeVC];
    homeNav.tabBarItem.title = @"首页";
    YGAccountViewController *accountVC = [YGAccountViewController new];
    UINavigationController *accountNav = [self navigationControllerWithRootController:accountVC];
    accountNav.tabBarItem.title = @"账户";
    YGDiscoveryViewController *disconveryVC = [YGDiscoveryViewController new];
    UINavigationController *disconveryNav = [self navigationControllerWithRootController:disconveryVC];
    disconveryNav.tabBarItem.title = @"发现";
    YGMessageViewController *messageVC = [YGMessageViewController new];
    UINavigationController *messageNav = [self navigationControllerWithRootController:messageVC];
    messageNav.tabBarItem.title = @"消息";
    YGMineViewController *mineVC = [YGMineViewController new];
    UINavigationController *mineNav = [self navigationControllerWithRootController:mineVC];
    mineNav.tabBarItem.title = @"我的";
    self.viewControllers = @[homeNav,accountNav,disconveryNav,messageNav,mineNav];
    
}

- (UINavigationController *)navigationControllerWithRootController:(UIViewController *)controller {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    return nav;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
