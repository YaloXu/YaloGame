//
//  YGSafeViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGSafeViewController.h"
#import "YGPwdViewController.h"
#import "UITableViewCell+Arrow.h"
#import "DMProgressHUD.h"
#import "YGAlertToast.h"

@interface YGSafeViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray <NSString *> *_dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"账户与安全";
    [self autoLayoutSizeContentView:self.tableView];
    _dataSource = @[@"账号密码",@"交易密码",@"绑定手机号"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = DefaultBackGroundColor;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.customArrow = YES;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        cell.textLabel.font = cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = UIColorFromRGBValue(0x333333);
        cell.detailTextLabel.textColor = UIColorFromRGBValue(0x979AA1);
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    if (indexPath.row == 0) {
        cell.detailTextLabel.text = @"";
    } else if (indexPath.row == 2) {
        cell.detailTextLabel.text = @"*******8976";
    } else {
        cell.detailTextLabel.text = @"";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0 || indexPath.row == 1) {
        YGPwdViewController *controller = [YGPwdViewController new];
        controller.pwdType = indexPath.row == 0 ? YGSetPwdType_login : YGSetPwdType_Pay;
        [self.navigationController pushViewController:controller animated:YES];
    } else if (indexPath.row == 2){
        if (YGUtils.validString(YGUserInfo.defaultInstance.phone)) {
             [YGAlertToast showMessage:@"您已经绑定过手机号"];
        } else {
            [YGLoadingTools beginLoading];
            [YGNetworkCommon bindPhone:nil success:^(id responseObject) {
                [YGNetworkCommon userInfo:^(id responseObject) {
                    [YGUserInfo.defaultInstance parseUserInfo:responseObject];
                    [YGAlertToast showHUDMessage:@"绑定完成"];
                    [YGLoadingTools endLoading];
                } failed:^(NSDictionary *errorInfo) {
                    [YGLoadingTools endLoading];
                }];
            } failed:^(NSDictionary *errorInfo) {
                [YGLoadingTools endLoading];
                [YGAlertToast showHUDMessage:errorInfo[@"message"]];            }];
        }
    } else {
        
    }
}



@end
