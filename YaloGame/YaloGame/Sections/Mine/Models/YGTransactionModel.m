//
//  YGTransactionModel.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGTransactionModel.h"

@implementation YGTransactionModel

- (NSString *)content {
    return @"2018年10月22日，从余额转出1000元到银行卡";
}

- (NSString *)cardNo {
    if (_cardNo) {
        return _cardNo;
    }
    NSInteger a = arc4random() % 2;
    _cardNo = a == 1 ?  @"" : @"**** **** **** **** 1234";
    return _cardNo;
}

- (BOOL)style {
    if (self.cardNo.length > 0) {
        return YES;
    }
    return NO;
}

@end
