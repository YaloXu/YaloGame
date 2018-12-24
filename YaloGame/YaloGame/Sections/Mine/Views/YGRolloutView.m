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
    BLOCK(self.rolloutHandler,self.pwdTF.text, self.moneyTF.text);
}

- (void)setBankInfo:(YGBankInfo *)bankInfo {
    _bankInfo = bankInfo;
    self.cardInfo.text =[NSString stringWithFormat:@"%@(%@)",_bankInfo.des,[_bankInfo.bankNum substringFromIndex:_bankInfo.bankNum.length - 4]];
}

- (void)changeCardInfo {
    BLOCK(self.changeCardInfoHandler);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = DefaultBackGroundColor;
    [self.cardInfo addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeCardInfo)]];
    [self setOnline];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CALayer *layer = [CALayer layer];
    [self.moneyTF.layer addSublayer:layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    layer.frame = CGRectMake(0, CGRectGetHeight(self.moneyTF.frame)-0.5, CGRectGetWidth(self.moneyTF.frame), 0.5);
    
    CALayer *layer1 = [CALayer layer];
    [self.pwdTF.layer addSublayer:layer1];
    layer1.backgroundColor = DefaultBackGroundColor.CGColor;
    layer1.frame = CGRectMake(0, CGRectGetHeight(self.pwdTF.frame) - 0.5, CGRectGetWidth(self.pwdTF.frame), 0.5);
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
