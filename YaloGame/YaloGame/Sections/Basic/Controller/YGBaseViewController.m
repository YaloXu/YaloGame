//
//  YGBaseViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"

@interface YGBaseViewController ()

@end

@implementation YGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self backBarbuttonForWhite];
    if (@available(iOS 11.0, *)) {
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
     self.view.backgroundColor = DefaultBackGroundColor;
}
//导航栏左边按钮
- (void)backBarbuttonForWhite{
    if (self.parentViewController.childViewControllers.count>1) {
        UIImage *image = [UIImage imageNamed:@"nav_back"];
        image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        UIBarButtonItem * leftBarbtn = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        self.navigationItem.leftBarButtonItem = leftBarbtn;
    }
    
}
-(void)back{
    if (![self isMemberOfClass:[YGBaseViewController class]]) {
        if (self.parentViewController.childViewControllers.count>1) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}
-(void)setHeadTitle:(NSString *)headTitle{
    _headTitle = headTitle;
    self.navigationItem.title = _headTitle;
}
-(void)setRightBarItemWithImage:(NSString *)imageName{
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [rightButton setImage:[UIImage imageNamed:imageName]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarItemEvent)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}

- (void)addBackButton {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_back"]];
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeLeft;
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.left.equalTo(@16);
        make.top.equalTo(self.view).with.offset(20);
    }];
}

- (void)customNav {
    UIView *navView = [UIView new];
    [self.view addSubview:navView];
    navView.backgroundColor = self.customNavColor ? self.customNavColor : NavgationBgColor;
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(kNavHeight);
    }];
    UILabel *label = [UILabel new];
    [navView addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(navView);
        make.height.mas_equalTo(44);
    }];
    _titleLabel = label;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        [self customNav];
    }
    return _titleLabel;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

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
