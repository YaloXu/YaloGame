//
//  YGMessageCollectionViewCell.h
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGMessageModel.h"
#import "MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) BOOL firstShow;

@property (nonatomic, copy) void (^(didSelected))(YGMessageModel *model);

@property (nonatomic, copy) void (^ (refreshHeaderHandler))(MJRefreshHeader *refreshHeader);

@property (nonatomic, copy) void (^ (refreshFooterHandler))(MJRefreshFooter *refreshFooter);

- (void)scrollTop;

@end

NS_ASSUME_NONNULL_END
