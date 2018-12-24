//
//  YGGoodsListModel.h
//  YaloGame
//
//  Created by maomao on 2018/12/14.
//  Copyright © 2018年 C. All rights reserved.
//

#import "YTGBasicModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGGoodsListModel : YTGBasicModels
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
@property (nonatomic, copy) NSString *le_inputtime;
@property (nonatomic, copy) NSString *le_updatetime;
@property (nonatomic, copy) NSString *le_displayorder;
@property (nonatomic, copy) NSString *le_comments;
@property (nonatomic, copy) NSString *le_favorites;
@property (nonatomic, copy) NSString *le_externalurl;
@property (nonatomic, copy) NSString *le_content;
@property (nonatomic, copy) NSString *le_pricet;
@property (nonatomic, copy) NSString *le_goldprice;

@end
/*
 "id": "46",
 "catid": "10",
 "title": "高晓松晒步数“吊打”马云 ：买菜遛狗发呆也能赢他1111",
 "thumb": "",
 "keywords": "",
 "description": "这期间 12 个人的团队2蜗居在北京五道口华清嘉园的一间三室两厅中，每人拿着 3000 块的基础工资。由于养不起专业的技术团队，也缺乏互联网行业人脉，陈安妮只能通过外包和qq技术群探讨的形式来打造APP。 8 个月后，快...",
 "hits": "0",
 "uid": "1",
 "author": "admin",
 "status": "9",
 "inputtime": "1491962414",
 "updatetime": "1491962414",
 "displayorder": "0",
 "comments": "0",
 "favorites": "0",
 "externalurl": null,
 "content": "<p>大立科技咖喱咖啡寄过来开发大家赶快来房间大概看了房</p>",
 "price": "10.00",
 "goldprice": "333"
*/
NS_ASSUME_NONNULL_END
