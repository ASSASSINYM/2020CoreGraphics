//
//  MTWave.h
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/18.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 波浪视图
@interface MTWave : UIView

///浪高
@property(nonatomic,assign)CGFloat waveHeight;
///浪周期相关
@property(nonatomic,assign)CGFloat waveOniga;
///浪移动的速度
@property(nonatomic,assign)CGFloat waveSpeed;
///浪的颜色
@property(nonatomic,strong)UIColor *waveColor;

/// 开始动画
-(void)startWaveAnimation;

/// 停止动画
-(void)endWaveAnimation;



@end

NS_ASSUME_NONNULL_END
