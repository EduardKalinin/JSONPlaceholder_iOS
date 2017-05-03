//
//  PhotosViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotosService.h"
#import "Photo.h"
#import "CustomCollectionViewCell.h"
#import "Album.h"
#import "DownloadImageService.h"
#import "DetailFotoViewController.h"

@interface PhotosViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) PhotosService *photoService;
@property (strong, nonatomic) DownloadImageService *imageService;
@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoService = [[PhotosService alloc] init];
    self.imageService = [[DownloadImageService alloc] init];
    [self loadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomCollectionViewCell class]) forIndexPath:indexPath];
    
    Photo *photo = [self.items objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = photo.title;
    
    if (photo.thumbnailUrl) {
        [self.imageService loadImageWithURL:photo.thumbnailUrl serviceCompletion:^(UIImage *image, NSError *error) {
            cell.imageView.image = image;
        }];
    }

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Photo *selectedPhoto = [self.items objectAtIndex:indexPath.row];
    DetailFotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailFotoViewController class])];
    photoVC.photo = selectedPhoto;
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:photoVC];
    [self presentViewController:navVC animated:YES completion:nil];
}
#pragma mark - LoadData

- (void)loadData {
    __weak PhotosViewController *weakSelf = self;
    [self.photoService photosForAlbumWithID:self.album.identifier completion:^(NSArray *array, NSError *error) {
        weakSelf.items = array;
        [weakSelf.collectionView reloadData];
    }];
}

@end
