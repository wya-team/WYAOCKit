//
//  NSObject+WYANetWorkState.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WYANetWorkStatus) {
    WYANetWorkStatusNoReach,
    WYANetWorkStatusWWAN,
    WYANetWorkStatusWIFI,
};

@interface NSObject (WYANetWorkState)

-(void)wya_getNetWorkStatus:(void(^)(WYANetWorkStatus status))handle;

@end

NS_ASSUME_NONNULL_END
