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

@property (nonatomic, copy) void (^(loginHandler))(void);

@property (nonatomic, copy) void (^(registerHandler))(void);

@property (nonatomic, copy) void (^(forgetPwdHandler))(void);

@property (nonatomic, copy) void (^(sendCodeHandler))(void);

@property (nonatomic, copy) void (^(backLoginHandler))(void);

@end

NS_ASSUME_NONNULL_END
