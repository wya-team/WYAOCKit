//
//  ASPopupPresentAnimator.h
//  ASPopupControllerDemo
//
//  Created by wya on 16/11/3.
//  Copyright © 2016年 code. All rights reserved.
//

#import "WYAAlertStyle.h"
#import <UIKit/UIKit.h>

@interface WYAPopupPresentAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) WYAPopupPresentStyle presentStyle;

@end
