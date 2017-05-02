//
//  CommentsViewController.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 02.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;

@interface CommentsViewController : UIViewController

@property (strong, nonatomic) Post *post;

@end
