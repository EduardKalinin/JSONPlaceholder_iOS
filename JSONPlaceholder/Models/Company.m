//
//  Company.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.catchPhrase = dict[@"catchPhrase"];
        self.bs = dict[@"bs"];
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"name"] = self.name;
    dict[@"catchPhrase"] = self.catchPhrase;
    dict[@"bs"] = self.bs;
    return dict;
}

@end
