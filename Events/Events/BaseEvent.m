//
//  BaseEvent.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "BaseEvent.h"

@interface BaseEvent ()
@property (nonatomic, strong) NSMutableDictionary *container;
@end

@implementation BaseEvent

- (instancetype)initWithType:(NSString *)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (nullable id)run {
    return nil;
}

- (EventStore *)currentStore {
    return self.store;
}

@end
