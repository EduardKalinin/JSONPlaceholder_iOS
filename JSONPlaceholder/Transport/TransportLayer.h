//
//  TransportLayer.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPMethod) {
    POST,
    PUT,
    DELETE
};

@interface TransportLayer : NSObject

- (void)executeRequestWithType:(HTTPMethod)method data:(NSData *)data URL:(NSURL *)url completion:(void (^)(NSError *))transportCompletion;
- (void)getDataWithURL:(NSURL *)url completion:(void (^)(NSData *data, NSError *error))transportCompletion;

@end
