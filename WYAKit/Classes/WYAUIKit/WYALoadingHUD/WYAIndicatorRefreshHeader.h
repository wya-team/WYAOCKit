//
//  WYARefreshHeader.h
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/30.
//

#import <MJRefresh/MJRefresh.h>
#import "WYALoadingHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYAIndicatorRefreshHeader : MJRefreshHeader
@property (assign, nonatomic) WYALoadingGraphAnimateStyle animateStyle;
+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action animateStyle:(WYALoadingGraphAnimateStyle)animateStyle;
@end

NS_ASSUME_NONNULL_END
