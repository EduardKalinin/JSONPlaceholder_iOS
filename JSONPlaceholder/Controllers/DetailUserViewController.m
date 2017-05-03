//
//  DetailUserViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 30.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "DetailUserViewController.h"
#import "User.h"
#import "PostsViewController.h"
#import "AlbumsViewController.h"

@interface DetailUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *suiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipcodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameCompanyLabel;
@property (weak, nonatomic) IBOutlet UILabel *catchLabel;
@property (weak, nonatomic) IBOutlet UILabel *bsLabel;

@end

@implementation DetailUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLayout];
}

#pragma mark - Helpers

- (void)configureLayout {
    [self configureUserInfo];
    [self addBarButtonItem];
}

- (void)configureUserInfo {
    self.nameLabel.text = self.user.name;
    self.userNameLabel.text = self.user.userName;
    self.emailLabel.text = self.user.email;
    self.phoneLabel.text = self.user.phone;
    self.websiteLabel.text = self.user.website;
    self.streetLabel.text = self.user.address.street;
    self.suiteLabel.text = self.user.address.suite;
    self.cityLabel.text = self.user.address.city;
    self.zipcodeLabel.text = [NSString stringWithFormat:@"%ld", self.user.address.zipCode];
    self.nameCompanyLabel.text = self.user.company.name;
    self.catchLabel.text = self.user.company.catchPhrase;
    self.bsLabel.text = self.user.company.bs;
}

#pragma mark - Bar Button

- (void)addBarButtonItem {
    UIBarButtonItem *albumsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"albums"]
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(actionShowAlbumssBarButtonClicked:)];
    
    UIBarButtonItem *commentsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"posts"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(actionShowCommentsBarButtonClicked:)];
    
    self.navigationItem.rightBarButtonItems = @[albumsButton, commentsButton];
}

#pragma mark - Action

- (IBAction)actionShowOnMapButtonClicked:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:
                                @"Map" message:@"you are registred" preferredStyle:UIAlertControllerStyleAlert ];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                         }];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)actionShowCommentsBarButtonClicked:(UIBarButtonItem *)sender {
    
    PostsViewController *postVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PostsViewController class])];
    postVC.user = self.user;
    [self.navigationController pushViewController:postVC animated:YES];
    
}

- (void)actionShowAlbumssBarButtonClicked:(UIBarButtonItem *)sender {
    
    AlbumsViewController *albumVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([AlbumsViewController class])];
    albumVC.user = self.user;
    [self.navigationController pushViewController:albumVC animated:YES];
    
}

@end
