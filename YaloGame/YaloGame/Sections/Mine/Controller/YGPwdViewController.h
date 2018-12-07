//
//  YGPwdViewController.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YGSetPwdType) {
    YGSetPwdType_login      = 0,
    YGSetPwdType_Pay
    
};

@interface YGPwdViewController : YGBaseViewController

@property (nonatomic, assign) YGSetPwdType pwdType;

@end

NS_ASSUME_NONNULL_END
