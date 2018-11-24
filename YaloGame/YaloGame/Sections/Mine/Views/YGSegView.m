//
//  YGSegView.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGSegView.h"


@interface YGSegView()
@property (weak, nonatomic) IBOutlet UILabel *zhifubaoLabel;
@property (weak, nonatomic) IBOutlet UIButton *alipayButton;
@property (weak, nonatomic) IBOutlet UIButton *unionButton;
@property (weak, nonatomic) IBOutlet UIButton *bankButton;

@property (weak, nonatomic) IBOutlet UILabel *unionLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankLabel;

@end

@implementation YGSegView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = UIColorFromRGBValue(0x000000).CGColor;
    layer.frame = CGRectMake(0, 36, kScreenWidth, 1);
    [self.layer addSublayer:layer];
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = UIColorFromRGBValue(0x000000).CGColor;
    layer1.frame = CGRectMake(0, 36 * 2, kScreenWidth, 1);
    [self.layer addSublayer:layer1];
    self.zhifubaoLabel.userInteractionEnabled = YES;
    self.unionLabel.userInteractionEnabled = YES;
    self.bankLabel.userInteractionEnabled = YES;
    [self.bankLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bankGesture)]];
    [self.zhifubaoLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(alipayTap)]];
    [self.unionLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(unionPayTap)]];
}

- (void)alipayTap {
    if (self.alipay) {
        self.alipay();
    }
}

- (void)unionPayTap {
    if (self.unionPay) {
        self.unionPay();
    }
}

- (void)bankGesture {
    if (self.bankPay) {
        self.bankPay();
    }
}
- (IBAction)alipayAction:(id)sender {
}
- (IBAction)unionAction:(id)sender {
}
- (IBAction)bankAction:(id)sender {
}

@end
