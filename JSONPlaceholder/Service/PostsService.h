//
//  PostsService.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"

@interface PostsService : NSObject <ServiceProtocol>

- (void)postsForUserWithID:(NSInteger)userID completion:(void(^)(NSArray *array, NSError *error))serviceCompletion;

@end
