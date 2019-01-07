//
//  WYABannerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    WYABannerViewPageContolAlimentRight,
    WYABannerViewPageContolAlimentCenter
} WYABannerViewViewPageContolAliment;

typedef enum {
    WYABannerViewPageContolStyleClassic,  // 系统自带经典样式
    WYABannerViewPageContolStyleAnimated, // 动画效果pagecontrol
    WYABannerViewPageContolStyleNone      // 不显示pagecontrol
} WYABannerViewPageContolStyle;

typedef NS_ENUM(NSUInteger, WYABannerViewCellStyle) {
    WYABannerViewCellStyleDefault,
    WYABannerViewCellStyleCoverFlow,
};

@class WYABannerView;

@protocol WYABannerViewwDelegate <NSObject>

@optional

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

@end

@interface WYABannerView : UIView

/**
 初始化

 @param frame 位置
 @param delegate delegate
 @param placeholderImage 占位图
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame bannerCellStyle:(WYABannerViewCellStyle)cellStyle delegate:(id<WYABannerViewwDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

/**
 初始化

 @param frame 位置
 @param imageURLStringsGroup 图片资源数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame bannerCellStyle:(WYABannerViewCellStyle)cellStyle imageURLStringsGroup:(NSArray *)imageURLStringsGroup;

/**
 初始化

 @param frame 位置
 @param imageNamesGroup 本地图片数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame bannerCellStyle:(WYABannerViewCellStyle)cellStyle imageNamesGroup:(NSArray *)imageNamesGroup;

/**
 初始化

 @param frame 位置
 @param infiniteLoop 是否无限循环
 @param imageNamesGroup 本地图片数组
 @return self
 */
+ (instancetype)wya_bannerViewWithFrame:(CGRect)frame bannerCellStyle:(WYABannerViewCellStyle)cellStyle shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesGroup:(NSArray *)imageNamesGroup;

/**
 网络图片 url string 数组
 */
@property (nonatomic, strong) NSArray * imageURLStringsGroup;

/**
 每张图片对应要显示的文字数组
 */
@property (nonatomic, strong) NSArray * titlesGroup;

/**
 本地图片数组
 */
@property (nonatomic, strong) NSArray * localizationImageNamesGroup;

/** 自动滚动间隔时间,默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 是否无限循环,默认Yes */
@property (nonatomic, assign) BOOL infiniteLoop;

/** 是否自动滚动,默认Yes */
@property (nonatomic, assign) BOOL autoScroll;

/** 图片滚动方向，默认为水平滚动 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic, weak) id<WYABannerViewwDelegate> delegate;

/** block方式监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);

/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);

/**
 可以调用此方法手动控制滚动到哪一个index

 @param index index
 */
- (void)makeScrollViewScrollToIndex:(NSInteger)index;

/**
 解决viewWillAppear时出现时轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法
 */
- (void)adjustWhenControllerViewWillAppera;

//////////////////////  自定义样式API  //////////////////////

/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;

/** 占位图，用于网络未加载到图片时 */
@property (nonatomic, strong) UIImage * placeholderImage;

/** 是否显示分页控件 */
@property (nonatomic, assign) BOOL showPageControl;

/** 是否在只有一张图时隐藏pagecontrol，默认为YES */
@property (nonatomic) BOOL hidesForSinglePage;

/** 只展示文字轮播 */
@property (nonatomic, assign) BOOL onlyDisplayText;

/** pagecontrol 样式，默认为动画样式 */
@property (nonatomic, assign) WYABannerViewPageContolStyle pageControlStyle;

/** 分页控件位置 */
@property (nonatomic, assign) WYABannerViewViewPageContolAliment pageControlAliment;

/** 分页控件距离轮播图的底部间距（在默认间距基础上）的偏移量 */
@property (nonatomic, assign) CGFloat pageControlBottomOffset;

/** 分页控件距离轮播图的右边间距（在默认间距基础上）的偏移量 */
@property (nonatomic, assign) CGFloat pageControlRightOffset;

/** 分页控件小圆标大小 */
@property (nonatomic, assign) CGSize pageControlDotSize;

/** 当前分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor * currentPageDotColor;

/** 其他分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor * pageDotColor;

/** 当前分页控件小圆标图片 */
@property (nonatomic, strong) UIImage * currentPageDotImage;

/** 其他分页控件小圆标图片 */
@property (nonatomic, strong) UIImage * pageDotImage;

/** 轮播文字label字体颜色 */
@property (nonatomic, strong) UIColor * titleLabelTextColor;

/** 轮播文字label字体大小 */
@property (nonatomic, strong) UIFont * titleLabelTextFont;

/** 轮播文字label背景颜色 */
@property (nonatomic, strong) UIColor * titleLabelBackgroundColor;

/** 轮播文字label高度 */
@property (nonatomic, assign) CGFloat titleLabelHeight;

/** 轮播文字label对齐方式 */
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;

/**
  滚动手势禁用（文字轮播较实用）
 */
- (void)disableScrollGesture;

/**
 清除图片缓存
 */
+ (void)clearImagesCache;

@end

NS_ASSUME_NONNULL_END
