//
//  WYAVideoPlayerView.m
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAVideoPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "WYAVideoPlayerControlView.h"
#import "WYAVideoSlider.h"
@interface WYAVideoPlayerView () <VideoControlDelegate>

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) AVPlayerItem *playerItem;

@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@property (nonatomic, strong) UIImageView *previewImageView;

@property (nonatomic, strong) WYAVideoPlayerControlView *controlView;

@property (nonatomic, strong) WYAVideoItem *videoItem;

@property (nonatomic, strong) id timeObserve;

@property (nonatomic, strong) UIActivityIndicatorView *activeView;

@property (nonatomic, assign) BOOL isFullScreen;

@end


@implementation WYAVideoPlayerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.playerLayer.frame = self.bounds;
    [self.previewImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    [self.activeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];

    [self.controlView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - Private Method -
- (void)setupUI{
    [self.layer addSublayer:self.playerLayer];
    [self addSubview:self.previewImageView];
    [self addSubview:self.activeView];
    [self addSubview:self.controlView];
    self.backgroundColor = [UIColor grayColor];
}

#pragma mark - Setter -
- (void)setVideoItem:(WYAVideoItem *)videoItem
{
    _videoItem = videoItem;
}

- (void)setPlayerItem:(AVPlayerItem *)playerItem
{
    if (_playerItem) {
        [_playerItem removeObserver:self forKeyPath:@"status"];
        [_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
        [_playerItem removeObserver:self forKeyPath:@"playbackBufferEmpty"];
        [_playerItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItem];
    }
    _playerItem = playerItem;
    if (playerItem) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
        [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];           // 监听status属性
        [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil]; // 监听loadedTimeRanges属性
        // 缓冲区空了，需要等待数据
        [playerItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:nil];
        // 缓冲区有足够数据可以播放了
        [playerItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:nil];
    }
}

//- (void)setNeedOneClick:(BOOL)needOneClick
//{
//    _needOneClick = needOneClick;
//    self.controlView.oneFingerClick = needOneClick;
//}

#pragma mark - Getter -
- (UIImageView *)previewImageView
{
    if (!_previewImageView) {
        _previewImageView = [[UIImageView alloc] init];
        _previewImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.videoItem.previewImage]]];
    }
    return _previewImageView;
}

- (UIActivityIndicatorView *)activeView
{
    if (!_activeView) {
        _activeView = [[UIActivityIndicatorView alloc] init];
        _activeView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activeView.hidden = YES;
    }
    return _activeView;
}

- (WYAVideoPlayerControlView *)controlView
{
    if (!_controlView) {
        _controlView = [[WYAVideoPlayerControlView alloc] initWithPlayItem:self.videoItem];
        _controlView.videoControlDelegate = self;
    }
    return _controlView;
}

#pragma mark VideoControlDelegate
- (void)videoControl:(UIView *)videoControl backButton:(UIButton *)backButton
{
    if (self.isFullScreen == YES) {
        [self exitFullscreen];
        self.controlView.zoomButton.selected = NO;
    } else {
//        if (self.playerDelegate && [self.playerDelegate respondsToSelector:@selector(playerView:backButton:)]) {
//            [self.playerDelegate playerView:self backButton:backButton];
//        }
    }
}

- (void)videoControl:(UIView *)videoControl PlayButton:(UIButton *)playButton
{
    self.previewImageView.hidden = YES;
    if (playButton.selected) {
        [self.player pause];
        _status = PlayerStateStopped;
    } else {
        [self.player play];
        _status = PlayerStatePlaying;
    }
}

- (void)videoControl:(UIView *)videoControl SlideBegin:(WYAVideoSlider *)slide
{
    [self.player pause];
}

- (void)videoControl:(UIView *)videoControl SlideChange:(WYAVideoSlider *)slide
{
    CGFloat totalTime = self.playerItem.duration.value / self.playerItem.duration.timescale;
    CGFloat currentTime = floorf(totalTime * slide.value);
    [self.controlView getDragTime:currentTime AutoPlay:NO];
}

- (void)videoControl:(UIView *)videoControl SlideEnd:(WYAVideoSlider *)slide
{
    CGFloat totalTime = self.playerItem.duration.value / self.playerItem.duration.timescale;
    CGFloat currentTime = floorf(totalTime * slide.value);
    CMTime time = CMTimeMake(currentTime, 1);
    [self.player seekToTime:time completionHandler:^(BOOL finished) {
        if (self->_status == PlayerStatePlaying) {
            [self.player play];
        }
        [self.controlView getDragTime:currentTime AutoPlay:YES];
    }];
}

