//
//  MTPresentOneTransition.h
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/14.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,MTPresentOneTransitionType) {
    MTPresentOneTransitionTypePresent = 0,
    MTPresentOneTransitionTypeDismiss
};

NS_ASSUME_NONNULL_BEGIN

@interface MTPresentOneTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(MTPresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(MTPresentOneTransitionType)type;

@end

NS_ASSUME_NONNULL_END
