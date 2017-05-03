//
//  PhotosViewController.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;

@interface PhotosViewController : UIViewController

@property (strong, nonatomic) Album *album;

@end
