//
//  YGQRView.h
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YGQRType) {
    YGQRType_AliPay,
    YGQRType_Union
};

@interface YGQRView : UIView

@property (nonatomic, assign) YGQRType qrtype;

@property (nonatomic, copy) void (^closeHandler)(void);

@end

NS_ASSUME_NONNULL_END
