//
//  YGMessageTableViewCell.m
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMessageTableViewCell.h"

@interface YGMessageTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation YGMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dateLabel.text = @"2018-11-11";
    
}

- (void)setModel:(YGMessageModel *)model {
    _model = model;
    self.titleLabel.text = _model.title;
    self.contentLabel.text = _model.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
