//
//  YGLoginView.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGLoginView.h"
#import "NSString+Regular.h"

@interface YGLoginView() {
    NSInteger count;
}

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UITextField *nameTF,*pwdTF,*codeTF, *regPwdTF, *regConPwdTF;

@property (nonatomic, strong) UIButton *loginButton,*registerButton,*selectedButton, *codeButton;

@property (nonatomic, strong) UILabel *stateLabel, *forgetPwdLabel;

@property (nonatomic, strong) UIView *line1, *line2, *line3, *line4,*line5;

@end

@implementation YGLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    [self addSubview:self.selectedButton];
    [self addSubview:self.loginButton];
    [self addSubview:self.registerButton];
    [self addSubview:self.codeTF];
    [self addSubview:self.pwdTF];
    [self addSubview:self.nameTF];
    [self addSubview:self.stateLabel];
    [self addSubview:self.forgetPwdLabel];
    [self addSubview:self.codeButton];
    [self addSubview:self.line1];
    [self addSubview:self.line2];
    [self addSubview:self.line3];
    [self addSubview:self.regConPwdTF];
    [self addSubview:self.regPwdTF];
    [self addSubview:self.line4];
    [self addSubview:self.line5];
}

- (UIView *)line5 {
    if (!_line5) {
        _line5 = [UIView new];
        _line5.hidden = YES;
        _line5.backgroundColor = DefaultBackGroundColor;
    }
    return _line5;
}

- (UIView *)line4 {
    if (!_line4) {
        _line4 = [UIView new];
        _line4.hidden = YES;
        _line4.backgroundColor = DefaultBackGroundColor;
    }
    return _line4;
}

- (UIView *)line3 {
    if (!_line3) {
        _line3 = [UIView new];
        _line3.hidden = YES;
        _line3.backgroundColor = DefaultBackGroundColor;
    }
    return _line3;
}

- (UIView *)line2 {
    if (!_line2) {
        _line2 = [UIView new];
        _line2.backgroundColor = DefaultBackGroundColor;
    }
    return _line2;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [UIView new];
        _line1.backgroundColor = DefaultBackGroundColor;
    }
    return _line1;
}

- (UIButton *)codeButton {
    if (!_codeButton) {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_codeButton setTitleColor:UIColorFromRGBValue(0x979AA1) forState:UIControlStateNormal];
        _codeButton.backgroundColor = UIColorFromRGBValue(0x2E3039);
        _codeButton.layer.cornerRadius = 12.5;
        _codeButton.layer.masksToBounds = YES;
        _codeButton.layer.borderColor = DefaultBackGroundColor.CGColor;
        _codeButton.layer.borderWidth = 1;
        [_codeButton addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = [UIFont systemFontOfSize:10];
        _stateLabel.textColor = UIColorFromRGBValue(0x979AA1);
        _stateLabel.text = @"保持登录状态";
    }
    return _stateLabel;
}

- (UILabel *)forgetPwdLabel {
    if (!_forgetPwdLabel) {
        _forgetPwdLabel = [UILabel new];
        _forgetPwdLabel.textAlignment = NSTextAlignmentRight;
        _forgetPwdLabel.font = [UIFont systemFontOfSize:10];
        _forgetPwdLabel.textColor = UIColorFromRGBValue(0x979AA1);
        _forgetPwdLabel.text = @"忘记密码？";
    }
    return _forgetPwdLabel;
}

