//
//  YGBankTableViewCell.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankTableViewCell.h"

@interface YGBankTableViewCell() {
    
}
@property (weak, nonatomic) IBOutlet UILabel *bankTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *bankNameLabel;

@end

@implementation YGBankTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
}
- (IBAction)close:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
