//
//  YGOrderViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGOrderViewController.h"
#import "YGTransactionTableViewCell.h"
#import "YGTransactionModel.h"
#import "YGWebViewController.h"

@interface YGOrderViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray <YGTransactionModel *>*_dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"交易记录";
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"YGTransactionTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"transactionCell"];
}

- (void)loadData {
    [YGLoadingTools beginLoading];
    [YGNetworkCommon getTransactionsWithType:self.transactionType page:0 total:10 success:^(id responseObject) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:responseObject[@"message"]];
    } failed:^(NSDictionary *errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YGTransactionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transactionCell" forIndexPath:indexPath];
    YGTransactionModel *model = _dataSource[indexPath.section];
    cell.nameLabel.text = model.content;
    if (model.style) {
        cell.cardLabel.text = model.cardNo;
        [cell updateLayout:NO];
    } else {
        [cell updateLayout:YES];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 16;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YGWebViewController *controller = [YGWebViewController new];
    controller.loadUrl = _dataSource[indexPath.section].url;;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
