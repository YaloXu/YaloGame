//
//  YGAccountViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGAccountViewController.h"
#import "GoodsCollectionViewCell.h"
#import "YGCoinHelpViewController.h"
#import "YGVipConvertViewController.h"

@interface YGAccountViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) UICollectionView  *mainCollectionView;
@property (nonatomic ,strong) UIView *infoBgView;
@property (nonatomic ,strong) UISegmentedControl *segmentControl;
@property (nonatomic ,strong) UILabel * accountLabel;
@property (nonatomic ,strong) UIButton* accountRecord;
@property (nonatomic ,strong) UIButton* accountHelp;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YGAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [NSMutableArray arrayWithObjects:@"good_list01",@"good_list02",@"good_list03",@"good_list04",@"good_list05",@"good_list06",@"good_list07",@"good_list08",@"good_list09",@"good_list01",@"good_list02",@"good_list03",@"good_list04",@"good_list05",@"good_list06",@"good_list07",@"good_list08",@"good_list09", nil];
}
-(void)setUI{
    self.headTitle = @"金币";
    [self setRightBarItemWithImage:@"home_im"];
    [self.infoBgView addSubview:self.accountLabel];
    [self.infoBgView addSubview:self.accountHelp];
    [self.infoBgView addSubview:self.accountRecord];
    [self.view addSubview:self.infoBgView];
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.mainCollectionView];
    [self.infoBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.mas_offset(20);
        make.left.equalTo(self.view).with.mas_offset(15);
        make.right.equalTo(self.view).with.mas_offset(-15);
        make.height.mas_equalTo(30);
    }];
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoBgView.mas_left).with.mas_offset(5);
        make.top.bottom.equalTo(self.infoBgView);
    }];
    [self.accountRecord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.infoBgView.mas_right).with.mas_offset(-5);
        make.top.bottom.equalTo(self.infoBgView);
//        make.width.mas_equalTo(80);
    }];
    [self.accountHelp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.accountRecord.mas_left).with.mas_offset(-5);
        make.top.bottom.equalTo(self.infoBgView);
