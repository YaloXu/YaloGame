//
//  YGPopViewController.m
//  YaloGame
//
//  Created by maomao on 2018/11/26.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YGPopViewController.h"
#import "YGIMTableViewCell.h"

@interface YGPopViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTable;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIImageView *arrowImg;

@end

@implementation YGPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
-(void)setUI{
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.mainTable];
    [self.view addSubview:self.arrowImg];
    
    [self.arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).with.mas_equalTo([YGAuthTool isIPhoneXAll]?-83:-49);
        make.size.mas_equalTo(CGSizeMake(21, 21));
    }];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.right.mas_equalTo(-18);
        make.bottom.equalTo(self.arrowImg.mas_bottom).with.mas_equalTo(0);
        make.height.mas_equalTo(235);
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YGIMTableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:YGIMTitleCellId];
        NSArray *titles = @[@"在线客服",@"免费回拨"];
        cell.boldLabel.text = titles[indexPath.row];
        cell.callBackPhone = ^{
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.callPhone) {
                    self.callPhone();
                }
            }];
            
        };
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:YGIMImgCellId];
        NSArray *images = @[@"im_wechat",@"im_QQ",@"im_phone",@"im_message"];
        NSArray *titles = @[@"mingmencs",@"751229212",@"+86 152-2100-2154",@"mingmen94168@gmail.com",];
        cell.themeImg.image =[UIImage imageNamed:images[indexPath.row]];
        cell.themeLabel.text = titles[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 1) {
        YGIMTableViewCell *cell = (YGIMTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        [cell updateSection];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }
    return CGFLOAT_MIN;
}
-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTable.backgroundColor = [UIColor clearColor];
        [_mainTable setSeparatorColor:kLineColor];
        [_mainTable registerClass:[YGIMTableViewCell class] forCellReuseIdentifier:YGIMTitleCellId];
        [_mainTable registerClass:[YGIMTableViewCell class] forCellReuseIdentifier:YGIMImgCellId];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.scrollEnabled = NO;
        _mainTable.sectionHeaderHeight = 5;
        _mainTable.sectionFooterHeight = 5;
        [self autoLayoutSizeContentView:_mainTable];
    }
    return _mainTable;
}
-(UIImageView *)arrowImg{
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"im_arrow"]];
    }
    return _arrowImg;
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
