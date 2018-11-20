//
//  YGHomeViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGHomeViewController.h"
#import "HomeTableViewCell.h"
#import "YGWebViewController.h"
#import "SDCycleScrollView.h"

@interface YGHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic ,strong) UITableView * mainTableView;
@property (nonatomic ,strong) UIView  *HeaderView;
@property (nonatomic, strong) SDCycleScrollView *scrollView;
@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    // Do any additional setup after loading the view.
}
-(void)setUI{
    self.headTitle = @"名门电竞";
    [self setRightBarItemWithImage:@"home_im"];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    [self setBannerView];
}
-(void)setBannerView{
    [self.HeaderView addSubview:self.scrollView];
    self.mainTableView.tableHeaderView = self.HeaderView;
}
-(void)rightBarItemEvent{
}

#pragma mark ======== SDCycleScrollViewDelegate ========
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    YGWebViewController *controller = [YGWebViewController new];
    [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark == tableViewDelegate ==
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeTableViewCellId];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YGWebViewController *controller = [YGWebViewController new];
    [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
    [self.navigationController pushViewController:controller animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return kSpace;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ?kSpace :CGFLOAT_MIN;
}
-(UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor clearColor];
        [_mainTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:HomeTableViewCellId];
        _mainTableView.rowHeight = (kScreenWidth - kSpace)/4;
        _mainTableView.sectionHeaderHeight = 5;
        _mainTableView.sectionFooterHeight = 5;
        [self autoLayoutSizeContentView:_mainTableView];
    }
    return _mainTableView;
}
-(UIView *)HeaderView{
    if (!_HeaderView) {
        _HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2 + 50)];
        _HeaderView.backgroundColor = [UIColor lightGrayColor];
    }
    return _HeaderView;
}
- (SDCycleScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.localizationImageNamesGroup = @[[UIImage imageWithColor:[UIColor blackColor]],[UIImage imageWithColor:[UIColor grayColor]],[UIImage imageWithColor:[UIColor lightGrayColor]],[UIImage imageWithColor:[UIColor greenColor]],[UIImage imageWithColor:[UIColor redColor]]];
        _scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
    }
    return _scrollView;
}
@end
