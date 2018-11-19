//
//  YGBaseViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGBaseViewController.h"

@interface YGBaseViewController ()

@end

@implementation YGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self backBarbuttonForWhite];
     self.view.backgroundColor = DefaultBackGroundColor;
}
//导航栏左边按钮
- (void)backBarbuttonForWhite{
    if (self.parentViewController.childViewControllers.count>1) {
        UIImage *image = [UIImage imageNamed:@"nav_back"];
        image = [image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        UIBarButtonItem * leftBarbtn = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        self.navigationItem.leftBarButtonItem = leftBarbtn;
    }
    
}
-(void)back{
    if (![self isMemberOfClass:[YGBaseViewController class]]) {
        if (self.parentViewController.childViewControllers.count>1) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}
-(void)setHeadTitle:(NSString *)headTitle{
    _headTitle = headTitle;
    self.navigationItem.title = _headTitle;
}
-(void)setRightBarItemWithImage:(NSString *)imageName{
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [rightButton setImage:[UIImage imageNamed:imageName]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarItemEvent)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
