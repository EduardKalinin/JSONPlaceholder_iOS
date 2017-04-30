//
//  ComentsService.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "ComentsService.h"
#import "TransportLayer.h"
#import "Comment.h"

NSString* const commentsPass = @"/comments";

@interface ComentsService ()

@property (strong ,nonatomic) TransportLayer *transport;

@end

@implementation ComentsService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}

- (void)getObjects:(void (^)(NSArray *items, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, commentsPass];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *items = [NSMutableArray array];
            for (NSDictionary *item in array) {
                Comment *comment = [[Comment alloc] initWithJSON:item];
                [items addObject:comment];
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
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, commentsPass, identifier];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            Comment *comment = [[Comment alloc] initWithJSON:dict];
            
            if (serviceCompletion) {
                serviceCompletion(comment, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

- (void)createObjects:(NSArray *)array completion:(void (^)(NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, commentsPass];
    NSMutableArray *mutArray = [NSMutableArray array];
    for (Comment *comment in array) {
        [mutArray addObject:[comment dictionaryReprisentation]];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutArray options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)updateObjectWithId:(NSInteger)identifier object:(NSObject*)object completion:(void (^)(NSError *error))serviceCompletion {
    Comment *comment = (Comment *)object;
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, commentsPass, identifier];
    NSDictionary* dict = [comment dictionaryReprisentation];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)deleteObjectWithId:(NSInteger)identifier completion:(void (^)(NSError *))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, commentsPass, identifier];
    [self.transport executeRequestWithType:POST data:nil URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

@end
