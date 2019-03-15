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

/**
 生产模板

 @param points 坐标点
 @param isTemplatePath 是否只生成模板路径 // default is NO
 */
- (void)addCoverLayerWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath;

- (void)wya_templateAnimationWithView:(UIView *)view point:(CGPoint)point;
@end

NS_ASSUME_NONNULL_END
