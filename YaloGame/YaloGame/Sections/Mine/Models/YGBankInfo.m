//
//  YGBankInfo.m
//  YaloGame
//
//  Created by C on 2018/12/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankInfo.h"

@implementation YGBankInfo

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{@"des":@"description",
             @"bankNum":@"title"
             };
}



@end
