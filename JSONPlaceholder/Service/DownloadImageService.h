//
//  DownloadImageService.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 03.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadImageService : NSObject

- (void)loadImageWithURL:(NSURL *)url serviceCompletion:(void (^)(UIImage *image, NSError *error))serviceCompletion;

@end
