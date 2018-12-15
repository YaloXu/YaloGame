//
//  YGSettingViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGSettingViewController.h"
#import "YGUserInfoViewController.h"
#import "YGAboutViewController.h"
#import "YGSafeViewController.h"
#import "UITableViewCell+Arrow.h"

@interface YGSettingViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *userCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *accountCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *aboutCell;

@end

@implementation YGSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置";
    self.userCell.customArrow = YES;
    self.accountCell.customArrow = YES;
    self.aboutCell.customArrow = YES;
    [self.userCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userInfo)]];
    [self.accountCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(account)]];
    [self.aboutCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(about)]];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    layer.frame = CGRectMake(0, 43, kScreenWidth - 30, 1);
    [self.userCell.layer addSublayer:layer];
}
- (IBAction)logout:(id)sender {
    [YGLoadingTools beginLoading];
    [YGNetworkCommon logout:^(id responseObject) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:@"退出成功"];
        [YGUserInfo.defaultInstance clearData];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failed:^(NSDictionary *errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:@"退出成功"];
        [YGUserInfo.defaultInstance clearData];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (void)userInfo {
    [self.navigationController pushViewController:[YGUserInfoViewController new] animated:YES];
}

- (void)account {
    [self.navigationController pushViewController:[YGSafeViewController new] animated:YES];
}

- (void)about {
    [self.navigationController pushViewController:[YGAboutViewController new] animated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    layer.frame = CGRectMake(16, 12 + 36, kScreenWidth - 32, 1);
    [self.view.layer addSublayer:layer];
}

@end
