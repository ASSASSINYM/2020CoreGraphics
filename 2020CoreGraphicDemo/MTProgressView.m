//
//  MTProgressView.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "MTProgressView.h"

@implementation MTProgressView

-(void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    path.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [path stroke];

}

@end
