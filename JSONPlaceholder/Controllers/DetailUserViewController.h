//
//  DetailUserViewController.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 30.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface DetailUserViewController : UITableViewController

@property (strong, nonatomic) User *user;

@end
