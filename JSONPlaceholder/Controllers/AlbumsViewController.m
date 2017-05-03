//
//  AlbumsViewController.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "AlbumsViewController.h"
#import "AlbumsService.h"
#import "Album.h"
#import "User.h"
#import "PhotosViewController.h"

@interface AlbumsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) AlbumsService *albumService;

@end

@implementation AlbumsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.albumService = [[AlbumsService alloc] init];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Album *album = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = album.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Album *selectedAlbum = [self.items objectAtIndex:indexPath.row];
    PhotosViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PhotosViewController class])];
    photoVC.album = selectedAlbum;
    [self.navigationController pushViewController:photoVC animated:true];
}

#pragma mark - LoadData

- (void)loadData {
    __weak AlbumsViewController *weakSelf = self;
    [self.albumService albumsForUsertWithID:self.user.identifier completion:^(NSArray *array, NSError *error) {
        weakSelf.items = array;
        [weakSelf.tableView reloadData];
    }];
}

@end
