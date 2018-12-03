//
//  YGMessageCollectionViewCell.h
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, copy) void (^(didSelected))(YGMessageModel *model);

@end

NS_ASSUME_NONNULL_END
