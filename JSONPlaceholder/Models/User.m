//
//  User.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.identifier = [dict[@"id"] integerValue];
        self.name = [dict[@"name"] capitalizedString];
        self.userName = [dict[@"username"] capitalizedString];
        self.email = dict[@"email"];
        self.phone = dict[@"phone"];
        self.website = dict[@"website"];
        self.address = [[Address alloc] initWithJSON:dict[@"address"]];
        self.company = [[Company alloc] initWithJSON:dict[@"company"]];
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"id"] = @(self.identifier);
    dict[@"name"] = self.name;
    dict[@"username"] = self.userName;
    dict[@"email"] = self.email;
    dict[@"phone"] = self.phone;
    dict[@"website"] = self.website;
    dict[@"address"] = [self.address dictionaryReprisentation];
    dict[@"company"] = [self.company dictionaryReprisentation];
    
    return dict;
}

@end
