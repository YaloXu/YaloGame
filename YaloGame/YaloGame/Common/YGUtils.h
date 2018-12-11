//
//  YGUtils.h
//  YaloGame
//
//  Created by C on 2018/11/17.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct _YGUtils_t {
    
    BOOL (*validString)(NSString *string);
    
   
    BOOL (*validArray)(NSArray *array);
    
    
    BOOL (*validDictionary)(NSDictionary *dictionary);
    
    
    NSURL *(*URLFromString)(NSString *urlStr);
    
    
    
} YGUtils_t;
OBJC_EXTERN YGUtils_t YGUtils;

@interface YGCommon : NSObject
+ (UIViewController *)topViewController;
@end
NS_ASSUME_NONNULL_END
