//
//  TimerViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property(nonatomic,copy)void(^block)(NSString *fuck);

@property(nonatomic,weak)NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
//
//    void(^fuckBlock)(NSString *fuck) = ^(NSString *name){
//        NSLog(@"%@",NSStringFromClass([self class]));
//    };
//    fuckBlock(@"xxxxx");
//    //self.block = fuckBlock;
//
//
//    [UIView animateWithDuration:5 animations:^{
//        self.view.alpha = 0.0;
//    }];
    
    
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        NSLog(@"+++%@",NSStringFromClass([weakSelf class]));
//    }];
//
    
    
    
   
   // [timer fire];
    
    NSLog(@"current thread = %@",[NSThread currentThread]);

    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        NSLog(@"current thread = %@",[NSThread currentThread]);
        
        NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
               
               NSLog(@"fuck it!");
           }];
           
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
        
    });
}

#pragma mark - run subthread

-(void)subThread {
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.callbackBlock) {
        self.callbackBlock(@"i love you!");
    }
}

-(void)dealloc {
    [self.timer invalidate];
}


@end
