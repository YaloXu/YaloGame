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

