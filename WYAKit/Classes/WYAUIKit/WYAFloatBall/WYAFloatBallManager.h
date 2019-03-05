//
//  WYAFloatBallManager.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "WYAFloatBall.h"
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYAFloatBallManager : NSObject
@property (nonatomic, strong) WYAFloatBall * floatBall;
@property (nonatomic, strong) UIViewController * floatViewController;

/**
 获取单例实例

 @return 返回一个WYAFloatBallManager实例
 */
+ (instancetype)shared;

/**
 添加需要实现fliatBall的控制器
 注意：在导航控制器实例化之后调用
 @param vcClass 控制器的name
 */
+ (void)wya_addFloatVcS:(NSArray<NSString *> *)vcClass;

/**
 展示浮窗

 @param fromVC 需要返回展示浮窗的VC
 */
- (void)wya_showBallBtnWith:(UIViewController *)fromVC;

/**
 移除浮窗
 */
- (void)wya_removeBallBtn;

@end

NS_ASSUME_NONNULL_END
