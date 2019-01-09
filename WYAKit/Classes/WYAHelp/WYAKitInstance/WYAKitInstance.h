//
//  WYAKitConfig.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/15.
//

#import <Foundation/Foundation.h>
@class WYABannerConfig;
NS_ASSUME_NONNULL_BEGIN

@interface WYAKitInstance : NSObject
@property (nonatomic, strong) WYABannerConfig * bannerConfig;
+ (instancetype)sharedInstance;

@end

@interface WYABannerConfig : NSObject
// 默认自动滚动
@property (nonatomic, assign) BOOL autoScroll;
@end

NS_ASSUME_NONNULL_END
