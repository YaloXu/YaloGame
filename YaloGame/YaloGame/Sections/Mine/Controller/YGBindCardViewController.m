//
//  YGBindCardViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBindCardViewController.h"
#import "YGBindCardSecondViewController.h"

@interface YGBindCardViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cardUserNameTF;
@property (weak, nonatomic) IBOutlet UITextField *cardNumTF;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation YGBindCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"绑定银行卡";
      self.view.backgroundColor = DefaultBackGroundColor;
}
- (IBAction)next:(id)sender {
    if (!YGUtils.validString(self.cardUserNameTF.text)) {
        [YGAlertToast showHUDMessage:@"请输入持卡人姓名"];
        return;
    }
    if (!YGUtils.validString(self.cardNumTF.text)) {
        [YGAlertToast showHUDMessage:@"请输入卡号"];
        return;
    }
    
    YGBindCardSecondViewController *controller = [YGBindCardSecondViewController new];
    
    controller.cardName = self.cardUserNameTF.text;
    controller.cardNo = self.cardNumTF.text;
    [self.navigationController pushViewController:controller animated:YES];
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
