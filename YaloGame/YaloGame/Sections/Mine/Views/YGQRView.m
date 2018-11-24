//
//  YGQRView.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGQRView.h"

@interface YGQRView()

@property (nonatomic, strong) UIButton *closeButton, *closeButton1;

@property (nonatomic,  strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation YGQRView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _closeButton.backgroundColor = UIColorFromRGBValue(0x333333);
    [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    _closeButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.closeButton];
    _closeButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton1 setImage:[UIImage imageNamed:@"qr_close"] forState:UIControlStateNormal];
   
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
     [self addSubview:self.closeButton1];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.textColor = UIColorFromRGBValue(0x333333);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(56);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    [self.closeButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.closeButton1 addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setQrtype:(YGQRType)qrtype {
    _qrtype = qrtype;
    self.titleLabel.text = _qrtype == YGQRType_AliPay ? @"打开支付宝扫一扫" : @"银联扫码";
    self.imageView.image = [UIImage imageNamed:@"qr_alipay"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    layer.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), CGRectGetWidth(self.frame), 1);
    [self.layer addSublayer:layer];
}

- (void)close {
    if (self.closeHandler) {
        self.closeHandler();
    }
}

@end
