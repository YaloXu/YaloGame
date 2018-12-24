//
//  YGUserInfo.m
//  YaloGame
//
//  Created by C on 2018/12/7.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGUserInfo.h"
#import "YYModel.h"

@implementation YGUserInfo

+ (YGUserInfo *)defaultInstance {
    static YGUserInfo *userInfo = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        userInfo = [[self alloc] init];
    });
    return userInfo;
}

- (NSString *)gxqm {
    if (!_gxqm || [_gxqm isKindOfClass:[NSNull class]]) {
        _gxqm = @"";
    }
    return _gxqm;
}

- (NSString *)userName {
    if (!_userName || [_userName isKindOfClass:[NSNull class]]) {
        _userName = @"";
    }
    return _userName;
}

- (NSString *)email {
    if (!_email || [_email isKindOfClass:[NSNull class]]) {
        _email = @"";
    }
    return _email;
}

- (NSString *)token {
    if (!_token || [_token isKindOfClass:[NSNull class]]) {
        _token = @"";
    }
    return _token;
}

- (NSString *)phone {
    if (!_phone || [_phone isKindOfClass:[NSNull class]]) {
        _phone = @"";
    }
    return _phone;
}

- (NSString *)paySalt {
    if (!_paySalt || [_paySalt isKindOfClass:[NSNull class]]) {
        _paySalt = @"";
    }
    return _paySalt;
}

- (NSString *)payPwd {
    if (!_payPwd || [_payPwd isKindOfClass:[NSNull class]]) {
        _payPwd = @"";
    }
    return _payPwd;
}

- (NSString *)freeze {
    if (!_freeze || [_freeze isKindOfClass:[NSNull class]]) {
        _freeze = @"";
    }
    return _freeze;
}

- (NSString *)money {
    if (!_money || [_money isKindOfClass:[NSNull class]] || !YGUtils.validString(_money)) {
        _money = @"0.00";
    }
    return _money;
}

- (void)parseToken:(NSDictionary *)dict {
    self.token = dict[@"token"];
    self.uid = [dict[@"uid"] integerValue];
}

- (void)parseUserInfo:(NSDictionary *)dict {
    self.avatar_url = dict[@"avatar"] ? : @"";
    self.email = dict[@"email"]? : @"";
    self.freeze = dict[@"freeze"]? : @"";
    self.isAuth = (dict[@"is_auth"] && ![dict[@"is_auth"] isKindOfClass:[NSNull class]]) ? [dict[@"is_auth"]  boolValue] : NO;
    self.isMobile = (dict[@"ismobile"] && ![dict[@"ismobile"] isKindOfClass:[NSNull class]]) ? [dict[@"ismobile"] boolValue] : NO;
    self.money = dict[@"money"];
    self.payPwd = dict[@"paypassword"]? : @"";
    self.paySalt = dict[@"paysalt"]? : @"";
    self.phone = dict[@"phone"]? : @"";
    self.userName = dict[@"username"]? : @"";
    self.autoLogin = NO;
    self.regtime = [dict[@"regtime"] longLongValue];
    self.name = dict[@"name"] ? : @"";
    self.nickName = dict[@"nickname"] ? : @"";
    self.gxqm = dict[@"gxqm"] ? : @"";
}

- (BOOL)login {
    return YGUtils.validString(self.token);
}

- (void)clearData {
    self.uid = 0;
    self.avatar_url = nil;
    self.token = nil;
    self.isMobile = NO;
    self.phone = nil;
    self.name = nil;
    self.userName = nil;
    self.gxqm = nil;
    self.regtime = 0;
}


- (NSDictionary *)userInfo {
    return @{
             @"token":self.token,
             @"uid":@(self.uid),
             @"username":self.userName,
             @"avatar":self.avatar_url,
             @"phone":self.phone,
             @"paypassword":self.payPwd,
             @"paysalt":self.paySalt,
             @"money":self.money,
             @"freeze":self.freeze,
             @"email":self.email,
             @"is_auth":@(self.isAuth),
             @"ismobile":@(self.isMobile),
             @"regtime":@(self.regtime),
             @"name":self.name,
             @"nickname":self.nickName,
             @"gxqm":self.gxqm
             };
}

@end
