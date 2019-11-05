//
//  EventParser.h
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventParser : NSObject

+ (BaseEvent *)parser:(NSDictionary *)config;
+ (NSArray<BaseEvent *> *)parsers:(NSArray<NSDictionary *> *)config;

@end

NS_ASSUME_NONNULL_END
