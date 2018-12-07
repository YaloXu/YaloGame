//
//  YGMessageModel.h
//  YaloGame
//
//  Created by C on 2018/11/24.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGMessageModel : NSObject


/*
 
 
 "id": "46",
 "catid": "10",
 "title": "高晓松晒步数“吊打”马云 ：买菜遛狗发呆也能赢他",
 "thumb": "",
 "keywords": "",
 "description": "这期间 12 个人的团队2蜗居在北京五道口华清嘉园的一间三室两厅中，每人拿着 3000 块的基础工资。由于养不起专业的技术团队，也缺乏互联网行业人脉，陈安妮只能通过外包和qq技术群探讨的形式来打造APP。 8 个月后，快...",
 "hits": "0",
 "uid": "1",
 "author": "admin",
 "status": "9",
 "url": "/index.php?c=show&id=46.html",
 "tableid": "0",
 "inputip": "192.168.0.5",
 "inputtime": "1491962414",
 "updatetime": "1491962414",
 "displayorder": "0",
 "comments": "0",
 "favorites": "0"
 */

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
