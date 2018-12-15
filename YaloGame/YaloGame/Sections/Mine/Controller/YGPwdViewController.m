//
//  YGPwdViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGPwdViewController.h"

@interface YGPwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UILabel *pwdLabel;
@property (weak, nonatomic) IBOutlet UILabel *confirmPwdLabel;

@end

@implementation YGPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置账户密码";
    self.confirmPwdTF.secureTextEntry = YES;
    if (self.pwdType == YGSetPwdType_Pay) {
        self.pwdLabel.text = @"新交易密码";
        self.confirmPwdLabel.text = @"确认交易密码";
    }
}

- (IBAction)pwdAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.pwdTF.secureTextEntry = sender.selected;
    
}
- (IBAction)pwdConfirmAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.confirmPwdTF.secureTextEntry = !sender.selected;
}

- (IBAction)confirmClick:(id)sender {
    if (!YGUtils.validString(self.pwdTF.text)) {
        [YGAlertToast showHUDMessage:@"密码不合法"];
        return;
    }
    if (!YGUtils.validString(self.confirmPwdTF.text)) {
        [YGAlertToast showHUDMessage:@"密码不合法"];
        return;
    }
    if (![self.confirmPwdTF.text isEqualToString:self.pwdTF.text]) {
        [YGAlertToast showHUDMessage:@"密码不一致"];
        return;
    }
    [YGLoadingTools beginLoading];
    if (self.pwdType == YGSetPwdType_Pay) {
        [YGNetworkCommon updatePayPassword:@(YGUserInfo.defaultInstance.uid).stringValue password:self.pwdTF.text surePassword:self.confirmPwdTF.text success:^(id responseObject) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
        } failed:^(NSDictionary *errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
        return;
    }
    [YGNetworkCommon updateLoginWithOldPwd:nil newPwd:self.pwdTF.text sureNewPwd:self.confirmPwdTF.text success:^(id responseObject) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:responseObject[@"message"]];
    } failed:^(NSDictionary *errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
    
}

@end
