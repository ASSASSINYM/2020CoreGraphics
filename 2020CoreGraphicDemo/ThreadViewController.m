//
//  ThreadViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "ThreadViewController.h"

#define IMG__URL @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1757702845,51708014&fm=26&gp=0.jpg"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self test3];
    
}

-(void)test3 {
    
    NSLog(@"%s",__func__);
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"thread = %@",[NSThread currentThread]);
        NSLog(@"task1");
    });
    NSLog(@"task2");
}

-(void)test2 {
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    
    //dispatch_queue_t queue = dispatch_get_main_queue();
    
    
//    dispatch_semaphore_t sem = dispatch_semaphore_create(1);
//
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    dispatch_async(queue, ^{
        sleep(5);
        NSLog(@"thread = %@" ,[NSThread currentThread]);
        NSLog(@"task------1 finished");
       // dispatch_semaphore_signal(sem);
    });
    
    //dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);

    dispatch_async(queue, ^{
         sleep(5);
        NSLog(@"thread = %@" ,[NSThread currentThread]);
         NSLog(@"task--------3 finished");
        //dispatch_semaphore_signal(sem);
     });
    
    //dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    dispatch_async(queue, ^{
         sleep(5);
        NSLog(@"thread = %@" ,[NSThread currentThread]);
         NSLog(@"task-------2 finished");
       // dispatch_semaphore_signal(sem);
     });
    

}

-(void)test1 {
    NSLog(@"threadx = %@",[NSThread currentThread]);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request1 = [NSURLRequest requestWithURL:[NSURL URLWithString:IMG__URL]];
    NSURLSessionDownloadTask *task1 = [session downloadTaskWithRequest:request1 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"thread1 = %@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"task1-------------finished");
        });
    }];
    [task1 resume];
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:[NSURL URLWithString:IMG__URL]];
    NSURLSessionDownloadTask *task2 = [session downloadTaskWithRequest:request2 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"thread2 = %@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
                   NSLog(@"task2-------------finished");
               });
    }];
    [task2 resume];
    
    
    NSURLRequest *request3 = [NSURLRequest requestWithURL:[NSURL URLWithString:IMG__URL]];
    NSURLSessionDownloadTask *task3 = [session downloadTaskWithRequest:request3 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"thread3 = %@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
                   NSLog(@"task3-------------finished");
               });
    }];
    [task3 resume];
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
