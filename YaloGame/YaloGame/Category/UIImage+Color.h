//
//  UIImage+Color.h
//  YaloGame
//
//  Created by maomao on 2018/11/16.
//  Copyright © 2018年 C. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)
/**
 *  根据颜色生成一张图片
 *  @param imageName 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
