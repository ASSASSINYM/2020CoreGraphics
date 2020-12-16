//
//  DeadLockViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "DeadLockViewController.h"

@interface DeadLockViewController ()

@end

@implementation DeadLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self test2];
    
    
}

-(void)test2 {
    
    dispatch_queue_t queue = dispatch_queue_create("mtQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"thread = %@",[NSThread currentThread]);
        NSLog(@"task1");
        dispatch_sync(queue, ^{
            NSLog(@"task2");
        });
    });
    NSLog(@"end");
}

-(void)test1 {
        
        dispatch_queue_t queue = dispatch_queue_create("mtQueue", DISPATCH_QUEUE_CONCURRENT);
        
        NSLog(@"%s",__func__);
    //    dispatch_sync(queue, ^{
    //        NSLog(@"thread = %@",[NSThread currentThread]);
    //        NSLog(@"task1");
    //    });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"thread = %@",[NSThread currentThread]);
                   NSLog(@"task1");
        });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"thread = %@",[NSThread currentThread]);
                        NSLog(@"task2");
        });
        
        NSLog(@"end");
}


@end