- (UITextField *)codeTF {
    if (!_codeTF) {
        _codeTF = [UITextField new];
        _codeTF.font = [UIFont systemFontOfSize:12];
        _codeTF.placeholder = @"[邀请码]可选";
        _codeTF.hidden = YES;
        _codeTF.textColor = UIColorFromRGBValue(0x979AA1);
        [_codeTF setValue:UIColorFromRGBValue(0x979AA1) forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _codeTF;
}

- (UITextField *)nameTF {
    if (!_nameTF) {
        _nameTF = [UITextField new];
        _nameTF.placeholder = @"请输入您的账号";
        _nameTF.font = [UIFont systemFontOfSize:12];
        _nameTF.textColor = UIColorFromRGBValue(0x979AA1);
         [_nameTF setValue:UIColorFromRGBValue(0x979AA1) forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _nameTF;
}

- (UITextField *)regPwdTF {
    if (!_regPwdTF) {
        _regPwdTF = [UITextField new];
        _regPwdTF.placeholder = @"请设置您的登录密码";
        _regPwdTF.font = [UIFont systemFontOfSize:12];
        _regPwdTF.hidden = YES;
        _regPwdTF.textColor = UIColorFromRGBValue(0x979AA1);
        [_regPwdTF setValue:UIColorFromRGBValue(0x979AA1) forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _regPwdTF;
}

- (UITextField *)regConPwdTF {
    if (!_regConPwdTF) {
        _regConPwdTF = [UITextField new];
        _regConPwdTF.placeholder = @"请确认您的登录密码";
        _regConPwdTF.hidden = YES;
        _regConPwdTF.font = [UIFont systemFontOfSize:12];
        _regConPwdTF.textColor = UIColorFromRGBValue(0x979AA1);
        [_regConPwdTF setValue:UIColorFromRGBValue(0x979AA1) forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _regConPwdTF;
}

- (UITextField *)pwdTF {
    if (!_pwdTF) {
        _pwdTF = [UITextField new];
        _pwdTF.textColor = UIColorFromRGBValue(0x979AA1);
        _pwdTF.placeholder = @"请输入密码";
        [_pwdTF setValue:UIColorFromRGBValue(0x979AA1) forKeyPath:@"_placeholderLabel.textColor"];
        _pwdTF.font = [UIFont systemFontOfSize:12];
    }
    return _pwdTF;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginButton setTitleColor:UIColorFromRGBValue(0x333333) forState:UIControlStateNormal];
        _loginButton.backgroundColor = UIColorFromRGBValue(0xEAAE0D);
        _loginButton.layer.cornerRadius = 20;
        [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_registerButton setTitleColor:UIColorFromRGBValue(0xD2D2D2) forState:UIControlStateNormal];
        _registerButton.backgroundColor = UIColorFromRGBValue(0x979AA1);
        _registerButton.layer.cornerRadius = 20;
        [_registerButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)selectedButton {
    if (!_selectedButton) {
        _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectedButton setImage:[UIImage imageNamed:@"protocol_selected"] forState:UIControlStateNormal];
        [_selectedButton setImage:[UIImage imageNamed:@"protocol_unselected"] forState:UIControlStateSelected];
        [_selectedButton addTarget:self action:@selector(selected) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedButton;
}

- (void)registerUser {
    if (self.viewType == YGViewType_Register) {
        if (self.backLoginHandler) {
            self.backLoginHandler();
        }
        return;
    }
    BLOCK(self.registerPushHandler);
}

- (void)selected {
    self.selectedButton.selected = !self.selectedButton.selected;
}

- (void)login {
    /*
     NSString *userName,NSString *pwd,NSString *confirmPwd,NSString *code, NSString *inviteCode
     */
    if (self.viewType == YGViewType_Register) {
        BLOCK(self.registerHandler,self.nameTF.text,self.pwdTF.text,self.codeTF.text,self.regPwdTF.text,self.regConPwdTF.text);

        return;
    }
   
    if (self.viewType == YGViewType_Pwd_Login) {
        BLOCK(self.loginHandler,self.nameTF.text,self.pwdTF.text,self.codeTF.text, self.viewType);
    } else {
        BLOCK(self.loginHandler,self.nameTF.text,@"",self.pwdTF.text, self.viewType);
    }
}

- (void)getCode {
    BLOCK(self.sendCodeHandler,self.nameTF.text);
}

- (void)setViewType:(YGViewType)viewType {
    _viewType = viewType;
    self.pwdTF.text = @"";
    _nameTF.keyboardType = UIKeyboardTypeNumberPad;
    switch (_viewType) {
        case YGViewType_Pwd_Login: {
            self.pwdTF.secureTextEntry = YES;
            self.nameTF.placeholder = @"请输入您的账号 ";
            self.pwdTF.placeholder = @"请输入密码";
            [self.nameTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.top.equalTo(@40);
                make.height.mas_equalTo(20);
            }];
            [self.pwdTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.height.right.equalTo(self.nameTF);
                make.top.equalTo(self.nameTF.mas_bottom).offset(25);
            }];
            [self.selectedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.size.mas_equalTo(CGSizeMake(16, 16));
                make.top.equalTo(self.pwdTF.mas_bottom).with.offset(20);
            }];
            [self.stateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.selectedButton.mas_right).with.offset(5);
                make.top.height.equalTo(self.selectedButton);
                make.width.mas_equalTo(100);
            }];
            self.codeButton.hidden = YES;
            self.forgetPwdLabel.hidden = NO;
            [self.forgetPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(-16));
                make.centerY.equalTo(self.stateLabel.mas_centerY);
                make.height.width.equalTo(self.stateLabel);
            }];
            [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.forgetPwdLabel.mas_bottom).offset(17);
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(40);
            }];
        }
            break;
        case YGViewType_Register: {
            self.pwdTF.keyboardType = UIKeyboardTypeNumberPad;
            self.regPwdTF.secureTextEntry = YES;
            self.regConPwdTF.secureTextEntry = YES;
            _codeTF.hidden = NO;
            _line3.hidden = NO;
            _line4.hidden = NO;
            _line5.hidden = NO;
            _regConPwdTF.hidden = NO;
            _regPwdTF.hidden = NO;
            self.nameTF.placeholder = @"请输入您的手机号码";
            self.pwdTF.placeholder = @"请输入短信验证码";
            [self.registerButton setTitle:@"返回登录" forState:UIControlStateNormal];
            [self.loginButton setTitle:@"快速注册" forState:UIControlStateNormal];
            [self areaPhone];
            [self.nameTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@47);
                make.right.equalTo(@(-16));
                make.top.equalTo(@40);
                make.height.mas_equalTo(20);
            }];
            [self.pwdTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(self.nameTF);
                make.right.equalTo(@(-130));
                make.top.equalTo(self.nameTF.mas_bottom).offset(25);
            }];
            [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(-37));
                make.centerY.equalTo(self.pwdTF.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(100, 25));
            }];
            [self.codeTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(self.nameTF);
                make.right.equalTo(@(-16));
                make.top.equalTo(self.pwdTF.mas_bottom).offset(25);
            }];
            [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(.5);
                make.top.equalTo(self.codeTF.mas_bottom).with.offset(10);
            }];
            [self.regPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(self.nameTF);
                make.right.equalTo(@(-16));
                make.top.equalTo(self.codeTF.mas_bottom).offset(25);
            }];
            [self.line4 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(.5);
                make.top.equalTo(self.regPwdTF.mas_bottom).with.offset(10);
            }];
            [self.regConPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(self.nameTF);
                make.right.equalTo(@(-16));
                make.top.equalTo(self.regPwdTF.mas_bottom).offset(25);
            }];
            [self.line5 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(.5);
                make.top.equalTo(self.regConPwdTF.mas_bottom).with.offset(10);
            }];
            [self.selectedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.size.mas_equalTo(CGSizeMake(16, 16));
                make.top.equalTo(self.regConPwdTF.mas_bottom).with.offset(20);
            }];
            [self.stateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.selectedButton.mas_right).with.offset(5);
                make.top.height.equalTo(self.selectedButton);
                make.width.mas_equalTo(100);
            }];
            self.forgetPwdLabel.hidden = YES;
            
            [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.stateLabel.mas_bottom).offset(17);
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(40);
            }];
        }
            break;
        case YGViewType_Phone_login: {
            self.pwdTF.keyboardType = UIKeyboardTypeNumberPad;
            self.pwdTF.secureTextEntry = NO;
            self.nameTF.placeholder = @"请输入您的手机号码";
            self.pwdTF.placeholder = @"请输入短信验证码";
            [self areaPhone];
            [self.nameTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@47);
                make.right.equalTo(@(-16));
                make.top.equalTo(@40);
                make.height.mas_equalTo(20);
            }];
            [self.pwdTF mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.height.equalTo(self.nameTF);
                make.right.equalTo(@(-130));
                make.top.equalTo(self.nameTF.mas_bottom).offset(25);
            }];
            self.codeButton.hidden = NO;
            [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(-37));
                make.centerY.equalTo(self.pwdTF.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(100, 25));
            }];
            [self.selectedButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@16);
                make.size.mas_equalTo(CGSizeMake(16, 16));
                make.top.equalTo(self.pwdTF.mas_bottom).with.offset(20);
            }];
            [self.stateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.selectedButton.mas_right).with.offset(5);
                make.top.height.equalTo(self.selectedButton);
                make.width.mas_equalTo(100);
            }];
            self.forgetPwdLabel.hidden = YES;
            
            [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.stateLabel.mas_bottom).offset(17);
                make.left.equalTo(@16);
                make.right.equalTo(@(-16));
                make.height.mas_equalTo(40);
            }];
        }
            break;
    }
    [self.line1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.right.equalTo(@(-16));
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.nameTF.mas_bottom).with.offset(10);
    }];
    [self.line2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.right.equalTo(@(-16));
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.pwdTF.mas_bottom).with.offset(10);
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.loginButton);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(16);
    }];
}

