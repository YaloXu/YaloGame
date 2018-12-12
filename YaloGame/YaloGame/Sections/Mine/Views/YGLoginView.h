//
//  YGLoginView.h
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YGViewType) {
    YGViewType_Pwd_Login,
    YGViewType_Phone_login,
    YGViewType_Register
    
};

@interface YGLoginView : UIView

@property (nonatomic, assign) YGViewType viewType;

@property (nonatomic, copy) void (^(loginHandler))(NSString *usname, NSString *password, NSString *code, YGViewType type);

@property (nonatomic, copy) void (^(registerHandler))(NSString *userName,NSString *code,NSString *inviteCode,NSString *pwd, NSString *confirmCode);

@property (nonatomic, copy) void (^(forgetPwdHandler))(void);

@property (nonatomic, copy) void (^(sendCodeHandler))(NSString *phone);

@property (nonatomic, copy) void (^(backLoginHandler))(void);

@property (nonatomic, copy) void (^(registerPushHandler))(void);

- (void)sending;

- (void)startTimer;

- (void)resetTimer;

- (BOOL)loginStateKeep;

@end

NS_ASSUME_NONNULL_END
