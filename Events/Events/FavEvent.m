//
//  FavEvent.m
//  Events
//
//  Created by 🥄💻 on 2019/11/4.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import "FavEvent.h"
#import "EventMapStore.h"

@implementation FavEvent

- (nullable id)run {
    id result = [super run];
    if (result) {
        return result;
    }
    
    NSString *method = self.config[@"action"];
    
    if ([method isEqualToString:@"fav"]) {
        
        [self fav:[self.config[@"uid"] integerValue]];
        
    } else if ([method isEqualToString:@"favList"]) {
        return [self favList];
    } else {
        
    }
    return nil;
}

- (void)fav:(NSInteger)uid {
    [self.currentStore append:@(uid)];
}

- (NSArray *)favList {
    return [self.currentStore getAllObjects];
}

- (EventMapStore *)currentStore {
    return (EventMapStore *)self.store;
}

@end
