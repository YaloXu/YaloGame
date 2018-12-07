//
//  YTGBasicModels.h
//  YTGShop
//
//  Created by maomao on 2017/11/28.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import "YTGBasicEncode.h"
#import <objc/runtime.h>
#define Pro_Prefix @"le_"
@interface YTGBasicModels : YTGBasicEncode
/**
 *
 *  初始化model对象
 *
 *  @return 返回对象
 */
+(id)shInitM;
/**
 *
 *  得到所有属性
 *
 *  @return 属性数组
 */
+(NSArray *)getModelAllProperty;
/**
 *  网络获取数据转对象
 *
 *  @param dic 网络返回的字典
 *
 *  @return 返回转换好的对象
 */
+(id) setDictionaryForModel :(NSDictionary *) dic ;
-(id) setDictionaryForModel :(NSDictionary *) dic;
//字典转换成对象
+(id) setDictionaryForModel :(NSDictionary *) dic withObject:(id)baseModel;
/**
 *
 *  网络获取数据转对象数组
 *
 *  @param arr 网络返回的数组包含相同的字典
 *
 *  @return 返回转换好的数组，数组里为对象
 */
+(NSArray *) setArrayForModel :(NSArray *) arr ;
/**
 *
 *  对象转化成字符串key=value中间逗号分隔形式
 *
 *  @param baseModel 要转换的对象
 *
 *  @return 返回对象字符串
 */
+(NSString *) setModelForString :(id ) baseModel;
//对象转换成字典
/**
 *
 *   对象转换成字典包括父对象
 *
 *  @param baseModel 转换的对象
 *
 *  @return 返回字典
 */
+(NSMutableDictionary *) setModelForDictionary :(id) baseModel;
//对象数组转换成数字
/**
 *
 *   对象数组转换成字符数组
 *
 * @param arr 转换的对象
 *
 *  @return 返回字典
 */
+(NSArray *) setModelForArray :(NSArray *) arr;
/**
 *
 *  <#Description#>
 *
 *  @param key   <#str description#>
 *  @param value <#value description#>
 */
-(void)setModelProValue:(NSString *)key value:(NSString *)value;

-(NSString *)getVauleForkey:(NSString *)key;
@end
