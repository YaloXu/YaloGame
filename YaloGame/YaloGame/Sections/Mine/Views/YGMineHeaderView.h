//
//  YGMineHeaderView.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGMineHeaderView : UIView

@property (nonatomic, copy) void (^editHandler)(void);

- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
