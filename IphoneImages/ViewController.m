//
//  ViewController.m
//  IphoneImages
//
//  Created by Hamza Lakhani on 2016-11-21.
//  Copyright © 2016 Hamza Lakhani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL*url= [NSURL URLWithString:@"https://i.imgur.com/zdwdenZ.png"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session= [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask*downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Request failed: %@", error.localizedDescription);
        }
        NSData *data= [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.phoneImageView.image = image;
        }];
        
        
        
    }];
    [downloadTask resume];
}




@end
