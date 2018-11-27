//
//  YGStringUtils.h
//  YaloGame
//
//  Created by maomao on 2018/11/27.
//  Copyright © 2018年 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGStringUtils : NSObject
+ (NSMutableAttributedString *)setAttributedString:(NSString *)totalString lineSpace:(CGFloat)lineSpace attributes1:(NSDictionary <NSString *, id>*)attributes1 range1:(NSRange)range1 attributes2:(NSDictionary <NSString *, id>*)attributes2 range2:(NSRange)range2 attributes3:(NSDictionary <NSString *, id>*)attributes3 range3:(NSRange)range3 attributes4:(NSDictionary <NSString *, id>*)attributes4 range4:(NSRange)range4 attributes5:(NSDictionary <NSString *, id>*)attributes5 range5:(NSRange)range5;
@end

NS_ASSUME_NONNULL_END
