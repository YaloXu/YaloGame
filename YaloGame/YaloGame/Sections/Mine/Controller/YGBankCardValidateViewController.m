//
//  YGBankCardValidateViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankCardValidateViewController.h"
#import "YGBankViewController.h"
#import "YGBindCardSuccessViewController.h"

@interface YGBankCardValidateViewController () {
    
    NSTimer *_timer;
    NSInteger _repeatCount;
}
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UITextField *validateTF;
@property (weak, nonatomic) IBOutlet UIButton *sendCodeButotn;

@end

@implementation YGBankCardValidateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"绑定银行卡";
    NSString *phone = [NSString stringWithFormat:@"%@******%@",[YGUserInfo.defaultInstance.userName substringToIndex:2],[YGUserInfo.defaultInstance.userName substringFromIndex:YGUserInfo.defaultInstance.userName.length - 2]];
    self.promptLabel.text = [NSString stringWithFormat:@"本次操作需要简讯确认，请输入%@收到的简讯验证码",phone];
    [self.validateTF setValue:UIColorFromRGBValue(0x333333) forKeyPath:@"_placeholderLabel.textColor"];
    [self startTimer];
    
}
- (IBAction)next:(id)sender {
    [YGLoadingTools beginLoading];
    [YGNetworkCommon addBankCardWithCardName:self.cardName cardNo:self.cardType bankDescription:self.cardType success:^(id  _Nonnull responseObject) {
        [self.navigationController pushViewController:[YGBindCardSuccessViewController new] animated:YES];
        [YGLoadingTools endLoading];
    } failed:^(NSDictionary * _Nonnull errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
}
- (IBAction)sendCode:(id)sender {
    //success
    kWeakSelf;
    [YGLoadingTools beginLoading];
    [YGNetworkCommon getVerifyCode:@"" type:@"" success:^(id  _Nonnull responseObject) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:responseObject[@"message"]];
        [weakSelf startTimer];
    } failed:^(NSDictionary * _Nonnull errorInfo) {
        [YGLoadingTools endLoading];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
}

- (void)changeButtonContent {
    _repeatCount --;
    if (_repeatCount <= 0) {
        [self stopTimer];
        [self.sendCodeButotn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        _sendCodeButotn.enabled = YES;
    } else {
        [self.sendCodeButotn setTitle:[NSString stringWithFormat:@"%ld秒后发送",_repeatCount] forState:UIControlStateNormal];
    }
}

- (void)stopTimer {
    if (_timer && [_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}

- (void)startTimer {
    if (_timer) {
        return;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeButtonContent) userInfo:nil repeats:YES];
    _repeatCount = 60;
    _sendCodeButotn.enabled = NO;
    [_timer fire];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
