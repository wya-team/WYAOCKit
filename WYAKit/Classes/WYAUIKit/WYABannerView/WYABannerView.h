//
//  WYABannerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYABannerView : UIView
//需要判断添加本地图片和网络图片
@property (nonatomic, strong) NSMutableArray * urls;
@property (nonatomic, strong) NSMutableArray * images;
@end

NS_ASSUME_NONNULL_END
