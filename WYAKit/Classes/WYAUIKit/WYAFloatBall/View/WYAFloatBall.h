//
//  WYAFloatBall.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAFloatBall;
@protocol WYAFloatBallDelegate <NSObject>
@optional
- (void)floatBallDidClick:(WYAFloatBall *)floatBall;
- (void)floatBallBeginMove:(WYAFloatBall *)floatBall;
- (void)floatBallEndMove:(WYAFloatBall *)floatBall;
@end

@interface WYAFloatBall : UIView
@property (nonatomic, weak) id<WYAFloatBallDelegate> delegate;
@property (nonatomic, strong) UIImageView * iconImageView;
@end

NS_ASSUME_NONNULL_END
