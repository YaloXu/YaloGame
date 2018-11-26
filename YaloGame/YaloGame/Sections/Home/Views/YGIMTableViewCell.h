//
//  YGIMTableViewCell.h
//  YaloGame
//
//  Created by maomao on 2018/11/26.
//  Copyright © 2018年 C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSTextView.h"
typedef void (^callPhoneNumber)();
NS_ASSUME_NONNULL_BEGIN
static NSString *const YGIMTitleCellId  = @"YGIMTitleCellIdentifier";
static NSString *const YGIMImgCellId  = @"YGIMImgCellIdentifier";
static NSString *const YGIMTextCellId  = @"YGIMTextCellIdentifier";

@interface YGIMTableViewCell : UITableViewCell
@property (nonatomic , copy  ) callPhoneNumber callBackPhone; 
@property (nonatomic , strong) UILabel     *boldLabel;
@property (nonatomic , strong) UIImageView *themeImg;
@property (nonatomic , strong) UILabel     *themeLabel;
@property (nonatomic , strong) FSTextView *phoneTextView;
@property (nonatomic , strong) UIButton    *ModyfierBtn;
@property (nonatomic , strong) UIButton    *callBtn;
-(void)updateSection;
@end

NS_ASSUME_NONNULL_END
