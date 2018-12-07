//
//  YGCacheManager.m
//  YaloGame
//
//  Created by C on 2018/12/7.
//  Copyright © 2018 C. All rights reserved.
//

#import "YGCacheManager.h"
#import <YYCache/YYCache.h>


@interface YGCacheManager()

@property (nonatomic, strong) YYCache *cache;

@end

@implementation YGCacheManager

+ (instancetype)sharedInstance {
    static YGCacheManager *manager = nil;
    static dispatch_once_t once;
    _dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (YYCache *)cache {
    if (!_cache) {
        _cache = [YYCache cacheWithName:@"YaloGame"];
    }
    return _cache;
}

@end