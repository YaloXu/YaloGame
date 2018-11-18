//
//  YGSettingViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGSettingViewController.h"
#import "YGUserInfoViewController.h"
#import "YGAboutViewController.h"
#import "YGSafeViewController.h"

@interface YGSettingViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *userCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *accountCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *aboutCell;

@end

@implementation YGSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置";
    [self.userCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userInfo)]];
    [self.accountCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(account)]];
    [self.aboutCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(about)]];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    layer.frame = CGRectMake(0, 43, kScreenWidth - 30, 1);
    [self.userCell.layer addSublayer:layer];
}
- (IBAction)logout:(id)sender {
}

- (void)userInfo {
    [self.navigationController pushViewController:[YGUserInfoViewController new] animated:YES];
}

- (void)account {
    [self.navigationController pushViewController:[YGSafeViewController new] animated:YES];
}

- (void)about {
    [self.navigationController pushViewController:[YGAboutViewController new] animated:YES];
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
