//
//  YGBankViewController.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"
#import "YGBankInfo.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YGBankManagerType) {
    YGBankManagerType_Add,
    YGBankManagerType_Cancel
};

@interface YGBankViewController : YGBaseViewController

@property (nonatomic, assign) YGBankManagerType managerType;

@property (nonatomic, copy) void (^(didSelectedBankHandler))(YGBankInfo *bankInfo);

@end

NS_ASSUME_NONNULL_END
