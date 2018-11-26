//
//  YGPopViewController.h
//  YaloGame
//
//  Created by maomao on 2018/11/26.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGBaseViewController.h"
typedef void (^callBackPhone) ();
NS_ASSUME_NONNULL_BEGIN

@interface YGPopViewController : YGBaseViewController
@property (nonatomic , copy) callBackPhone callPhone;
@end

NS_ASSUME_NONNULL_END
