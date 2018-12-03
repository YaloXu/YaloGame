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

@end

@implementation YGPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置账户密码";
    self.confirmPwdTF.secureTextEntry = YES;
}

- (IBAction)pwdAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.pwdTF.secureTextEntry = sender.selected;
    
}
- (IBAction)pwdConfirmAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.confirmPwdTF.secureTextEntry = !sender.selected;
}


@end
