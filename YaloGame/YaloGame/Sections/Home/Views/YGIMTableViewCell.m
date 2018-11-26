//
//  YGIMTableViewCell.m
//  YaloGame
//
//  Created by maomao on 2018/11/26.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGIMTableViewCell.h"
@interface YGIMTableViewCell()
@property (nonatomic , strong) UILabel     *boldLabel;
@property (nonatomic , strong) UIImageView *themeImg;
@property (nonatomic , strong) UILabel     *themeLabel;
@property (nonatomic , strong) UITextField *phoneTextField;
@property (nonatomic , strong) UIButton    *ModyfierBtn;
@property (nonatomic , strong) UIButton    *callBtn;
@end
@implementation YGIMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
