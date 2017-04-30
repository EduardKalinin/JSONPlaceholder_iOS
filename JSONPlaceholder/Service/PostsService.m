//
//  PostsService.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "PostsService.h"
#import "TransportLayer.h"
#import "Post.h"

NSString* const postsPass = @"/posts";

@interface PostsService ()

@property (strong ,nonatomic) TransportLayer *transport;

@end

@implementation PostsService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}

- (void)getObjects:(void (^)(NSArray *items, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, postsPass];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *items = [NSMutableArray array];
            for (NSDictionary *item in array) {
                Post *post = [[Post alloc] initWithJSON:item];
                [items addObject:post];
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
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, postsPass, identifier];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            Post *post = [[Post alloc] initWithJSON:dict];
            
            if (serviceCompletion) {
                serviceCompletion(post, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

- (void)createObjects:(NSArray *)array completion:(void (^)(NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, postsPass];
    NSMutableArray *mutArray = [NSMutableArray array];
    for (Post *post in array) {
        [mutArray addObject:[post dictionaryReprisentation]];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutArray options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)updateObjectWithId:(NSInteger)identifier object:(NSObject*)object completion:(void (^)(NSError *error))serviceCompletion {
    Post *post = (Post *)object;
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, postsPass, identifier];
    NSDictionary* dict = [post dictionaryReprisentation];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)deleteObjectWithId:(NSInteger)identifier completion:(void (^)(NSError *))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, postsPass, identifier];
    [self.transport executeRequestWithType:POST data:nil URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

@end
