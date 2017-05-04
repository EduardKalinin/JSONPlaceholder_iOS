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
#import "AddCommentViewController.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) ComentsService *commentService;

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commentService = [[ComentsService alloc] init];
    [self configureLayout];
    [self addBarButtonItem];
    [self loadData];
}

#pragma mark - Helpers

- (void)configureLayout {
    self.titleLabel.text = self.post.title;
    self.bodyLabel.text = self.post.body;
}

- (void)addBarButtonItem {
    UIBarButtonItem *addCommentButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionCommentWithButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem = addCommentButton;
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDelegate

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak CommentsViewController *weakSelf = self;
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        Comment *comment = self.items[indexPath.row];
        [weakSelf.commentService deleteObjectWithId:comment.identifier completion:^(NSError *error) {
            if (error == nil) {
                [weakSelf.items removeObjectAtIndex:indexPath.row];
                [weakSelf.tableView reloadData];
            } else {
                [UIAlertController showFromViewController:self title:@"ERROR" message:@"You missed the field Name or Email"];
            }
        }];
    }];
    delete.backgroundColor = [UIColor redColor];
    
    return @[delete];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - LoadData

- (void)loadData {
    __weak CommentsViewController *weakSelf = self;
    [self.commentService commentsForPostWithID:self.post.identifier completion:^(NSArray *array, NSError *error) {
        weakSelf.items = [array mutableCopy];
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Actions

- (void)actionCommentWithButtonClicked:(UIBarButtonItem *)sender {
    AddCommentViewController *addCommVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AddCommentViewController class])];
    addCommVC.post = self.post;
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:addCommVC];
    [self presentViewController:navVC animated:YES completion:nil];
    
}

@end
