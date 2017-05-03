//
//  PhotosService.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "PhotosService.h"
#import "TransportLayer.h"
#import "Photo.h"

NSString* const photosPath = @"/photos";

@interface PhotosService ()

@property (strong ,nonatomic) TransportLayer *transport;

@end

@implementation PhotosService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}

- (void)getObjects:(void (^)(NSArray *items, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, photosPath];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *items = [NSMutableArray array];
            for (NSDictionary *item in array) {
                Photo *photo = [[Photo alloc] initWithJSON:item];
                [items addObject:photo];
            }
            if (serviceCompletion) {
                serviceCompletion(items, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

- (void)getObjectWithId:(NSInteger)identifier completion:(void (^)(NSObject *object, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, photosPath, identifier];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            Photo *photo = [[Photo alloc] initWithJSON:dict];
            
            if (serviceCompletion) {
                serviceCompletion(photo, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

- (void)createObjects:(NSArray *)array completion:(void (^)(NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, photosPath];
    NSMutableArray *mutArray = [NSMutableArray array];
    for (Photo *photo in array) {
        [mutArray addObject:[photo dictionaryReprisentation]];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutArray options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)updateObjectWithId:(NSInteger)identifier object:(NSObject*)object completion:(void (^)(NSError *error))serviceCompletion {
    Photo *photo = (Photo *)object;
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, photosPath, identifier];
    NSDictionary* dict = [photo dictionaryReprisentation];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)deleteObjectWithId:(NSInteger)identifier completion:(void (^)(NSError *))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, photosPath, identifier];
    [self.transport executeRequestWithType:POST data:nil URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)photosForAlbumWithID:(NSInteger)albumID completion:(void(^)(NSArray *array, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@?albumId=%ld", BaseUrl, photosPath, albumID];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *items = [NSMutableArray array];
            for (NSDictionary *item in array) {
                Photo *photo = [[Photo alloc] initWithJSON:item];
                [items addObject:photo];
            }
            if (serviceCompletion) {
                serviceCompletion(items, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

@end
