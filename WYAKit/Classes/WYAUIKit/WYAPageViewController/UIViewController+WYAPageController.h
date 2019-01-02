//
//  UIViewController+WYAPageController.h
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAPageController;

@interface UIViewController (WYAPageController)

/**
 获取控制器所在的WYAPageController
 */
@property (nonatomic, nullable, strong, readonly) WYAPageController * wya_PageController;
@end

NS_ASSUME_NONNULL_END
