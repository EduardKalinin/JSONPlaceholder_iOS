//
//  DetailUserViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 30.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "DetailUserViewController.h"
#import "User.h"

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
    [self addBarButtonItem];
}

- (void)configureLayout {
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
    UIImage *image = [UIImage imageNamed:@"albums"];
    UIBarButtonItem *albumsButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(actionShowOnMapButtonClicked:)];
    
    UIImage *image2 = [UIImage imageNamed:@"posts"];
    UIBarButtonItem *commentsButton = [[UIBarButtonItem alloc] initWithImage:image2 style:UIBarButtonItemStylePlain target:self action:@selector(actionShowOnMapButtonClicked:)];
    
    NSMutableArray *rightBarButtonArray = [NSMutableArray array];
    [rightBarButtonArray addObject:albumsButton];
    [rightBarButtonArray addObject:commentsButton];
    
    self.navigationItem.rightBarButtonItems = rightBarButtonArray;
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

@end
