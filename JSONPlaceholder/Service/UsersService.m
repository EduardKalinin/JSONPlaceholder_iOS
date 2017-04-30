//
//  UsersService.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "UsersService.h"
#import "TransportLayer.h"
#import "User.h"

NSString* const usersPass = @"/users";

@interface UsersService ()

@property (strong ,nonatomic) TransportLayer *transport;

@end

@implementation UsersService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transport = [[TransportLayer alloc] init];
    }
    return self;
}

- (void)getObjects:(void (^)(NSArray *items, NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, usersPass];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *items = [NSMutableArray array];
            for (NSDictionary *item in array) {
                User *user = [[User alloc] initWithJSON:item];
                [items addObject:user];
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
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, usersPass, identifier];
    [self.transport getDataWithURL:[NSURL URLWithString:url] completion:^(NSData *data, NSError *error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            User *user = [[User alloc] initWithJSON:dict];
            
            if (serviceCompletion) {
                serviceCompletion(user, error);
            }
        } else {
            if (serviceCompletion) {
                serviceCompletion(nil, error);
            }
        }
    }];
}

- (void)createObjects:(NSArray *)array completion:(void (^)(NSError *error))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@", BaseUrl, usersPass];
    NSMutableArray *mutArray = [NSMutableArray array];
    for (User *user in array) {
        [mutArray addObject:[user dictionaryReprisentation]];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutArray options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)updateObjectWithId:(NSInteger)identifier object:(NSObject*)object completion:(void (^)(NSError *error))serviceCompletion {
    User *user = (User *)object;
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, usersPass, identifier];
    NSDictionary* dict = [user dictionaryReprisentation];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    [self.transport executeRequestWithType:POST data:data URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

- (void)deleteObjectWithId:(NSInteger)identifier completion:(void (^)(NSError *))serviceCompletion {
    NSString *url = [NSString stringWithFormat:@"%@%@/%ld", BaseUrl, usersPass, identifier];
    [self.transport executeRequestWithType:POST data:nil URL:[NSURL URLWithString:url] completion:^(NSError *error) {
        if (serviceCompletion) {
            serviceCompletion(error);
        }
    }];
}

@end
