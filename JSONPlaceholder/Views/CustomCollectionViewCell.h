//
//  CustomCollectionViewCell.h
//  JSONPlaceholder
//
//  Created by Maksim Rakhleev on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
