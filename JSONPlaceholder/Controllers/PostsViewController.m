//
//  PostsViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 02.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "PostsViewController.h"
#import "CommentsViewController.h"
#import "PostsService.h"
#import "Post.h"
#import "User.h"

@interface PostsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) PostsService *postService;

@end

@implementation PostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postService = [[PostsService alloc] init];
    [self configureLayout];
    [self loadData];
}

#pragma mark - Helpers

- (void)configureLayout {
    self.title = self.user.name;
}

#pragma mark - UITableViewDataSource	

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Post *posts = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = posts.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Post *selectedPost = [self.items objectAtIndex:indexPath.row];
    CommentsViewController *commentVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CommentsViewController class])];
    commentVC.post = selectedPost;
    [self.navigationController pushViewController:commentVC animated:true];
}

#pragma mark - LoadData

- (void)loadData {
    __weak PostsViewController *weakSelf = self;
    [self.postService postsForUserWithID:self.user.identifier completion:^(NSArray *array, NSError *error) {
        weakSelf.items = array;
        [weakSelf.tableView reloadData];
    }];
}

@end
