//
//  DetailFotoViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "DetailFotoViewController.h"
#import "Photo.h"
#import "DownloadImageService.h"
#import "PhotosService.h"

@interface DetailFotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) DownloadImageService *imageService;

@end

@implementation DetailFotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageService = [[DownloadImageService alloc] init];
    [self configureLayout];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancelBarButtonClicked:)];
    
}

- (void)configureLayout {
    
    if (self.photo.url) {
        [self.imageService loadImageWithURL:self.photo.url serviceCompletion:^(UIImage *image, NSError *error) {
            self.imageView.image = image;
        }];
    }
    
    self.titleLabel.text = self.photo.title;
}

- (void)actionCancelBarButtonClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
