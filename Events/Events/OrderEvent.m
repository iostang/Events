//
//  OrderEvent.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "OrderEvent.h"
#import "EventHashStore.h"
@implementation OrderEvent

- (nullable id)run {
    id result = [super run];
    if (result) {
        return result;
    }
    
    NSString *method = self.config[@"action"];
    
    if ([method isEqualToString:@"save"]) {
        [self saveOrder:self.config[@"pageID"] oid:self.config[@"value"]];
    } else if ([method isEqualToString:@"values"]) {
        return [self values];
    } else {
        
    }
    return nil;
}

- (void)saveOrder:(nonnull NSString *)key oid:(nullable NSString *)oid {
    [self.currentStore insert:key value:oid];
}

- (NSArray *)values {
    return [self.currentStore allValues];
}

- (EventHashStore *)currentStore {
    return (EventHashStore *)self.store;
}

@end
