//
//  Todo.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.userId = [dict[@"userId"] integerValue];
        self.identifier = [dict[@"id"] integerValue];
        self.title = [dict[@"title"] capitalizedString];
        self.completed = [dict[@"completed"] boolValue];

        ;    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"userId"] = @(self.userId);
    dict[@"id"] = @(self.identifier);
    dict[@"title"] = self.title;
    dict[@"completed"] = @(self.completed);
    
    return dict;
}

@end
