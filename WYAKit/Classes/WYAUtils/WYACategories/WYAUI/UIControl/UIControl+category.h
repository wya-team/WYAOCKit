//
//  UIControl+category.h
//  AFNetworking
//
//  Created by 李雪峰 on 2019/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (category)
@property (nonatomic, assign) double debounceTime; // 防抖保护时长，单位s
@property (nonatomic, assign) double endTime;      // 上次事件触发保护期至
@end

NS_ASSUME_NONNULL_END
