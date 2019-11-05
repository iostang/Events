//
//  EventMapStore.h
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventStore.h"

NS_ASSUME_NONNULL_BEGIN


@interface EventMapStore : EventStore

- (void)append:(nullable id)value;
- (nullable id)remove:(NSUInteger)idx;
- (nullable id)get:(NSUInteger)idx;
- (void)replace:(NSUInteger)idx obj:(nonnull id)obj;
- (NSArray *)getAllObjects;
- (nullable id)lastObject;
- (nullable id)firstObject;
- (void)removeAll;

@end

NS_ASSUME_NONNULL_END
