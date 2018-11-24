//
//  YGBindCardView.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBindCardView.h"

@interface YGBindCardView()

@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;

@end

@implementation YGBindCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)bindCard:(id)sender {
    if (self.addBankCardHandler) {
        self.addBankCardHandler();
    }
}

- (void)onlineGes {
    if (self.onlineHandler) {
        self.onlineHandler();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = DefaultBackGroundColor;
    
    self.onlineLabel.userInteractionEnabled = YES;
    [self.onlineLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onlineGes)]];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"在线客服" attributes:@{NSForegroundColorAttributeName:UIColorFromRGBValue(0xE9A400),NSFontAttributeName:[UIFont systemFontOfSize:12],NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    [self.onlineLabel setAttributedText:attString];
    
}

@end
