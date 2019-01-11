//
//  UITextField+WYATextFieldBlock.h
//  WYAKit_Example
//
//  Created by 李世航 on 2019/1/3.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WYATextFieldBlock)
- (void)wya_addTextChangeWithEvent:(UIControlEvents)event
                        textHandle:(void (^)(UITextField * text))textHandle;
@end

NS_ASSUME_NONNULL_END
