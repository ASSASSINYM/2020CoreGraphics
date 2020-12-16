//
//  SessionViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "SessionViewController.h"

@interface SessionViewController ()<NSURLSessionDataDelegate>

{
    NSMutableData *_imageData;
    UIImageView *_imageView;
}
@end

@implementation SessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageData = [[NSMutableData alloc] init];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    _imageView = imageView;
    
   
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600489651977&di=b25d345c4272ca4e7e0fc954dfe63f48&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201111%2F01%2F131423x5n9f11x30s9zfqm.jpg"]];
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        if (!error) {
//            NSLog(@"%@",location);
//           // response.
//            dispatch_async(dispatch_get_main_queue(), ^{
//                            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
//            });
//
//        }else {
//            NSLog(@"下载错误");
//        }
//        NSLog(@"reponse = %@",response);
//    }];
    
    
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    [task resume];
   
}

#pragma mark - session delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveResponse:(NSURLResponse *)response
    completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [_imageData appendData:data];
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
    didCompleteWithError:(nullable NSError *)error {
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_imageView.image = [UIImage imageWithData:self->_imageData];

    });
    
    
}


@end
