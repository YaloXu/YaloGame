//
//  YGLoadingTools.m
//  YaloGame
//
//  Created by C on 2018/12/11.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGLoadingTools.h"
#import "DMProgressHUD.h"

@implementation YGLoadingTools

static DMProgressHUD *progressHUD;

+ (void)beginLoading {
    if (progressHUD) {
        return;
    }
   progressHUD = [DMProgressHUD showLoadingHUDAddedTo:[YGCommon topViewController].view];
}

+ (void)endLoading {
    if (progressHUD) {
        [progressHUD dismiss];
        progressHUD = nil;
    }
}

@end
