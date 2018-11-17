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
        self.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self config];
        [self setDatas];
    }
    return self;
}

- (void)config {
    _bgImageView = [UIImageView new];
    _avaImageView = [UIImageView new];
    _dateLabel = [UILabel new];
    _IDLabel = [UILabel new];
    [self addSubview:self.bgImageView];
    [self addSubview:self.avaImageView];
    self.avaImageView.layer.masksToBounds = YES;
    self.avaImageView.layer.cornerRadius = 30;
    [self addSubview:self.IDLabel];
    [self addSubview:self.dateLabel];
    self.dateLabel.font = [UIFont systemFontOfSize:14];
    self.dateLabel.textColor = UIColor.lightGrayColor;
    self.dateLabel.textAlignment = self.IDLabel.textAlignment = NSTextAlignmentCenter;
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(120);
    }];
    [self.avaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [self.IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.avaImageView.mas_bottom).with.offset(10);
        make.height.mas_equalTo(20);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.IDLabel.mas_bottom).with.offset(5);
        make.height.mas_equalTo(20);
    }];
    self.avaImageView.userInteractionEnabled = YES;
    [self.avaImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
}

- (void)setDatas {
    self.avaImageView.backgroundColor = [UIColor redColor];
    self.bgImageView.backgroundColor = [UIColor yellowColor];
    self.IDLabel.text = @"ID:a1212121212";
    self.dateLabel.text = @"2018-11-19";
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

- (UIImagePickerController *)imagePickerController {
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(-88));
        make.left.right.bottom.equalTo(self.view);
    }];
    self.navigationItem.title = @"个人资料";
    YGUserHeaderView *headerView = [[YGUserHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 380)];
    headerView.delegate = self;
    _headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    self.tableView.tableFooterView = [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.backgroundColor = UIColor.whiteColor;
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"昵称";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"个性签名";
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
    _headerView.avaImageView.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGBValue(0x2e3039)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

@end
