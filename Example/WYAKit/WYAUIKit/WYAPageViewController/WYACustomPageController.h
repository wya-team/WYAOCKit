//
//  WYACustomPageController.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/21.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPageController.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, WYAMenuViewPosition) {
    WYAMenuViewPositionDefault,
    WYAMenuViewPositionBottom,
};
@interface WYACustomPageController : WYAPageController
@property (nonatomic, assign) WYAMenuViewPosition  menuViewPosition;
@end

NS_ASSUME_NONNULL_END
