//
//  YGNetworkCommon.h
//  test
//
//  Created by C on 2018/11/23.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGNetWorkTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGNetworkCommon : NSObject

+ (void)login:(NSString *)userName password:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)registerUser:(NSString *)userName password:(NSString *)password success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)userInfo:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)getBankCards:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)addBankCardWithCardName:(NSString *)cardName cardNo:(NSString *)cardNo success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)getVerifyCode:(NSString *)phone success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)updateNickName:(NSString *)nickName success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)uploadImage:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)getTransactionInfo:(SuccessBlock)success failed:(FailedBlock)failed;

@end

NS_ASSUME_NONNULL_END
