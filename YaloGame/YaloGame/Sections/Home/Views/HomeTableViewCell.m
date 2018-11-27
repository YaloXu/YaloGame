//
//  HomeTableViewCell.m
//  YaloGame
//
//  Created by maomao on 2018/11/19.
//  Copyright © 2018年 C. All rights reserved.
//

#import "HomeTableViewCell.h"
@interface HomeTableViewCell ()
//@property (nonatomic , strong) UIImageView *myImage;
@end
@implementation HomeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.myImage];
        [self.myImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.mas_offset(kSpace/2);
            make.right.equalTo(self.mas_right).with.mas_offset(-kSpace/2);
            make.top.bottom.equalTo(self);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UIImageView *)myImage{
    if (!_myImage) {
        _myImage = [[UIImageView alloc]init];
        _myImage.layer.masksToBounds = YES;
        _myImage.layer.cornerRadius = 10.0f;
        _myImage.contentMode = UIViewContentModeScaleAspectFit;
//        _myImage.clipsToBounds = YES;
//        _myImage.image = [UIImage imageWithColor:[UIColor lightGrayColor]];
    }
    return _myImage;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
