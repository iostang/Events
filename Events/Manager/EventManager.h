//
//  EventManager.h
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventManager : NSObject

+ (instancetype)shared;

- (nullable id)drives:(NSArray<NSDictionary *> *)config;

- (nullable id)drive:(NSDictionary *)config;

@end

NS_ASSUME_NONNULL_END
