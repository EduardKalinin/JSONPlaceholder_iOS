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
        self.name = [dict[@"name"] capitalizedString];
        self.catchPhrase = [dict[@"catchPhrase"] capitalizedString];
        self.bs = [dict[@"bs"] capitalizedString];
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
