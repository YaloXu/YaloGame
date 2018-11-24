//
//  YGMessageTableViewCell.h
//  YaloGame
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageTableViewCell : UITableViewCell
@property (nonatomic, strong) YGMessageModel *model;

@end

NS_ASSUME_NONNULL_END
