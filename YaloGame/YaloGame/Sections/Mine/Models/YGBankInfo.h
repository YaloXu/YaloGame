//
//  YGBankInfo.h
//  YaloGame
//
//  Created by C on 2018/12/24.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/*
 author = 15138483773;
 description = "\U4e2d\U56fd\U5efa\U8bbe\U94f6\U884c\U50a8\U84c4\U5361";
 displayorder = 0;
 id = 192;
 inputtime = 1545375049;
 keywords = "\U4e2d\U56fd\U5efa\U8bbe\U94f6\U884c\U50a8\U84c4\U5361";
 status = 9;
 title = "\U4e2d\U56fd\U5efa\U8bbe\U94f6\U884c\U50a8\U84c4\U5361";
 uid = 19;
 updatetime = 1545375049;
 */
@interface YGBankInfo : NSObject

@property (nonatomic, copy) NSString *des;
@property (nonatomic, copy) NSString *keywords;
@property (nonatomic, copy) NSString *bankNum;

@end

NS_ASSUME_NONNULL_END
