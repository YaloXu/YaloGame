//
//  YGNetworkCommon.m
//  test
//
//  Created by C on 2018/11/23.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGNetworkCommon.h"
#import "YGEncryptTool.h"

#define kBaseUrl @"http://testw.mm94178.com/app/"

#define kRequestUrlFormat(url) [NSString stringWithFormat:@"%@%@",kBaseUrl,url]

@implementation YGNetworkCommon

+ (void)login:(NSString *)userName password:(NSString *)password code:(NSString *)code type:(NSInteger)type success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=login" parameters:@{@"username":userName,@"password":[YGEncryptTool rsaEncrypt:password],@"code":code ? :@"",@"type":@(type)} success:success failed:failed];
}

+ (void)registerUser:(NSString *)userName password:(NSString *)password confirmPwd:(NSString *)confirmPwd code:(NSString *)code inviteCode:(NSString *)inviteCode success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=register" parameters:@{@"phone":userName,@"password":[YGEncryptTool rsaEncrypt:password],@"surepassword":[YGEncryptTool rsaEncrypt:confirmPwd],@"code":code,@"invitecode":inviteCode} success:success failed:failed];
}

+ (void)userInfo:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member&uid=%@",@(YGUserInfo.defaultInstance.uid)] sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:nil success:success failed:failed];
}

+ (void)updatePayPassword:(NSString *)uid password:(NSString *)password surePassword:(NSString *)surePassword success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] put:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":uid,@"password":password,@"surepassword":surePassword} success:success failed:failed];
}

+ (void)getBankCardsWithPage:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=bankcard" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"page":@(page),@"total":@(total)} success:success failed:failed];
}

+ (void)addBankCardWithCardName:(NSString *)cardName cardNo:(NSString *)cardNo success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"" parameters:@{} success:success failed:failed];
}

+ (void)getVerifyCode:(NSString *)phone type:(NSString *)type success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=verify" parameters:@{@"mobile":phone,@"type":type} success:success failed:failed];
}

+ (void)updateNickName:(NSString *)nickName success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":@"",@"name":nickName} success:success failed:failed];
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

+ (void)setRequestHeaderInfo:(AFHTTPSessionManager *)manager {
    [manager.requestSerializer setValue:YGUserInfo.defaultInstance.token forHTTPHeaderField:@"Authentication"];
}

+ (void)getMessage:(NSInteger)catid page:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=news" parameters:@{@"catid":@(catid),@"page":@(page),@"total":@(total)} success:success failed:failed];
}

@end
