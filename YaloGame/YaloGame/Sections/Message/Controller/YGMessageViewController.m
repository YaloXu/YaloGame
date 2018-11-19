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

@interface YGMessageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    NSInteger _lastIndex;
}

@property (nonatomic, strong) UICollectionView *mainCollectionView;



@end

@implementation YGMessageViewController

- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - kNavHeight - 40 - 49);
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
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _mainCollectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    [self addSegView];
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(@55);
    }];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"YGMessageCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}

- (void)addSegView {
    YGMessageSegView *segView = [YGMessageSegView new];
    [self.view addSubview:segView];
    [segView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@40);
        make.right.equalTo(@(-40));
        make.height.mas_equalTo(40);
    }];
    [segView setSegDidSelctedHandler:^(NSInteger index){
        if (_lastIndex == index) {
            return ;
        }
        _lastIndex = index;
        [self.mainCollectionView selectItemAtIndexPath:[NSIndexPath indexPathWithIndex:index] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGMessageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

@end
