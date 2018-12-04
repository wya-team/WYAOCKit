//
//  WYAProgressView.h
//  Masonry
//
//  Created by 李俊恒 on 2018/11/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPageProgressView : UIView
@property (nonatomic, strong) NSArray * itemFrames;
@property (nonatomic, assign) CGColorRef  color;
@property (nonatomic, assign) CGFloat  progress;
/**
 进度条速度引述，默认15，越小越快，不得小于等于0
 */
@property (nonatomic, assign) CGFloat  speedFactor;
@property (nonatomic, assign) CGFloat  cornerRadius;

// 调皮属性，用于实现新腾讯视频效果
@property (nonatomic, assign) BOOL naughty;
@property (nonatomic, assign) BOOL isTriangle;
@property (nonatomic, assign) BOOL hollow;
@property (nonatomic, assign) BOOL hasBorder;

- (void)wya_setProgressWithOutAnimate:(CGFloat)progress;

- (void)wya_moveToPostion:(NSInteger)pos;
@end

NS_ASSUME_NONNULL_END
