//
//  Comment.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelProtocol.h"

@interface Comment : NSObject <ModelProtocol>

@property (assign, nonatomic) NSInteger postId;
@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *body;

@end
