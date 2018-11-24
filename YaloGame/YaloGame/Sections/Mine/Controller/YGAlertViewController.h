//
//  YGAlertViewController.h
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"
#import "YGQRView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGAlertViewController : YGBaseViewController

+ (void)alertViewWithQRType:(YGQRType)qrtype fromVC:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
