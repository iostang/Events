//
//  EventDataCenter.h
//  Events
//
//  Created by 🥄💻 on 2019/11/5.
//  Copyright © 2019 TangChi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventDataCenter : NSObject

+ (NSArray<NSDictionary *> *)testDatas:(NSString *)pageID;

+ (NSDictionary *)testData:(NSString *)pageID;

@end

NS_ASSUME_NONNULL_END
