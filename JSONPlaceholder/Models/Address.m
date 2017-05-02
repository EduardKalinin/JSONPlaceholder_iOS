//
//  Address.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "Address.h"

@implementation Address

-(instancetype)initWithJSON:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.street = [dict[@"street"] capitalizedString];
        self.suite = dict[@"suite"];
        self.city = [dict[@"city"] capitalizedString];
        self.zipCode = [dict[@"zipcode"] integerValue];
        double lat = [dict[@"geo"][@"lat"] doubleValue];
        double lng = [dict[@"geo"][@"lng"] doubleValue];
        self.coordinates = CLLocationCoordinate2DMake(lat, lng);
    }
    return self;
}

- (NSDictionary *)dictionaryReprisentation {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"street"] = self.street;
    dict[@"suite"] = self.suite;
    dict[@"city"] = self.city;
    dict[@"zipcode"] = @(self.zipCode);
    
    NSMutableDictionary *geoDict = [NSMutableDictionary dictionary];
    geoDict[@"lat"] = @(self.coordinates.latitude);
    geoDict[@"lng"] = @(self.coordinates.longitude);
    dict = geoDict;

    return dict;
}

@end
