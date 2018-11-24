//
//  YGMineFooterView.h
//  YaloGame
//
//  Created by C on 2018/11/18.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YGMineFooterDelegate <NSObject>

- (void)collectionViewDidSelected:(NSIndexPath *)indexPath;

@end

@interface YGMineFooterView : UIView

@property (nonatomic, weak) id <YGMineFooterDelegate> delegate;

@end

@interface YGUnLoginView : UIView

@property (nonatomic, copy) void (^(loginHandler))(void);

@property (nonatomic, copy) void (^(registerHandler))(void);

@end

NS_ASSUME_NONNULL_END
