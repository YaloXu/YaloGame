//
//  YGAlertViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAlertViewController.h"


@interface YGAlertViewController ()

@property (nonatomic, strong) YGQRView *alertView;

@end

@implementation YGAlertViewController

- (YGQRView *)alertView {
    if (!_alertView) {
        _alertView = [YGQRView new];
    }
    return _alertView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.6];
    [self.view addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(280, 219));
    }];
    [self.alertView setCloseHandler:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.alertView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [UIView animateWithDuration:0.23
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
}


+ (void)alertViewWithQRType:(YGQRType)qrtype fromVC:(nonnull UIViewController *)controller {
    YGAlertViewController *alertController = [[YGAlertViewController alloc] init];
    alertController.alertView.qrtype = qrtype;
    alertController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    alertController.modalTransitionStyle   = UIModalTransitionStyleCrossDissolve;
    [controller presentViewController:alertController animated:YES completion:nil];
}

@end
