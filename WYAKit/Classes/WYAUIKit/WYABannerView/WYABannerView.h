//
//  WYABannerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WYABannerSourceStyle) {
    WYABannerSourceStyleLocal,
    WYABannerSourceStyleNet,
};

@interface WYABannerView : UIView

/**
 资源图片名
 */
@property (nonatomic, strong) NSMutableArray<NSString *> * images;

@property (nonatomic, assign) UIViewContentMode  imageContentModel;

/**
 本地图片不需要设置该属性，网络图片可自由选择
 */
@property (nonatomic, strong) UIImage * placeholdImage;
//图片点击事件
@property (nonatomic, copy) void (^touchImageHandle) (NSInteger curIndex) ;

/**
 初始化使用这种方式，指定加载资源类型，同时数据源要给准确的类型，本地类型请传入要加载本地图片的名字，网络类型请传入url

 @param frame frame
 @param sourceStyle 资源类型
 @param time 时间间隔（默认2s）
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame bannerSourceStyle:(WYABannerSourceStyle)sourceStyle timeInterval:(CGFloat)time;
@end

NS_ASSUME_NONNULL_END
