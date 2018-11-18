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

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"在线客服" attributes:@{NSForegroundColorAttributeName:[UIColor yellowColor],NSFontAttributeName:[UIFont systemFontOfSize:14],NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    [self.onlineLabel setAttributedText:attString];
    
}

@end
