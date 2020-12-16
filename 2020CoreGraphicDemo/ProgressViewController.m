//
//  ProgressViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "ProgressViewController.h"
#import "MTProgressView.h"
#import "TimerViewController.h"
#import "FuckTimerViewController.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    MTProgressView *progress = [[MTProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    progress.center = self.view.center;
    [self.view addSubview:progress];
}

-(IBAction)pushAction:(id)sender {
    
    FuckTimerViewController *timer = [[FuckTimerViewController alloc] init];
//    [timer setCallbackBlock:^(NSString * _Nonnull name) {
//        NSLog(@"name = %@",name);
//    }];
    [self.navigationController pushViewController:timer animated:YES];
}


@end
