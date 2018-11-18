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

NS_ASSUME_NONNULL_END
