//
//  WYAImageCropPhotoFramesView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageCropPhotoFramesView : UIView

/** Hides the interior grid lines, sans animation. */
@property (nonatomic, assign) BOOL gridHidden;

/** Add/Remove the interior horizontal grid lines. */
@property (nonatomic, assign) BOOL displayHorizontalGridLines;

/** Add/Remove the interior vertical grid lines. */
@property (nonatomic, assign) BOOL displayVerticalGridLines;

/** Shows and hides the interior grid lines with an optional crossfade animation. */
- (void)setGridHidden:(BOOL)hidden animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
