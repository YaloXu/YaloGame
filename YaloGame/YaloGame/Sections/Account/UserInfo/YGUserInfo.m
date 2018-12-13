//
//  YGUserInfo.m
//  YaloGame
//
//  Created by C on 2018/12/7.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGUserInfo.h"

@implementation YGUserInfo

+ (instancetype)sharedInstance {
    static YGUserInfo *userInfo = nil;
    static dispatch_once_t once;
    _dispatch_once(&once, ^{
        userInfo = [[self alloc] init];
    });
    return userInfo;
}

- (void)parseToken:(NSDictionary *)dict {
    self.token = dict[@"token"];
    self.uid = [dict[@"uid"] integerValue];
}

@end
