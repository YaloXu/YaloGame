//
//  YGMineViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMineViewController.h"
#import "YGChargeViewController.h"
#import "YGMineHeaderView.h"
#import "YGMineFooterView.h"
#import "YGChargeViewController.h"
#import "YGBindCardViewController.h"
#import "YGSettingViewController.h"
#import "YGBankViewController.h"
#import "YGOrderViewController.h"
#import "YGShareViewController.h"
#import "YGLoginViewController.h"
#import "YGRegisterViewController.h"

@interface YGMineViewController () <YGMineFooterDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YGMineViewController

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundView.backgroundColor = DefaultBackGroundColor;
        _tableView.backgroundColor = DefaultBackGroundColor;
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view.
    [self autoLayoutSizeContentView:self.tableView];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = DefaultBackGroundColor;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 480)];
    //已登录
    if (@"".length > 0) {
        footerView.frame = CGRectMake(0, 0, kScreenWidth, 296);
        self.tableView.tableHeaderView = [[YGMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 274)];
    }
    
    
    footerView.backgroundColor = DefaultBackGroundColor;
    
    
    YGMineFooterView *view = [[NSBundle mainBundle] loadNibNamed:@"YGMineFooterView" owner:nil options:nil].firstObject;
    [footerView addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    view.delegate = self;
    //已登录
    if (@"".length > 0) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@16);
            make.bottom.equalTo(footerView);
            make.left.equalTo(@16);
            make.right.equalTo(@(-16));
        }];
    } else {
        YGUnLoginView *loginView = [[YGUnLoginView alloc] init];
        [footerView addSubview:loginView];
        [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(footerView);
            make.height.mas_equalTo(226);
        }];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(footerView);
            make.left.equalTo(@16);
            make.right.equalTo(@(-16));
            make.height.mas_equalTo(280);
        }];
        [loginView setLoginHandler:^{
            [self.navigationController pushViewController:[YGLoginViewController new] animated:YES];
        }];
        [loginView setRegisterHandler:^{
            [self.navigationController pushViewController:[YGRegisterViewController new] animated:YES];
        }];
        [footerView bringSubviewToFront:view];
    }
    
    self.tableView.tableFooterView = footerView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)collectionViewDidSelected:(NSIndexPath *)indexPath {
    UIViewController *controller = nil;
    switch (indexPath.item) {
        case 0: {
            controller = [YGChargeViewController new];
        }
            break;
        case 1: {
            controller = [YGChargeViewController new];
            [controller setValue:@(1) forKey:@"selectedIndex"];
        }
            break;
        case 2: {
            controller = [YGOrderViewController new];
        }
            break;
        case 3: {
            controller = [YGBankViewController new];
        }
            break;
        case 4: {
        }
            break;
        case 5: {
        }
            break;
        case 6: {
            controller = [YGShareViewController new];
        }
            break;
        case 7: {
            controller = [YGSettingViewController new];
        }
            break;
        default:
            break;
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
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
