//
//  YGGoodsConvertViewController.m
//  YaloGame
//
//  Created by maomao on 2018/11/29.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGGoodsConvertViewController.h"
#import "YGConvertFooter.h"
#import "CoinCommonCell.h"
@interface YGGoodsConvertViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTable;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic , strong) UIButton *closeImgBtn;
@property (nonatomic , strong) UILabel  *alertTitleLabel;
@property (nonatomic ,strong)  UIView   *line;
@property (nonatomic ,strong)  UIButton *convertBtn;
@property (nonatomic , strong) YGConvertFooter *convertFooter;

@end

@implementation YGGoodsConvertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
-(void)setUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.alertTitleLabel];
    [self.view addSubview:self.line];
    [self.view addSubview:self.closeImgBtn];
    [self.view addSubview:self.mainTable];
    [self.view addSubview:self.convertFooter];
    [self.view addSubview:self.convertBtn];
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
    [self.convertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    [self.convertFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.view);
        make.bottom.equalTo(self.convertBtn.mas_top);
        make.height.mas_equalTo(54);
    }];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40*kWidthRatio);
        make.right.mas_equalTo(-40*kWidthRatio);
        make.bottom.equalTo(self.convertFooter.mas_top).with.mas_equalTo(-10);
        make.top.equalTo(self.line.mas_bottom).with.mas_equalTo(20);
    }];
}
-(void)closeEvent{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CoinCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:CoinCommonOnlyLabelId];
    cell.contentLabel.text = self.dataSource[indexPath.row];
    cell.verticalStyle = VerticalAlignmentMiddle;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTable.backgroundColor = [UIColor clearColor];
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_mainTable registerClass:[CoinCommonCell class] forCellReuseIdentifier:CoinCommonLabelAndTextViewId];
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
        _alertTitleLabel.text = @"兑换商品";
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
-(UIButton *)convertBtn{
    if (!_convertBtn) {
        _convertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _convertBtn.backgroundColor = UIColorFromRGBValue(0x333333);
        [_convertBtn setTitle:@"确认兑换" forState:UIControlStateNormal];
        [_convertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _convertBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_convertBtn addTarget:self action:@selector(closeEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _convertBtn;
}
-(YGConvertFooter *)convertFooter{
    if (!_convertFooter) {
        _convertFooter = [[YGConvertFooter alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 54)];
        _convertFooter.backgroundColor = [UIColor whiteColor];
    }
    return _convertFooter;
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
