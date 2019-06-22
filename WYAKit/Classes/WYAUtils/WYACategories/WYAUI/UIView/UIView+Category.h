//
//  UIView+Category.h
//  WYAKit
//
//  Created by 李世航 on 2019/6/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)
@property (nonatomic, copy) UIView *(^setupFrame)(CGRect frame);
@property (nonatomic, copy) UIView *(^setupCenter)(CGPoint point);
@property (nonatomic, copy) UIView *(^setupBounds)(CGRect bounds);
@property (nonatomic, copy) UIView *(^setupTag)(NSInteger tag);
- (void)wya_addSubViews:(NSArray *)views;
@end

NS_ASSUME_NONNULL_END
