//
//  WYAVideoNetWorkView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/21.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAVideoNetWorkView : UIView
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * button;

@property (nonatomic, copy) void (^retryHandle)(void);
@property (nonatomic, copy) void (^goOnHandle)(void);
- (void)netWorkStatus:(void (^)(AFNetworkReachabilityStatus status))handle; //只能被动监测网络状态
@end

NS_ASSUME_NONNULL_END
