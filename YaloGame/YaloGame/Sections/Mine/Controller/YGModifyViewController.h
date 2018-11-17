//
//  YGModifyViewController.h
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ModifyStyle) {
    ModifyStyle_NickName            = 0,
    ModifyStyle_SignName
};

@interface YGModifyViewController : YGBaseViewController

@property (nonatomic, assign) ModifyStyle modifyStyle;

@end

NS_ASSUME_NONNULL_END
