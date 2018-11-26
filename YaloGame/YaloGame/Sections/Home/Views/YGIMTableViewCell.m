//
//  YGIMTableViewCell.m
//  YaloGame
//
//  Created by maomao on 2018/11/26.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGIMTableViewCell.h"
@interface YGIMTableViewCell()

@end
@implementation YGIMTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if ([reuseIdentifier isEqualToString:YGIMTitleCellId]) {
            [self addSubview:self.boldLabel];
            [self addSubview:self.phoneTextView];
            [self addSubview:self.ModyfierBtn];
            [self addSubview:self.callBtn];
            self.phoneTextView.hidden = YES;
            self.callBtn.hidden = YES;
            self.ModyfierBtn.hidden = YES;
            [self.boldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];
        }else if ([reuseIdentifier isEqualToString:YGIMImgCellId]){
            [self addSubview:self.themeLabel];
            [self addSubview:self.themeImg];
            [self.themeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];
            [self.themeImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.themeLabel.mas_left).with.mas_equalTo(-3);
                make.centerY.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(16, 16));
            }];
        }
    }
    return self;
}
-(void)updateSection{
    self.boldLabel.hidden = YES;
    self.phoneTextView.hidden = NO;
    self.callBtn.hidden = NO;
    self.ModyfierBtn.hidden = NO;
    
    [self.callBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(54, 24));
        make.right.equalTo(self.mas_right).with.mas_equalTo(-49);
    }];
    [self.ModyfierBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(54, 24));
        make.right.equalTo(self.callBtn.mas_left).with.mas_equalTo(-10);
    }];
    [self.phoneTextView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(110, 24));
        make.right.equalTo(self.ModyfierBtn.mas_left).with.mas_equalTo(-12);
    }];
}
-(void)callPhone:(UIButton*)btn{
    if (self.callBackPhone) {
        self.callBackPhone();
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
-(UILabel *)boldLabel{
    if (!_boldLabel) {
        _boldLabel = [[UILabel alloc]init];
        _boldLabel.textColor = UIColorFromRGBValue(0x333333);
        _boldLabel.font = [UIFont systemFontOfSize:16];
        _boldLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _boldLabel;
}
-(UIImageView *)themeImg{
    if (!_themeImg) {
        _themeImg = [[UIImageView alloc]init];
    }
    return _themeImg;
}
-(UILabel *)themeLabel{
    if (!_themeLabel) {
        _themeLabel = [[UILabel alloc]init];
        _themeLabel.textColor = UIColorFromRGBValue(0x333333);
        _themeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _themeLabel;
}
-(UIButton *)ModyfierBtn{
    if (!_ModyfierBtn) {
        _ModyfierBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _ModyfierBtn.layer.masksToBounds = YES;
        _ModyfierBtn.layer.cornerRadius = 5.0f;
        _ModyfierBtn.backgroundColor = UIColorFromRGBValue(0x333333);
        _ModyfierBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_ModyfierBtn setTitle:@"修改" forState:UIControlStateNormal];
        [_ModyfierBtn setTitle:@"修改" forState:UIControlStateSelected];
        [_ModyfierBtn setTitle:@"修改" forState:UIControlStateHighlighted];
        
        [_ModyfierBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_ModyfierBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_ModyfierBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    }
    return _ModyfierBtn;
}
-(UIButton *)callBtn{
    if (!_callBtn) {
        _callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _callBtn.layer.masksToBounds = YES;
        _callBtn.layer.cornerRadius = 5.0f;
        _callBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _callBtn.backgroundColor = UIColorFromRGBValue(0x333333);
        [_callBtn setTitle:@"回拨" forState:UIControlStateNormal];
        [_callBtn setTitle:@"回拨" forState:UIControlStateSelected];
        [_callBtn setTitle:@"回拨" forState:UIControlStateHighlighted];
        [_callBtn addTarget:self action:@selector(callPhone:) forControlEvents:UIControlEventTouchUpInside];
        [_callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
    }
    return _callBtn;
}
-(FSTextView *)phoneTextView{
    if (!_phoneTextView) {
        _phoneTextView = [FSTextView textView];
        _phoneTextView.borderWidth = 1.f;
        _phoneTextView.borderColor = kLineColor;
        _phoneTextView.placeholder = @"*******1234";
        _phoneTextView.canPerformAction = NO;
        _phoneTextView.placeholderFont = [UIFont systemFontOfSize:11];
        _phoneTextView.font = [UIFont systemFontOfSize:11];
    }
    return _phoneTextView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
