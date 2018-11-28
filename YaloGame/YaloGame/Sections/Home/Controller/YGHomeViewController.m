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
#import "YGPopViewController.h"
#import "YGAlertSelectedViewController.h"

@interface YGHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UUMarqueeViewDelegate>
@property (nonatomic ,strong) UITableView * mainTableView;
@property (nonatomic ,strong) UIView  *HeaderView;
@property (nonatomic, strong) SDCycleScrollView *scrollView;
@property (nonatomic, strong) UUMarqueeView *activityView;
@property (nonatomic, strong) NSArray *activities;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.dataSource = [NSMutableArray arrayWithObjects:@"home_list01",@"home_list02",@"home_list03",@"home_list04",@"home_list05", nil];
    // Do any additional setup after loading the view.
}
-(void)setUI{
    self.headTitle = @"悠拟电竞";
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
    
    [self.HeaderView addSubview:self.scrollView];
    self.mainTableView.tableHeaderView = self.HeaderView;
    
    UILabel *noticeLabel = [[UILabel alloc]init];
    noticeLabel.text = @"公告";
    noticeLabel.font = [UIFont boldSystemFontOfSize:16];
    noticeLabel.textColor =UIColorFromRGBValue(0xEAAE0D);
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = UIColorFromRGBValue(0xEAB116);
    UIImageView *imageBg = [[UIImageView alloc]init];
    imageBg.backgroundColor = UIColorFromRGBValue(0xFFFBE9);
    imageBg.layer.shadowColor = UIColorFromRGBValue(0xE8DEB2).CGColor;//阴影颜色
    imageBg.layer.shadowOffset = CGSizeMake(0, 3);//偏移距离
    imageBg.layer.shadowOpacity = 1;//不透明度
    imageBg.layer.shadowRadius = 10.0;//半径
    [self.HeaderView addSubview:imageBg];
    [self.HeaderView addSubview:self.activityView];
    [self.HeaderView addSubview:noticeLabel];
    [self.HeaderView addSubview:line];
    [imageBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_bottom);
        make.left.right.equalTo(self.HeaderView);
        make.bottom.equalTo(self.HeaderView.mas_bottom).with.mas_offset(-kTopSpace);
    }];
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageBg.mas_centerY);
        make.left.equalTo(self.HeaderView.mas_left).with.mas_offset(kSpace);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.HeaderView.mas_bottom).with.mas_offset(-10);
        make.centerY.equalTo(noticeLabel.mas_centerY);
        make.left.equalTo(noticeLabel.mas_right).with.mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(0.5, 24.9));
    }];
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageBg.mas_centerY);
        make.left.equalTo(line.mas_left).with.mas_offset(10);
        make.right.equalTo(self.HeaderView.mas_right);
        make.height.mas_equalTo(40);
    }];
    [self.activityView start];
    [self.activityView reloadData];
    
    
}
-(void)rightBarItemEvent{
    YGPopViewController *vc = [YGPopViewController new];
    [self yc_bottomPresentController:vc presentedHeight:440 completeHandle:^(BOOL presented) {
        if (presented) {
            
        }else{
            NSLog(@"消失了");
        }
    }];
    
    vc.callPhone = ^{
        [self callPhoneEvent];
    };
}
-(void)callPhoneEvent{
    YGAlertSelectedViewController *alertVC = [YGAlertSelectedViewController new];
    [self yc_centerPresentController:alertVC presentedSize:CGSizeMake(kScreenWidth - 2*48*kWidthRatio, 220) completeHandle:^(BOOL presented) {
        
    }];
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
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-100, 40)];
    contentLabel.font = [UIFont systemFontOfSize:10.0f];
    contentLabel.tag = 1001;
    contentLabel.textColor = UIColorFromRGBValue(0x000000);
    contentLabel.numberOfLines = 0;
    [itemView addSubview:contentLabel];
}

- (void)updateItemView:(UIView*)itemView withData:(id )data forMarqueeView:(UUMarqueeView*)marqueeView {
    UILabel *content = [itemView viewWithTag:1001];
    content.text = @"重要公告：在线客服客服绝不会提供二维码给玩家充值，也没有 QQ和微信客服！请广大玩家提高警惕，谨防受骗！";
}
#pragma mark == tableViewDelegate ==
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeTableViewCellId];
    cell.myImage.image = [UIImage imageNamed:self.dataSource[indexPath.section]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YGWebViewController *controller = [YGWebViewController new];
    [controller setValue:@"https://www.baidu.com" forKey:@"loadUrl"];
    [self.navigationController pushViewController:controller animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return kTopSpace;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        [_mainTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:HomeTableViewCellId];
        _mainTableView.rowHeight = (kScreenWidth-kSpace)/4;
        _mainTableView.sectionHeaderHeight = 5;
        _mainTableView.sectionFooterHeight = 5;
        [self autoLayoutSizeContentView:_mainTableView];
    }
    return _mainTableView;
}
-(UIView *)HeaderView{
    if (!_HeaderView) {
        _HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 70+kScreenWidth/2.5)];
//        [_HeaderView addShadowToView:_HeaderView withColor:UIColorFromRGBValue(0xE8DEB2)];
//        _HeaderView.backgroundColor =UIColorFromRGBValue(0xFFFBE9);
        
    }
    return _HeaderView;
}
- (SDCycleScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2.5) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.localizationImageNamesGroup = @[[UIImage imageNamed:@"home_banner"],[UIImage imageNamed:@"home_banner"],[UIImage imageNamed:@"home_banner"]];
        _scrollView.currentPageDotColor = UIColorFromRGBValue(0xE9A400);
        _scrollView.pageDotColor = UIColorFromRGBValue(0xFFFFFF);
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _scrollView.pageControlDotSize = CGSizeMake(10, 10);
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
