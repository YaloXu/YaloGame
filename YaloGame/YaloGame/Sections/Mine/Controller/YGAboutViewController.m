//
//  YGAboutViewController.m
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAboutViewController.h"
#import "YGWebViewController.h"
#import "YGContactUsViewController.h"

@interface YGAboutLogoView : UIView {
    
    UIImageView *_logoImageView;
    
    UILabel *_versionLabel;
}

@end

@implementation YGAboutLogoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self config];
    }
    return self;
}

- (void)config {
    _logoImageView = [UIImageView new];
    [self addSubview:_logoImageView];
    _versionLabel = [UILabel new];
    [self addSubview:_versionLabel];
    _versionLabel.textAlignment = NSTextAlignmentCenter;
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.top.equalTo(@30);
    }];
    [_versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(20);
        make.top.equalTo(_logoImageView.mas_bottom).offset(20);
    }];
   NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    _versionLabel.text = version;
    _logoImageView.backgroundColor = [UIColor redColor];
}

@end



@interface YGAboutViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray <NSString *> *_dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dataSource = @[@"服务条款",@"隐私政策",@"联系我们",@"更新日志",@"检查更新"];
    _tableView.tableHeaderView = [[YGAboutLogoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    _tableView.tableFooterView = [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0:
        case 1:{
            controller = [YGWebViewController new];
            if (indexPath.row == 0) {
                [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
            } else {
                [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
            }
        }
            break;
            
        case 3: {
            controller = [YGContactUsViewController new];
        }
            break;
        default:
            break;
    }
    if (controller) {
         [self.navigationController pushViewController:controller animated:YES];
    }
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
