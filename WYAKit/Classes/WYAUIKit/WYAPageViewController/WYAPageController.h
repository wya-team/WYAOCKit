//
//  WYAPageController.h
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import <UIKit/UIKit.h>
#import "WYAMenuView.h"
#import "WYAPageScrollView.h"
@class WYAPageController;
NS_ASSUME_NONNULL_BEGIN
extern NSString * const WYAControllerDidAddToSuperViewNotification;
extern NSString * const WYAControllerDidFullyDisplayedNotification;
@protocol WYAPageControllerDataSource <NSObject>
@optional

/**
 得到一个在PageController里子控制器的个数

 @param pageController parentController
 @return child controllers's count
 */
- (NSInteger)wya_numbersOfCHildControllersInPageController:(WYAPageController *)pageController;

/**
 返回要在索引处显示的控制器。如果实现了这些方法，就可以轻松地设置属性。

 @param pageController parentController
 @param index index of child COntroller
 @return UIViewController instance
 */
- (__kindof UIViewController *)wya_pageController:(WYAPageController *)pageController viewControllerAtIndex:(NSInteger)index;


/**
 WYAMenuView中显示的每个标题

 @param pageController parentController
 @param index index of title
 @return WYAPageController 顶部显示的 NSString的值
 */
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index;

@required


@end


@interface WYAPageController : UIViewController

@end

NS_ASSUME_NONNULL_END
