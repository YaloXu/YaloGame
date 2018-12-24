//
//  YGRolloutView.h
//  YaloGame
//
//  Created by C on 2018/12/9.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGBankInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGRolloutView : UIView

@property (nonatomic, strong) YGBankInfo *bankInfo;

@property (nonatomic, copy) void (^(rolloutHandler))(NSString *pwd, NSString *money);

@property (nonatomic, copy) void (^(changeCardInfoHandler))(void);

@end

NS_ASSUME_NONNULL_END
