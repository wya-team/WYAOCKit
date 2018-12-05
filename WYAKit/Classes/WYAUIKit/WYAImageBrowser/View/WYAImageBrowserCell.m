//
//  ImageBrowserCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/26.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAImageBrowserCell.h"

@interface WYAImageBrowserCell ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

//@property (nonatomic, strong) UIView * imageContainerView;

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation WYAImageBrowserCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.scrollV = [[UIScrollView alloc]init];
        self.scrollV.bouncesZoom = YES;
        self.scrollV.maximumZoomScale = 2.5;
        self.scrollV.minimumZoomScale = 1.0;
        self.scrollV.multipleTouchEnabled = YES;
        self.scrollV.delegate = self;
        self.scrollV.scrollsToTop = NO;
        self.scrollV.showsHorizontalScrollIndicator = NO;
        self.scrollV.showsVerticalScrollIndicator = YES;
        self.scrollV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollV.delaysContentTouches = NO;
        self.scrollV.canCancelContentTouches = YES;
        self.scrollV.alwaysBounceVertical = NO;
        if (@available(iOS 11, *)) {
            self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.contentView addSubview:self.scrollV];
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = YES;
        [self.scrollV addSubview:self.imageView];
    
        [self.scrollV setZoomScale:1 animated:NO];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollV.frame = CGRectMake(10, 0, self.contentView.cmam_width-20, self.contentView.cmam_height);
    [self.scrollV setZoomScale:1 animated:NO];
    self.imageView.center = self.scrollV.center;
    self.imageView.bounds = CGRectMake(0, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height);
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    [scrollView setZoomScale:scale animated:NO];
}

- (void)setImage:(UIImage *)image{
    _image = image;
    if (image) {
        self.imageView.image = image;
    }
}

@end
