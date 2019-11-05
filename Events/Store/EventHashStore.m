//
//  EventHashStore.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventHashStore.h"

@interface EventHashStore ()

@property (nonatomic, strong) NSMutableDictionary *container;

@end

@implementation EventHashStore

#pragma mark - Methods

/// 删
/// @param key key
- (nullable id)remove:(nonnull NSString *)key {
    id value = [self.container objectForKey:key];
    [self.container removeObjectForKey:key];
    return value;
}

/// 查
/// @param key key
- (nullable id)get:(nonnull NSString *)key {
    return [self.container objectForKey:key];
}

/// 增
/// @param key key
/// @param value value
- (void)insert:(nonnull NSString *)key value:(nullable id)value {
    [self.container setValue:value forKey:key];
}

/// 改
/// @param key key
/// @param value value
- (void)update:(nonnull NSString *)key value:(nullable id)value {
    self.container[key] = value;
}

- (NSArray *)allKeys {
    return [self.container allKeys];
}

- (NSArray *)allValues {
    return [self.container allValues];
}

- (void)clean {
    [self.container removeAllObjects];
}

#pragma mark - Getter

- (NSMutableDictionary *)container {
    if (!_container) {
        _container = [NSMutableDictionary new];
    }
    return _container;
}

@end
