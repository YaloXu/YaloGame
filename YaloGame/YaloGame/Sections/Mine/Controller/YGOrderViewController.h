//
//  YGOrderViewController.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGOrderViewController : YGBaseViewController


/**
 0:获取所有的交易记录
 1:充值激励
 2:提现记录
 */
@property (nonatomic, assign) NSInteger transactionType;

@end

NS_ASSUME_NONNULL_END
