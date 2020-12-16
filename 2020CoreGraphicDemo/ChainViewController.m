//
//  ChainViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "ChainViewController.h"
#import "MTCustomView.h"

@interface ChainViewController ()

@end

@implementation ChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MTCustomView *view = [[MTCustomView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = self.view.center;
    [self.view addSubview:view];
    
    [view addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button action

-(void)buttonAction {
    NSLog(@"xx");
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
