//
//  CallbackViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "CallbackViewController.h"

@interface CallbackViewController ()

@property(nonatomic,strong)NSThread *speciThread;
@property(nonatomic,strong)dispatch_queue_t queue;

@end

@implementation CallbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   // [self performsel];
    
    self.speciThread = [[NSThread alloc] initWithTarget:self selector:@selector(sub_thread_enter) object:nil];
    self.speciThread.name = @"speciThread";
    [self.speciThread start];
    
    self.queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        sleep(5);
        [self performSelector:@selector(task1_finished) onThread:self.speciThread withObject:nil waitUntilDone:NO];
//        dispatch_async(self.queue, ^{
//            NSLog(@"task1 finished");
//            NSLog(@"%@",[NSThread currentThread]);
//        });
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
           sleep(5);
        [self performSelector:@selector(task2_finished) onThread:self.speciThread withObject:nil waitUntilDone:NO];

//        dispatch_async(self.queue, ^{
//               NSLog(@"task2 finished");
//            NSLog(@"%@",[NSThread currentThread]);
//           });
       });
    
    dispatch_async(dispatch_get_main_queue(), ^{
           sleep(5);
        [self performSelector:@selector(task3_finished) onThread:self.speciThread withObject:nil waitUntilDone:NO];

//        dispatch_async(self.queue, ^{
//               NSLog(@"task3 finished");
//            NSLog(@"%@",[NSThread currentThread]);
//           });
       });
}

-(void)sub_thread_enter{
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
    [runloop run];
}

-(void)task1_finished {
    NSLog(@"task1 finised");
    NSLog(@"%@",[NSThread currentThread]);
}

-(void)task2_finished{
    NSLog(@"task2 finised");
    NSLog(@"%@",[NSThread currentThread]);
}

-(void)task3_finished {
    NSLog(@"task3 finised");
    NSLog(@"%@",[NSThread currentThread]);
}


@end
