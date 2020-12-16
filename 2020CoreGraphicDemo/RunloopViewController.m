//
//  RunloopViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/13.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "RunloopViewController.h"
#import "TestThread.h"

@interface RunloopViewController ()

@property(nonatomic,strong)TestThread *sub_thread;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    TestThread *thread = [[TestThread alloc] initWithTarget:self selector:@selector(subThreadEnter) object:nil];
//    thread.name = @"测试线程";
//    self.sub_thread = thread;
//    [thread start]
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"%@",[NSThread currentThread]);
//        NSLog(@"--------task1");
//    });
//
//    NSLog(@"%@",[NSOperationQueue currentQueue]);
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"task1 --- start");
//        NSLog(@"task1 --- end");
        
        sleep(5);
    }];
    operation1.completionBlock = ^{
        NSLog(@"task1 --------------------- finished");
    };
    [queue addOperation:operation1];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
//          NSLog(@"task2 --- start");
//          NSLog(@"task2 --- end");
        sleep(5);

      }];
      operation2.completionBlock = ^{
          NSLog(@"task2 --------------------- finished");
      };
    [operation2 addDependency:operation1];
      [queue addOperation:operation2];
    
      
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
//          NSLog(@"task3 --- start");
//          NSLog(@"task3 --- end");
        sleep(5);

      }];
      operation3.completionBlock = ^{
          NSLog(@"task3 --------------------- finished");
      };
      [queue addOperation:operation3];
      
    
}

-(void)subThreadAction {
    
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
       NSLog(@"%@----子线程任务开始",[NSThread currentThread]);

    for (int i=0; i<10; i++)
       {
           [NSThread sleepForTimeInterval:1.0];
           NSLog(@"----子线程任务 %ld",(long)i);
       }
       NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
}

-(void)subThreadEnter {
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
    NSLog(@"启动RunLoop前--%@",runloop.currentMode);
    [runloop run];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self performSelector:@selector(subThreadAction) onThread:self.sub_thread withObject:nil waitUntilDone:NO];
}

@end
