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

+ (void)bankCardInfo:(NSInteger)cardId success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=bankcard" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"id":@(cardId)} success:success failed:failed];
}

+ (void)addBankCardWithCardName:(NSString *)cardName cardNo:(NSString *)cardNo bankDescription:(NSString *)bankDescription type:(NSInteger)type code:(NSString *)code success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=bankcard" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"title":cardNo,@"keywords":cardNo,@"description":bankDescription,@"type":@(type),@"code":code, @"mobile":YGUserInfo.defaultInstance.phone} success:success failed:failed];
}

+ (void)getVerifyCode:(NSString *)phone type:(NSString *)type success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=verify" parameters:@{@"mobile":phone,@"type":type} success:success failed:failed];
}

+ (void)updateNickName:(NSString *)nickName success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] put:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member&uid=%@",@(YGUserInfo.defaultInstance.uid)] sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":@(YGUserInfo.defaultInstance.uid),@"name":YGUserInfo.defaultInstance.userName,@"nickname":nickName} success:success failed:failed];
}

+ (void)updateAvaImage:(NSString *)avaUrl success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] put:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member&uid=%@",@(YGUserInfo.defaultInstance.uid)] sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":@(YGUserInfo.defaultInstance.uid),@"name":YGUserInfo.defaultInstance.userName,@"nickname":avaUrl} success:success failed:failed];
}

+ (void)updateSign:(NSString *)sign success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] put:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":@(YGUserInfo.defaultInstance.uid),@"name":YGUserInfo.defaultInstance.userName,@"gxqm":sign} success:success failed:failed];
}

+ (void)uploadImage:(NSData *)data fileName:(NSString *)fileName success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] upload:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=api" fileName:fileName sessionConfig:^(AFHTTPSessionManager *manager) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
        [self setRequestHeaderInfo:manager];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    } parameters:@{@"uid":@(YGUserInfo.defaultInstance.uid),@"file":fileName} data:data success:success failed:failed];
}

+ (void)getTransactionsWithType:(NSInteger)type page:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=finace"] sessionConfig:^(AFHTTPSessionManager *manager) {
        [self setRequestHeaderInfo:manager];
    }
parameters:@{@"type":@(type),@"page":@(page),@"total":@(total)} success:success failed:failed];
}

+ (void)setRequestHeaderInfo:(AFHTTPSessionManager *)manager {
    [manager.requestSerializer setValue:YGUserInfo.defaultInstance.token forHTTPHeaderField:@"Authentication"];
}

+ (void)getMessage:(NSInteger)catid page:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] get:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=news" parameters:@{@"catid":@(catid),@"page":@(page),@"total":@(total)} success:success failed:failed];
}

+ (void)logout:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] post:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=logout" sessionConfig:^(AFHTTPSessionManager * _Nonnull manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:nil success:success failed:failed];
}

+ (void)bindPhone:(NSString *)phone success:(SuccessBlock)success failed:(FailedBlock)failed {
    [[YGNetWorkTools sharedTools] put:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member"] sessionConfig:^(AFHTTPSessionManager *manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:@{@"uid":@(YGUserInfo.defaultInstance.uid),@"type":@(2)} success:success failed:failed];
}

+ (void)updateLoginWithOldPwd:(NSString *)oldPwd newPwd:(NSString *)newPwd sureNewPwd:(NSString *)sureNewPwd success:(SuccessBlock)success failed:(FailedBlock)failed {
    NSDictionary *p = nil;
    if (YGUtils.validString(oldPwd)) {
        p = @{@"oldpassword":oldPwd,@"newpassword":newPwd,@"surepassword":sureNewPwd,@"uid":@(YGUserInfo.defaultInstance.uid),@"type":@(1)};
    } else {
        p = @{@"newpassword":[YGEncryptTool rsaEncrypt:newPwd],@"surepassword":[YGEncryptTool rsaEncrypt:sureNewPwd],@"uid":@(YGUserInfo.defaultInstance.uid),@"type":@(1)};
    }
    [[YGNetWorkTools sharedTools] put:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=member"] sessionConfig:^(AFHTTPSessionManager *manager) {
        [self setRequestHeaderInfo:manager];
    } parameters:p success:success failed:failed];
}
+(void)getHomeBannerListSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    [[YGNetWorkTools sharedTools] get:[NSString stringWithFormat:@"http://dev.d3d.cc/mmjj/?c=rest&m=v1&api=banner"] parameters:nil success:success failed:failed];
}
@end
