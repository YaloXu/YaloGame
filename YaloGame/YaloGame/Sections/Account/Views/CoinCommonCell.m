//
//  CoinCommonCell.m
//  YaloGame
//
//  Created by maomao on 2018/11/27.
//  Copyright © 2018年 C. All rights reserved.
//

#import "CoinCommonCell.h"

@implementation CoinCommonCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if ([reuseIdentifier isEqualToString:CoinCommonOnlyLabelId]) {
            [self addSubview:self.contentLabel];
            [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.equalTo(self);
            }];
        }
        else if([reuseIdentifier isEqualToString:CoinCommonLabelAndTextViewId]){
            
        }
    }
    return self;
}
-(void)setVerticalStyle:(VerticalAlignment)verticalStyle{
    _verticalStyle = verticalStyle;
    if (verticalStyle == 1) {
        
        [self.contentLabel setAttributedText:[YGStringUtils setAttributedString:self.contentLabel.text lineSpace:2 attributes1:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333)} range1:[self.contentLabel.text rangeOfString:@"普通会员"] attributes2:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333)} range2:[self.contentLabel.text rangeOfString:@"星级 VIP"] attributes3:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333)} range3:[self.contentLabel.text rangeOfString:@"白金 VIP"] attributes4:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333)} range4:[self.contentLabel.text rangeOfString:@"钻石 VIP"] attributes5:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333)} range5:[self.contentLabel.text rangeOfString:@"至尊 VIP"]]];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
    }else{
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = UIColorFromRGBValue(0x979aa1);
    }
    return _contentLabel;
}
@end
