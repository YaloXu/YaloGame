//
//  YGNewsModel.h
//  YaloGame
//
//  Created by maomao on 2018/12/4.
//  Copyright © 2018年 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGNewsModel : YTGBasicModels
@property (nonatomic, copy) NSString *le_id;
@property (nonatomic, copy) NSString *le_title;
@property (nonatomic, copy) NSString *le_thumb;
@property (nonatomic, copy) NSString *le_displayorder;
@property (nonatomic, copy) NSString *le_externalurl;

@end

NS_ASSUME_NONNULL_END
