//
//  ASPopupPresentAnimator.h
//  ASPopupControllerDemo
//
//  Created by wya on 16/11/3.
//  Copyright © 2016年 code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAPopupHeader.h"

@interface WYAPopupPresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) WYAPopupPresentStyle presentStyle;

@end
