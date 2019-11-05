//
//  TimeEvent.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "TimeEvent.h"
#import <UIKit/UIKit.h>
#import "EventManager.h"
#import "EventStore.h"
#import "EventHashStore.h"

@implementation TimeEvent

- (nullable id)run {
    id result = [super run];
    if (result) {
        return result;
    }
    
    NSString *method = self.config[@"action"];
    
    NSString *key = self.config[@"pageID"];
    
    EventHashStore *st = (EventHashStore *)self.store;
    
    if ([method isEqualToString:@"remove"]) {
        
        return [st remove: key];
        
    } else if ([method isEqualToString:@"get"]) {
        
        return [st get:key];
        
    } else if ([method isEqualToString:@"insert"]) {
        
        [st insert:key value:self.config[@"value"]];
        
    } else if ([method isEqualToString:@"update"]) {
        
        [st update:key value:self.config[@"value"]];
        
    } else if ([method isEqualToString:@"compare"]) {
        
        BOOL res = [self comparePageTime:self.config];
        return [NSNumber numberWithBool:res];
        
    } else if ([method isEqualToString:@"enter"]) {
        
        [self enterPageWithKey:self.config[@"pageID"]
                         value:[self.config[@"value"] longValue]];
        
    } else if ([method isEqualToString:@"leave"]) {
        
        return [self leavePageWithKey:self.config[@"pageID"]];
        
    } else if ([method isEqualToString:@"allValues"]) {
        return [st allValues];
    } else {
        
    }
    return nil;
    
}

- (EventHashStore *)currentStore {
    return (EventHashStore *)self.store;
}

/// 比较进入页面和将要离开页面时 的 时间间隔
/// @param config 配置
- (BOOL)comparePageTime:(NSDictionary *)config {
    long leaveTime = [config[@"value"] longValue];
    CGFloat interval = [config[@"interval"] floatValue];
    long enterTime = [[self.currentStore get:config[@"pageID"]] longValue];
    BOOL result = leaveTime - enterTime > interval;
    return result;
}

/// 记录页面打开时间
/// @param key PageID
/// @param value Time
- (void)enterPageWithKey:(NSString *)key value:(long)value {
    [self.currentStore insert: key value: [NSNumber numberWithLong:value]];
}

/// 离开页面
/// @param key PageID
- (nullable id)leavePageWithKey:(NSString *)key {
    return [self.currentStore remove:key];
}

/// 更新时间
/// @param key PageID
/// @param value Time
- (void)updatePageWithKey:(nonnull NSString *)key value:(nullable id)value {
    [self.currentStore update:key value:value];
}

/// 获取时间
/// @param key PageID
- (nullable id)getEnterPageTimeWithKey:(NSString *)key {
    return [self.currentStore get:key];
}


@end
