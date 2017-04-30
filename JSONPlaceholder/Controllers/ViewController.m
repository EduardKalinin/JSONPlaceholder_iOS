//
//  ViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "ViewController.h"
#import "AlbumsService.h"
#import "ComentsService.h"
#import "PhotosService.h"
#import "PostsService.h"
#import "TodosService.h"
#import "UsersService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AlbumsService *service = [[AlbumsService alloc] init];
    [service getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
    
    ComentsService *comServ = [[ComentsService alloc] init];
    [comServ getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
    
    PhotosService *phServ = [[PhotosService alloc] init];
    [phServ getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
    
    PostsService *postServ = [[PostsService alloc] init];
    [postServ getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
    
    TodosService *todoServ = [[TodosService alloc] init];
    [todoServ getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
    
    UsersService *userServ = [[UsersService alloc] init];
    [userServ getObjects:^(NSArray *items, NSError *error) {
        NSLog(@"");
    }];
}

@end
