//
//  WYAPhotoPreviewCell.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoBrowserModel.h"
#import <Photos/Photos.h>

@implementation WYAPhotoPreviewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.preview = [[WYAPhotoPreview alloc] init];
        [self addSubview:self.preview];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.preview.frame = self.bounds;
}

#pragma mark - Public Method -
- (void)setScrollZoom
{
    [self.preview setScrollZoom];
}

#pragma mark--- Setter
- (void)setModel:(WYAPhotoBrowserModel *)model
{
    _model = model;
    if (model) {
        if (model.cropImage) {
            self.preview.imageView.image = model.cropImage;
        } else {
            if (model.cacheImage) {
                self.preview.imageView.image = model.cacheImage;
            } else {
                PHImageManager * manager    = [PHImageManager defaultManager];
                PHImageRequestOptions * opi = [[PHImageRequestOptions alloc] init];

                [manager requestImageForAsset:model.asset targetSize:CGSizeMake(self.cmam_width, self.cmam_height) contentMode:PHImageContentModeAspectFill options:opi resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                    self.preview.imageView.image = result;
                    model.cacheImage             = result;
                    [self.preview setScrollZoom];
                }];
            }
        }
    }
}
@end

@interface WYAVideoPreviewCell ()
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerLayer * playerlayer;
@property (nonatomic, strong) AVPlayerItem * playerItem;
@property (nonatomic, strong) UIImageView * playImageView;
@property (nonatomic, strong) UIButton * playButton;
@end

@implementation WYAVideoPreviewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.playImageView];
        [self.contentView addSubview:self.playButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.playImageView.frame = self.contentView.frame;

    self.playButton.center    = self.contentView.center;
    CGFloat playButton_Width  = 50 * SizeAdapter;
    CGFloat playButton_Height = 50 * SizeAdapter;
    self.playButton.bounds    = CGRectMake(0, 0, playButton_Width, playButton_Height);
}

- (void)buttonClick
{
    self.playButton.selected = !self.playButton.selected;
    if (self.playButton.selected) {
        [self.player play];
    } else {
        [self.player pause];
    }
}

- (void)playEnd:(NSNotification *)n
{
    AVPlayerItem * p = [n object];
    //关键代码
    [p seekToTime:kCMTimeZero];

    [self.player play];
    self.playButton.selected = YES;
}

#pragma mark - KVO -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    AVPlayerItem * playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            //            self.playImageView.hidden = YES;
        } else {
            NSLog(@"AVPlayerStatusFailed");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        // 计算缓冲进度
        NSLog(@"缓冲中");
    } else if ([keyPath isEqualToString:@"playbackBufferEmpty"]) {
        // 当缓冲是空的时候

    } else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]) {
        // 当缓冲好的时候
    }
}

#pragma mark - Setter -
- (void)setModel:(WYAPhotoBrowserModel *)model
{
    if (model) {
        PHAsset * asset          = model.asset;
        PHImageManager * manager = [PHImageManager defaultManager];
        if (model.cacheImage) {
            self.playImageView.image = model.cacheImage;
        } else {
            [manager requestImageForAsset:asset targetSize:CGSizeMake(self.cmam_width, self.cmam_height) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                self.playImageView.image = result;
                model.cacheImage         = result;
            }];
        }
        if (asset.mediaType == PHAssetMediaTypeVideo) {
            PHVideoRequestOptions * option = [[PHVideoRequestOptions alloc] init];
            option.version                 = PHVideoRequestOptionsVersionOriginal;
            option.progressHandler         = ^(double progress, NSError * _Nullable error, BOOL * _Nonnull stop, NSDictionary * _Nullable info) {
                NSLog(@"progress==%f", progress);
                NSLog(@"error==%@", [error localizedDescription]);
            };
            [manager requestPlayerItemForVideo:asset options:option resultHandler:^(AVPlayerItem * _Nullable playerItem, NSDictionary * _Nullable info) {
                self.playerItem = playerItem;
            }];
        }
    }
}

- (void)setPlayerItem:(AVPlayerItem *)playerItem
{
    _playerItem = playerItem;
    if (playerItem) {
        self.player                   = [AVPlayer playerWithPlayerItem:playerItem];
        self.playerlayer              = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerlayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.playerlayer.frame        = self.bounds;
        [self.contentView.layer insertSublayer:self.playerlayer below:self.playButton.layer];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
        [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];           // 监听status属性
        [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil]; // 监听loadedTimeRanges属性
        // 缓冲区空了，需要等待数据
        [playerItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:nil];
        // 缓冲区有足够数据可以播放了
        [playerItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:nil];
    }
}

