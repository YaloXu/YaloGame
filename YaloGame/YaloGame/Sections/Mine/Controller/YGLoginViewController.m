//
//  YGLoginViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGLoginViewController.h"
#import "YGLoginView.h"
#import "YGRegisterViewController.h"
#import "YGCacheManager.h"

@interface YGLoginViewController ()

@property (nonatomic, strong) UILabel *styleLabel;

@property (nonatomic, strong) YGLoginView *loginView;

@end

@implementation YGLoginViewController

- (YGLoginView *)loginView {
    if (!_loginView) {
        _loginView = [YGLoginView new];
        _loginView.viewType = YGViewType_Pwd_Login;
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
    [self.loginView setRegisterPushHandler:^{
        kStrongSelfAutoReturn;
        [strongSelf.navigationController pushViewController:[YGRegisterViewController new] animated:YES];
    }];
    [self.loginView setLoginHandler:^(NSString *name,NSString *pwd,NSString *code, YGViewType type){
        [YGLoadingTools beginLoading];
        [YGNetworkCommon login:name password:pwd code:code type:type == YGViewType_Pwd_Login ? 1 : 0 success:^(id  _Nonnull responseObject) {
            [YGUserInfo.defaultInstance parseToken:responseObject];
            [YGNetworkCommon userInfo:^(id  _Nonnull responseObject) {
                [YGUserInfo.defaultInstance parseUserInfo:responseObject];
                [YGLoadingTools endLoading];
                [YGCacheManager.sharedInstance saveUserInfo];
                [YGAlertToast showHUDMessage:@"登录成功"];
                [weakSelf popToRoot];
            } failed:^(NSDictionary * _Nonnull errorInfo) {
                [YGAlertToast showHUDMessage:errorInfo[@"message"]];
                [YGUserInfo.defaultInstance clearData];
                [YGLoadingTools endLoading];
            }];
        } failed:^(NSDictionary * _Nonnull errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    }];
    [self.loginView setSendCodeHandler:^(NSString *phone){
        [YGLoadingTools beginLoading];
        [weakSelf.loginView sending];
        [YGNetworkCommon getVerifyCode:phone type:@"0" success:^(id  _Nonnull responseObject) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
            [weakSelf.loginView startTimer];
        } failed:^(NSDictionary * _Nonnull errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    }];
    
    [self.loginView setForgetPwdHandler:^{
        [YGAlertToast showHUDMessage:@"请联系客服"];
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
    UILabel *styleLabel = [UILabel new];
    [self.view addSubview:styleLabel];
    styleLabel.font = [UIFont systemFontOfSize:10];
    styleLabel.textColor = UIColorFromRGBValue(0x979AA1);
    _styleLabel = styleLabel;
    [styleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(protocolLabel.mas_top).offset(-8);
        make.height.mas_equalTo(14);
    }];
    styleLabel.text = @"手机号登录";
    styleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setImage:[UIImage imageNamed:@"login_pwd"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"login_phone"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(changeStyle:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(styleLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerX.equalTo(self.view);
    }];
}

- (void)changeStyle:(UIButton *)button {
    button.selected = !button.selected;
    self.styleLabel.text = !button.selected ? @"手机号登录" : @"账号密码登录";
    if (!button.selected) {
        self.loginView.viewType = YGViewType_Pwd_Login;
    } else {
        self.loginView.viewType = YGViewType_Phone_login;
    }
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

- (void)popToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
