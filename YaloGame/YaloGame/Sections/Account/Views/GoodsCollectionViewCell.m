//
//  GoodsCollectionViewCell.m
//  YaloGame
//
//  Created by 毛亚恒 on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "GoodsCollectionViewCell.h"
@interface GoodsCollectionViewCell()
@property (nonatomic , strong) UILabel     *goodsName;
@property (nonatomic , strong) UILabel     *goodsPrice;
@property (nonatomic , strong) UILabel     *goodsVipPrice;
@property (nonatomic , strong) UIButton    *convertBtn;
@end
@implementation GoodsCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.goodsImg];
        [self addSubview:self.goodsName];
        [self addSubview:self.goodsPrice];
        [self addSubview:self.goodsVipPrice];
        [self addSubview:self.convertBtn];
        [self.goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.mas_equalTo((kScreenWidth - 2*kSpace -2*20)/4);
        }];
        [self.goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodsImg.mas_left);
            make.right.equalTo(self.goodsImg.mas_right);
            make.top.equalTo(self.goodsImg.mas_bottom).with.mas_offset(5);
            make.height.mas_equalTo(15);
        }];
        [self.goodsPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodsImg.mas_left);
            make.right.equalTo(self.goodsImg.mas_right);
            make.top.equalTo(self.goodsName.mas_bottom).with.mas_offset(5);
            make.height.mas_equalTo(10);
        }];
        [self.goodsVipPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodsImg.mas_left);
            make.right.equalTo(self.goodsImg.mas_right);
            make.top.equalTo(self.goodsPrice.mas_bottom).with.mas_offset(5);
            make.height.mas_equalTo(12);
        }];
        [self.convertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodsImg.mas_left).with.mas_offset(10);
            make.right.equalTo(self.goodsImg.mas_right).with.mas_offset(-10);
            make.top.equalTo(self.goodsVipPrice.mas_bottom).with.mas_offset(15);
            make.height.mas_equalTo(30);
        }];
        
    }
    return self;
}
-(void)chooseGoodsEvent{
    if (self.selectedGood) {
        self.selectedGood();
    }
}
-(UIImageView *)goodsImg{
    if (!_goodsImg) {
        _goodsImg = [[UIImageView alloc]init];
        _goodsImg.image = [UIImage imageWithColor:[UIColor lightGrayColor]];
    }
    return _goodsImg;
}
-(UILabel *)goodsName{
    if (!_goodsName) {
        _goodsName = [[UILabel alloc]init];
        _goodsName.font = [UIFont systemFontOfSize:15];
        _goodsName.textColor = kSecondaryFontColor;
        _goodsName.text = @"现金筹码10元";
    }
    return _goodsName;
}
-(UILabel *)goodsPrice{
    if (!_goodsPrice) {
        _goodsPrice = [[UILabel alloc]init];
        _goodsPrice.font = [UIFont systemFontOfSize:10];
        _goodsPrice.textColor = kSecondaryFontColor;
        _goodsPrice.text = @"价值：10元";
    }
    return _goodsPrice;
}
-(UILabel *)goodsVipPrice{
    if (!_goodsVipPrice) {
        _goodsVipPrice = [[UILabel alloc]init];
        _goodsVipPrice.font = [UIFont systemFontOfSize:12];
        _goodsVipPrice.textColor = kSecondaryFontColor;
        _goodsVipPrice.text = @"普通会员：333金币";
    }
    return _goodsVipPrice;
}
-(UIButton *)convertBtn{
    if (!_convertBtn) {
        _convertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _convertBtn.layer.masksToBounds = YES;
        _convertBtn.layer.cornerRadius = 3.0f;
        _convertBtn.backgroundColor = UIColorFromRGBValue(0x333333);
        _convertBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_convertBtn setTitle:@"兑换商品" forState: UIControlStateNormal];
        [_convertBtn setTitle:@"兑换商品" forState: UIControlStateSelected];
        [_convertBtn setTitle:@"兑换商品" forState: UIControlStateHighlighted];
        [_convertBtn setTitleColor:NavgationTitleColor forState:UIControlStateNormal];
        [_convertBtn setTitleColor:NavgationTitleColor forState:UIControlStateSelected];
        [_convertBtn setTitleColor:NavgationTitleColor forState:UIControlStateHighlighted];

        [_convertBtn addTarget:self action:@selector(chooseGoodsEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _convertBtn;
}
@end
