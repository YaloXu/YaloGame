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
    
    if (YGUtils.validString(self.cardNumTF.text) && _cardNumTF.text.length < 15) {
        [YGAlertToast showHUDMessage:@"卡号非法"];
        return;
    }
    NSDictionary *cardInfo = [YGCommon findCardInfoWithCardBin:self.cardNumTF.text];
    if (!YGUtils.validDictionary(cardInfo)) {
        [YGAlertToast showHUDMessage:@"卡号不支持"];
        return;
    }
    YGBindCardSecondViewController *controller = [YGBindCardSecondViewController new];
    controller.cardInfo = cardInfo;
    controller.cardName = self.cardUserNameTF.text;
    controller.cardNo = self.cardNumTF.text;
    [self.navigationController pushViewController:controller animated:YES];
}


@end
