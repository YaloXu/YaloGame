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
    UIButton *_rechargeButton, *_rolloutButton, *_refreshButton;
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
    [refreshButton setBackgroundImage:[UIImage imageNamed:@"common_refresh"] forState:UIControlStateNormal];
    _refreshButton = refreshButton;
    [_refreshButton addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
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
    leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:rightButton];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
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
    leftButton.imageView.contentMode = UIViewContentModeCenter;
    rightButton.imageView.contentMode = UIViewContentModeCenter;
    [leftButton setImage:[UIImage imageNamed:@"recharge_unselected"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"recharge_selected"] forState:UIControlStateSelected];
    [rightButton setImage:[UIImage imageNamed:@"rollout_unselected"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"rollout_selected"] forState:UIControlStateSelected];
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
    _rechargeButton = leftButton;
    _rolloutButton = rightButton;
    leftButton.selected = YES;
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
}

- (void)rolloutMoney:(UIButton *)button {
    _rechargeButton.selected = NO;
    _rolloutButton.selected = YES;
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
