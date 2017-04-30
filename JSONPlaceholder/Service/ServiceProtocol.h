//
//  ServiceProtocol.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

@protocol ServiceProtocol <NSObject>

- (void)getObjects:(void (^)(NSArray *items, NSError *error))serviceCompletion;
- (void)getObjectWithId:(NSInteger)identifier completion:(void (^)(NSObject *object, NSError *error))serviceCompletion;
- (void)createObjects:(NSArray *)array completion:(void (^)(NSError *error))serviceCompletion;
- (void)updateObjectWithId:(NSInteger)identifier object:(NSObject*)object completion:(void (^)(NSError *error))serviceCompletion;
- (void)deleteObjectWithId:(NSInteger)identifier completion:(void (^)(NSError *error))serviceCompletion;

@end