#pragma mark - Getter -
- (UIImageView *)playImageView
{
    if (!_playImageView) {
        _playImageView = ({
            UIImageView * object = [[UIImageView alloc] init];
            object;
        });
    }
    return _playImageView;
}
- (UIButton *)playButton
{
    if (!_playButton) {
        _playButton = ({
            UIButton * object = [[UIButton alloc] init];
            [object setImage:[UIImage loadBundleImage:@"icon_begin" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
            [object setImage:[UIImage loadBundleImage:@"icon_pause" ClassName:NSStringFromClass(self.class)] forState:UIControlStateSelected];
            [object addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _playButton;
}

- (void)dealloc
{
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [self.playerItem removeObserver:self forKeyPath:@"playbackBufferEmpty"];
    [self.playerItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerItem];
}

@end

@interface WYAPhotoPreview () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView * imageContainerView;
@end

@implementation WYAPhotoPreview

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollV                                = [[UIScrollView alloc] init];
        self.scrollV.bouncesZoom                    = YES;
        self.scrollV.maximumZoomScale               = 3.0;
        self.scrollV.minimumZoomScale               = 1.0;
        self.scrollV.multipleTouchEnabled           = YES;
        self.scrollV.delegate                       = self;
        self.scrollV.scrollsToTop                   = NO;
        self.scrollV.showsHorizontalScrollIndicator = NO;
        self.scrollV.showsVerticalScrollIndicator   = YES;
        self.scrollV.autoresizingMask               = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollV.delaysContentTouches           = NO;
        self.scrollV.canCancelContentTouches        = YES;
        self.scrollV.alwaysBounceVertical           = NO;
        if (@available(iOS 11, *)) {
            self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:self.scrollV];

        self.imageContainerView               = [[UIView alloc] init];
        self.imageContainerView.clipsToBounds = YES;
        self.imageContainerView.contentMode   = UIViewContentModeScaleAspectFill;
        [self.scrollV addSubview:self.imageContainerView];

        self.imageView                        = [[UIImageView alloc] init];
        self.imageView.contentMode            = UIViewContentModeScaleAspectFill;
        self.imageView.userInteractionEnabled = YES;
        [self.imageContainerView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGFloat scrollV_X      = 0;
    CGFloat scrollV_Y      = 0;
    CGFloat scrollV_Width  = self.cmam_width - 0;
    CGFloat scrollV_Height = self.cmam_height;
    self.scrollV.frame     = CGRectMake(scrollV_X, scrollV_Y, scrollV_Width, scrollV_Height);

    [self setScrollZoom];
}

#pragma mark - Private Method -
- (void)setScrollZoom
{
    [self.scrollV setZoomScale:1 animated:NO];
    [self setSubViewFrame];
}

- (void)setSubViewFrame
{
    self.imageContainerView.cmam_origin = CGPointZero;
    self.imageContainerView.cmam_width  = self.scrollV.cmam_width;
    UIImage * image                     = self.imageView.image;
    if (image.size.height / image.size.width > self.cmam_height / self.scrollV.cmam_width) {
        self.imageContainerView.cmam_height = floor(image.size.height / (image.size.width / self.scrollV.cmam_width));
    } else {
        CGFloat height = image.size.height / image.size.width * self.scrollV.cmam_width;
        if (height < 1 || isnan(height)) {
            height = self.cmam_height;
        }
        height                               = floor(height);
        self.imageContainerView.cmam_height  = height;
        self.imageContainerView.cmam_centerY = self.cmam_height / 2;
    }

    if (self.imageContainerView.cmam_height > self.cmam_height && self.imageContainerView.cmam_height - self.cmam_height <= 1) {
        self.imageContainerView.cmam_height = self.cmam_height;
    }

    CGFloat contentSizeH     = MAX(self.imageContainerView.cmam_height, self.cmam_height);
    self.scrollV.contentSize = CGSizeMake(self.scrollV.cmam_width, contentSizeH);
    [self.scrollV scrollRectToVisible:self.bounds animated:NO];
    self.scrollV.alwaysBounceVertical = self.imageContainerView.cmam_height <= self.cmam_height ? NO : YES;
    self.imageView.frame              = self.imageContainerView.bounds;
}

- (void)refreshImageContainerViewCenter
{
    CGFloat offsetX                = (self.scrollV.cmam_width > self.scrollV.contentSize.width) ? ((self.scrollV.cmam_width - self.scrollV.contentSize.width) * 0.5) : 0.0;
    CGFloat offsetY                = (self.scrollV.cmam_height > self.scrollV.contentSize.height) ? ((self.scrollV.cmam_height - self.scrollV.contentSize.height) * 0.5) : 0.0;
    self.imageContainerView.center = CGPointMake(self.scrollV.contentSize.width * 0.5 + offsetX, self.scrollV.contentSize.height * 0.5 + offsetY);
}

#pragma mark - UIScrollViewDelegate -
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageContainerView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self refreshImageContainerViewCenter];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    //    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark - Getter -

@end
