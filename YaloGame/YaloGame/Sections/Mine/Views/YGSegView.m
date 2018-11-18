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

@property (weak, nonatomic) IBOutlet UILabel *unionLabel;

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
    layer.backgroundColor = UIColor.blackColor.CGColor;
    layer.frame = CGRectMake(0, 40, kScreenWidth, 1);
    [self.layer addSublayer:layer];
    self.zhifubaoLabel.userInteractionEnabled = YES;
    self.unionLabel.userInteractionEnabled = YES;
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

@end
