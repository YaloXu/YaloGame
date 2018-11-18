//
//  YGChargeViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGChargeViewController.h"
#import "YGBindCardView.h"
#import "YGSegView.h"

@interface YGChargeViewController () {
    
    UILabel *_line;
}



@end

@implementation YGChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    self.navigationItem.title = @"充值/提现";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"交易记录" style:UIBarButtonItemStylePlain target:self action:@selector(record)];
//    [self addDefaultView];
    [self segView];
    [self setUp];
    
}

- (void)setUp {
    
    UIView *view = [UIView new];
    view.backgroundColor = NavgationBgColor;
    [self.view addSubview:view];
    UILabel *moneyLabel = [UILabel new];
    [view addSubview:moneyLabel];
    UILabel *acountLabel = [UILabel new];
    [view addSubview:acountLabel];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:refreshButton];
    refreshButton.backgroundColor = [UIColor redColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@45);
        make.height.mas_equalTo(90);
    }];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(@15);
        make.height.mas_equalTo(20);
    }];
    [acountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(moneyLabel.mas_bottom).with.offset(5);
        make.height.mas_equalTo(15);
    }];
    [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.right.equalTo(@(-15));
    }];
    moneyLabel.text = @"0.00";
    acountLabel.text = @"主账户余额（¥）";
    moneyLabel.textAlignment = acountLabel.textAlignment = NSTextAlignmentCenter;
    
    YGSegView *segView = [[NSBundle mainBundle] loadNibNamed:@"YGSegView" owner:nil options:nil].firstObject;
    [self.view addSubview:segView];
    [segView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(view.mas_bottom).with.offset(10);
        make.height.mas_equalTo(80);
    }];
    
}

- (void)segView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:leftButton];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:rightButton];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_centerX);
        make.top.bottom.equalTo(view);
        make.width.mas_equalTo(100);
    }];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftButton.mas_right);
        make.top.bottom.width.equalTo(leftButton);
    }];
    [leftButton setTitle:@"充值" forState:UIControlStateNormal];
    [rightButton setTitle:@"提现" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [leftButton addTarget:self action:@selector(chargeMoney:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(rolloutMoney:) forControlEvents:UIControlEventTouchUpInside];
    _line = [UILabel new];
    _line.backgroundColor = [UIColor blackColor];
    [view addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(leftButton.mas_centerX);
        make.bottom.equalTo(view);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(60);
    }];
}

- (void)addDefaultView {
    YGBindCardView *cardView = [[NSBundle mainBundle] loadNibNamed:@"YGBindCardView" owner:nil options:nil].firstObject;
    [self.view addSubview:cardView];
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(44);
    }];
}

- (void)record {
}

- (void)chargeMoney:(UIButton *)button {
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button.mas_centerX);
        make.bottom.equalTo(button.superview);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(60);
    }];
    [UIView animateWithDuration:.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)rolloutMoney:(UIButton *)button {
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button.mas_centerX);
        make.bottom.equalTo(button.superview);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(60);
    }];
    [UIView animateWithDuration:.3 animations:^{
        [self.view layoutIfNeeded];
    }];
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
