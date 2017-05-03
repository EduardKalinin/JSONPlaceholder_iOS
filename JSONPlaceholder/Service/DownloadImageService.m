//
//  DownloadImageService.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadImageService.h"
#import "TransportLayer.h"

@interface DownloadImageService ()

@property (strong ,nonatomic) TransportLayer *transport;

@end

@implementation DownloadImageService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}
- (void)loadImageWithURL:(NSURL *)url serviceCompletion:(void (^)(UIImage *image, NSError *error))serviceCompletion {
    [self.transport getDataWithURL:url completion:^(NSData *data, NSError *error) {
        if (serviceCompletion) {
            if (data) {
                serviceCompletion([UIImage imageWithData:data], error);
            };
        } else {
            serviceCompletion (nil, error);
        }
    }];
}

@end
