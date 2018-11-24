//
//  YGTransactionModel.h
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGTransactionModel : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *cardNo;

@property (nonatomic, assign) BOOL style;


@end

NS_ASSUME_NONNULL_END
