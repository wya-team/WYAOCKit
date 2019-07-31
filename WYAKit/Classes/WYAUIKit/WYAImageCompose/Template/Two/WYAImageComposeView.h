//
//  WYAImageComposeView.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageComposeView : UIImageView
@property (nonatomic, assign) BOOL needPan;
@property (nonatomic, copy) void (^panClick)(CGPoint point, WYAImageComposeView * view);

@end

NS_ASSUME_NONNULL_END
