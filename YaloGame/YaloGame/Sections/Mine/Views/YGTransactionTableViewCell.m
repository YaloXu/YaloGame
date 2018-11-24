//
//  YGTransactionTableViewCell.m
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGTransactionTableViewCell.h"
#import "UITableViewCell+Arrow.h"

@interface YGTransactionTableViewCell()
@end

@implementation YGTransactionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.customArrow = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateLayout:(BOOL)update {
    if (update) {
        self.iconImageView.image = [UIImage imageNamed:@"message_add"];
        [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.top.bottom.equalTo(self);
            make.right.equalTo(@(-15));
        }];
        self.cardLabel.hidden = YES;
    } else {
        self.iconImageView.image = [UIImage imageNamed:@"message_rel"];
        self.cardLabel.hidden = NO;
        [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).with.offset(10);
            make.top.equalTo(@(5));
            make.right.equalTo(@(-16));
            make.bottom.equalTo(self.cardLabel.mas_top).offset(5);
        }];
        [self.cardLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(@(-5));
            make.right.equalTo(@(-10));

        }];
    }
}

@end
