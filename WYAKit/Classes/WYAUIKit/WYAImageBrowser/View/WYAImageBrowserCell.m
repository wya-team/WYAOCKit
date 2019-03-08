//
//  ImageBrowserCell.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/26.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAImageBrowserCell.h"

@interface WYAImageBrowserCell ()

@end

@implementation WYAImageBrowserCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.preview = [[WYAPreview alloc] init];
        WeakSelf(weakSelf);
        self.preview.singleTapCallback = ^{
            weakSelf.singleTapCallback();
        };
        [self addSubview:self.preview];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.preview.frame = self.bounds;
}

#pragma mark - Public Method -
- (void)setScrollZoom {
    [self.preview setScrollZoom];
}

#pragma mark--- Setter
- (void)setImage:(UIImage *)image {
    if (image) { self.preview.imageView.image = image; }
}

@end

@implementation WYAVideoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
}

#pragma mark - Private Method -
- (void)playEnd:(NSNotification *)n {
    //    AVPlayerItem * p = [n object];
    //    [p seekToTime:kCMTimeZero];
}

#pragma mark - Setter -
- (void)setUrl:(NSURL *)url {
    if (url) {
        self.playerItem               = [AVPlayerItem playerItemWithURL:url];
        self.player                   = [AVPlayer playerWithPlayerItem:self.playerItem];
        self.playerLayer              = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.playerLayer.frame        = self.bounds;
        [self.contentView.layer addSublayer:self.playerLayer];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:self.playerItem];
        [self.playerItem addObserver:self
                          forKeyPath:@"status"
                             options:NSKeyValueObservingOptionNew
                             context:nil];
        [self.playerItem addObserver:self
                          forKeyPath:@"loadedTimeRanges"
                             options:NSKeyValueObservingOptionNew
                             context:nil];
        [self.playerItem addObserver:self
                          forKeyPath:@"playbackBufferEmpty"
                             options:NSKeyValueObservingOptionNew
                             context:nil];
        [self.playerItem addObserver:self
                          forKeyPath:@"playbackLikelyToKeepUp"
                             options:NSKeyValueObservingOptionNew
                             context:nil];
    }
}

- (void)dealloc {
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [self.playerItem removeObserver:self forKeyPath:@"playbackBufferEmpty"];
    [self.playerItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:self.playerItem];
}

@end

@interface WYAPreview () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView * imageContainerView;
//@property(nonatomic, assign) CGFloat zoomScale;
@end

@implementation WYAPreview

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollV                                = [[UIScrollView alloc] init];
        self.scrollV.bouncesZoom                    = YES;
        self.scrollV.maximumZoomScale               = 2.0;
        self.scrollV.minimumZoomScale               = 1.0;
        self.scrollV.multipleTouchEnabled           = YES;
        self.scrollV.delegate                       = self;
        self.scrollV.scrollsToTop                   = NO;
        self.scrollV.showsHorizontalScrollIndicator = NO;
        self.scrollV.showsVerticalScrollIndicator   = YES;
        self.scrollV.autoresizingMask =
            UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollV.delaysContentTouches    = NO;
        self.scrollV.canCancelContentTouches = YES;
        self.scrollV.alwaysBounceVertical    = NO;
        if (@available(iOS 11, *)) {
            self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:self.scrollV];

        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleClick)];
        tap1.numberOfTapsRequired     = 1;
        [self.scrollV addGestureRecognizer:tap1];
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        tap2.numberOfTapsRequired     = 2;
        [self.scrollV addGestureRecognizer:tap2];

        [tap1 requireGestureRecognizerToFail:tap2];

        self.imageContainerView               = [[UIView alloc] init];
        self.imageContainerView.clipsToBounds = YES;
        self.imageContainerView.contentMode   = UIViewContentModeScaleAspectFit;
        [self.scrollV addSubview:self.imageContainerView];

        self.imageView                        = [[UIImageView alloc] init];
        self.imageView.contentMode            = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = YES;
        [self.imageContainerView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollV.frame = CGRectMake(0, 0, self.cmam_width, self.cmam_height);

    //    self.imageView.frame = CGRectMake(0, 0, self.scrollV.frame.size.width,
    //    self.scrollV.frame.size.height);
    //    self.scrollV.contentSize = CGSizeMake(self.imageView.cmam_width,
    //    self.imageView.cmam_height);
    [self setScrollZoom];
}

#pragma mark - Private Method -
- (void)setScrollZoom {
    [self.scrollV setZoomScale:1 animated:NO];
    [self setSubViewFrame];
}

- (void)setSubViewFrame {
    self.imageContainerView.cmam_origin = CGPointZero;
    self.imageContainerView.cmam_width  = self.scrollV.cmam_width;
    UIImage * image                     = self.imageView.image;
    if (image.size.height / image.size.width > self.cmam_height / self.scrollV.cmam_width) {
        self.imageContainerView.cmam_height =
            floor(image.size.height / (image.size.width / self.scrollV.cmam_width));
    } else {
        CGFloat height = image.size.height / image.size.width * self.scrollV.cmam_width;
        if (height < 1 || isnan(height)) { height = self.cmam_height; }
        height                               = floor(height);
        self.imageContainerView.cmam_height  = height;
        self.imageContainerView.cmam_centerY = self.cmam_height / 2;
    }

    if (self.imageContainerView.cmam_height > self.cmam_height &&
        self.imageContainerView.cmam_height - self.cmam_height <= 1) {
        self.imageContainerView.cmam_height = self.cmam_height;
    }

    CGFloat contentSizeH     = MAX(self.imageContainerView.cmam_height, self.cmam_height);
    self.scrollV.contentSize = CGSizeMake(self.scrollV.cmam_width, contentSizeH);
    [self.scrollV scrollRectToVisible:self.bounds animated:NO];
    self.scrollV.alwaysBounceVertical =
        self.imageContainerView.cmam_height <= self.cmam_height ? NO : YES;
    self.imageView.frame = self.imageContainerView.bounds;
}

- (void)refreshImageContainerViewCenter {
    CGFloat offsetX = (self.scrollV.cmam_width > self.scrollV.contentSize.width)
                          ? ((self.scrollV.cmam_width - self.scrollV.contentSize.width) * 0.5)
                          : 0.0;
    CGFloat offsetY = (self.scrollV.cmam_height > self.scrollV.contentSize.height)
                          ? ((self.scrollV.cmam_height - self.scrollV.contentSize.height) * 0.5)
                          : 0.0;
    self.imageContainerView.center = CGPointMake(self.scrollV.contentSize.width * 0.5 + offsetX,
                                                 self.scrollV.contentSize.height * 0.5 + offsetY);
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width  = self.frame.size.width / scale;
    zoomRect.origin.x    = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

- (void)singleClick {
    if (self.singleTapCallback) {
        self.singleTapCallback();
    }
}

- (void)doubleClick:(UITapGestureRecognizer *)gesture {
    CGFloat zoomScale = self.scrollV.zoomScale;
    zoomScale         = (zoomScale == 1.0) ? 2.0 : 1.0;
    CGRect zoomRect   = [self zoomRectForScale:zoomScale withCenter:[gesture locationInView:gesture.view]];
    [self.scrollV zoomToRect:zoomRect animated:YES];
}

#pragma mark - UIScrollViewDelegate -
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageContainerView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self refreshImageContainerViewCenter];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                       withView:(UIView *)view
                        atScale:(CGFloat)scale {
    //    [scrollView setZoomScale:scale animated:NO];
}

@end
