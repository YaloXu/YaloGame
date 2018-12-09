//
//  YTGBasicEncode.m
//  YTGShop
//
//  Created by maomao on 2017/11/28.
//  Copyright © 2017年 maomao. All rights reserved.
//

#import "YTGBasicEncode.h"
#import "YTGBasicModels.h"
@implementation YTGBasicEncode
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[[[self class] alloc]init];
    if (self) {
        Class class = [self class];
        while (class!=[YTGBasicModels class]) {
            unsigned int outCount, i;
            objc_property_t *properties =class_copyPropertyList([class class], &outCount);
            for (i = 0; i<outCount; i++)
            {
                objc_property_t property = properties[i];
                const char* char_f =property_getName(property);
                NSString *propertyName = [NSString stringWithUTF8String:char_f];
                id value = [aDecoder decodeObjectForKey: propertyName];
                if (value) {
                    [self setValue:value forKey:propertyName] ;
                }
            }
            free(properties);
            class = [class superclass];
        }
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    Class class = [self class];
    while (class!=[YTGBasicModels class]) {
        unsigned int outCount, i;
        objc_property_t *properties =class_copyPropertyList([class class], &outCount);
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_f =property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            id value = [self valueForKey:propertyName];
            if (value) {
                [aCoder encodeObject:value forKey:propertyName];
            }
            
        }
        free(properties);
        class = [class superclass];
    }
    
}
//拷贝对象
- (id)copyWithZone:(NSZone *)zone
{
    NSObject *copy = [[[self class] alloc] init];
    if (copy) {
        Class class = [copy class];
        while (class!=[YTGBasicModels class]) {
            unsigned int outCount, i;
            objc_property_t *properties =class_copyPropertyList([class class], &outCount);
            for (i = 0; i<outCount; i++)
            {
                objc_property_t property = properties[i];
                const char* char_f =property_getName(property);
                NSString *propertyName = [NSString stringWithUTF8String:char_f];
                id value = [self valueForKey:propertyName];
                if (value) {
                    [copy setValue:[value copyWithZone:zone] forKey:propertyName];
                }
            }
            free(properties);
            class = [class superclass];
        }
    }
    return copy;
}
-(void)destroyDealloc{
    Class class = [self class];
    while (class!=[YTGBasicModels class]) {
        unsigned int outCount, i;
        objc_property_t *properties =class_copyPropertyList([class class], &outCount);
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_f =property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            id value = [self valueForKey:propertyName];
            if (value&&![value isKindOfClass:[NSNumber class]]) {
                [self setValue:nil forKey:propertyName];
            }
            
            propertyName=nil;
        }
        class = [class superclass];
        free(properties);
    }
    
}
@end
