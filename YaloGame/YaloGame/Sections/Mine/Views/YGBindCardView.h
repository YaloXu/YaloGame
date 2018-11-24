//
//  YGBindCardView.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGBindCardView : UIView

@property (nonatomic, copy) void (^addBankCardHandler)(void);

@property (nonatomic, copy) void (^onlineHandler)(void);

@end

NS_ASSUME_NONNULL_END
