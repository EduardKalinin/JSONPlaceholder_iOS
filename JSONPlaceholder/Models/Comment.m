//
//  Comment.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "Comment.h"

@implementation Comment

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.postId = [dict[@"postId"] integerValue];
        self.identifier = [dict[@"id"] integerValue];
        self.name = [dict[@"name"] capitalizedString];
        self.email = dict[@"email"];
        self.body = [dict[@"body"] capitalizedString];
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"postId"] = @(self.postId);
    dict[@"id"] = @(self.identifier);
    dict[@"name"] = self.name;
    dict[@"email"] = self.email;
    dict[@"body"] = self.body;
   
    return dict;
}

@end
