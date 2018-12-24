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

+ (NSArray *)cardBins {
    static NSArray *array = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"checkbankcard" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            if (data) {
                NSArray *list = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                array = list;
            }
        }
    });
    return array;
}

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

+ (NSDictionary *)findCardInfoWithCardBin:(NSString *)cardbin {
    if (cardbin.length < 6) {
        return nil;
    }
    if (cardbin.length > 6) {
        cardbin = [cardbin substringToIndex:6];
    }
    NSDictionary *desD = nil;
    for (NSDictionary *dict in YGCommon.cardBins) {
        if ([dict[@"card_bin"] isEqualToString:cardbin]) {
            desD = dict;
            break;
        }
    }
    return desD;
}

@end
