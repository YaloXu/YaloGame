//
//  YGRegisterViewController.m
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGRegisterViewController.h"
#import "YGLoginView.h"
#import "YGLoginViewController.h"

@interface YGRegisterViewController ()

@property (nonatomic, strong) YGLoginView *loginView;

@end

@implementation YGRegisterViewController

- (YGLoginView *)loginView {
    if (!_loginView) {
        _loginView = [YGLoginView new];
        _loginView.viewType = YGViewType_Register;
    }
    return _loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGBValue(0x2E3039);
    [self addBackButton];
    [self addRight];
    [self bottomView];
    [self topView];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(@(-110));
        make.top.equalTo(@130);
    }];
    [self.loginView setRegisterHandler:^{
        
    }];
    [self.loginView setBackLoginHandler:^{
        if (self.navigationController.viewControllers.count > 2) {
            [self.navigationController popViewControllerAnimated:YES];
            return ;
        }
        [self.navigationController pushViewController:[YGLoginViewController new] animated:YES];
    }];
}

- (void)addRight {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_im"]];
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(service)]];
    imageView.contentMode = UIViewContentModeRight;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-16));
        make.height.mas_equalTo(kNavHeight - kStatusBarHeight);
        make.width.mas_equalTo(50);
        make.top.equalTo(@(kStatusBarHeight));
    }];
}

- (void)service {
    
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (void)bottomView {
    UILabel *protocolLabel = [UILabel new];
    protocolLabel.font = [UIFont systemFontOfSize:10];
    NSString *string = @"登录时即代表同意《名门电竞服务协议》";
    [self.view addSubview:protocolLabel];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSForegroundColorAttributeName:UIColorFromRGBValue(0x979AA1),NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(8, string.length - 8)];
    [protocolLabel setAttributedText:attString];
    [protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-34));
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(14);
    }];
    
    protocolLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)topView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(kNavHeight));
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.equalTo(self.view);
    }];
    UILabel *nameLabel = [UILabel new];
    [self.view addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:20];
    nameLabel.textColor = UIColor.whiteColor;
    nameLabel.text = @"名门电竞";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
}

@end
