//
//  YGTransactionTableViewCell.m
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGTransactionTableViewCell.h"

@interface YGTransactionTableViewCell()



@end

@implementation YGTransactionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateLayout:(BOOL)update {
    if (update) {
        [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.top.bottom.equalTo(self);
            make.right.equalTo(@(-15));
        }];
        self.cardLabel.hidden = YES;
    } else {
        self.cardLabel.hidden = NO;
        [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.top.equalTo(@(10));
            make.right.equalTo(@(-15));
            make.bottom.equalTo(self.cardLabel.mas_top).with.offset(-10);
        }];
        [self.cardLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(@(-10));
            make.right.equalTo(@(-10));
            make.height.mas_greaterThanOrEqualTo(10);
        }];
    }
}

@end
