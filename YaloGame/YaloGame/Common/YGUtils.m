//
//  YGUtils.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGUtils.h"

static BOOL validString(NSString *string) {
    return (string && [string isKindOfClass:[NSString class]] && string.length > 0);
}

static BOOL validArray(NSArray *array) {
    return (array && [array isKindOfClass:[NSArray class]] && array.count > 0);
}

static BOOL validDictionary(NSDictionary *dictionary) {
    return (dictionary && [dictionary isKindOfClass:[NSDictionary class]] && dictionary.count > 0);
}

static NSURL *URLFromString(NSString *urlStr) {
    if (YGUtils.validString(urlStr)) {
        return [NSURL URLWithString:[urlStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    }
    return nil;
}


YGUtils_t YGUtils = {
    validString,
    validArray,
    validDictionary,
    URLFromString
};

@implementation YGCommon

+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self topViewController:[[UIApplication sharedApplication].delegate.window rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self topViewController:resultVC.presentedViewController];
    }
    
    return resultVC;
}
+ (UIViewController *)topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
}

@end
