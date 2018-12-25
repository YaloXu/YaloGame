//
//  YGUserInfoViewController.m
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGUserInfoViewController.h"
#import "YGAlertTool.h"
#import "YGAuthTool.h"
#import "YGModifyViewController.h"
#import "UITableViewCell+Arrow.h"
#import "UIImageView+WebCache.h"
#import "YGDateTools.h"
#import "YGOrderViewController.h"

@protocol YGUserHeaderDelegate <NSObject>

- (void)changeImage:(UIImageView *)imageView;

@end


@interface YGUserHeaderView : UIView

@property (nonatomic, weak) id <YGUserHeaderDelegate>delegate;

@property (nonatomic, strong) UIImageView *avaImageView, *bgImageView;;

@property (nonatomic, strong) UILabel *IDLabel, *dateLabel;

@end


@implementation YGUserHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = DefaultBackGroundColor;
        [self config];
        [self setDatas];
    }
    return self;
}

- (void)config {
    _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_header_bg"]];
    _avaImageView = [UIImageView new];
    _avaImageView.image = [UIImage imageNamed:@"user_ava"];
    _dateLabel = [UILabel new];
    _IDLabel = [UILabel new];
    [self addSubview:self.bgImageView];
    [self addSubview:self.avaImageView];
    self.avaImageView.layer.masksToBounds = YES;
    self.avaImageView.layer.cornerRadius = 50;
    [self addSubview:self.IDLabel];
    [self addSubview:self.dateLabel];
    self.dateLabel.font = [UIFont systemFontOfSize:12];
    self.IDLabel.font = [UIFont systemFontOfSize:16];
    self.IDLabel.textColor = self.dateLabel.textColor = UIColorFromRGBValue(0x333333);
    self.dateLabel.textAlignment = self.IDLabel.textAlignment = NSTextAlignmentCenter;
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(175);
    }];
    [self.avaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(@125); make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.avaImageView.mas_bottom).with.offset(6);
        make.height.mas_equalTo(22);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.IDLabel.mas_bottom).with.offset(5);
        make.height.mas_equalTo(17);
    }];
    self.avaImageView.userInteractionEnabled = YES;
    [self.avaImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
}

- (void)setDatas {
    if (YGUtils.validString(YGUserInfo.defaultInstance.avatar_url)) {
        [_avaImageView sd_setImageWithURL:[NSURL URLWithString:YGUserInfo.defaultInstance.avatar_url] placeholderImage:[UIImage imageNamed:@"user_ava"]];
    } else {
        _avaImageView.image = [UIImage imageNamed:@"user_ava"];
    }
    self.IDLabel.text = [NSString stringWithFormat:@"ID:%@",YGUserInfo.defaultInstance.nickName];
    self.dateLabel.text = [YGDateTools formatDateTimeInterval:YGUserInfo.defaultInstance.regtime formatString:@"YYYY-MM-dd"];;
}

- (void)tap {
    if ([self.delegate respondsToSelector:@selector(changeImage:)]) {
        [self.delegate changeImage:self.avaImageView];
    }
}

@end


@interface YGUserInfoViewController () <UITableViewDelegate, UITableViewDataSource, YGUserHeaderDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) YGUserHeaderView *headerView;

@end

@implementation YGUserInfoViewController

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (UIImagePickerController *)imagePickerController {
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.headerView setDatas];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    [self autoLayoutSizeContentView:self.tableView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.customTextColor = [UIColor whiteColor];
    self.customNavColor = [UIColor clearColor];
    self.titleLabel.text = @"个人资料";
    [self addBackButton];
    [self addRight];
    YGUserHeaderView *headerView = [[YGUserHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 315)];
    headerView.delegate = self;
    _headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = DefaultBackGroundColor;
    self.tableView.backgroundView.backgroundColor = DefaultBackGroundColor;
}

- (void)addRight {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"交易记录" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-16));
        make.size.mas_equalTo(CGSizeMake(50, kNavHeight - kStatusBarHeight));
        make.top.equalTo(@(kStatusBarHeight));
    }];
    [button addTarget:self action:@selector(record) forControlEvents:UIControlEventTouchUpInside];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = UIColorFromRGBValue(0x333333);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
        cell.detailTextLabel.textColor = UIColorFromRGBValue(0x979AA1);
        cell.backgroundColor = UIColor.whiteColor;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        cell.customArrow = YES;
    }
    YGUserInfo *userInfo = YGUserInfo.defaultInstance;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"昵称";
        cell.detailTextLabel.text = YGUtils.validString(userInfo.nickName) ? userInfo.nickName : @"未设置";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"个性签名";
        cell.detailTextLabel.text = YGUtils.validString(userInfo.gxqm) ? userInfo.gxqm : @"未设置";
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YGModifyViewController *controller = [YGModifyViewController new];
    controller.modifyStyle = indexPath.row == 0 ? ModifyStyle_NickName : ModifyStyle_SignName;
    [self.navigationController pushViewController:controller animated:YES];
        
}

- (void)changeImage:(UIImageView *)imageView {
    [self showActionSheet];
}

- (void)showActionSheet {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    __weak __typeof(self) weakSelf = self;
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![YGAuthTool cameraAuth]) {
            [YGAlertTool alertTitle:@"没有权限" message:nil confirm:@"去开启" container:weakSelf confirmHandler:^{
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
                
            } cancel:@"取消" cancelHandler:nil];
            return ;
        }
        weakSelf.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        weakSelf.imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
        weakSelf.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        [weakSelf presentViewController:weakSelf.imagePickerController animated:YES completion:nil];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![YGAuthTool photosAuth]) {
            [YGAlertTool alertTitle:@"没有权限" message:nil confirm:@"去开启" container:weakSelf confirmHandler:^{
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }
                
            } cancel:@"取消" cancelHandler:nil];
            return ;
        }
        weakSelf.imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [weakSelf presentViewController:weakSelf.imagePickerController animated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    kWeakSelf;
    [picker dismissViewControllerAnimated:YES completion:^{
        [YGLoadingTools beginLoading];
        [YGNetworkCommon uploadImage:UIImagePNGRepresentation(selectedImage) fileName:@"aaaa.jpg" success:^(id responseObject) {
            weakSelf.headerView.avaImageView.image = selectedImage;
            NSString *url = responseObject[@"url"];
            YGUserInfo.defaultInstance.avatar_url = url;
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:responseObject[@"message"]];
            
        } failed:^(NSDictionary *errorInfo) {
            [YGLoadingTools endLoading];
            [YGAlertToast showHUDMessage:errorInfo[@"message"]];
        }];
    }];
}

- (void)record {
    [self.navigationController pushViewController:[YGOrderViewController new] animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
