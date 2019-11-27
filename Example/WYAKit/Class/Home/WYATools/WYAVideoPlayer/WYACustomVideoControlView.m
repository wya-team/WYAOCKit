//
//  WYACustomVideoControlView.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/21.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYACustomVideoControlView.h"
#import <ZFPlayer/ZFPlayer.h>

@interface WYACustomVideoControlView ()

/// 播放或暂停按钮
@property (nonatomic, strong) UIButton *playOrPauseBtn;



/// 全屏按钮
@property (nonatomic, strong) UIButton *fullScreenBtn;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, assign) BOOL controlViewAppeared;

@property (nonatomic, strong) dispatch_block_t afterBlock;

@property (nonatomic, assign) NSTimeInterval sumTime;

/// 封面图
@property (nonatomic, strong) UIImageView *coverImageView;
@end

@implementation WYACustomVideoControlView
@synthesize player = _player;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 添加子控件

        [self addSubview:self.playOrPauseBtn];

        [self addSubview:self.fullScreenBtn];


        // 设置子控件的响应事件
        [self makeSubViewsAction];

        [self resetControlView];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)makeSubViewsAction {
    [self.playOrPauseBtn addTarget:self action:@selector(playPauseButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.fullScreenBtn addTarget:self action:@selector(fullScreenButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - action

- (void)playPauseButtonClickAction:(UIButton *)sender {
    [self playOrPause];
}

- (void)fullScreenButtonClickAction:(UIButton *)sender {
    [self.player enterFullScreen:!self.player.isFullScreen animated:YES];
}

/// 根据当前播放状态取反
- (void)playOrPause {
    self.playOrPauseBtn.selected = !self.playOrPauseBtn.isSelected;
    self.playOrPauseBtn.isSelected? [self.player.currentPlayerManager play]: [self.player.currentPlayerManager pause];
}

- (void)playBtnSelectedState:(BOOL)selected {
    self.playOrPauseBtn.selected = selected;
}

#pragma mark - 添加子控件约束

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    CGFloat min_view_w = self.bounds.size.width;
    CGFloat min_view_h = self.bounds.size.height;
    CGFloat min_margin = 9;

    self.coverImageView.frame = self.bounds;
    self.bgImgView.frame = self.bounds;


    min_x = 0;
    min_y = 0;
    min_w = 44;
    min_h = min_w;
    self.playOrPauseBtn.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.playOrPauseBtn.center = self.center;

    if (!self.isShow) {
        self.playOrPauseBtn.alpha = 0;
    } else {
        self.playOrPauseBtn.alpha = 1;
    }
}

#pragma mark - private

/** 重置ControlView */
- (void)resetControlView {
    self.backgroundColor             = [UIColor clearColor];
    self.playOrPauseBtn.selected     = YES;
}

- (void)showControlView {

    self.isShow                      = YES;
    self.playOrPauseBtn.alpha        = 1;
    self.player.statusBarHidden      = NO;
}

- (void)hideControlView {
    self.isShow                      = NO;
    self.player.statusBarHidden      = NO;
    self.playOrPauseBtn.alpha        = 0;
}

- (void)autoFadeOutControlView {
    self.controlViewAppeared = YES;
    [self cancelAutoFadeOutControlView];
    @weakify(self)
    self.afterBlock = dispatch_block_create(0, ^{
        @strongify(self)
        [self hideControlViewWithAnimated:YES];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(),self.afterBlock);
}

/// 取消延时隐藏controlView的方法
- (void)cancelAutoFadeOutControlView {
    if (self.afterBlock) {
        dispatch_block_cancel(self.afterBlock);
        self.afterBlock = nil;
    }
}

/// 隐藏控制层
- (void)hideControlViewWithAnimated:(BOOL)animated {
    self.controlViewAppeared = NO;
    [UIView animateWithDuration:animated ? 0.25 : 0 animations:^{
        [self hideControlView];
    } completion:^(BOOL finished) {

    }];
}

/// 显示控制层
- (void)showControlViewWithAnimated:(BOOL)animated {
    self.controlViewAppeared = YES;
    [self autoFadeOutControlView];
    [UIView animateWithDuration:animated ? 0.25 : 0 animations:^{
        [self showControlView];
    } completion:^(BOOL finished) {

    }];
}


//- (BOOL)shouldResponseGestureWithPoint:(CGPoint)point withGestureType:(ZFPlayerGestureType)type touch:(nonnull UITouch *)touch {
//
//    return YES;
//}

/**
 设置标题、封面、全屏模式

 @param title 视频的标题
 @param coverUrl 视频的封面，占位图默认是灰色的
 @param fullScreenMode 全屏模式
 */
- (void)showTitle:(NSString *)title coverURLString:(NSString *)coverUrl fullScreenMode:(ZFFullScreenMode)fullScreenMode {
    UIImage *placeholder = [UIImage wya_createImageWithColor:[UIColor lightGrayColor]];
    [self resetControlView];
    [self layoutIfNeeded];
    [self setNeedsDisplay];

    self.player.orientationObserver.fullScreenMode = fullScreenMode;
//    [self.coverImageView setImageWithURLString:coverUrl placeholder:placeholder];
//    [self.bgImgView setImageWithURLString:coverUrl placeholder:placeholder];
}



#pragma mark - ZFPlayerControlViewDelegate
/// 单击手势事件
- (void)gestureSingleTapped:(ZFPlayerGestureControl *)gestureControl {
    if (!self.player) return;
    if (self.player.isSmallFloatViewShow && !self.player.isFullScreen) {
        [self.player enterFullScreen:YES animated:YES];
    } else {
        if (self.controlViewAppeared) {
            [self hideControlViewWithAnimated:YES];
        } else {
            /// 显示之前先把控制层复位，先隐藏后显示
            [self hideControlViewWithAnimated:NO];
            [self showControlViewWithAnimated:YES];
        }
    }
}
/// 准备播放
- (void)videoPlayer:(ZFPlayerController *)videoPlayer prepareToPlay:(NSURL *)assetURL {
    [self hideControlViewWithAnimated:NO];
}

/// 播放状态改变
- (void)videoPlayer:(ZFPlayerController *)videoPlayer playStateChanged:(ZFPlayerPlaybackState)state {
    if (state == ZFPlayerPlayStatePlaying) {
        [self playBtnSelectedState:YES];
        /// 开始播放时候判断是否显示loading
        if (videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStateStalled) {
//            [self.activity startAnimating];
        } else if ((videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStateStalled || videoPlayer.currentPlayerManager.loadState == ZFPlayerLoadStatePrepare)) {
//            [self.activity startAnimating];
        }
    } else if (state == ZFPlayerPlayStatePaused) {
        [self playBtnSelectedState:NO];
        /// 暂停的时候隐藏loading
//        [self.activity stopAnimating];
    } else if (state == ZFPlayerPlayStatePlayFailed) {
//        [self.activity stopAnimating];
    }
}

/// 加载状态改变
- (void)videoPlayer:(ZFPlayerController *)videoPlayer loadStateChanged:(ZFPlayerLoadState)state {
    if (state == ZFPlayerLoadStatePrepare) {
        self.coverImageView.hidden = NO;
    } else if (state == ZFPlayerLoadStatePlaythroughOK || state == ZFPlayerLoadStatePlayable) {
        self.coverImageView.hidden = YES;
        self.player.currentPlayerManager.view.backgroundColor = [UIColor blackColor];
    }
    if (state == ZFPlayerLoadStateStalled && videoPlayer.currentPlayerManager.isPlaying) {
//        [self.activity startAnimating];
    } else if ((state == ZFPlayerLoadStateStalled || state == ZFPlayerLoadStatePrepare) && videoPlayer.currentPlayerManager.isPlaying) {
//        [self.activity startAnimating];
    } else {
//        [self.activity stopAnimating];
    }
}

/// 视频view即将旋转
- (void)videoPlayer:(ZFPlayerController *)videoPlayer orientationWillChange:(ZFOrientationObserver *)observer {
    if (videoPlayer.isSmallFloatViewShow) {
        if (observer.isFullScreen) {
            self.controlViewAppeared = NO;
            [self cancelAutoFadeOutControlView];
        }
    }
    if (self.controlViewAppeared) {
        [self showControlViewWithAnimated:NO];
    } else {
        [self hideControlViewWithAnimated:NO];
    }
}

/// 视频view已经旋转
- (void)videoPlayer:(ZFPlayerController *)videoPlayer orientationDidChanged:(ZFOrientationObserver *)observer {
    if (self.controlViewAppeared) {
        [self showControlViewWithAnimated:NO];
    } else {
        [self hideControlViewWithAnimated:NO];
    }
    [self layoutIfNeeded];
    [self setNeedsDisplay];
}

/// 锁定旋转方向
- (void)lockedVideoPlayer:(ZFPlayerController *)videoPlayer lockedScreen:(BOOL)locked {
    [self showControlViewWithAnimated:YES];
}

#pragma mark - setter

- (void)setPlayer:(ZFPlayerController *)player {
    _player = player;
    /// 解决播放时候黑屏闪一下问题
    [player.currentPlayerManager.view insertSubview:self.bgImgView atIndex:0];
    [player.currentPlayerManager.view insertSubview:self.coverImageView atIndex:1];
    self.coverImageView.frame = player.currentPlayerManager.view.bounds;
    self.coverImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.bgImgView.frame = player.currentPlayerManager.view.bounds;
    self.bgImgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.coverImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark - getter

- (UIButton *)playOrPauseBtn {
    if (!_playOrPauseBtn) {
        _playOrPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playOrPauseBtn setImage:[UIImage imageNamed:@"icon_begin"] forState:UIControlStateNormal];
        [_playOrPauseBtn setImage:[UIImage imageNamed:@"icon_pause"] forState:UIControlStateSelected];
    }
    return _playOrPauseBtn;
}

- (UIButton *)fullScreenBtn {
    if (!_fullScreenBtn) {
        _fullScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_fullScreenBtn setImage:ZFPlayer_Image(@"ZFPlayer_fullscreen") forState:UIControlStateNormal];
    }
    return _fullScreenBtn;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.userInteractionEnabled = YES;
        _coverImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _coverImageView;
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

@end
