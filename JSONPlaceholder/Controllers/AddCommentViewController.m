//
//  AddCommentViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "AddCommentViewController.h"
#import "ComentsService.h"
#import "Comment.h"
#import "Post.h"

@interface AddCommentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (strong, nonatomic) ComentsService *commentService;

@end

@implementation AddCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentService = [[ComentsService alloc] init];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancelBarButtonClicked:)];
}

#pragma mark - Helpers

- (BOOL)validateData {
    if (self.nameTextField.text.length == 0 && self.emailTextField.text.length == 0) {
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - Actions

- (IBAction)actionSaveButtonClicked:(UIButton *)sender {
    if ([self validateData]) {
        Comment *comment = [[Comment alloc] init];
        comment.name = self.nameTextField.text;
        comment.email = self.emailTextField.text;
        comment.body = self.commentTextView.text;
        comment.postId = self.post.identifier;
        
        [self.commentService createObjects:@[comment] completion:^(NSError *error) {
            if (error == nil) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                [UIAlertController showFromViewController:self title:@"ERROR" message:@"You missed the field Name or Email"];
            }
        }];
    } else {
        [UIAlertController showFromViewController:self title:@"ERROR" message:@"You missed the field Name or Email"];
    }
}

- (void)actionCancelBarButtonClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
