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
//#import "AxcAE_TabBar.h"
//#import "YGHintTabBar.h"


//@interface YGTabBarController ()<AxcAE_TabBarDelegate>
//
//@property (nonatomic, strong) AxcAE_TabBar *axcTabBar;

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
//- (void)addChildViewControllers{
//    YGHomeViewController *homeVC = [YGHomeViewController new];
//    UINavigationController *homeNav = [self navigationControllerWithRootController:homeVC];
//    YGAccountViewController *accountVC = [YGAccountViewController new];
//    UINavigationController *accountNav = [self navigationControllerWithRootController:accountVC];
//    YGDiscoveryViewController *disconveryVC = [YGDiscoveryViewController new];
//    UINavigationController *disconveryNav = [self navigationControllerWithRootController:disconveryVC];
//    YGMessageViewController *messageVC = [YGMessageViewController new];
//    UINavigationController *messageNav = [self navigationControllerWithRootController:messageVC];
//    YGMineViewController *mineVC = [YGMineViewController new];
//    UINavigationController *mineNav = [self navigationControllerWithRootController:mineVC];
//    NSArray <NSDictionary *>*VCArray =
//    @[@{@"vc":homeNav,@"normalImg":@"tabbar_home",@"selectImg":@"tabbar_home_selected",@"itemTitle":@"首页"},
//      @{@"vc":accountNav,@"normalImg":@"tabbar_coin",@"selectImg":@"tabbar_coin_selected",@"itemTitle":@"金币"},
//      @{@"vc":disconveryNav,@"normalImg":@"",@"selectImg":@"",@"itemTitle":@"发现"},
//      @{@"vc":messageNav,@"normalImg":@"tabbar_message",@"selectImg":@"tabbar_message_selected",@"itemTitle":@"消息"},
//      @{@"vc":mineNav,@"normalImg":@"tabbar_mine",@"selectImg":@"tabbar_mine_selected",@"itemTitle":@"我的"}];
//    // 1.遍历这个集合
//    // 1.1 设置一个保存构造器的数组
//    NSMutableArray *tabBarConfs = @[].mutableCopy;
//    // 1.2 设置一个保存VC的数组
//    NSMutableArray *tabBarVCs = @[].mutableCopy;
//    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        // 2.根据集合来创建TabBar构造器
//        AxcAE_TabBarConfigModel *model = [AxcAE_TabBarConfigModel new];
//        // 3.item基础数据三连
//        model.itemTitle = [obj objectForKey:@"itemTitle"];
//        model.selectImageName = [obj objectForKey:@"selectImg"];
//        model.normalImageName = [obj objectForKey:@"normalImg"];
//        // 4.设置单个选中item标题状态下的颜色
//        model.selectColor = [UIColor blackColor];
//        model.normalColor = [UIColor blackColor];
//
//        /***********************************/
//        if (idx == 2 ) { // 如果是中间的
//            // 设置凸出 矩形
//            model.bulgeStyle = AxcAE_TabBarConfigBulgeStyleSquare;
//            // 设置凸出高度
//            model.bulgeHeight = 30;
//            // 设置成图片文字展示
//            model.itemLayoutStyle = AxcAE_TabBarItemLayoutStyleTopPictureBottomTitle;
//            // 设置图片
//            model.selectImageName = @"tabbar_discovery_selected";
//            model.normalImageName = @"tabbar_discovery";
//            model.selectBackgroundColor = model.normalBackgroundColor = [UIColor clearColor];
//            model.backgroundImageView.hidden = YES;
//            // 设置图片大小c上下左右全边距
//            model.componentMargin = UIEdgeInsetsMake(0, 0, 0, 0 );
//            // 设置图片的高度为40
//            model.icomImgViewSize = CGSizeMake(self.tabBar.frame.size.width / 5, 60);
//            model.titleLabelSize = CGSizeMake(self.tabBar.frame.size.width / 5, 20);
//            // 图文间距0
//            model.pictureWordsMargin = 0;
//            // 设置标题文字字号
//            model.titleLabel.font = [UIFont systemFontOfSize:11];
//            // 设置大小/边长 自动根据最大值进行裁切
//            model.itemSize = CGSizeMake(self.tabBar.frame.size.width / 5 - 5.0 ,self.tabBar.frame.size.height + 20);
//        } else{
//            model.interactionEffectStyle = AxcAE_TabBarInteractionEffectStyleNone;
//            // 点击背景稍微明显点吧
//            model.selectBackgroundColor = [UIColor clearColor];
//            model.normalBackgroundColor = [UIColor clearColor];
//        }
//        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
//        // 示例中为了方便就在这写了
//        UIViewController *vc = [obj objectForKey:@"vc"];
//        vc.view.backgroundColor = [UIColor whiteColor];
//        // 5.将VC添加到系统控制组
//        [tabBarVCs addObject:vc];
//        // 5.1添加构造Model到集合
//        [tabBarConfs addObject:model];
//    }];
//    // 使用自定义的TabBar来帮助触发凸起按钮点击事件
//    YGHintTabBar *testTabBar = [YGHintTabBar new];
//    [self setValue:testTabBar forKey:@"tabBar"];
//
//    self.viewControllers = tabBarVCs;
//    //////////////////////////////////////////////////////////////////////////
//    // 注：这里方便阅读就将AE_TabBar放在这里实例化了 使用懒加载也行
//    // 6.将自定义的覆盖到原来的tabBar上面
//    // 这里有两种实例化方案：
//    // 6.1 使用重载构造函数方式：
//    //    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
//    // 6.2 使用Set方式：
//    self.axcTabBar = [AxcAE_TabBar new] ;
//    self.axcTabBar.tabBarConfig = tabBarConfs;
//    // 7.设置委托
//    self.axcTabBar.delegate = self;
//    self.axcTabBar.backgroundColor = [UIColor whiteColor];
//    // 8.添加覆盖到上边
//    [self.tabBar addSubview:self.axcTabBar];
//    [self addLayoutTabBar]; // 10.添加适配
//}
//// 9.实现代理，如下：
//static NSInteger lastIdx = 0;
//- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
//    if (index != 2) { // 不是中间的就切换
//        // 通知 切换视图控制器
//        [self setSelectedIndex:index];
//        lastIdx = index;
//    }else{ // 点击了中间的
//
//        [self.axcTabBar setSelectIndex:lastIdx WithAnimation:NO]; // 换回上一个选中状态
//        //todo:
//#warning 自定义
//    }
//}
//- (void)setSelectedIndex:(NSUInteger)selectedIndex{
//    [super setSelectedIndex:selectedIndex];
//    if(self.axcTabBar){
//        self.axcTabBar.selectIndex = selectedIndex;
//    }
//}

// 10.添加适配
//- (void)addLayoutTabBar{
//    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
//    // 能兼容转屏时的自动布局
//}
//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    self.axcTabBar.frame = self.tabBar.bounds;
//    [self.axcTabBar viewDidLayoutItems];
//}
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

