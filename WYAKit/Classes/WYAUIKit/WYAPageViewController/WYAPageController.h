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

/**
 实现此数据源方法，以便自定义您自己的contentView的frame

 @param pageController parentController
 @param contentView contentView 每个都是子控制器的父视图
 @return contentView 的frame
 */
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView;

/**
 实现此数据源方法，以便自定义您自己的MenuView的frame

 @param pageController parentController
 @param menuView 菜单视图
 @return menuView的frane
 */
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView;
@end

@protocol WYAPageControllerDelegate <NSObject>

@optional

/**
 如果子控制器比较重，则在此方法中进行一些工作。此方法仅在控制器初始化并停止滚动时调用。(这意味着，如果控制器被缓存，并且没有释放，则永远不会调用此方法。)

 @param pageController  parent controller
 @param viewController 视图控制器在滚动停止时首先出现。
 @param info A dictionary that includes some infos, such as: `index` / `title`
 */
- (void)wya_pageController:(WYAPageController *)pageController lazyLoadViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info;

@end

@interface WYAPageController : UIViewController

@end

NS_ASSUME_NONNULL_END
