//
//  NSNotificationCenter+WYANotificationCenter.h
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (WYANotificationCenter)

- (void)wya_addObserverWithName:(NSString *)name object:(_Nullable id)object selector:(void(^)(NSNotification *))sel;
@end

NS_ASSUME_NONNULL_END
