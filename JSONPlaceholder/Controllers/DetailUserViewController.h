//
//  DetailUserViewController.h
//  JSONPlaceholder
//
//  Created by Maksim Rakhleev on 30.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface DetailUserViewController : UITableViewController

@property (strong, nonatomic) User *user;

@end
