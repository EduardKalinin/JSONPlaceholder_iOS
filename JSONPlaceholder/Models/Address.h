//
//  Address.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "ModelProtocol.h"

@interface Address : NSObject <ModelProtocol>

@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *suite;
@property (strong, nonatomic) NSString *city;
@property (assign, nonatomic) NSInteger zipCode;
@property (assign, nonatomic) CLLocationCoordinate2D coordinates;

@end
