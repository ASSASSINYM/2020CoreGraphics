//
//  MTCustomView.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "MTCustomView.h"

@implementation MTCustomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = CGRectMake(self.bounds.origin.x - 10, self.bounds.origin.y - 10, self.bounds.size.width + 20, self.bounds.size.height + 20);
    if (CGRectContainsPoint(bounds, point)) {
        return YES;
    }else {
        return NO;
    }
}

@end
