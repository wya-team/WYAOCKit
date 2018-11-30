//
//  ImageBrowserCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/26.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAImageBrowserCell.h"

@interface WYAImageBrowserCell ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScrollView * scrollV;

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation WYAImageBrowserCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.userInteractionEnabled = YES;
        
        self.scrollV = [[UIScrollView alloc]init];
        self.scrollV.delegate = self;
        self.scrollV.userInteractionEnabled = YES;
        self.scrollV.bounces = NO;
        [self.contentView addSubview:self.scrollV];
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = YES;
        [self.scrollV addSubview:self.imageView];
        
//        UIPinchGestureRecognizer *doubleTapGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
//        doubleTapGesture.delegate = self;
//        [_scrollV addGestureRecognizer:doubleTapGesture];
        
        [self.scrollV setMinimumZoomScale:1.0f];
    
        [self.scrollV setMaximumZoomScale:3.0f];
    
        [self.scrollV setZoomScale:1 animated:NO];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"self.frame==%@",NSStringFromCGRect(self.contentView.frame));
    self.scrollV.frame = self.contentView.frame;
    [self.scrollV setZoomScale:1 animated:NO];
    self.imageView.frame = CGRectMake(0, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height);
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

//支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

//- (void)handleDoubleTap:(UIGestureRecognizer *)gesture
//
//{
//
//    NSLog(@"handleDoubleTap");
//
//    float newScale = self.scrollV.zoomScale * 1.5;//zoomScale这个值决定了contents当前扩展的比例
//    if (newScale>3) {
//        newScale = 1.0f;
//    }
//    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];
//
//    [self.scrollV zoomToRect:zoomRect animated:YES];
//
//}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center

{
    
    CGRect zoomRect;
    
    zoomRect.size.height = self.scrollV.frame.size.height / scale;
    
    NSLog(@"zoomRect.size.height is %f",zoomRect.size.height);
    
    NSLog(@"self.frame.size.height is %f",self.scrollV.frame.size.height);
    
    zoomRect.size.width  = self.scrollV.frame.size.width  / scale;
    
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{
    
    return self.imageView;
    
}

//当滑动结束时

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale

{
    
    //把当前的缩放比例设进ZoomScale，以便下次缩放时实在现有的比例的基础上
    
    NSLog(@"scale is %f",scale);
    
    [self.scrollV setZoomScale:scale animated:NO];
    
}

- (void)setImage:(UIImage *)image{
    _image = image;
    if (image) {
        self.imageView.image = image;
    }
}

//-(void)dealloc{
//    _scrollV.delegate = nil;
//}

@end