- (void)areaPhone {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    UILabel *areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    areaLabel.font = [UIFont systemFontOfSize:10];
    areaLabel.textColor = UIColorFromRGBValue(0xD2D2D2);
    areaLabel.text = @"+86";
    [view addSubview:areaLabel];
    CALayer *layer = [CALayer layer];
    [view.layer addSublayer:layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    layer.frame = CGRectMake(32, 0, 1, 20);
    self.nameTF.leftView = view;
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
}

- (void)startTimer {
    [self stopTimer];
    _codeButton.enabled = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeButtonState) userInfo:nil repeats:YES];
}

- (void)changeButtonState {
    count --;
    if (count <= 0) {
        [self resetTimer];
        return;
    }
    [_codeButton setTitle:[NSString stringWithFormat:@"%lds重新发送",count] forState:UIControlStateNormal];
}

- (void)stopTimer {
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];
    }
    self.timer = nil;
    count = 60;
}

- (void)sending {
    self.codeButton.userInteractionEnabled = NO;
    [self.codeButton setTitle:@"发送中..." forState:UIControlStateNormal];
    [self.codeButton setTitleColor:kButtonBackColorForDisabled forState:UIControlStateNormal];
}

- (void)resetTimer {
    _codeButton.userInteractionEnabled = YES;
    [_codeButton setTitleColor:UIColorFromRGBValue(0x979AA1) forState:UIControlStateNormal];
    [_codeButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
}

- (BOOL)loginStateKeep {
    return !self.selectedButton.selected;
}

@end
