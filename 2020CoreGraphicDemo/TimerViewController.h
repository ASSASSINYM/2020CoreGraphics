//
//  TimerViewController.h
//  2020CoreGraphicDemo
//
//  Created by ASSASSIN on 2020/9/19.
//  Copyright © 2020 scbdh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TimerViewController : BaseViewController

@property(nonatomic,copy)void(^callbackBlock)(NSString *name);

@end

NS_ASSUME_NONNULL_END
