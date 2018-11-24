//
//  YGBandRechargeViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBandRechargeViewController.h"

@interface YGBandRechargeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *cardNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *cardLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *cardNumTF;

@end

@implementation YGBandRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = DefaultBackGroundColor;
    self.navigationItem.title = @"银行卡充值";
}
- (IBAction)copy:(id)sender {
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = DefaultBackGroundColor.CGColor;
    [self.view.layer addSublayer:layer];
   CGRect rect = [self.nameLabel.superview convertRect:self.nameLabel.frame toView:self.view];
    layer.frame = CGRectMake(0, CGRectGetMaxY(rect), kScreenWidth, 1);
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = DefaultBackGroundColor.CGColor;
    [self.view.layer addSublayer:layer1];
     CGRect rect1 = [self.cardLabel.superview convertRect:self.cardLabel.frame toView:self.view];
    layer1.frame = CGRectMake(0, CGRectGetMaxY(rect1), kScreenWidth, 1);
    CALayer *layer2 = [CALayer layer];
    layer2.backgroundColor = DefaultBackGroundColor.CGColor;
    CGRect rect2 = [self.nameTF.superview convertRect:self.nameTF.frame toView:self.view];
    layer2.frame = CGRectMake(0, CGRectGetMaxY(rect2), kScreenWidth, 1);
    [self.view.layer addSublayer:layer2];
    
}



@end
