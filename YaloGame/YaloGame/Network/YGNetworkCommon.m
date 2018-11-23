//
//  YGNetworkCommon.m
//  test
//
//  Created by C on 2018/11/23.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGNetworkCommon.h"



@implementation YGNetworkCommon

+ (void)login:(NSString *)userName password:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

@end
