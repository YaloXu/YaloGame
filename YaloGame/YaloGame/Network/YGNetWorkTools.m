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
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _manager.requestSerializer.HTTPShouldUsePipelining = YES;
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
    [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parseResponse:responseObject success:success failed:faild];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self parseError:error failed:faild];
    }];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    [self.manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parseResponse:responseObject success:success failed:failed];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self parseError:error failed:failed];
    }];
}

- (void)get:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)faild {
    BLOCK(block,self.manager);
    [self get:url parameters:parameters success:success failed:faild];
}


- (void)post:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    BLOCK(block,self.manager);
    [self post:url parameters:parameters success:success failed:failed];
}

- (void)put:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    BLOCK(block,self.manager);
    [self put:url parameters:parameters success:success failed:failed];
}

- (void)put:(NSString *)url parameters:(NSDictionary *)parameters success:(SuccessBlock)success failed:(FailedBlock)failed {
    [self.manager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self parseResponse:responseObject success:success failed:failed];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self parseError:error failed:failed];
    }];
}

- (void)upload:(NSString *)url sessionConfig:(SessionBlock)block parameters:(NSDictionary *)parameters data:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed {
    BLOCK(block,self.manager);
    [self upload:url parameters:parameters data:data success:success failed:failed];
}

- (void)upload:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data success:(SuccessBlock)success failed:(FailedBlock)failed {
    [self.manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data
                                    name:@"image"
                                fileName:@""
                                mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)parseError:(NSError *)error failed:(FailedBlock)faied {
        id data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
    if (!data || ![data isKindOfClass:[NSData class]]) {
        BLOCK(faied,@{@"message":@"失败"});
        return;
    }
        id oj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
    BLOCK(faied,oj);
}

- (void)parseResponse:(id)response success:(SuccessBlock)success failed:(FailedBlock)failed{
    id oj = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
    if ([oj[@"code"] integerValue] != 200) {
        BLOCK(failed,oj[@"ret_data"]);
        return;
    }
    BLOCK(success,oj);
}
@end
