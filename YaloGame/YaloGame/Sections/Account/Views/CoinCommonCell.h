//
//  CoinCommonCell.h
//  YaloGame
//
//  Created by maomao on 2018/11/27.
//  Copyright © 2018年 C. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentLeft = 0, // default
    VerticalAlignmentMiddle,
    
} VerticalAlignment;
NS_ASSUME_NONNULL_BEGIN
static NSString *const  CoinCommonOnlyLabelId = @"CoinCommonCell_OnlyLabel";
static NSString *const  CoinCommonLabelAndTextViewId = @"CoinCommonCell_Label_TextView";

@interface CoinCommonCell : UITableViewCell
@property (nonatomic,strong)  UILabel  *contentLabel;
@property (nonatomic,assign) VerticalAlignment verticalStyle;
@end

NS_ASSUME_NONNULL_END
