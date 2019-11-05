//
//  EventMapStore.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "EventMapStore.h"

@interface EventMapStore ()

@property (nonatomic, strong) NSMutableArray *container;

@end

@implementation EventMapStore

- (void)append:(nullable id)value {
    if (!value) {
        return;
    }
    [self.container addObject: value];
}

- (nullable id)remove:(NSUInteger)idx {
    if (self.container.count <= idx) {
        return nil;
    }
    
    id value = [self.container objectAtIndex:idx];
    [self.container removeObject:value];
    return value;
}

- (void)replace:(NSUInteger)idx obj:(nonnull id)obj {
    [self.container replaceObjectAtIndex:idx withObject:obj];
}

- (nullable id)get:(NSUInteger)idx {
    if (self.container.count <= idx) {
        return nil;
    }
    return [self.container objectAtIndex:idx];
}

- (void)removeLast {
    [self.container removeLastObject];
}

- (nullable id)firstObject {
    return self.container.firstObject;
}
- (nullable id)lastObject {
    return self.container.lastObject;
}

- (NSArray *)getAllObjects {
    return self.container;
}

- (void)removeAll {
    [self.container removeAllObjects];
}

- (NSMutableArray *)container {
    if (!_container) {
        _container = @[].mutableCopy;
    }
    return _container;
}


@end
