//
//  YGNetworkCommon.h
//  test
//
//  Created by C on 2018/11/23.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGNetWorkTools.h"


@interface YGNetworkCommon : NSObject

/**
 登录

 @param userName 用户名
 @param password 密码
 @param code 验证码
 @param type 登录类型（1普通，2快捷）
 @param success success
 @param failed failed
 */
+ (void)login:(NSString *)userName
     password:(NSString *)password
         code:(NSString *)code
         type:(NSInteger)type
      success:(SuccessBlock)success
       failed:(FailedBlock)failed;

/**
 注册

 @param userName 手机号
 @param password 密码
 @param confirmPwd 确认密码
 @param code 验证码
 @param inviteCode 邀请码
 @param success success
 @param failed failed
 */
+ (void)registerUser:(NSString *)userName
            password:(NSString *)password
          confirmPwd:(NSString *)confirmPwd
                code:(NSString *)code
          inviteCode:(NSString *)inviteCode
             success:(SuccessBlock)success
              failed:(FailedBlock)failed;

/**
 获取用户信息

 @param success success
 @param failed failed
 */
+ (void)userInfo:(SuccessBlock)success
          failed:(FailedBlock)failed;

/**
 获取银行卡

 @param page page
 @param total total
 @param success success
 @param failed failed
 */
+ (void)getBankCardsWithPage:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 查看银行卡详情

 @param cardId cardId
 @param success success
 @param failed failed
 */
+ (void)bankCardInfo:(NSInteger)cardId success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 添加银行卡

 @param cardName 卡名
 @param cardNo 卡号
 @param bankDescription 开户行
 @param success success
 @param failed failed
 */
+ (void)addBankCardWithCardName:(NSString *)cardName cardNo:(NSString *)cardNo bankDescription:(NSString *)bankDescription success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 发送验证码

 @param phone 手机号
 @param type 类型（1注册，2绑定手机，0快捷）
 @param success success
 @param failed failed
 */
+ (void)getVerifyCode:(NSString *)phone
                 type:(NSString *)type
              success:(SuccessBlock)success
               failed:(FailedBlock)failed;

/**
 更新交易密码

 @param uid 用户标识
 @param password 密码
 @param surePassword 确认密码
 @param success success
 @param failed failed
 */
+ (void)updatePayPassword:(NSString *)uid
                 password:(NSString *)password
             surePassword:(NSString *)surePassword
                  success:(SuccessBlock)success
                   failed:(FailedBlock)failed;

/**
 更新昵称

 @param nickName 昵称
 @param success success
 @param failed failed
 */
+ (void)updateNickName:(NSString *)nickName
               success:(SuccessBlock)success
                failed:(FailedBlock)failed;

/**
 更新签名

 @param sign 签名
 @param success success
 @param failed failed
 */
+ (void)updateSign:(NSString *)sign success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 <#Description#>

 @param data <#data description#>
 @param fileName <#fileName description#>
 @param success <#success description#>
 @param failed <#failed description#>
 */
+ (void)uploadImage:(NSData *)data fileName:(NSString *)fileName success:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 <#Description#>

 @param avaUrl <#avaUrl description#>
 @param success <#success description#>
 @param failed <#failed description#>
 */
+ (void)updateAvaImage:(NSString *)avaUrl success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)getTransactionsWithType:(NSInteger)type page:(NSInteger)page total:(NSInteger)total success:(SuccessBlock)success failed:(FailedBlock)failed;


/**
 获取消息

 @param catid 消息类型
 @param page 页数
 @param total 数量
 @param success success
 @param failed failed
 */
+ (void)getMessage:(NSInteger)catid
              page:(NSInteger)page
             total:(NSInteger)total
           success:(SuccessBlock)success
            failed:(FailedBlock)failed;

/**
 退出

 @param success success
 @param failed failed
 */
+ (void)logout:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 绑定手机号

 @param phone phone
 @param success success
 @param failed failed
 */
+ (void)bindPhone:(NSString *)phone success:(SuccessBlock)success failed:(FailedBlock)failed;

+ (void)updateLoginWithOldPwd:(NSString *)oldPwd newPwd:(NSString *)newPwd sureNewPwd:(NSString *)sureNewPwd success:(SuccessBlock)success failed:(FailedBlock)failed;

@end

