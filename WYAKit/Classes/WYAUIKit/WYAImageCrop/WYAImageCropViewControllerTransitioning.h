//
//  WYAImageCropViewControllerTransitioning.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageCropViewControllerTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImage * image;

@property (nonatomic, assign) BOOL  dismiss;

@property (nonatomic, strong) UIView * fromView;
@property (nonatomic, strong) UIView * toView;

@property (nonatomic, assign) CGRect  fromFrame;
@property (nonatomic, assign) CGRect  toFrame;

@end

NS_ASSUME_NONNULL_END
