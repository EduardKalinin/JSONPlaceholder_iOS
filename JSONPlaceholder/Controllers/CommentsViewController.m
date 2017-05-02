//
//  CommentsViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 02.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "CommentsViewController.h"
#import "ComentsService.h"
#import "Comment.h"
#import "Post.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) ComentsService *commentService;

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentService = [[ComentsService alloc] init];
    [self configureLayout];
    [self loadData];
}

#pragma mark - Helpers

- (void)configureLayout {
    self.titleLabel.text = self.post.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.bodyLabel.text = self.post.body;
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
    
    Comment *comment = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = comment.body;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - LoadData

- (void)loadData {
    __weak CommentsViewController *weakSelf = self;
    [self.commentService commentsForPostWithID:self.post.identifier completion:^(NSArray *array, NSError *error) {
        weakSelf.items = array;
        [weakSelf.tableView reloadData];
    }];
}

@end
