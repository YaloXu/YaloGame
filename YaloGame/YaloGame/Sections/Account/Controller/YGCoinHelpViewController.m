//
//  YGCoinHelpViewController.m
//  YaloGame
//
//  Created by maomao on 2018/11/27.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGCoinHelpViewController.h"
#import "CoinCommonCell.h"
@interface YGCoinHelpViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTable;
@property (nonatomic, strong) NSArray <NSArray *>*dataSource;
@property (nonatomic , strong) UIButton *closeImgBtn;
@property (nonatomic , strong) UILabel  *alertTitleLabel;
@property (nonatomic ,strong)  UIView   *line;


@end

@implementation YGCoinHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.dataSource = @[@[@"1）每在线充值1000=10金币",@"2）每转账汇款1000=20金币"],@[@"1）每10000有效投注额=10金币"],@[@"1）官网会不定时推出优惠送金币活动"]];
}
-(void)setUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.alertTitleLabel];
    [self.view addSubview:self.line];
    [self.view addSubview:self.closeImgBtn];
    [self.view addSubview:self.mainTable];
    [self.alertTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(24);
        make.top.mas_equalTo(14);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.view);
        make.top.equalTo(self.alertTitleLabel.mas_bottom).with.mas_equalTo(13);
        make.height.mas_equalTo(0.5);
    }];
    [self.closeImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40*kWidthRatio);
        make.right.mas_equalTo(-40*kWidthRatio);
        make.bottom.equalTo(self.view.mas_bottom).with.mas_equalTo(-20);
        make.top.equalTo(self.line.mas_bottom).with.mas_equalTo(20);
    }];
}
-(void)closeEvent{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CoinCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:CoinCommonOnlyLabelId];
    cell.contentLabel.text = self.dataSource[indexPath.section][indexPath.row];
    cell.verticalStyle = VerticalAlignmentLeft;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kTopSpace;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.mainTable.frame.size.width, 20)];
    UILabel *title = [[UILabel alloc]initWithFrame:header.frame];
    NSArray *titles = @[@"存款送金币",@"投注送金币",@"优惠送金币"];
    title.font = [UIFont boldSystemFontOfSize:12];
    title.textColor = UIColorFromRGBValue(0x333333);
    title.text = titles[section];
    [header addSubview:title];
    return header;
}
-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTable.backgroundColor = [UIColor clearColor];
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTable registerClass:[CoinCommonCell class] forCellReuseIdentifier:CoinCommonLabelAndTextViewId];
        [_mainTable registerClass:[CoinCommonCell class] forCellReuseIdentifier:CoinCommonOnlyLabelId];

        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.scrollEnabled = NO;
        _mainTable.sectionHeaderHeight = 5;
        _mainTable.sectionFooterHeight = 5;
        _mainTable.rowHeight = 20;
        [self autoLayoutSizeContentView:_mainTable];
    }
    return _mainTable;
}
-(UIButton *)closeImgBtn{
    if (!_closeImgBtn) {
        _closeImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeImgBtn setImage:[UIImage imageNamed:@"qr_close"] forState:UIControlStateNormal];
        [_closeImgBtn addTarget:self action:@selector(closeEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeImgBtn;
}
-(UILabel *)alertTitleLabel{
    if (!_alertTitleLabel) {
        _alertTitleLabel = [[UILabel alloc]init];
        _alertTitleLabel.textColor = UIColorFromRGBValue(0x333333);
        _alertTitleLabel.font = [UIFont boldSystemFontOfSize:20];
        _alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        _alertTitleLabel.text = @"如何获取金币";
    }
    return _alertTitleLabel;
}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = kLineColor;
    }
    return _line;
}
@end
