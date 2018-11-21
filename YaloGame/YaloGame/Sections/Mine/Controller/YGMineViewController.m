//
//  YGMineViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMineViewController.h"
#import "YGBindCardViewController.h"
#import "YGSettingViewController.h"
#import "YGChargeViewController.h"
#import "YGMineHeaderView.h"
#import "YGMineFooterView.h"
#import "YGChargeViewController.h"
#import "YGBindCardViewController.h"
#import "YGSettingViewController.h"
#import "YGBankViewController.h"
#import "YGOrderViewController.h"
#import "YGShareViewController.h"

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
        _tableView.backgroundView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
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
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableHeaderView = [[YGMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    YGMineFooterView *view = [[NSBundle mainBundle] loadNibNamed:@"YGMineFooterView" owner:nil options:nil].firstObject;
    [footerView addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    view.delegate = self;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.bottom.equalTo(footerView);
        make.left.equalTo(@15);
        make.right.equalTo(@(-15));
    }];
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
