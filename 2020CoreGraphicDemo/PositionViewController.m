//
//  PositionViewController.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/18.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "PositionViewController.h"

@interface PositionViewController ()

@end

@implementation PositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100,100)];
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, redView.frame.origin.y + 64)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width-100, redView.frame.origin.y + 64)];
    animation.duration = 5;
    //[redView.layer addAnimation:animation forKey:@"position"];
    
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.toValue = [NSNumber numberWithDouble:M_PI];
    rotate.duration = 1;
    rotate.repeatCount = 100;
  //  [redView.layer addAnimation:rotate forKey:@"xxx"];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = [NSNumber numberWithInt:2];
    scale.duration = 2;
  //  [redView.layer addAnimation:scale forKey:@"scale"];
    
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue = [NSNumber numberWithDouble:1];
    opacity.toValue = [NSNumber numberWithDouble:0];
    opacity.duration = 2;
    //[redView.layer addAnimation:opacity forKey:@"opacity"];
    
    //CAAnimationGroup
    
    CAKeyframeAnimation *fuck = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL,260, 300);
    CGPathAddLineToPoint(path, NULL, self.view.frame.size.width, 200);
    CGPathCloseSubpath(path);
    
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
    
    fuck.path = circlePath.CGPath;
    fuck.duration = 5;
    fuck.removedOnCompletion = NO;
    
    [redView.layer addAnimation:fuck forKey:@"fuck"];
    
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
