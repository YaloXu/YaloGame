//
//  YGAlertTool.h
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGAlertTool : NSObject

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
           confirm:(NSString *)confirm
         container:(UIViewController *)container
    confirmHandler:(void (^)(void))confirmHandler
            cancel:(NSString *)cancel
     cancelHandler:(void(^)(void))cancelHandler;

@end

NS_ASSUME_NONNULL_END
