//
//  WYAPageController.h
//  FMDB
//
//  Created by 李俊恒 on 2018/11/14.
//

#import <UIKit/UIKit.h>
#import "WYAMenuView.h"
#import "WYAPageScrollView.h"
#import "WYANavBar.h"
@class WYAPageController;
/*
 *  WYAPageController 的缓存设置，默认缓存为无限制，当收到 memoryWarning 时，会自动切换到低缓存模式 (WYAPageControllerCachePolicyLowMemory)，并在一段时间后切换到 High .
 收到多次警告后，会停留在到 WYAPageControllerCachePolicyLowMemory 不再增长
 *
 *  The Default cache policy is No Limit, when recieved memory warning, page controller will switch mode to 'LowMemory'
 and continue to grow back after a while.
 If recieved too much times, the cache policy will stay at 'LowMemory' and don't grow back any more.
 */
typedef NS_ENUM(NSInteger, WYAPageControllerCachePolicy) {
    WYAPageControllerCachePolicyDisabled   = -1,  // Disable Cache
    WYAPageControllerCachePolicyNoLimit    = 0,   // No limit
    WYAPageControllerCachePolicyLowMemory  = 1,   // Low Memory but may block when scroll
    WYAPageControllerCachePolicyBalanced   = 3,   // Balanced ↑ and ↓
    WYAPageControllerCachePolicyHigh       = 5    // High
};

typedef NS_ENUM(NSUInteger, WYAPageControllerPreloadPolicy) {
    WYAPageControllerPreloadPolicyNever     = 0, // Never pre-load controller.
    WYAPageControllerPreloadPolicyNeighbour = 1, // Pre-load the controller next to the current.
    WYAPageControllerPreloadPolicyNear      = 2  // Pre-load 2 controllers near the current.
};

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
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController;

/**
 返回要在索引处显示的控制器。如果实现了这些方法，就可以轻松地设置属性。
 
 @param pageController parentController
 @param index index of child Controller
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

/**
 当一个视图控制器被缓存时调用。如果某些数据不可重用，您可以清除它。
 
 @param pageController  parent controller
 @param viewController viewController 会被缓存
 @param info  A dictionary that includes some infos, such as: `index` / `title`
 */
- (void)wya_pageController:(WYAPageController *)pageController willCachedViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info;

/**
 *  di
 *
 *  @param pageController The parent controller (WMPageController)
 *  @param viewController The viewController will appear.
 *  @param info           A dictionary that includes some infos, such as: `index` / `title`
 */
