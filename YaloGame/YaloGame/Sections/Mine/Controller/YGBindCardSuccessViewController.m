//
//  YGBindCardSuccessViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBindCardSuccessViewController.h"
#import "UIButton+Badge.h"

@interface YGBindCardSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *reviewBankCardButton;

@end

@implementation YGBindCardSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"绑定银行卡成功";
    self.reviewBankCardButton.badge  = 1;
//    self.reviewBankCardButton.layer.
}
- (IBAction)reviewBankCardActin:(id)sender {
    
}
- (IBAction)continueBindCard:(id)sender {
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
