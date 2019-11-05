//
//  EventParser.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventParser.h"
#import "TimeEvent.h"
#import "EventManager.h"
#import "FavEvent.h"
#import "OrderEvent.h"
#import "BaseEvent.h"

@implementation EventParser

+ (BaseEvent *)parser:(NSDictionary *)config {
    NSDictionary *params = config;
    NSString *key = params[@"key"];
    BaseEvent *obj = [EventParser factory: key];
    if (obj) {
        obj.config = params;
    }
    return obj;
}

+ (NSArray<BaseEvent *> *)parsers:(NSArray<NSDictionary *> *)config {
   
    NSMutableArray *results = @[].mutableCopy;
    for (NSDictionary *dict in config) {
        BaseEvent *event = [self parser:dict];
        if (event) {
            [results addObject:event];
        }
    }
    return results;
}

+ (BaseEvent *)factory:(NSString *)type {
    //Key + Event = ClassName
    Class cls = NSClassFromString([NSString stringWithFormat:@"%@Event",type]);
    if ([cls conformsToProtocol:@protocol(EventProtocol)]) {
        return [[cls alloc] initWithType:type];
    }
    return BaseEvent.new;
}

@end