- (void)wya_pageController:(WYAPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info;

/**
 当一个视图控制器出现在用户的视线中时调用。如果需要的话，做一些准备工作。
 
 @param pageController parent controller
 @param viewController The viewController entirely displayed
 @param info A dictionary that includes some infos, such as: `index` / `title`
 */
- (void)wya_pageController:(WYAPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info;

@end

@interface WYAPageController : UIViewController
<WYAMenuViewDataSource,WYAMenuViewDelegate,UIScrollViewDelegate,WYAPageControllerDelegate,WYAPageControllerDataSource>

@property (nonatomic, weak) id<WYAPageControllerDelegate> delegate;
@property (nonatomic, weak) id<WYAPageControllerDataSource> dataSource;

/**
 *  values keys 属性可以用于初始化控制器的时候为控制器传值(利用 KVC 来设置)
 使用时请确保 key 与控制器的属性名字一致！！(例如：控制器有需要设置的属性 type，那么 keys 所放的就是字符串 @"type")
 */
@property (nonatomic, strong) NSMutableArray <id> * values;
@property (nonatomic, strong) NSMutableArray<NSString *> * keys;

/**
 *  各个控制器的 class, 例如:[UITableViewController class]
 */
@property (nonatomic, copy, nullable) NSArray<Class> * ViewControllerClasses;

/**
 各个控制器的标题
 */
@property (nonatomic, copy, nullable) NSArray<NSString *> * titles;
@property (nonatomic, strong, readonly) UIViewController * currentViewController;

/**
 设置选中几号item
 */
@property (nonatomic, assign) int  selectIndex;

/**
 点击的MenuItem是否触发滚动效果动画
 */
@property (nonatomic, assign) BOOL  pageAnimatable;

/**
 是否通过字符串内容自动计算MenuItem的宽度，默认为NO
 */
@property (nonatomic, assign) BOOL  automaticallyCalculatesItemWidths;

/**
 是否可以滑动切换，默认是YES
 */
@property (nonatomic, assign) BOOL  scrollEnable;

/**
 标题选中时的尺寸
 */
@property (nonatomic, assign) CGFloat  titleSizeSelected;

/**
 标题未选中时的尺寸
 */
@property (nonatomic, assign) CGFloat  titleSizeNormal;

/**
 *  标题选中时的颜色, 颜色是可动画的.
 */
@property (nonatomic, strong) UIColor * titleColorSelected;

/**
 *  标题非选择时的颜色, 颜色是可动画的.
 */
@property (nonatomic, strong) UIColor * titleColorNormal;

/**
 标题的字体名字
 */
@property (nonatomic, copy, nullable) NSString * titleFontName;

/**
 每个Item的宽度
 */
@property (nonatomic, assign) CGFloat  menuItemWidth;

/**
 各个item的宽度，可不等，数组内存放NSNumber
 */
@property (nonatomic, copy, nullable) NSArray<NSNumber *> * itemsWidths;

/**
 menuView的样式 默认为无下划线
 */
@property (nonatomic, assign) WYAMenuViewStyle  menuViewStyle;

/**
 item布局分布样式居左 居中 居右 默认
 */
@property (nonatomic, assign) WYAMenuViewLayoutMode  menuViewLayoutMode;

/**
 进度条颜色，默认和选中颜色一致（如果style为default,该属性无效）
 */
@property (nonatomic, strong, nullable) UIColor * progressColor;

/**
 定制进度条在各个item下的宽度
 */
@property (nonatomic, strong, nullable) NSArray * progressViewWidths;

/**
 若每个进度调宽度一致，可设置该属性
 */
@property (nonatomic, assign) CGFloat  progressWidth;

/**
 使用这个属性请设置一个小的progressWidth,用于实现腾讯视频新效果
 */
@property (nonatomic, assign) BOOL  progressViewIsNaughty;

/**
 是否发送在创建控制器或者视图完全展现在用户眼前时通知观察者，默认为不开启，如需利用通知请开启
 */
@property (nonatomic, assign) BOOL  postNotification;
/**
 *  是否记录 Controller 的位置，并在下次回来的时候回到相应位置，默认为 NO (若当前缓存中存在不会触发)
 *  Whether to remember controller's positon if it's a kind of scrollView controller,like UITableViewController,The default value is NO.
 *  比如 `UITabelViewController`, 当然你也可以在自己的控制器中自行设置, 如果将 Controller.view 替换为 scrollView 或者在Controller.view 上添加了一个和自身 bounds 一样的 scrollView 也是OK的
 */
@property (nonatomic, assign) BOOL  rememberLocation __deprecated_msg("Because of the cache policy,this property can abondon now.");

/**
 缓存机制，默认无限制（如果收到内存警告，会自动切换）
 */
@property (nonatomic, assign) WYAPageControllerCachePolicy  cachePolicy;

/**
 预加载机制，在停止滑动的时候预加载n页
 */
@property (nonatomic, assign) WYAPageControllerPreloadPolicy  preloadPolicy;

/**
 ContentView是否需要弹簧效果
 */
@property (nonatomic, assign) BOOL  bounces;

/**
 自定义的导航栏，如果需要显示在自定义的导航栏上需要先设置该属性
 */
@property (nonatomic, strong) WYANavBar * navBar;

/**
 是否作为NavigatonBar的titleView展示默认为NO，若不使用系统导航栏需要将自定义导航栏传入
 */
@property (nonatomic, assign) BOOL  showOnNavigationBar;

/**
 用代码设置ContentView的contentOffset之前请设置startDragging = YES
 */
@property (nonatomic, assign) BOOL  startDragging;

/**
 下划线进度条的高度
 */
@property (nonatomic, assign) CGFloat  progressHeight;

/**
 顶部菜单栏各个item的间隙，因为包括头为两端，所以确保他的数量等于控制器数量+1，默认间距为0
 */
@property (nonatomic, copy, nullable) NSArray<NSNumber *> * itemsMargins;

/**
 *  set itemMargin if all margins are the same, default is 0
 如果各个间隙都想同，设置该属性，默认为 0
 */
@property (nonatomic, assign) CGFloat itemMargin;

/**
 progressView到menuview底部的距离
 */
@property (nonatomic, assign) CGFloat  progressViewBottomSpace;

/**
 progressView's cornerRadius
 */
@property (nonatomic, assign) CGFloat  progressViewCornerRadius;

/**
 顶部导航栏
 */
@property (nonatomic, weak, nullable) WYAMenuView * menuView;

/**
 内部容器视图
 */
@property (nonatomic, weak, nullable) WYAPageScrollView * scrollView;

/**
 menuView内部视图与左右的间距
 */
@property (nonatomic, assign) CGFloat  menuViewContentMargin;

/**
 构造方法，使用该方法创建控制器，或者实现数据源方法
 
 @param classes 子控制器的class确保数量与titles的数量相等
 @param titles 各个子控制器的标题，string类型
 @return instancetype
 */
- (instancetype)initWithViewControllerClasses:(NSArray<Class>*)classes anTheirTitles:(NSArray<NSString *>*)titles;

/**
 该方法用于重置刷新父控制器，该刷新包括顶部 MenuView 和 childViewControllers.如果之前设置过 `itemsMargins` 和 `itemsWidths` `values` 以及 `keys` 属性，请确保在调用 reload 之前也同时更新了这些属性。并且，最最最重要的，注意数组的个数以防止溢出。
 */
- (void)wya_reloadData;

/**
 Layout all views in WMPageController
 @discussion This method will recall `-wya_pageController:preferredFrameForContentView:` and `-wya_pageContoller:preferredFrameForMenuView:`
 */
- (void)wya_forceLayoutSubviews;

/**
 *  Update designated item's title
 更新指定序号的控制器的标题
 *  @param title 新的标题
 *  @param index 目标序号
 */
- (void)wya_updateTitle:(NSString *)title atIndex:(NSInteger)index;

/**
 *  Update designated item's title and width
 更新指定序号的控制器的标题以及他的宽度
 *  @param title 新的标题
 *  @param index 目标序号
 *  @param width 对应item的新宽度
 */
- (void)wya_updateTitle:(NSString *)title anWidth:(CGFloat)width atIndex:(NSInteger)index;

- (void)wya_updateAttributeTitle:(NSAttributedString *)title atIndex:(NSInteger)index;

/**
 app即将进入后台接到的通知
 */
- (void)wya_willResignActive:(NSNotification *)notification;
/**
 app即将回到前台接收到的通知
 */
- (void)wya_willEnterForeground:(NSNotification *)notification;

@end

NS_ASSUME_NONNULL_END
