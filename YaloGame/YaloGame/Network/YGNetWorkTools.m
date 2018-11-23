//
//  YGNetWorkTools.m
//  test
//
//  Created by C on 2018/11/22.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGNetWorkTools.h"


static inline NSSet *acceptableContentTypes() {
    return [NSSet setWithObjects:@"text/html", @"text/json", @"text/plain", @"text/javascript", @"application/json", @"application/javascript", nil];
}

@interface YGNetWorkTools()

@property (nonatomic, strong) AFHTTPSessionManager *manager;


@end

@implementation YGNetWorkTools

+ (instancetype)sharedTools {
    static YGNetWorkTools *tools = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        tools = [[self alloc] init];
    });
    return tools;
}

- (instancetype)init {
    if (self = [super init]) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 30;
        _manager.responseSerializer.acceptableContentTypes = acceptableContentTypes();
    }
    return self;
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval {
    _timeoutInterval = timeoutInterval;
    self.manager.requestSerializer.timeoutInterval = _timeoutInterval;
}

- (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)faild {
    [self.manager GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faild(error);
    }];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    [self.manager POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error);
    }];
}

- (void)get:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)faild {
    if (block) {
        block(self.manager);
    }
    [self.manager GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faild(error);
    }];
}


- (void)post:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    if (block) {
        block(self.manager);
    }
    [self.manager POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error);
    }];
}


@end