//        make.width.mas_equalTo(100);
    }];
    [self.segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoBgView.mas_left);
        make.right.equalTo(self.infoBgView.mas_right);
        make.top.equalTo(self.infoBgView.mas_bottom).with.mas_offset(20);
        make.height.mas_equalTo(40);
    }];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.segmentControl.mas_bottom).with.mas_offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.mas_offset(-20);
    }];
}
-(void)rightBarItemEvent{
    
}
-(void)howGetmoney{
    YGCoinHelpViewController *alertVC = [YGCoinHelpViewController new];
    [self yc_centerPresentController:alertVC presentedSize:CGSizeMake(kScreenWidth - 2*48*kWidthRatio, 267) completeHandle:^(BOOL presented) {
        
    }];
}
-(void)scanAccountRecord{
    
}
-(void)change:(UISegmentedControl*)sender{
    switch (sender.selectedSegmentIndex) {
            case 0:{
               NSLog(@"全部商品"); 
            }
            break;
            case 1:{
                 NSLog(@"现金兑换");
            }
            break;
            case 2:{
                 NSLog(@"数码家电");
            }
            break;
            case 3:{
                 NSLog(@"奢饰品");
            }
            break;
            case 4:{
                 NSLog(@"充值卡");
            }
            break;
        default:
            break;
    }
}
-(void)convertGood{
    YGVipConvertViewController *alertVC = [YGVipConvertViewController new];
    [self yc_centerPresentController:alertVC presentedSize:CGSizeMake(kScreenWidth - 2*48*kWidthRatio, 230) completeHandle:^(BOOL presented) {
        
    }];
}
#pragma  mark  ==== UICollectionViewDelegate ====
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-  (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GoodsCollectionViewCellId forIndexPath:indexPath];
    cell.selectedGood = ^{
        [self convertGood];
    };
    cell.goodsImg.image = [UIImage imageNamed:self.dataSource[indexPath.item]];
    return cell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section { 
    return UIEdgeInsetsMake(0, 15, 0, 15);
    
}
//设置每个item水平间距 
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section 
{ 
    return 10; 
    
} 
//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
    
}
-(UICollectionView *)mainCollectionView{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置collectionView滚动方向 
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical]; 
        CGFloat ItemWidth = (kScreenWidth - 2*kSpace -2*20)/3;
        layout.itemSize =CGSizeMake(ItemWidth, 3*ItemWidth/4+97);
        _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_mainCollectionView registerClass:[GoodsCollectionViewCell class] forCellWithReuseIdentifier:GoodsCollectionViewCellId];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
    }
    return _mainCollectionView;
}
-(UIView *)infoBgView{
    if (!_infoBgView) {
        _infoBgView = [[UIView alloc]init];
        _infoBgView.backgroundColor = UIColorFromRGBValue(0x333333);
        _infoBgView.layer.masksToBounds = YES;
        _infoBgView.layer.cornerRadius = 3.0f;
    }
    return _infoBgView;
}
-(UILabel *)accountLabel{
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc]init];
        _accountLabel.font = [UIFont systemFontOfSize:12];
        _accountLabel.textColor =NavgationTitleColor;
        _accountLabel.text = @"我的金币：100000000";
    }
    return _accountLabel;
}
-(UIButton *)accountHelp{
    if (!_accountHelp) {
        _accountHelp = [UIButton buttonWithType:UIButtonTypeCustom];
        _accountHelp.titleLabel.font = [UIFont systemFontOfSize:12];
        [_accountHelp setTitle:@"如何获取金币？" forState: UIControlStateNormal];
        [_accountHelp setTitle:@"如何获取金币？" forState: UIControlStateSelected];
        [_accountHelp setTitle:@"如何获取金币？" forState: UIControlStateHighlighted];
        [_accountHelp setTitleColor:NavgationTitleColor forState:UIControlStateNormal];
        [_accountHelp setTitleColor:NavgationTitleColor forState:UIControlStateSelected];
        [_accountHelp setTitleColor:NavgationTitleColor forState:UIControlStateHighlighted];
        [_accountHelp addTarget:self action:@selector(howGetmoney) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountHelp;
}
-(UIButton *)accountRecord{
    if (!_accountRecord) {
        _accountRecord = [UIButton buttonWithType:UIButtonTypeCustom];
        _accountRecord.titleLabel.font = [UIFont systemFontOfSize:12];
        [_accountRecord setTitle:@"我的金币记录" forState: UIControlStateNormal];
        [_accountRecord setTitle:@"我的金币记录" forState: UIControlStateSelected];
        [_accountRecord setTitle:@"我的金币记录" forState: UIControlStateHighlighted];
        [_accountRecord setTitleColor:NavgationTitleColor forState:UIControlStateNormal];
        [_accountRecord setTitleColor:NavgationTitleColor forState:UIControlStateSelected];
        [_accountRecord setTitleColor:NavgationTitleColor forState:UIControlStateHighlighted];
        [_accountRecord addTarget:self action:@selector(scanAccountRecord) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountRecord;
}
-(UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        NSArray *titleArray = [NSArray arrayWithObjects:@"全部商品",@"现金兑换",@"数码家电",@"奢饰品",@"充值卡", nil];
        _segmentControl = [[UISegmentedControl alloc]initWithItems:titleArray];
        _segmentControl.layer.masksToBounds = YES;
        _segmentControl.layer.cornerRadius = 20.0f;
        _segmentControl.layer.borderWidth = 0.5;                   
        _segmentControl.layer.borderColor = UIColorFromRGBValue(0x333333).CGColor;
         _segmentControl.selectedSegmentIndex = 0;
        _segmentControl.tintColor = TabBarTitleColorUnSelected;
//        _segmentControl.tintColor = [UIColor clearColor];
        [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:NavgationTitleColor} forState:UIControlStateSelected];
        [_segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:kSecondaryFontColor} forState:UIControlStateNormal];
        [_segmentControl setBackgroundImage:[UIImage imageWithColor:UIColorFromRGBValue(0x333333)] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segmentControl setBackgroundImage:[UIImage imageWithColor:NavgationTitleColor] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [_segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}
@end
