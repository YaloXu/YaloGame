//
//  YGMessageSegView.h
//  test
//
//  Created by C on 2018/11/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageSegView : UIView

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, copy) void (^(segDidSelctedHandler))(NSInteger index);

@end

NS_ASSUME_NONNULL_END
