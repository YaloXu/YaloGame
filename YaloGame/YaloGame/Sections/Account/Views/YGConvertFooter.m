//
//  YGConvertFooter.m
//  YaloGame
//
//  Created by maomao on 2018/12/7.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGConvertFooter.h"
@interface YGConvertFooter()
@property (nonatomic , strong) UIButton  * addBtn;
@property (nonatomic , strong) UIButton  * reduceBtn;
@property (nonatomic , strong) UILabel   * goodsName;
@property (nonatomic , strong) UILabel   * goodsNum;
@property (nonatomic , strong) UIView    * line;

@end
@implementation YGConvertFooter
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.line];
        [self addSubview:self.addBtn];
        [self addSubview:self.reduceBtn];
        [self addSubview:self.goodsName];
        [self addSubview:self.goodsNum];
        [self initUI];
    }
    return self;
}
-(void)initUI{
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.mas_equalTo(-kSpace);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.goodsNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addBtn.mas_centerY);
        make.right.equalTo(self.addBtn.mas_left).with.mas_offset(-5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(5);
    }];
    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.goodsNum.mas_left).with.mas_offset(-5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kSpace);
        make.centerY.equalTo(self.addBtn.mas_centerY);
        make.right.equalTo(self.reduceBtn.mas_left).with.mas_offset(-kSpace);
        make.height.mas_equalTo(20);
    }];
}
-(void)changeNumber:(UIButton *)btn{
    switch (btn.tag-110) {
        case 0:
            {
                _goodsNum.text = [NSString stringWithFormat:@"%ld",_goodsNum.text.integerValue +1];
                NSString *string = _goodsNum.text;
                [self.goodsNum mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo([YGStringUtils sizeWithText:string withFont:[UIFont systemFontOfSize:16]].width+2);
                }];
            }
            break;
        case 1:
        {
            if (_goodsNum.text.integerValue>0) {
                _goodsNum.text = [NSString stringWithFormat:@"%ld",_goodsNum.text.integerValue -1];
                NSString *string = _goodsNum.text;
                [self.goodsNum mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo([YGStringUtils sizeWithText:string withFont:[UIFont systemFontOfSize:16]].width+2);
                }];
            }
        }
            break;
            
        default:
            break;
    }
}
-(UILabel *)goodsName{
    if (!_goodsName) {
        _goodsName = [[UILabel alloc]init];
        _goodsName.font = [UIFont systemFontOfSize:16];
        _goodsName.textColor = UIColorFromRGBValue(0x333333);
        _goodsName.text = @"总需兑换金币：270";
    }
    return _goodsName;
}
-(UILabel *)goodsNum{
    if (!_goodsNum) {
        _goodsNum = [[UILabel alloc]init];
        _goodsNum.font = [UIFont systemFontOfSize:16];
        _goodsNum.textColor = UIColorFromRGBValue(0x333333);
        _goodsNum.text = @"1";
    }
    return _goodsNum;
}
-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.tag = 110;
        [_addBtn setImage:[UIImage imageNamed:@"change_add"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(changeNumber:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}
-(UIButton *)reduceBtn{
    if (!_reduceBtn) {
        _reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _reduceBtn.tag = 111;
        [_reduceBtn setImage:[UIImage imageNamed:@"change_reduce"] forState:UIControlStateNormal];
        [_reduceBtn addTarget:self action:@selector(changeNumber:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reduceBtn;
}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = kLineColor;
    }
    return _line;
}
@end