- (void)videoControl:(UIView *)videoControl zoomButton:(UIButton *)zoomButton
{
    if (zoomButton.selected) {
        //全屏
        [self enterFullscreen];

    } else {
        [self exitFullscreen];
    }
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");

            _status = PlayerStatePlaying;
            if (self.videoItem.seekTime) {
                [self seekToTime:self.videoItem.seekTime AutoPlay:self.videoItem.seekToTimeAutoPlay];
            }
            [self.activeView stopAnimating];
            self.activeView.hidden = YES;
        } else if ([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
            _status = PlayerStateFailed;
        } else {
            _status = PlayerStateFailed;
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        // 计算缓冲进度
        NSTimeInterval timeInterval = [self availableDuration];
        CMTime duration = self.playerItem.duration;
        CGFloat totalDuration = CMTimeGetSeconds(duration);

        [self.controlView wya_playerSetProgress:timeInterval / totalDuration];
    } else if ([keyPath isEqualToString:@"playbackBufferEmpty"]) {
        // 当缓冲是空的时候
        if (self.playerItem.playbackBufferEmpty) {
            _status = PlayerStateBuffering;
            self.activeView.hidden = NO;
            [self.activeView startAnimating];
        }

    } else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]) {
        // 当缓冲好的时候
        if (self.playerItem.playbackLikelyToKeepUp && _status == PlayerStateBuffering) {
//            _status = PlayerStatePlaying;

        }
    }
}

#pragma mark NSNotificationCenter
- (void)playerItemDidReachEnd:(NSNotification *) not
{
    [self.controlView playerEnd];
//    if (self.playerDelegate && [self.playerDelegate respondsToSelector:@selector(videoEnd)]) {
//        [self.playerDelegate videoEnd];
//    }
}


#pragma mark Private Action
- (void)configPlayInfo
{
    self.playerItem = [[AVPlayerItem alloc] initWithURL:self.videoItem.videoUrl];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    if (WYAiPhoneX) {
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    
}

- (void)createTimer
{
    __weak typeof(self) weakSelf = self;
    self.timeObserve = [self.player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1) queue:nil usingBlock:^(CMTime time) {
        AVPlayerItem *currentItem = weakSelf.playerItem;
        NSArray *loadedRanges = currentItem.seekableTimeRanges;
        if (loadedRanges.count > 0 && currentItem.duration.timescale != 0) {
            NSInteger currentTime = (NSInteger)CMTimeGetSeconds([currentItem currentTime]);
            CGFloat totalTime = (CGFloat)currentItem.duration.value / currentItem.duration.timescale;
            CGFloat value = CMTimeGetSeconds([currentItem currentTime]) / totalTime;
            [weakSelf.controlView getCurrentTime:currentTime TotalTime:totalTime SlideValue:value];
        }
    }];
}

/**
 *  计算缓冲进度
 *
 *  @return 缓冲进度
 */
- (NSTimeInterval)availableDuration
{
    NSArray *loadedTimeRanges = [[_player currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue]; // 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds; // 计算缓冲总进度
    return result;
}

- (void)enterFullscreen
{
//    [self.superview layoutIfNeeded];
    if (!self.videoItem.superV) {
        self.videoItem.superV = self.superview;
        self.videoItem.rect = self.frame;
    }
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.isFullScreen = YES;
    
    /*
     * movieView移到window上
     */
    CGRect rectInWindow = [self convertRect:self.bounds toView:[UIApplication sharedApplication].keyWindow];
    [self removeFromSuperview];
    self.frame = rectInWindow;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    /*
     * 执行动画
     */
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.bounds = CGRectMake(0, 0, CGRectGetHeight(self.superview.bounds)-WYAStatusBarHeight-WYABottomHeight, CGRectGetWidth(self.superview.bounds));
        self.center = CGPointMake(CGRectGetMidX(self.superview.bounds), CGRectGetMidY(self.superview.bounds));
    } completion:^(BOOL finished){
        
    }];
}

- (void)exitFullscreen
{
    //    [self.videoItem.superV layoutIfNeeded];

    self.isFullScreen = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    CGRect frame = [self.videoItem.superV convertRect:self.videoItem.rect toView:[UIApplication sharedApplication].keyWindow];
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.frame = frame;
    } completion:^(BOOL finished) {
        /*
         * movieView回到小屏位置
         */
        [self removeFromSuperview];
        self.frame = self.videoItem.rect;
        [self.videoItem.superV addSubview:self];
    }];
}

- (void)seekToTime:(NSInteger)time AutoPlay:(BOOL)autoPlay
{
    CMTime timeA = CMTimeMake(time, 1);
    [self.player seekToTime:timeA completionHandler:^(BOOL finished) {
        if (self.status == PlayerStatePlaying) {
            if (autoPlay == YES) {
                [self.player play];
            } else {
                [self.player pause];
            }
        }
    }];
    [self.controlView getDragTime:time AutoPlay:autoPlay];
}

#pragma mark Public Action
- (void)wya_RegisterPlayerItem:(WYAVideoItem *)item
{
    self.videoItem = item;
    [self.playerLayer removeFromSuperlayer];
    [self configPlayInfo];
    [self.layer insertSublayer:self.playerLayer atIndex:0];
    [self createTimer];
}

- (void)resetPlayer
{
    [self.playerLayer removeFromSuperlayer];
    self.playerItem = nil;
    [self.controlView resetVideoPlayControl];
}

- (void)RestorePlayerToOriginalFrame
{
    [self exitFullscreen];
}

- (void)dealloc
{
    if (self.timeObserve) {
        [self.player removeTimeObserver:self.timeObserve];
        self.timeObserve = nil;
    }
    self.controlView.videoControlDelegate = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
