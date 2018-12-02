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

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)userInfo:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"" parameters:@{} success:success failed:failed];
}

+ (void)getBankCards:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"" parameters:@{} success:success failed:failed];
}

+ (void)addBankCardWithCardName:(NSString *)cardName cardNo:(NSString *)cardNo success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)getVerifyCode:(NSString *)phone success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)updateNickName:(NSString *)nickName success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)updateSign:(NSString *)sign success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)uploadImage:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] upload:@"" parameters:@{} data:data success:success failed:failed];
}

+ (void)getTransactionInfo:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"" parameters:@{} success:success failed:failed];
}


@end
