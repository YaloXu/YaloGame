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
#import "UUMarqueeView.h"

@interface YGHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UUMarqueeViewDelegate>
@property (nonatomic ,strong) UITableView * mainTableView;
@property (nonatomic ,strong) UIView  *HeaderView;
@property (nonatomic, strong) SDCycleScrollView *scrollView;
@property (nonatomic, strong) UUMarqueeView *activityView;
@property (nonatomic, strong) NSArray *activities;

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
    self.activityView = [[UUMarqueeView alloc]init];
    self.activityView.backgroundColor = [UIColor clearColor];
    self.activityView.delegate = self;
    self.activityView.timeIntervalPerScroll = 3.0f;
    self.activityView.timeDurationPerScroll = 1.0f;
    self.activityView.touchEnabled = YES;
    [self.HeaderView addSubview:self.activityView];
    [self.HeaderView addSubview:self.scrollView];
    self.mainTableView.tableHeaderView = self.HeaderView;
    
    UILabel *noticeLabel = [[UILabel alloc]init];
    noticeLabel.text = @"公告";
    noticeLabel.font = [UIFont boldSystemFontOfSize:18];
    noticeLabel.textColor =UIColorFromRGBValue(0xe9a400);
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = UIColorFromRGBValue(0xe9a400);
    [self.HeaderView addSubview:noticeLabel];
    [self.HeaderView addSubview:line];
    
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.HeaderView);
        make.left.equalTo(self.HeaderView.mas_left).with.mas_offset(kSpace);
        make.size.mas_equalTo(CGSizeMake(40, 50));
        
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.HeaderView.mas_bottom).with.mas_offset(-10);
        make.centerY.equalTo(noticeLabel.mas_centerY);
        make.left.equalTo(noticeLabel.mas_right).with.mas_offset(10);
        make.width.mas_equalTo(0.5);
    }];
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.HeaderView.mas_bottom);
        make.left.equalTo(line.mas_left).with.mas_offset(10);
        make.right.equalTo(self.HeaderView.mas_right);
        make.height.mas_equalTo(50);
    }];
    [self.activityView start];
    [self.activityView reloadData];
    
    
}
-(void)rightBarItemEvent{
}

#pragma mark ======== SDCycleScrollViewDelegate ========
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    YGWebViewController *controller = [YGWebViewController new];
    [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark --
- (void)didTouchItemViewAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView *)marqueeView {
    
}

- (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView {
    return 1;
}

- (NSArray*)dataSourceArrayForMarqueeView:(UUMarqueeView*)marqueeView {
    return self.activities;
}

- (void)createItemView:(UIView *)itemView forMarqueeView:(UUMarqueeView *)marqueeView {
    itemView.backgroundColor = [UIColor clearColor];
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-100, 50)];
    contentLabel.font = [UIFont systemFontOfSize:13.0f];
    contentLabel.tag = 1001;
    contentLabel.textColor = UIColorFromRGBValue(0x333333);
    contentLabel.numberOfLines = 0;
    [itemView addSubview:contentLabel];
}

- (void)updateItemView:(UIView*)itemView withData:(id )data forMarqueeView:(UUMarqueeView*)marqueeView {
    UILabel *content = [itemView viewWithTag:1001];
    content.text = @"这里是重要通知公告区域这里是重要通知公告区域这里是重要通知公告区域这里是重要通知公告区域";
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
        _HeaderView.backgroundColor =kRGB(255, 251, 234);
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
-(NSArray *)activities{
    if (!_activities) {
        _activities = @[@"1",@"2"];
    }
    return _activities;
}
@end
