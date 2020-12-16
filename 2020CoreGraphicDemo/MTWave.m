//
//  MTWave.m
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/18.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import "MTWave.h"

@interface MTWave ()

/// 偏移
@property(nonatomic,assign)CGFloat waveOffset;
/// 刷新帧
@property(nonatomic,strong)CADisplayLink *displayLink;
/// 波浪
@property(nonatomic,strong)CAShapeLayer *waveShapeLayer;

@end

@implementation MTWave


-(void)awakeFromNib {
    [super awakeFromNib];
    [self initData];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

#pragma mark - 默认配置

-(void)initData {
    _waveHeight = 50;
    _waveOniga = 1;
    _waveSpeed = 10;
    _waveColor = [UIColor redColor];
    
    
    [self.layer addSublayer:self.waveShapeLayer];
}

#pragma mark - lazy load

-(CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(wave)];
    }
    return _displayLink;
}

-(CAShapeLayer *)waveShapeLayer {
    if (!_waveShapeLayer) {
        _waveShapeLayer = [CAShapeLayer layer];
        _waveShapeLayer.frame = self.bounds;
    }
    return _waveShapeLayer;
}

#pragma mark wave

-(void)wave {
    NSLog(@"xx");
    _waveOffset += self.waveSpeed;
    //创建浪路径
    CGMutablePathRef wavePath = CGPathCreateMutable();
    CGPathMoveToPoint(wavePath, NULL, 0, self.waveHeight);
    for (int x = 0; x < self.frame.size.width; x++) {
        CGFloat y = self.waveHeight  * sinf(self.waveOniga * x * M_PI / 180 + _waveOffset * M_PI / 180);
        CGPathAddLineToPoint(wavePath, NULL, x, y);
        NSLog(@"y = %f",y);
    }
    
    CGPathAddLineToPoint(wavePath, NULL, self.frame.size.width, self.waveHeight);
    CGPathAddLineToPoint(wavePath, NULL, 0, self.waveHeight);
    
    CGPathCloseSubpath(wavePath);
    self.waveShapeLayer.path = wavePath;
    self.waveShapeLayer.fillColor = self.waveColor.CGColor;
    CGPathRelease(wavePath);
}


-(void)startWaveAnimation {
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)endWaveAnimation {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

@end
