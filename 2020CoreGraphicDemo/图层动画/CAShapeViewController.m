//
//  CAShapeViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/27.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "CAShapeViewController.h"


@interface CAShapeViewController ()

@end

@implementation CAShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIView *ss = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    ss.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:ss];
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    //circle.frame = CGRectMake(60, 100, 300, 300);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(180, 200) radius:150 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    circle.path = path.CGPath;
//
    
    NSLayoutConstraint
   // circle.path = [UIBezierPath bezierPathWithRect:CGRectMake(60, 100, 500, 500)].CGPath;
    circle.fillColor = [UIColor redColor].CGColor;
    circle.strokeColor = [UIColor greenColor].CGColor;
    circle.lineWidth = 10;
    
    [self.view.layer addSublayer:circle];
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
