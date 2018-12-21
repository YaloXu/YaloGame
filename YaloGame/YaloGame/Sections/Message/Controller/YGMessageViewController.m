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
#import "YGWebViewController.h"
#import "YYModel.h"
@interface YGMessageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    NSInteger _lastIndex;
    NSMutableArray *mails, *messages, *notices;
    BOOL loadMa,loadM, loadN;
    NSInteger mailPage, messagePage, noticePage;
}

@property (nonatomic, strong) MJRefreshFooter *MJFooter;

@property (nonatomic, strong) MJRefreshHeader *MJHeader;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    noticePage = -1;
    mailPage = -1;
    mailPage = -1;
    [self loadData:0 loadMore:NO];
    self.navigationItem.title = @"消息";
    [self addSegView];
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(54);
    }];
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"YGMessageCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}

- (void)loadData:(NSInteger)index loadMore:(BOOL)loadMore {
    NSInteger catid = 0;
    NSInteger currentPage = 0;
    if (index == 0) {
        catid = 7;
        mailPage ++;
        currentPage = mailPage;
    } else if (index == 1) {
        catid = 9;
        noticePage ++;
        currentPage = noticePage;
    } else if (index == 2) {
        catid = 8;
        messagePage ++;
        currentPage = messagePage;
    } else {
        return;
    }
    kWeakSelf;
    [YGLoadingTools beginLoading];
    [YGNetworkCommon getMessage:catid page:currentPage total:10 success:^(id  _Nonnull responseObject) {
        kStrongSelfAutoReturn;
        NSArray *list = [NSArray yy_modelArrayWithClass:[YGMessageModel class] json:responseObject[@"data"]].copy;
        if (index == 0) {
            strongSelf->loadMa = YES;
            if (!strongSelf->mails) {
                strongSelf->mails = [NSMutableArray new];
            }
            if (!loadMore) {
                [strongSelf->mails removeAllObjects];
            }
            [strongSelf->mails addObjectsFromArray:list];
        } else if (index == 1) {
            strongSelf->loadN = YES;
            if (!strongSelf->notices) {
                strongSelf->notices = [NSMutableArray new];
            }
            if (!loadMore) {
                [strongSelf->notices removeAllObjects];
            }
            [strongSelf->notices addObjectsFromArray:list];
        } else if (index == 2) {
            strongSelf->loadM = YES;
            if (!strongSelf->messages) {
                strongSelf->messages = [NSMutableArray new];
            }
            if (!loadMore) {
                [strongSelf->messages removeAllObjects];
            }
            [strongSelf->messages addObjectsFromArray:list];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        if (!loadMore && strongSelf.MJHeader) {
            YGMessageCollectionViewCell *cell = (YGMessageCollectionViewCell *)[strongSelf.mainCollectionView cellForItemAtIndexPath:indexPath];
            [cell scrollTop];
        }
        [self endRefresh];
        [strongSelf.mainCollectionView reloadItemsAtIndexPaths:@[indexPath]];
    } failed:^(NSDictionary * _Nonnull errorInfo) {
        kStrongSelf;
        if (index == 0) {
            strongSelf->loadMa = YES;
        } else if (index == 1) {
            strongSelf->loadN = YES;
        } else {
            strongSelf->loadM = YES;
        }
        [self endRefresh];
        [YGAlertToast showHUDMessage:errorInfo[@"message"]];
    }];
}

- (void)endRefresh {
    [YGLoadingTools endLoading];
    if (self.MJFooter && self.MJFooter.refreshing) {
        [self.MJFooter endRefreshing];
        self.MJFooter = nil;
    }
    if (self.MJHeader && self.MJHeader.refreshing) {
        [self.MJHeader endRefreshing];
        self.MJHeader = nil;
    }
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
    kWeakSelf;
    [segView setSegDidSelctedHandler:^(NSInteger index){
        kStrongSelfAutoReturn;
        if (strongSelf->_lastIndex == index) {
            return ;
        }
        if (index == 0) {
            strongSelf.navigationItem.title = @"站内信";
        } else if (index == 1) {
            strongSelf.navigationItem.title = @"公告";
            if (!strongSelf->loadN) {
                [strongSelf loadData:index loadMore:NO];
            }
        } else {
            strongSelf.navigationItem.title = @"新闻";
            if (!strongSelf->loadM) {
                [strongSelf loadData:index loadMore:NO];
            }
        }
        strongSelf->_lastIndex = index;
        [strongSelf.mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGMessageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.item == 1) {
        cell.firstShow = loadN;
        cell.dataSource = notices;
    } else if (indexPath.item == 2){
        cell.firstShow = loadM;
        cell.dataSource = messages;
    } else {
        cell.firstShow = loadMa;
        cell.dataSource = mails;
    }
    kWeakSelf;
    [cell setDidSelected:^(YGMessageModel *model){
        YGWebViewController *webController = [YGWebViewController new];
        webController.loadUrl = model.url;
        [weakSelf.navigationController pushViewController:webController animated:YES];
    }];
    [cell setRefreshFooterHandler:^(MJRefreshFooter *refreshFooter){
        kStrongSelfAutoReturn;
        strongSelf.MJFooter = refreshFooter;
        [strongSelf loadData:strongSelf->_lastIndex loadMore:YES];
    }];
    [cell setRefreshHeaderHandler:^(MJRefreshHeader *refreshHeader){
        kStrongSelfAutoReturn;
        strongSelf.MJHeader = refreshHeader;
        if (strongSelf->_lastIndex == 0) {
            strongSelf->mailPage = -1;
        } else if (strongSelf->_lastIndex == 1) {
            strongSelf->noticePage = -1;
        } else {
            strongSelf->messagePage = -1;
        }
        [strongSelf loadData:strongSelf->_lastIndex loadMore:NO];
    }];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}



@end
