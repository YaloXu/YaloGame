//
//  YGMineHeaderView.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMineHeaderView.h"

@interface YGMineHeaderView() {
    
    UIImageView *_bgImageView, *_avaImageView;
    UILabel *_IDLabel, *_signlabel;
    UIButton *_editButton;
    UILabel *_moneyLaebl, *_acountLabel;
}

@end

@implementation YGMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _bgImageView = [UIImageView new];
    [self addSubview:_bgImageView];
    _avaImageView = [UIImageView new];
    [self addSubview:_avaImageView];
    _IDLabel = [UILabel new];
    _signlabel = [UILabel new];
    _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moneyLaebl = [UILabel new];
    _acountLabel = [UILabel new];
    [self addSubview:_IDLabel];
    [self addSubview:_signlabel];
    [self addSubview:_editButton];
    UIView *view = [UIView new];
    [self addSubview:view];
    [view addSubview:_moneyLaebl];
    [view addSubview:_acountLabel];
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(@(-50));
    }];
    [_avaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(@30);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaImageView.mas_right).with.offset(10);
        make.top.equalTo(_avaImageView).with.offset(5);
        make.right.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    [_signlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_IDLabel);
        make.top.equalTo(_IDLabel.mas_bottom).with.offset(5);
        make.height.mas_equalTo(20);
    }];
    [_editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avaImageView.mas_centerY);
        make.right.equalTo(@(-15));
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(@(15));
        make.right.equalTo(@(-15));
        make.height.mas_equalTo(90);
    }];
    [_moneyLaebl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(@10);
        make.height.mas_equalTo(30);
    }];
    [_acountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.height.equalTo(@30);
        make.bottom.equalTo(@(-10));
    }];
    _acountLabel.textAlignment = _moneyLaebl.textAlignment = NSTextAlignmentCenter;
    _acountLabel.text = @"主账户余额（¥）";
    _moneyLaebl.text = @"0.00";
    [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
    _IDLabel.text = @"a12121212";
    _signlabel.text = @"暂无签名";
    _avaImageView.backgroundColor = [UIColor redColor];
    _bgImageView.backgroundColor = [UIColor yellowColor];
    [_editButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpOutside];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}

- (void)edit {
    if (self.editHandler) {
        self.editHandler();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
