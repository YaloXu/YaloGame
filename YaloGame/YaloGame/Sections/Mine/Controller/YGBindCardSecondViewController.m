//
//  YGBindCardSecondViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBindCardSecondViewController.h"
#import "YGBankCardValidateViewController.h"

@interface YGBindCardSecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cardType;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLaebl;

@end

@implementation YGBindCardSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"绑定银行卡";
    NSString *name = YGUserInfo.defaultInstance.userName;
    self.phoneNumLaebl.text = [NSString stringWithFormat:@"%@******%@",[name substringToIndex:2],[name substringFromIndex:name.length - 2]];
    self.cardType.text = self.cardInfo[@"bank_name"];
}
- (IBAction)next:(id)sender {
    YGBankCardValidateViewController *controller = [YGBankCardValidateViewController new];
    controller.cardName = self.cardName;
    controller.cardNo = self.cardNo;
    controller.cardType = self.cardType.text;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)back {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
