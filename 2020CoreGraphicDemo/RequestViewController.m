//
//  RequestViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/12.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "RequestViewController.h"

#define IMG_URL @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3785880956,1811210930&fm=26&gp=0.jpg"

@interface RequestViewController ()<NSURLSessionTaskDelegate,NSURLSessionDataDelegate,NSURLSessionDownloadDelegate>

@property(nonatomic,weak)IBOutlet UIImageView *imageView;

@property(nonatomic,strong)NSMutableData *receivedData;

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:IMG_URL]];
    
    NSLog(@"++%@",request.mainDocumentURL);
    
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //[NSURLSession sessionWithConfiguration:<#(nonnull NSURLSessionConfiguration *)#> delegate:<#(nullable id<NSURLSessionDelegate>)#> delegateQueue:<#(nullable NSOperationQueue *)#>];
    
    
    
//    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            NSLog(@"location = %@",location);
//            self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
//                   NSLog(@"++%@",request.mainDocumentURL);
//
//            NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/fuccccxkvv"];
//            NSURL *url = [NSURL URLWithString:path];
//            NSError *error;
//            [[NSFileManager defaultManager] moveItemAtPath:[location path] toPath:path error:&error];
//           // [[NSFileManager defaultManager] moveItemAtURL:location toURL:url error:&error];
//            if (error) {
//                NSLog(@"xxx-error = %@",error.description);
//            }else {
//                NSLog(@"%@",location);
//            }
//        });
//
//    }];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    [task resume];
    
   
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    [self.receivedData appendData:data];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    
    
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float process = (float)(totalBytesWritten)/totalBytesExpectedToWrite;
    
    NSLog(@"download process ----- %lf",process);
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
