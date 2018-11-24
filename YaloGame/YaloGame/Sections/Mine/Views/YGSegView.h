//
//  YGSegView.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGSegView : UIView

@property (nonatomic, copy) void (^alipay)(void);

@property (nonatomic, copy) void (^unionPay)(void);

@property (nonatomic, copy) void (^bankPay)(void);

@end

NS_ASSUME_NONNULL_END
