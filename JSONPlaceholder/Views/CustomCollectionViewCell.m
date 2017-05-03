//
//  CustomCollectionViewCell.m
//  JSONPlaceholder
//
//  Created by Maksim Rakhleev on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.imageView.image = nil;
}

@end
