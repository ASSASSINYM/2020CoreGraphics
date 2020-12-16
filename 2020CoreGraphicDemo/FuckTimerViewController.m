//
//  FuckTimerViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/11.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "FuckTimerViewController.h"

@interface FuckTimerViewController ()

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation FuckTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    
//    _timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"fuck it++++!");
//    }];
    
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)timerAction {
    NSLog(@"shit on me!!");
}

-(void)dealloc {
    [_timer invalidate];
    _timer = nil;
}


@end
