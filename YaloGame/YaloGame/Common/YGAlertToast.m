//
//  YGAlertToast.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAlertToast.h"
#import "MBProgressHUD.h"

@implementation YGAlertToast

+ (void)showMessage:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [[YGCommon topViewController] presentViewController:controller animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [controller dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

+ (void)showHUDMessage:(NSString *)message {
    if (!YGUtils.validString(message)) {
        return;
    }
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideHUDForView:window animated:NO];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode                      = MBProgressHUDModeText;
    hud.labelText                = message;
    hud.animationType             = MBProgressHUDAnimationZoom;
    hud.userInteractionEnabled    = NO;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}


@end
