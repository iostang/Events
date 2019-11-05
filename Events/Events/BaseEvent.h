//
//  BaseEvent.h
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventStore.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *kTimeEventTypeName = @"Time";
static NSString *kOrderEventTypeName = @"Order";
static NSString *kFavEventTypeName = @"Fav";

@protocol EventProtocol <NSObject>

- (instancetype)initWithType:(NSString *)type;

@end

@interface BaseEvent : NSObject<EventProtocol>

/// 存储
@property (nonatomic, weak) EventStore *store;

/// 类型
@property (nonatomic, copy) NSString *type;

/// 配置
@property (nonatomic, strong) NSDictionary *config;

/// 启动
- (nullable id)run;

@end

NS_ASSUME_NONNULL_END
