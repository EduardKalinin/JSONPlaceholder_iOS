//
//  ModelProtocol.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

@protocol ModelProtocol <NSObject>

- (instancetype)initWithJSON:(NSDictionary *)dict;
- (NSDictionary *)dictionaryReprisentation;

@end
