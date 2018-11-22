# WYAPageViewController

## 功能

- 实现分页效果，可以左右滑动切换也可以点击顶部或底部的标签切换页面.
  标签位置可以自定义，可以放在导航栏位置也可放在底部，或者导航栏下边

## 属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
ViewControllerClasses | 各个控制器的class | `NSArray <Class> *` | -
titles | 各个控制器的标题 | `NSArray<NSString*> *`| -
currentViewController | 当前控制器<font color="red">只读</font> | `UIViewController` | -
selectIndex | 设置选中的item | int | -
pageAnimatable | 点击MenuItem是否触发滚动效果 | BOOL | NO
automaticallyCalculatesItemWidths | 是否通过字符串内容自动计算MenuItem的宽度 | BOOL | NO
scrollEnable | 是否可以滑动切换 | BOOL | YES
titleSizeSelected | 标题选中的尺寸 | CGFloat | -
titleSizeNormal | 标题未选中的尺寸 | CGFloat | -
titleColorSelected | 标题选中的颜色（颜色是渐变动画效果）| UIColor | -
titleColorNormal | 标题选中的颜色（颜色是渐变动画效果）| UIColor | -
titleFontName | 标题的字体名字(可以为空) | NSString | -
menuItemWidth | 每个Item的宽度（如果item等宽可以设置该属性）| CGFloat | -
itemsWidths | 各个item的宽度，可不等，数组内存放NSNumber | `NSArray<NSNumber *> *` | -
menuViewStyle | item布局分布样式 | WYAMenuViewLayoutMode | WYAMenuViewLayoutModeScatter
progressColor | 进度条颜色，默认和选中颜色一致（如果style为default,该属性无效） | UIColor | -
progressViewWidths | 定制进度条在各个item下的宽度 | NSArray(可以为空) | -
progressWidth | 若每个进度调宽度一致，可设置该属性 | CGFloat | -
progressHeight | 进度条的高度 | CGFloat | 1
progressViewIsNaughty | 使用这个属性请设置一个小的progressWidth(另类的进度条滑动效果) | BOOL | NO
postNotification | 是否发送在创建控制器或者视图完全展现在用户眼前时通知观察者 | BOOL | NO
bounces | ContentView是否需要弹簧效果 | BOOL | NO
showOnNavigationBar | 是否作为NavigatonBar的titleView展示默认为NO | BOOL | NO
startDragging | 用代码设置ContentView的contentOffset之前请设置startDragging= YES | BOOL | NO
itemsMargins | 顶部菜单栏各个item的间隙,因为包括头为两端，所以确保他的数量等于控制器数量+1,默认间距为0 | `NSArray<NSNumber *> *` | -
itemMargin | 如果各个间隙都想同，设置该属性 | CGFloat | 0
progressViewBottomSpace | progressView到menuview底部的距离 | CGFloat | -
progressViewCornerRadius | 进度条的圆角 | CGFLoat | -1
menuView | 顶部导航栏 | WYAMenuView | -
scrollView | 内部容器视图 | WYAPageScrollView | -
menuViewContentMargin | menuView内部视图与左右的间距 | CGFloat | -

## 方法
```Object-C
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
 @discussion This method will recall `-pageController:wya_preferredFrameForContentView:` and `-wya_pageContoller:preferredFrameForMenuView:`
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

```


## delegate
```Object-C
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
```

## DataSource

```Object-C
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
```
## 基础用法

- 构建继承与WYAPageController的Class


```Object-C
#import "WYAPageController.h"

NS_ASSUME_NONNULL_BEGIN
@interface WYACustomPageController : WYAPageController

@end
NS_ASSUME_NONNULL_END
```
- 设置相关属性
 
```Object-C
    WYACustomPageController * vc = [[WYACustomPageController alloc]init];
    vc.selectIndex = 1;
    vc.title = key;
    vc.menuViewStyle = WYAMenuViewStyleDefault;
    vc.automaticallyCalculatesItemWidths = YES;
```

- 实现代理

```Object-C
#pragma mark ======= delegate
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu{
    return 3;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageController *)pageController{
    return 3;
}
- (NSString *)wya_pageController:(WYAPageController *)pageController titleAtIndex:(NSInteger)index {
    switch (index % 3) {
        case 0: return @"index1";
        case 1: return @"index2";
        case 2: return @"index3";
    }
    return @"NONE";
}

- (UIViewController *)wya_pageController:(WYAPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index % 3) {
        case 0: return [[WYAOneTableViewController alloc] init];
        case 1: return [[WYATwoTableViewController alloc] init];
        case 2: return [[WYAThreeTableViewController alloc] init];
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    CGFloat width = [super wya_menuView:menu widthForItemAtIndex:index];
    return width + 20;
}
- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView{
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView{
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}
```
## TODO

