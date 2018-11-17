//
//  YGAlertTool.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAlertTool.h"

@implementation YGAlertTool

+ (void)alertTitle:(NSString *)title
           message:(NSString *)message
           confirm:(NSString *)confirm
         container:(UIViewController *)container
    confirmHandler:(void (^)(void))confirmHandler
            cancel:(NSString *)cancel
     cancelHandler:(void(^)(void))cancelHandler {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (YGUtils.validString(confirm)) {
        UIAlertAction *confirmA = [UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirmHandler) {
                confirmHandler();
            }
        }];
        [controller addAction:confirmA];
    }
    if (YGUtils.validString(cancel)) {
        UIAlertAction *cancelA = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelHandler) {
                cancelHandler();
            }
        }];
        [controller addAction:cancelA];
    }
    [controller presentViewController:controller animated:YES completion:nil];
}

@end
