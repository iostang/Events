//
//  EventManager.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventManager.h"
#import "TimeEvent.h"
#import "FavEvent.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EventParser.h"
#import "EventHashStore.h"
#import "EventMapStore.h"


@interface EventManager ()

@property (nonatomic, strong) EventHashStore *timeStore;
@property (nonatomic, strong) EventMapStore *favStore;
@property (nonatomic, strong) EventHashStore *orderStore;

@end

@implementation EventManager

static EventManager* _instance = nil;

#pragma mark - Init

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [EventManager shared];
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return [EventManager shared];
}

#pragma mark - Drive

- (nullable id)drive:(NSDictionary *)config {
    BaseEvent *obj = [EventParser parser:config];
    ///没有字符串枚举真难受
    if ([obj.type isEqualToString:kFavEventTypeName]) {
        obj.store = self.favStore;
    } else if ([obj.type isEqualToString:kOrderEventTypeName]) {
        obj.store = self.orderStore;
    } else if ([obj.type isEqualToString:kTimeEventTypeName]) {
        obj.store = self.timeStore;
    } else {
        obj.store = nil;
    }
    id res = [obj run];
    return res;
}

- (nullable id)drives:(NSArray<NSDictionary *> *)config {
    
    NSMutableArray *results = @[].mutableCopy;
    [config enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id res = [self drive:obj];
        [results addObject:res ? res : NSNull.new];
    }];
    
    return results;
}

#pragma mark - Getter

- (EventHashStore *)timeStore {
    if (!_timeStore) {
        _timeStore = EventHashStore.new;
    }
    return _timeStore;
}

- (EventMapStore *)favStore {
    if (!_favStore) {
        _favStore = EventMapStore.new;
    }
    return _favStore;
}

- (EventHashStore *)orderStore {
    if (!_orderStore) {
        _orderStore = EventHashStore.new;
    }
    return _orderStore;
}

@end
