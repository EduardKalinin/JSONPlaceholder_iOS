//
//  TransportLayer.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "TransportLayer.h"

@interface TransportLayer ()

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation TransportLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        self.session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)executeRequestWithType:(HTTPMethod)method data:(NSData *)data URL:(NSURL *)url completion:(void (^)(NSError *))transportCompletion {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if (method == POST) {
        request.HTTPMethod = @"POST";
    } else if (method == PUT) {
        request.HTTPMethod = @"PUT";
    } else if (method == DELETE) {
        request.HTTPMethod = @"DELETE";
    }
    request.HTTPBody = data;
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (transportCompletion) {
                transportCompletion(error);
            }
        });
    }] resume];
}

- (void)getDataWithURL:(NSURL *)url completion:(void (^)(NSData *, NSError *))transportCompletion {
    [[self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (transportCompletion) {
                transportCompletion(data, error);
            }
        });
    }] resume];
}

@end
