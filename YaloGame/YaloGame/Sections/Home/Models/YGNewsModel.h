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
@property (nonatomic, copy) NSString *le_catid;
@property (nonatomic, copy) NSString *le_title;
@property (nonatomic, copy) NSString *le_thumb;
@property (nonatomic, copy) NSString *le_keywords;
@property (nonatomic, copy) NSString *le_description;
@property (nonatomic, copy) NSString *le_hits;
@property (nonatomic, copy) NSString *le_uid;
@property (nonatomic, copy) NSString *le_author;

@property (nonatomic, copy) NSString *le_status;
@property (nonatomic, copy) NSString *le_url;
@property (nonatomic, copy) NSString *le_tableid;
@property (nonatomic, copy) NSString *le_inputip;
@property (nonatomic, copy) NSString *le_inputtime;
@property (nonatomic, copy) NSString *le_updatetime;
@property (nonatomic, copy) NSString *le_displayorder;
@property (nonatomic, copy) NSString *le_comments;
@property (nonatomic, copy) NSString *le_favorites;
@end

NS_ASSUME_NONNULL_END
