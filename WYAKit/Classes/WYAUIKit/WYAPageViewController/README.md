# WYAPageViewController

## 功能

- 实现分页效果，可以左右滑动切换也可以点击顶部或底部的标签切换页面.
  标签位置可以自定义，可以放在导航栏位置也可放在底部，或者导航栏下边
  <font color="red">注意：要继承`WYAWYAPageController`</font>

- 如果需要实现顶部有头部视图中间展示菜单类型的功能需要<font color="red">继承`WYAPageTableViewController`</font>

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
```objective-c
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
```objective-c
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

```objective-c
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


```objective-c
#import "WYAPageController.h"

NS_ASSUME_NONNULL_BEGIN
@interface WYACustomPageController : WYAPageController

@end
NS_ASSUME_NONNULL_END
```
- 设置相关属性
 
```objective-c
    WYACustomPageController * vc = [[WYACustomPageController alloc]init];
    vc.selectIndex = 1;
    vc.title = key;
    vc.menuViewStyle = WYAMenuViewStyleDefault;
    vc.automaticallyCalculatesItemWidths = YES;
```

- 实现代理

```objective-c
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

## 扩展继承与UITableViewController

### 新增属性

属性 | 说明 | 类型 | 默认值
--- | ---| --- | ---
headerView | 放在顶部的自定义视图控件 | UIView | nil
acceptNotification | 是否接收childController中tableView的偏移量通知 | BOOL | NO
menuViewBackroundColor | menuView的背景色设置 | UIColor | whiteColor

### 基本使用

- 在需要push或者呈现Controller之前先设置(注意这里要给titles赋值)

```objective-c
 WYATablePageController * vc = [[WYATablePageController alloc]init];
        vc.selectIndex = 0;
        vc.menuViewStyle = WYAMenuViewStyleLine;
        vc.automaticallyCalculatesItemWidths = YES;
        vc.titleColorNormal = [UIColor blackColor];
        vc.titleColorSelected = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
        vc.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
        vc.menuViewLayoutMode = WYAMenuViewLayoutModeScatter;
        vc.titleSizeSelected = 16;
        vc.titleSizeNormal = 14;
        vc.itemMargin = 20;//（没个标签的间距必传值）
        vc.acceptNotification = YES;// (必传值需要接收tableView偏移量)
        vc.titles = @[@"LIST",@"INTRODUCTION",@"INTRODUCTION",@"LIST"];//(必传值)
        [self.navigationController pushViewController:vc animated:YES];
``` 
- 父容器视图控制器（继承WYAPageTableViewController）

```objective-c
#import "WYAPageTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYATablePageController : WYAPageTableViewController

@end

NS_ASSUME_NONNULL_END
```
- 需要将
<font color="red">WYATabControllerChildControllerChangeContentOffstNotification</font>传给子控制器，这个是通知名字，用来监听tableView的偏移量

```objective-c
@interface WYATablePageController ()
@property (nonatomic, strong) UIImageView * headerImageView;
@end

@implementation WYATablePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerView = self.headerImageView;
}
- (NSInteger)wya_numberOfTitlesInMenuView:(WYAMenuView *)menu{
    return 4;
}
- (NSInteger)wya_numbersOfChildControllersInPageController:(WYAPageTableViewController *)pageController{
    return 4;
}
- (NSString *)wya_pageController:(WYAPageTableViewController *)pageController titleAtIndex:(NSInteger)index {
    switch (index % 4) {
        case 0: return @"LIST";
        case 1: return @"INTRODUCTION";
        case 2: return @"INTRODUCTION";
         case 3: return @"LIST";
    }
    return @"NONE";

}

- (UIViewController *)wya_pageController:(WYAPageTableViewController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index % 4) {
            
        case 0:
        {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;// 将通知名字传递给子控制器
            return vc;
        }
        case 1:
        {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 2:
        {
            WYATwoTableViewController * vc = [[WYATwoTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }
        case 3:
        {
            WYAOneTableViewController * vc = [[WYAOneTableViewController alloc] init];
            vc.notificationName = WYATabControllerChildControllerChangeContentOffstNotification;
            return vc;
        }

    }
    return [[UIViewController alloc] init];
}

- (CGFloat)wya_menuView:(WYAMenuView *)menu widthForItemAtIndex:(NSInteger)index{
    CGFloat tempW = [[self.titles wya_safeObjectAtIndex:index] wya_widthWithFontSize:15 height:WYANavBarHeight];// 计算没个items的标签宽度
    return tempW;
}
- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameForMenuView:(WYAMenuView *)menuView{
    return CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame), ScreenWidth, WYANavBarHeight);
}

- (CGRect)wya_pageController:(WYAPageTableViewController *)pageController preferredFrameContentView:(WYAPageScrollView *)contentView{
    return CGRectMake(0, 0, ScreenWidth, ScreenHeight - WYATopHeight - WYANavBarHeight - WYABottomHeight);
}
- (UIImageView *)headerImageView{
    if(!_headerImageView){
        _headerImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.frame = CGRectMake(0, 0, ScreenWidth, 200);
            object.backgroundColor = [UIColor brownColor];
            object.image = [UIImage imageNamed:@"0"];
            object;
        });
    }
    return _headerImageView;
}

@end
```
- 子视图必须实现的方法(这里可以继承UITableViewController或者UIViewController)

```objective-c
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAOneTableViewController : UITableViewController
@property (nonatomic, copy) NSString * notificationName;
@end

NS_ASSUME_NONNULL_END

```
- 需要实现scrollView的代理方法，发送相关通知

```objective-c
@interface WYAOneTableViewController ()

@end

@implementation WYAOneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"oneCellID"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.tableHeaderView = [[UIView alloc]init];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self performSelector:@selector(end) withObject:self afterDelay:0.5];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self performSelector:@selector(enddd) withObject:self afterDelay:0.5];
    }];
}
- (void)end{
    [self.tableView.mj_header endRefreshing];
}
- (void)enddd{
    [self.tableView.mj_footer endRefreshing];

}
// 必须要实现的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGPoint point = scrollView.contentOffset;
        NSLog(@"%f",scrollView.contentOffset.y);
        [[NSNotificationCenter defaultCenter] postNotificationName:self.notificationName object:self userInfo:[NSDictionary dictionaryWithObject:@(point.y) forKey:@"key"]];// 发送通知，注意在userInfo里的字典的key必须是“key”,value值是tableView的contentOffset的y值
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneCellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath.row = %d",(int)indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

```

