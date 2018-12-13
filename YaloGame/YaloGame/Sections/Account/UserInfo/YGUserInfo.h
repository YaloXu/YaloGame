//
//  YGUserInfo.h
//  YaloGame
//
//  Created by C on 2018/12/7.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGUserInfo : NSObject


@property (nonatomic, copy) NSString *token;

@property (nonatomic, assign)NSInteger uid;

+ (instancetype)sharedInstance;

- (void)parseToken:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
