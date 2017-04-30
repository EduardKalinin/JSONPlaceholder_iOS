//
//  ViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 29.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "ViewController.h"
#import "UsersService.h"
#import "User.h"
#import "DetailUserViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) UsersService *userService;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userService = [[UsersService alloc] init];
    
    [self loadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    User *user = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = user.name;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    User *selectedUser = [self.items objectAtIndex:indexPath.row];
    DetailUserViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailUserViewController"];
    detailVC.user = selectedUser;
    [self.navigationController pushViewController:detailVC animated:true];
}

#pragma mark - LoadData

- (void)loadData {
    __weak ViewController *weakSelf = self;
    [self.userService getObjects:^(NSArray *items, NSError *error) {
        weakSelf.items = items;
        [weakSelf.tableView reloadData];
    }];
}

@end
