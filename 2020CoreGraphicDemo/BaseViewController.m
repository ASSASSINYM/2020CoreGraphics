//
//  BaseViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)dealloc {
    
    NSLog(@"------%s",__func__);
}

-(NSString *)description {
    return NSStringFromClass([self class]);
}


@end
