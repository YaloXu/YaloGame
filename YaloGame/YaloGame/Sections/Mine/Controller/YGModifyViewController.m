//
//  YGModifyViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGModifyViewController.h"

@interface YGModifyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTF;

@end

@implementation YGModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.modifyStyle == ModifyStyle_NickName ? @"设置昵称" : @"设置签名";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(complete)];
    [self adjustFont];
}

- (void)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)complete {
//    [self.navigationController popViewControllerAnimated:YES];
    if (!YGUtils.validString(self.inputTF.text)) {
        [YGAlertToast showHUDMessage:@"输入不合法"];
        return;
    }
    [YGLoadingTools beginLoading];
    if (self.modifyStyle == ModifyStyle_NickName) {
        [YGNetworkCommon updateNickName:self.inputTF.text success:^(id responseObject) {
            [YGLoadingTools endLoading];
            YGUserInfo.defaultInstance.nickName = self.inputTF.text;
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
            [self.navigationController popViewControllerAnimated:YES];
        } failed:^(NSDictionary *errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    } else {
        [YGNetworkCommon updateSign:self.inputTF.text success:^(id responseObject) {
            [YGLoadingTools endLoading];
            YGUserInfo.defaultInstance.gxqm = self.inputTF.text;
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
            [self.navigationController popViewControllerAnimated:YES];
        } failed:^(NSDictionary *errorInfo) {
            [YGLoadingTools endLoading];
             [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    }
    
}

- (void)adjustFont {
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:UIColorFromRGBValue(0xE9A400)} forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:UIColorFromRGBValue(0xE9A400)} forState:UIControlStateSelected];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];

}


@end
