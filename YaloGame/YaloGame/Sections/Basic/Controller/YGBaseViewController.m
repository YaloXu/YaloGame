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
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
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

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
