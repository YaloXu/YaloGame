//
//  YGRegisterViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGRegisterViewController.h"
#import "YGLoginView.h"
#import "YGLoginViewController.h"
#import "NSString+Regular.h"
#import "YGCacheManager.h"

@interface YGRegisterViewController ()

@property (nonatomic, strong) YGLoginView *loginView;

@end

@implementation YGRegisterViewController

- (YGLoginView *)loginView {
    if (!_loginView) {
        _loginView = [YGLoginView new];
        _loginView.viewType = YGViewType_Register;
    }
    return _loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBValue(0x2E3039);
    [self addBackButton];
    [self addRight];
    [self bottomView];
    [self topView];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(@(-110));
        make.top.equalTo(@130);
    }];
    kWeakSelf;
    [self.loginView setRegisterHandler:^(NSString *userName,NSString *code,NSString *inviteCode,NSString *pwd, NSString *confirmPwd){
        if (!YGUtils.validString(userName)) {
            [YGAlertToast showHUDMessage:@"请输入注册手机号"];
            return ;
        }
        if (![userName validatePhoneNumber]) {
            [YGAlertToast showHUDMessage:@"注册手机号不合法"];
            return;
        }
        if (!YGUtils.validString(code)) {
            [YGAlertToast showHUDMessage:@"请输入手机验证码"];
            return;
        }
        if (!YGUtils.validString(pwd)) {
            [YGAlertToast showHUDMessage:@"请输入密码"];
            return;
        }
        if (!YGUtils.validString(confirmPwd)) {
            [YGAlertToast showHUDMessage:@"请输入确认密码"];
            return;
        }
        if (![pwd validatePwd]) {
            [YGAlertToast showHUDMessage:@"密码不合法"];
            return;
        }
        if (![pwd isEqualToString:confirmPwd]) {
            [YGAlertToast showHUDMessage:@"两次密码输入不一致，请重新输入"];
            return;
        }
        if ([weakSelf.loginView loginStateKeep]) {
#warning -------
        }
        [YGLoadingTools beginLoading];
        [YGNetworkCommon registerUser:userName password:pwd confirmPwd:confirmPwd code:code inviteCode:inviteCode success:^(id  _Nonnull responseObject) {
            [YGNetworkCommon login:userName password:confirmPwd code:@"" type:1 success:^(id responseObject) {
                [YGUserInfo.defaultInstance parseToken:responseObject];
                [YGNetworkCommon userInfo:^(id  _Nonnull responseObject) {
                    [YGUserInfo.defaultInstance parseUserInfo:responseObject];
                    [YGLoadingTools endLoading];
                    [YGCacheManager.sharedInstance saveUserInfo];
                    [YGAlertToast showHUDMessage:@"登录成功"];
                    [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            } failed:^(NSDictionary *errorInfo) {
                [YGLoadingTools endLoading];
                [YGAlertToast showHUDMessage:@"登录失败"];
            }];
            } failed:^(NSDictionary *errorInfo) {
                [YGLoadingTools endLoading];
                [YGAlertToast showHUDMessage:@"登录失败"];
            }];
        } failed:^(NSDictionary * _Nonnull errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    }];
    [self.loginView setSendCodeHandler:^(NSString *phone){
        if (!YGUtils.validString(phone)) {
            [YGAlertToast showHUDMessage:@"请输入注册手机号"];
            return ;
        }
        if (![phone validatePhoneNumber]) {
            [YGAlertToast showHUDMessage:@"注册手机号不合法"];
            return;
        }
        kStrongSelfAutoReturn;
        [strongSelf.loginView sending];
        [YGLoadingTools beginLoading];
        [YGNetworkCommon getVerifyCode:phone type:@"1" success:^(id  _Nonnull responseObject) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
            [strongSelf.loginView startTimer];
        } failed:^(NSDictionary * errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:@"验证码发送失败"];
            [strongSelf.loginView resetTimer];
        }];
    }];
    [self.loginView setBackLoginHandler:^{
        kStrongSelf;
        if (strongSelf.navigationController.viewControllers.count > 2) {
            [strongSelf.navigationController popViewControllerAnimated:YES];
            return ;
        }
        [strongSelf.navigationController pushViewController:[YGLoginViewController new] animated:YES];
    }];
}

- (void)addRight {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_im"]];
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(service)]];
    imageView.contentMode = UIViewContentModeRight;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-16));
        make.height.mas_equalTo(kNavHeight - kStatusBarHeight);
        make.width.mas_equalTo(50);
        make.top.equalTo(@(kStatusBarHeight));
    }];
}

- (void)service {
    
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (void)bottomView {
    UILabel *protocolLabel = [UILabel new];
    protocolLabel.font = [UIFont systemFontOfSize:10];
    NSString *string = @"登录时即代表同意《悠拟电竞服务协议》";
    [self.view addSubview:protocolLabel];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSForegroundColorAttributeName:UIColorFromRGBValue(0x979AA1),NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(8, string.length - 8)];
    [protocolLabel setAttributedText:attString];
    [protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-34));
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(14);
    }];
    
    protocolLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)topView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kNavHeight));
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.equalTo(self.view);
    }];
    UILabel *nameLabel = [UILabel new];
    [self.view addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.textColor = UIColor.whiteColor;
    nameLabel.text = @"悠拟电竞";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
}

@end
