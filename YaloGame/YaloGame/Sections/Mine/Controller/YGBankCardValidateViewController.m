//
//  YGBankCardValidateViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBankCardValidateViewController.h"

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
    
    [self startTimer];
    
}
- (IBAction)next:(id)sender {
    
}
- (IBAction)sendCode:(id)sender {
    //success
    [self startTimer];
}

- (void)changeButtonContent {
    _repeatCount --;
    if (_repeatCount <= 0) {
        [self stopTimer];
        [self.sendCodeButotn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        _sendCodeButotn.enabled = YES;
    } else {
        [self.sendCodeButotn setTitle:[NSString stringWithFormat:@"%ld秒后重新发送",_repeatCount] forState:UIControlStateNormal];
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
