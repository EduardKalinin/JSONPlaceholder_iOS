//
//  User.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "Company.h"
#import "ModelProtocol.h"

@interface User : NSObject <ModelProtocol>

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) Address *address;
@property (strong, nonatomic) Company *company;

@end
