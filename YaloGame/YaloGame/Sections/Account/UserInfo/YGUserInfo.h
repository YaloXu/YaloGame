//
//  YGUserInfo.h
//  YaloGame
//
//  Created by C on 2018/12/7.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGUserInfo : NSObject
/*
 
 adminid = 0;
 avatar = "";
 "avatar_url" = "THEME_PATHadmin/images/avatar_45.png";
 complete = "<null>";
 email = "";
 experience = 0;
 freeze = "0.00";
 groupid = 3;
 "is_auth" = "<null>";
 ismobile = 0;
 levelid = 0;
 money = "0.00";
 name = "";
 overdue = 0;
 paypassword = "<null>";
 paysalt = "<null>";
 phone = "";
 regip = "127.0.0.1";
 regtime = 1544671087;
 score = 0;
 spend = "0.00";
 uid = 19;
 username = 15138483773;
 */

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *payPwd;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *freeze;
@property (nonatomic, copy) NSString *paySalt;
@property (nonatomic, assign) BOOL isMobile;
@property (nonatomic, assign) BOOL isAuth;

@property (nonatomic, copy) NSString *token;

@property (nonatomic, assign)NSInteger uid;

@property (nonatomic, assign) BOOL autoLogin;
@property (class,nonatomic,readonly,strong) YGUserInfo *defaultInstance;

- (BOOL)login;

- (void)parseToken:(NSDictionary *)dict;

- (void)parseUserInfo:(NSDictionary *)dict;

- (void)clearData;

- (NSDictionary *)userInfo;

@end
