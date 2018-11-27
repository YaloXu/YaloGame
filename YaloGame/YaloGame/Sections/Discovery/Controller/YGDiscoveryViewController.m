//
//  YGDiscoveryViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGDiscoveryViewController.h"
#import "HomeTableViewCell.h"
#import "YGWebViewController.h"
@interface YGDiscoveryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * mainTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [NSMutableArray arrayWithObjects:@"discovery_list01",@"discovery_list02",@"discovery_list03",@"discovery_list04",@"discovery_list01",@"discovery_list02",@"discovery_list03",@"discovery_list04", nil];
    // Do any additional setup after loading the view.
}
-(void)setUI{
    self.headTitle = @"发现";
    [self setRightBarItemWithImage:@"home_im"];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}
-(void)rightBarItemEvent{
    
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
    
    return 2*kTopSpace;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ?2*kTopSpace :CGFLOAT_MIN;
}
-(UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.backgroundColor = [UIColor clearColor];
        [_mainTableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:HomeTableViewCellId];
        _mainTableView.rowHeight = (kScreenWidth-kSpace)/3;
        _mainTableView.sectionHeaderHeight = 5;
        _mainTableView.sectionFooterHeight = 5;
        [self autoLayoutSizeContentView:_mainTableView];
    }
    return _mainTableView;
}

@end
