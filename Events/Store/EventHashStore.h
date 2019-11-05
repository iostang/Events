//
//  EventHashStore.h
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventHashStore : EventStore

- (void)insert:(nonnull NSString *)key value:(nullable id)value;
- (void)update:(nonnull NSString *)key value:(nullable id)value;
- (nullable id)remove:(nonnull NSString *)key;
- (nullable id)get:(nonnull NSString *)key;

- (NSArray *)allValues;
- (NSArray *)allKeys;
- (void)clean;

@end

NS_ASSUME_NONNULL_END
