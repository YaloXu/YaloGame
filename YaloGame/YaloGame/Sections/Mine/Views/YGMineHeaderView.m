//
//  YGMineHeaderView.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMineHeaderView.h"
#import "UIImageView+WebCache.h"

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
        self.backgroundColor = DefaultBackGroundColor;
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_header_bg"]];
    [self addSubview:_bgImageView];
    _avaImageView = [UIImageView new];
    _avaImageView.layer.masksToBounds = YES;
    _avaImageView.layer.cornerRadius = 30;
    [self addSubview:_avaImageView];
    _IDLabel = [UILabel new];
    _IDLabel.textColor = UIColorFromRGBValue(0xffffff);
    _signlabel = [UILabel new];
    _signlabel.textColor = UIColorFromRGBValue(0xffffff);
    _IDLabel.font = [UIFont systemFontOfSize:16];
    _signlabel.font = [UIFont systemFontOfSize:12];
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
        make.height.mas_equalTo(226);
    }];
    [_avaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@93);
        make.left.equalTo(@28);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [_IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaImageView.mas_right).with.offset(15);
        make.top.equalTo(_avaImageView).with.offset(9);
        make.right.equalTo(self);
        make.height.mas_equalTo(22);
    }];
    [_signlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_IDLabel);
        make.top.equalTo(_IDLabel.mas_bottom).with.offset(3);
        make.height.mas_equalTo(17);
    }];
    [_editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avaImageView.mas_centerY);
        make.right.equalTo(@(-22));
        make.size.mas_equalTo(CGSizeMake(40, 22));
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(@(16));
        make.right.equalTo(@(-16));
        make.height.mas_equalTo(72);
    }];
    [_moneyLaebl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.top.equalTo(@13);
        make.height.mas_equalTo(26);
    }];
    [_acountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(view);
        make.height.equalTo(@16);
        make.top.equalTo(_moneyLaebl.mas_bottom).offset(11);
    }];
    _acountLabel.textAlignment = _moneyLaebl.textAlignment = NSTextAlignmentCenter;
    _acountLabel.text = @"主账户余额（¥）";
    _acountLabel.font = [UIFont systemFontOfSize:11];
    _acountLabel.textColor = UIColorFromRGBValue(0x333333);
    _moneyLaebl.font = [UIFont systemFontOfSize:17];
    _moneyLaebl.textColor = UIColorFromRGBValue(0xECB728);
    _moneyLaebl.text = @"0.00";
    [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
    _editButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _IDLabel.text = @"a12121212";
    _signlabel.text = @"暂无签名";
    _avaImageView.backgroundColor = [UIColor redColor];
    _bgImageView.backgroundColor = [UIColor yellowColor];
    [_editButton addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}

- (void)edit {
    if (self.editHandler) {
        self.editHandler();
    }
}

- (void)refreshData {
    _moneyLaebl.text = YGUserInfo.defaultInstance.money;
    [_avaImageView sd_setImageWithURL:[NSURL URLWithString:YGUserInfo.defaultInstance.avatar_url] placeholderImage:[UIImage imageNamed:@"user_ava"]];
    YGUserInfo *useInfo = YGUserInfo.defaultInstance;
    _IDLabel.text = YGUtils.validString(useInfo.nickName) ? useInfo.nickName : @"没有返回数据";
    _signlabel.text = YGUtils.validString(YGUserInfo.defaultInstance.gxqm) ? YGUserInfo.defaultInstance.gxqm : @"暂无签名";
}
@end
