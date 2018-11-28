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

@property (nonatomic, strong) NSMutableArray<NSString *> * images;

/// click action
@property (nonatomic, copy) void (^clickAction) (NSInteger curIndex) ;

/**
 初始化使用这种方式，指定加载资源类型，同时数据源要给准确的类型，本地类型请传入要加载本地图片的名字，网络类型请传入url

 @param frame frame
 @param sourceStyle 资源类型
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame BannerSourceStyle:(WYABannerSourceStyle)sourceStyle;
@end

NS_ASSUME_NONNULL_END
