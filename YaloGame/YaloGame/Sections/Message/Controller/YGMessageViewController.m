//
//  YGMessageViewController.m
//  YaloGame
//
//  Created by C on 2018/11/14.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGMessageViewController.h"
#import "YGMessageSegView.h"
#import "YGMessageCollectionViewCell.h"
#import "YGMessageModel.h"

@interface YGMessageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    NSInteger _lastIndex;
    NSMutableArray *datas;
}

@property (nonatomic, strong) UICollectionView *mainCollectionView;



@end

@implementation YGMessageViewController

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - kNavHeight - 54 - kTabBarHeight);
        layout.minimumLineSpacing = CGFLOAT_MIN;
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainCollectionView.backgroundColor = [UIColor clearColor];
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        _mainCollectionView.pagingEnabled = YES;
        _mainCollectionView.scrollEnabled = NO;
        _mainCollectionView.bounces = NO;
        [self autoLayoutSizeContentView:_mainCollectionView]; _mainCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _mainCollectionView;
}

- (void)datas {
    datas = [NSMutableArray new];
    for (int i = 0; i < 16; i ++) {
        [datas addObject:[YGMessageModel new]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    [self addSegView];
    [self datas];
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(54);
    }];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"YGMessageCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}

- (void)addSegView {
    YGMessageSegView *segView = [YGMessageSegView new];
    [self.view addSubview:segView];
    [segView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo(@38);
        make.right.equalTo(@(-38));
        make.height.mas_equalTo(30);
    }];
    [segView setSegDidSelctedHandler:^(NSInteger index){
        if (_lastIndex == index) {
            return ;
        }
        if (index == 0) {
            self.navigationItem.title = @"站内信";
        } else if (index == 1) {
            self.navigationItem.title = @"公告";
        } else {
            self.navigationItem.title = @"新闻";
        }
        _lastIndex = index;
        [self.mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGMessageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.item == 1) {
        cell.dataSource = datas;
    } else {
        cell.dataSource = @[];
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}



@end
