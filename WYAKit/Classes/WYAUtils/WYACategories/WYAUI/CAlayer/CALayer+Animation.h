//
//  CALayer+Animation.h
//  WYAKit
//
//  Created by 李世航 on 2019/11/26.
//

#import <Foundation/Foundation.h>


#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Animation)

/// 暂停动画
- (void)pause;

/// 恢复动画
- (void)resume;
@end

NS_ASSUME_NONNULL_END
