#  WYANavBar
## 功能
- 实现自定义导航栏的需求，在pop返回上级界面时候可以全屏返回。定制化比较高

## 属性
 属性 | 说明 | 类型 | 默认值
 --- | --- | --- | ---
 pageItemView | 组件内部使用给分页控制器的MenuView使用 | UIView | -
 navTitleColor | 导航栏标题字体颜色 | UIColor | blackColor
 navTitleFont | 标题字号大小 | CGFloat | 18
 leftBarButtonItemTitleFont|返回标题字体大小 | CGFloat | 16
rightBarButtonItemTitleFont|右侧标题字体大小 | CGFloat | 16
isShowLine | 是否显示分割线 | BOOL | YES
backgroundImage | 导航栏背景图 | UIImage | -
navTitle | 导航栏标题 | NSString|-
space | 左右按钮多个时候的间距 | CGFloat | 0
delegate | 导航栏的点击事件的代理 | WYANavBarDelegate | -
rightButtons | 设置右侧文字图片混合模式的右侧多个按钮 | `NSArray <UIButton *>* `| -
leftButtons | 设置左侧文字图片混合模式的右侧多个按钮 | `NSArray <UIButton *>* `| -

## 方法

```Object-C
#pragma mark ======= createRightButton
/**
 创建多个导航右侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont
 
 @param normalTitles 需要显示的标题
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *>* _Nonnull)normalTitles;

/**
 创建多个导航右侧文字按钮，标题颜色自定义两种状态
 
 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addRightNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                    normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                               highlightedColor:(NSArray<UIColor *>* _Nonnull)highlightedColors;


/**
 创建多个图片类型的右侧导航栏按钮
 
 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addRightNavBarButtonWithNormalImage:(NSArray<NSString *>* _Nonnull)normalImages
                                 highlightedImg:(NSArray<NSString *> *)highlightedImgs;


#pragma mark ======= createLeftButton
/**
 创建多个导航左侧文字按钮默认黑色标题颜色字号默认16，如需设置字体大小可以设置rightBarButtonItemTitleFont
 
 @param normalTitles 需要显示的标题
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *>* _Nonnull)normalTitles;

/**
 创建多个导航左侧文字按钮，标题颜色自定义两种状态
 
 @param normalTitles titles
 @param normalColors normalColor
 @param highlightedColors highlightedColors
 */
- (void)wya_addLeftNavBarButtonWithNormalTitle:(NSArray<NSString *> *)normalTitles
                                   normalColor:(NSArray<UIColor *> * _Nonnull)normalColors
                              highlightedColor:(NSArray<UIColor *>* _Nonnull)highlightedColors;


/**
 创建多个图片类型的左侧导航栏按钮
 
 @param normalImages normalImages 必传项
 @param highlightedImgs highlightedImgs 可以为nil
 */
- (void)wya_addLeftNavBarButtonWithNormalImage:(NSArray<NSString *>* _Nonnull)normalImages
                                highlightedImg:(NSArray<NSString *> *)highlightedImgs;

- (void)wya_goBackButtonWithTitle:(NSString *)title
                      normalColor:(UIColor * _Nullable)normalColor
                 highlightedColor:(UIColor * _Nullable)highlightedColor;

- (void)wya_goBackButtonWithImage:(NSString *)imageNamed;
```

## 代理
```Object-C
/// 返回按钮点击事件
- (void)wya_goBackPressed:(UIButton *)sender;
/// 自定义左侧按钮点击事件
- (void)wya_leftBarButtonItemPressed:(UIButton *)sender;
/// 自定义右侧按钮点击事件
- (void)wya_rightBarButtonItemPressed:(UIButton *)sender;
```

## 基本用法

```Object-C
#import "WYABaseViewController.h"

@interface WYABaseViewController ()<WYANavBarDelegate>
@property (nonatomic, strong) WYANavBar * navBar;
@end
#pragma mark ======= private
- (void)addCustomNavBar{
    self.navBar = [[WYANavBar alloc]init];
    self.navBar.delegate = self;
    self.navBar.backgroundColor = [UIColor whiteColor];
    self.navBar.navTitle = @"Example";
    NSArray *arrViewControllers = self.navigationController.viewControllers;
    if ([arrViewControllers indexOfObject:self] > 0){
        [self.navBar wya_goBackButtonWithImage:@"返回"];
    }
    [self.view addSubview:self.navBar];
}
```
详情可以参考Example中的WYABaseViewController


