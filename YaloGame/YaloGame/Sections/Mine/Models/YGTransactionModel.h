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

@property (nonatomic, copy) NSString *url;




/*
 amount = 20;
 author = "\U9ece\U6587\U658c";
 description = "\U8d2d\U4e70\U6e38\U620f\U5e01";
 displayorder = 0;
 id = 1;
 lastwallet = 0;
 prewallet = 0;
 status = 2;
 trxNo = 01001;
 type = 1;
 uid = 12;
 */


@end

NS_ASSUME_NONNULL_END
