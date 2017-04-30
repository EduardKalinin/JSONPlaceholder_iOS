//
//  Company.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"

@interface Company : NSObject <ModelProtocol>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *catchPhrase;
@property (strong, nonatomic) NSString *bs;

@end
