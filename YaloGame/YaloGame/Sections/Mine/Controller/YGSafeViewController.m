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

@interface YGSafeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"账户与安全";
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
    cell.textLabel.text = indexPath.row == 0 ? @"账号密码" : @"绑定手机号";
    cell.detailTextLabel.text = indexPath.row == 0 ? @"未保护" : @"*******8976";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[YGPwdViewController new] animated:YES];
    } else {
        [YGAlertToast showMessage:@"您已经绑定过手机号"];
    }
}



@end
