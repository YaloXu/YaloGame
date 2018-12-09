//
//  YGRolloutView.m
//  YaloGame
//
//  Created by C on 2018/12/9.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGRolloutView.h"

@interface YGRolloutView()

@property (weak, nonatomic) IBOutlet UILabel *cardInfo;

@property (weak, nonatomic) IBOutlet UITextField *moneyTF;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@property (weak, nonatomic) IBOutlet UIButton *rolloutButton;

@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;

@end

@implementation YGRolloutView

- (IBAction)rolloutClick:(id)sender {
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setOnline];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CALayer *layer = [CALayer layer];
    [self.layer addSublayer:layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    layer.frame = CGRectMake(CGRectGetMinX(self.moneyTF.frame), CGRectGetMaxY(self.moneyTF.frame) - 1, CGRectGetWidth(self.moneyTF.frame), 1);
    
    CALayer *layer1 = [CALayer layer];
    [self.layer addSublayer:layer1];
    layer1.backgroundColor = DefaultBackGroundColor.CGColor;
    layer1.frame = CGRectMake(CGRectGetMinX(self.pwdTF.frame), CGRectGetMaxY(self.pwdTF.frame) - 1, CGRectGetWidth(self.pwdTF.frame), 1);
    
    
}

- (void)setOnline {
    self.onlineLabel.userInteractionEnabled = YES;
    [self.onlineLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onlineGes)]];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"在线客服" attributes:@{NSForegroundColorAttributeName:UIColorFromRGBValue(0xE9A400),NSFontAttributeName:[UIFont systemFontOfSize:12],NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    [self.onlineLabel setAttributedText:attString];
}

- (void)onlineGes {
    
}

@end
