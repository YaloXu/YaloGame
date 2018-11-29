//
//  YGNetWorkTools.h
//  test
//
//  Created by C on 2018/11/22.
//  Copyright © 2018 C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

#define BLOCK(block, ...) if (block) { block(__VA_ARGS__); };


typedef void(^SuccessBlock)(id responseObject);

typedef void(^FailedBlock)(NSError *error);

typedef void(^SessionBlock)(AFHTTPSessionManager *manager);

@interface YGNetWorkTools : NSObject

@property (nonatomic, assign) NSTimeInterval timeoutInterval;



+ (instancetype)sharedTools;

- (void)get:(NSString *)url
 parameters:(NSDictionary *)parameters
    success:(SuccessBlock)success
     failed:(FailedBlock)faild;

- (void)post:(NSString *)url
  parameters:(NSDictionary *)parameters
     success:(SuccessBlock)success
      failed:(FailedBlock)failed;

- (void)get:(NSString *)url
sessionConfig:(SessionBlock)block
 parameters:(NSDictionary *)parameters
    success:(SuccessBlock)success
     failed:(FailedBlock)faild;

- (void)post:(NSString *)url
sessionConfig:(SessionBlock)block
  parameters:(NSDictionary *)parameters
     success:(SuccessBlock)success
      failed:(FailedBlock)failed;

@end

NS_ASSUME_NONNULL_END
