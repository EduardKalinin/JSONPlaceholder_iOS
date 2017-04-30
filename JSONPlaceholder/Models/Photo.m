//
//  Photo.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.albumId = [dict[@"albumId"] integerValue];
        self.identifier = [dict[@"id"] integerValue];
        self.title = dict[@"title"];
        self.url = [NSURL URLWithString:dict[@"url"]];
        self.thumbnailUrl = [NSURL URLWithString:dict[@"thumbnailUrl"]];
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"albumId"] = @(self.albumId);
    dict[@"id"] = @(self.identifier);
    dict[@"title"] = self.title;
    dict[@"url"] = self.url.absoluteString;
    dict[@"thumbnailUrl"] = self.thumbnailUrl.absoluteString;
    
    return dict;
}

@end
