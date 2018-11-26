//
//  YGAlertSelectedViewController.m
//  YaloGame
//
//  Created by 毛亚恒 on 2018/11/27.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAlertSelectedViewController.h"

@interface YGAlertSelectedViewController ()
@property (nonatomic , strong) UILabel  *alertTitleLabel;
@property (nonatomic , strong) UILabel  *contentLabel;
@property (nonatomic , strong) UIButton *closeImgBtn;
@property (nonatomic ,strong)  UIButton *closebtn;
@property (nonatomic ,strong)  UIView   *line;

@end

@implementation YGAlertSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBValue(0xf5f5f5);
    [self setUI];
}
-(void)setUI{
    [self.view addSubview:self.alertTitleLabel];
    [self.view addSubview:self.line];
    [self.view addSubview:self.closeImgBtn];
    [self.view addSubview:self.contentLabel];
    [self.view addSubview:self.closebtn];
    
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
    [self.closebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.mas_offset(2);
        make.right.left.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self.line.mas_bottom);
        make.bottom.equalTo(self.closebtn.mas_top);
    }];
}
-(void)closeEvent{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UILabel *)alertTitleLabel{
    if (!_alertTitleLabel) {
        _alertTitleLabel = [[UILabel alloc]init];
        _alertTitleLabel.textColor = UIColorFromRGBValue(0x333333);
        _alertTitleLabel.font = [UIFont boldSystemFontOfSize:20];
        _alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        _alertTitleLabel.text = @"回拨申请已递交";
    }
    return _alertTitleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = UIColorFromRGBValue(0x333333);
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"非常感谢您对名门电竞的支持，已通知电话客服联系您请，稍等！";
    }
    return _contentLabel;
}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = kLineColor;
    }
    return _line;
}
-(UIButton *)closebtn{
    if (!_closebtn) {
        _closebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closebtn.backgroundColor = UIColorFromRGBValue(0x333333);
        [_closebtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_closebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _closebtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_closebtn addTarget:self action:@selector(closeEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closebtn;
}
-(UIButton *)closeImgBtn{
    if (!_closeImgBtn) {
        _closeImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeImgBtn setImage:[UIImage imageNamed:@"qr_close"] forState:UIControlStateNormal];
        [_closeImgBtn addTarget:self action:@selector(closeEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeImgBtn;
}
@end
