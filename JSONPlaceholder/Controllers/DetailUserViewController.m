//
//  DetailUserViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 30.04.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "DetailUserViewController.h"

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
- (IBAction)showOnMapAction:(UIButton *)sender;

@end

@implementation DetailUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLayout];
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

#pragma mark - Action

- (IBAction)showOnMapAction:(UIButton *)sender {
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
