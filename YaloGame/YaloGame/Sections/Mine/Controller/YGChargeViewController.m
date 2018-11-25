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
#import "YGBandRechargeViewController.h"
#import "YGAlertViewController.h"
#import "YGBindCardViewController.h"

@interface YGChargeViewController () {
    
    UILabel *_line;
    UIButton *_rechargeButton, *_rolloutButton, *_refreshButton;
}

@property (nonatomic, strong) UIView *rollView;

@property (nonatomic, strong) UIView *rechargeView, *refreshView;

@end

@implementation YGChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = DefaultBackGroundColor;
    self.navigationItem.title = self.selectedIndex == 0 ? @"交易" : @"提现";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"交易记录" style:UIBarButtonItemStylePlain target:self action:@selector(record)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
//    [self addDefaultView];
    [self segView];
    if (self.selectedIndex == 0) {
         [self setUp];
    } else {
        [self addDefaultView];
    }
    
}

- (void)setUp {
    
    UIView *view = [UIView new];
    view.backgroundColor = NavgationBgColor;
    _refreshView = view;
    [self.view addSubview:view];
    UILabel *moneyLabel = [UILabel new];
    [view addSubview:moneyLabel];
    UILabel *acountLabel = [UILabel new];
    [view addSubview:acountLabel];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:refreshButton];
    [refreshButton setBackgroundImage:[UIImage imageNamed:@"common_refresh"] forState:UIControlStateNormal];
    _refreshButton = refreshButton;
    [_refreshButton addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@52);
        make.height.mas_equalTo(72);
    }];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(@13);
        make.height.mas_equalTo(28);
    }];
    [acountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(moneyLabel.mas_bottom).with.offset(0);
        make.height.mas_equalTo(17);
    }];
    [refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.right.equalTo(@(-16));
    }];
    moneyLabel.text = @"0.00";
    acountLabel.text = @"主账户余额（¥）";
    moneyLabel.textAlignment = acountLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.textColor = UIColorFromRGBValue(0xE9A400);
    acountLabel.textColor = UIColorFromRGBValue(0x979AA1);
    moneyLabel.font = [UIFont systemFontOfSize:20];
    acountLabel.font = [UIFont systemFontOfSize:12];
    YGSegView *segView = [[NSBundle mainBundle] loadNibNamed:@"YGSegView" owner:nil options:nil].firstObject;
    [self.view addSubview:segView];
    _rechargeView = segView;
    [segView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(view.mas_bottom).with.offset(14);
        make.height.mas_equalTo(36 * 3);
    }];
    [segView setAlipay:^{
        [YGAlertViewController alertViewWithQRType:YGQRType_AliPay fromVC:self];
    }];
    [segView setBankPay:^{
        [self.navigationController pushViewController:[YGBandRechargeViewController new] animated:YES];
    }];
    [segView setUnionPay:^{
        [YGAlertViewController alertViewWithQRType:YGQRType_Union fromVC:self];
    }];
}

- (void)segView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:leftButton];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:rightButton];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    leftButton.imageView.contentMode = rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftButton setTitleColor:UIColorFromRGBValue(0x333333) forState:UIControlStateSelected];
    [rightButton setTitleColor:UIColorFromRGBValue(0x333333) forState:UIControlStateSelected];
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
    leftButton.imageView.contentMode = UIViewContentModeCenter;
    rightButton.imageView.contentMode = UIViewContentModeCenter;
    [leftButton setImage:[UIImage imageNamed:@"recharge_unselected"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"recharge_selected"] forState:UIControlStateSelected];
    [rightButton setImage:[UIImage imageNamed:@"rollout_unselected"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"rollout_selected"] forState:UIControlStateSelected];
    [leftButton setTitleColor:UIColorFromRGBValue(0x979AA1) forState:UIControlStateNormal];
    [rightButton setTitleColor:UIColorFromRGBValue(0x979AA1) forState:UIControlStateNormal];
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [leftButton addTarget:self action:@selector(chargeMoney:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(rolloutMoney:) forControlEvents:UIControlEventTouchUpInside];
    _line = [UILabel new];
    _line.backgroundColor = UIColorFromRGBValue(0x333333);
    [view addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.selectedIndex == 0 ? leftButton.mas_centerX : rightButton.mas_centerX);
        make.bottom.equalTo(view);
        make.height.mas_equalTo(3);
        make.width.mas_equalTo(48);
    }];
    _rechargeButton = leftButton;
    _rolloutButton = rightButton;
    if (self.selectedIndex == 0) {
        leftButton.selected = YES;
    } else {
        rightButton.selected = YES;
    }
    
}

- (void)addDefaultView {
    YGBindCardView *cardView = [[NSBundle mainBundle] loadNibNamed:@"YGBindCardView" owner:nil options:nil].firstObject;
    [self.view addSubview:cardView];
    _rollView = cardView;
    [cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(44);
    }];
    
    [cardView setOnlineHandler:^{
        
    }];
    [cardView setAddBankCardHandler:^{
        [self.navigationController pushViewController:[YGBindCardViewController new] animated:YES];
    }];
}

- (void)record {
}

- (void)chargeMoney:(UIButton *)button {
    _rechargeButton.selected = YES;
    _rolloutButton.selected = NO;
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button.mas_centerX);
        make.bottom.equalTo(button.superview);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(60);
    }];
    [UIView animateWithDuration:.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    self.rollView.hidden = YES;
    self.rechargeView.hidden = NO;
    self.refreshView.hidden = NO;
    if (!self.rechargeView) {
        [self setUp];
    }
}

- (void)rolloutMoney:(UIButton *)button {
    _rechargeButton.selected = NO;
    _rolloutButton.selected = YES;
    if (!self.rollView) {
        [self addDefaultView];
    }
    self.rollView.hidden = NO;
    self.rechargeView.hidden = YES;
    self.refreshView.hidden = YES;
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button.mas_centerX);
        make.bottom.equalTo(button.superview);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(60);
    }];
//    [UIView animateWithDuration:.3 animations:^{
//        [self.view layoutIfNeeded];
//    }];
}

- (void)startAnimation {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    
    rotationAnimation.duration = 1;
    
    rotationAnimation.cumulative = YES;
    
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    [_refreshButton.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

- (void)stopAnimation {
    [_refreshButton.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)refresh {
    [self startAnimation];
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:5];
}

@end
