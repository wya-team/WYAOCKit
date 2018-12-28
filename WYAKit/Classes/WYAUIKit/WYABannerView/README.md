# WYABannerView

轮播图

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
delegate|代理|WYABannerViewwDelegate|-
clickItemOperationBlock|点击回调|block|-
itemDidScrollOperationBlock|滚动回调|block|-
imageURLStringsGroup|网络图片数组| NSArray|-
titlesGroup|每张图片对应要显示的文字数组|NSArray|-
placeholdImage|占位图片（加载图片时用于占位的图片）|-
localizationImageNamesGroup|本地图片数组|NSArray|-
autoScrollTimeInterval|滚动时间间隔|CGFloat|2s
infiniteLoop|是否无限循环|BOOL|Yes
autoScroll|是否自动滚动|BOOL|Yes
scrollDirection|图片滚动方向|UICollectionViewScrollDirection|UICollectionViewScrollDirectionHorizontal
bannerImageViewContentMode|图片展示模式|UIViewContentMode|UIViewContentModeScaleToFill
placeholderImage|占位图|UIImage|-
showPageControl|是否显示分页控件|BOOL|Yes
hidesForSinglePage|是否在只有一张图时隐藏pagecontrol|BOOL|Yes
onlyDisplayText|只展示文字轮播|BOOL|NO
pageControlStyle|pagecontrol 样式|WYABannerViewPageContolStyle|WYABannerViewPageContolStyleAnimated
pageControlAliment|分页控件位置|WYABannerViewViewPageContolAliment|WYABannerViewPageContolAlimentRight
pageControlBottomOffset|分页控件距离轮播图的底部间距（在默认间距基础上）的偏移量|CGFloat|-
pageControlRightOffset|分页控件距离轮播图的右边间距（在默认间距基础上）的偏移量|-
pageControlDotSize|分页控件小圆标大小|CGSize|-
currentPageDotColor|当前分页控件小圆标颜色|UIColor|-
pageDotColor|其他分页控件小圆标颜色|UIColor|-
currentPageDotImage|当前分页控件小圆标图片|UIImage|-
pageDotImage|其他分页控件小圆标图片|UIImage|-
titleLabelTextColor|轮播文字label字体颜色|UIColor|-
titleLabelTextFont|轮播文字label字体大小|UIColor|-
titleLabelBackgroundColor|轮播文字label背景颜色|UIColor|-
titleLabelHeight|轮播文字label高度|CGFloat|-
titleLabelTextAlignment|轮播文字label对齐方式|NSTextAlignment|NSTextAlignmentLeft

## 方法

* 代理方法

```objc
/**
 点击图片回调

 @param bannerView bannerView
 @param index index
 */
- (void)wya_bannerView:(WYABannerView *)bannerView didSelectItemAtIndex:(NSInteger)index;

/**
 图片滚动回调

 @param bannerView bannerView
 @param index 偏移量
 */
- (void)wya_bannerView:(WYABannerView *)bannerView didScrollToIndex:(NSInteger)index;



#pragma mark - 自定义内容容器样式  -

/**
 class

 @param view bannerView
 @return class
 */
- (Class)wya_customCollectionViewCellClassForBannerView:(WYABannerView *)view;

/**
 nib

 @param view bannerView
 @return nib
 */
- (UINib *)wya_customCollectionViewCellNibForBannerView:(WYABannerView *)view;


/**
 如果你自定义了cell样式，请在实现此代理方法为你的cell填充数据以及其它一系列设置

 @param cell cell
 @param index index
 @param view bannerView
 */
- (void)wya_setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index bannerView:(WYABannerView *)view;
```

* 类方法

```Object-C
/**
 初始化

 @param frame 位置
 @param delegate delegate
 @param placeholderImage 占位图
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame delegate:(id<WYABannerViewwDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

/**
 初始化

 @param frame 位置
 @param imageURLStringsGroup 图片资源数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame imageURLStringsGroup:(NSArray *)imageURLStringsGroup;

/**
 初始化

 @param frame 位置
 @param imageNamesGroup 本地图片数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray *)imageNamesGroup;

/**
 初始化

 @param frame 位置
 @param infiniteLoop 是否无限循环
 @param imageNamesGroup 本地图片数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesGroup:(NSArray *)imageNamesGroup;

/**
 清除图片缓存
 */
+ (void)clearImagesCache;
```

* 实例方法

```objc
/**
 可以调用此方法手动控制滚动到哪一个index

 @param index index
 */
- (void)makeScrollViewScrollToIndex:(NSInteger)index;


/**
 解决viewWillAppear时出现时轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法
 */
- (void)adjustWhenControllerViewWillAppera;

/**
  滚动手势禁用（文字轮播较实用）
 */
- (void)disableScrollGesture;
```

## 基础用法

导入头文件

```objc
#import <WYAKit/WYABannerView.h>
```

```objc
CGFloat bannerView_X = 0;
CGFloat bannerView_Y = CGRectGetMaxY(label.frame);
CGFloat bannerView_Width = ScreenWidth;
CGFloat bannerView_Height = 200*SizeAdapter;
CGRect rectB = CGRectMake(bannerView_X, bannerView_Y, bannerView_Width, bannerView_Height);
    
WYABannerView *banner1 = [WYABannerView wya_bannerViewWithFrame:rectB delegate:nil placeholderImage:nil];
banner1.localizationImageNamesGroup = @[@"0",@"1",@"2"];
banner1.pageControlAliment = WYABannerViewPageContolAlimentCenter;
banner1.pageControlStyle = WYABannerViewPageContolStyleClassic;
[self.view addSubview:banner1];
```


