//
//  EventDataCenter.m
//  Events
//
//  Created by 🥄💻 on 2019/11/5.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventDataCenter.h"

@implementation EventDataCenter

#pragma mark - Public Method

+ (NSArray<NSDictionary *> *)testDatas:(NSString *)pageID  {
    NSArray<NSDictionary *> *config =
       @[
           @{
               @"key":@"Time",
               @"action":@"enter",
               @"value":@(EventDataCenter.currentTime),
               @"pageID": pageID,
           },
           @{
               @"key":@"Time",
               @"action":@"enter",
               @"value":@(EventDataCenter.currentTime),
               @"pageID": pageID,
           },
           @{
               @"key":@"Time",
               @"action":@"enter",
               @"value":@(EventDataCenter.currentTime),
               @"pageID": pageID,
           },
           @{
               @"key":@"Time",
               @"pageID": pageID,
               @"value": @(EventDataCenter.currentTime),
               @"interval":@(5),
               @"action":@"compare",
           },
           @{
               @"key":@"Time",
               @"action":@"allValues",
           },
           @{
               @"key":@"Fav",
               @"action":@"fav",
               @"uid":@666
           },
           @{
               @"key":@"Fav",
               @"action":@"fav",
               @"uid":@888
           },
           @{
               @"key":@"Fav",
               @"action":@"favList"
           },
           @{
               @"key":@"Order",
               @"action":@"save",
               @"pageID": pageID,
               @"value": [NSString stringWithFormat:@"%ld",EventDataCenter.currentTime]
           },
           @{
               @"key":@"Order",
               @"action":@"values"
           }
       ];
    return config;
}

+ (NSDictionary *)testData:(NSString *)pageID {
    NSDictionary *config = @{
        @"key": @"Time",
        @"pageID": pageID,
        @"value": @(EventDataCenter.currentTime),
        @"interval":@(5),
        @"action":@"compare",
    };
    return config;
}

#pragma mark - Private Method

+ (NSString *)randomID {
    return NSUUID.UUID.UUIDString;
}

+ (long)currentTime {
    long time = [EventDataCenter dateToTime:NSDate.new];
    return time;
}

+ (long)dateToTime:(NSDate *)date {
    return (long)[date timeIntervalSince1970];
}



@end
