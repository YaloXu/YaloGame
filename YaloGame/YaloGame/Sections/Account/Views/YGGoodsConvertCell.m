//
//  YGGoodsConvertCell.m
//  YaloGame
//
//  Created by maomao on 2018/11/29.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGGoodsConvertCell.h"
#import "FSTextView.h"
@interface YGGoodsConvertCell ()
@property (nonatomic,strong)  UILabel  *nameLabel;
@property (nonatomic,strong)  UILabel  *goodsLabel;
@property (nonatomic , strong) FSTextView *contentTextView;

@end
@implementation YGGoodsConvertCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.nameLabel];
        if ([reuseIdentifier isEqualToString:YGGoodsConvertCellLabelId]) {
            [self addSubview:self.goodsLabel];
            
        }
        else if([reuseIdentifier isEqualToString:YGGoodsConvertCellTextId]){
            [self addSubview:self.contentTextView];
        }
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)goodsLabel{
    if (!_goodsLabel) {
        _goodsLabel = [[UILabel alloc]init];
        _goodsLabel.font = [UIFont systemFontOfSize:16];
        _goodsLabel.textColor = UIColorFromRGBValue(0x979aa1);
    }
    return _goodsLabel;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textColor = UIColorFromRGBValue(0x333333);
    }
    return _nameLabel;
}
-(FSTextView *)contentTextView{
    if (!_contentTextView) {
        _contentTextView = [FSTextView textView];
        _contentTextView.borderWidth = 1.f;
        _contentTextView.borderColor = kLineColor;
//        _contentTextView.placeholder = @"*******1234";
        _contentTextView.canPerformAction = NO;
        _contentTextView.placeholderFont = [UIFont systemFontOfSize:10];
        _contentTextView.font = [UIFont systemFontOfSize:10];
    }
    return _contentTextView;
}
@end
