//
//  YGDateTools.h
//  YaloGame
//
//  Created by C on 2018/12/19.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGDateTools : NSObject

+ (NSString *)formatDateTimeInterval:(NSTimeInterval)timeInterval formatString:(NSString *)formatString;

@end

NS_ASSUME_NONNULL_END
