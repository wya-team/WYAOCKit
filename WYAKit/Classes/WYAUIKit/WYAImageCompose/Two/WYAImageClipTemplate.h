//
//  WYAImageClipTemplate.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageClipTemplate : UIView

@property (nonatomic, readonly) NSArray * templatePoints;

@property (nonatomic, assign) CGMutablePathRef pathRef;

@property (nonatomic, copy) void (^panClick)(CGPoint point, WYAImageClipTemplate * view, BOOL panIsChange);

@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) BOOL haveAnimationShapeLayer;
@property (nonatomic, assign) BOOL resetImageFrame;
/**
 生产模板

 @param points 坐标点
 @param isTemplatePath 是否只生成模板路径 // default is NO
 */
- (void)addCoverLayerWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath;

/**
 添加虚线动画
 */
- (void)wya_templateAddAnimationPath;

/**
 移除虚线动画
 */
- (void)wya_templateRemoveAnimationPath;
@end

NS_ASSUME_NONNULL_END
