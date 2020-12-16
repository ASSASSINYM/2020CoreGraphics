//
//  MTPresentedOneViewController.h
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/10/14.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@protocol MTPresentedOneControllerDelegate <NSObject>

- (void)presentedOneControllerPressedDissmiss;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface MTPresentedOneViewController : UIViewController

@property (nonatomic, assign) id<MTPresentedOneControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
