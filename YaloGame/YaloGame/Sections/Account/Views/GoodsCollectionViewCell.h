//
//  GoodsCollectionViewCell.h
//  YaloGame
//
//  Created by 毛亚恒 on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectedConvertGoods) ();
NS_ASSUME_NONNULL_BEGIN
static NSString *const GoodsCollectionViewCellId = @"GoodsCollectionViewCellIdentifier";
@interface GoodsCollectionViewCell : UICollectionViewCell
@property (nonatomic , strong) UIImageView *goodsImg;
@property (nonatomic , copy) selectedConvertGoods selectedGood;
@end

NS_ASSUME_NONNULL_END
