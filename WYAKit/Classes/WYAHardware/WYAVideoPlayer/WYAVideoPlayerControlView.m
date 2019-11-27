//
//  WYAVideoPlayerControlView.m
//  VideoDemo
//
//  Created by 李世航 on 2018/5/28.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAVideoPlayerControlView.h"
#import "WYAVideoFastView.h"
#import "WYAVideoNetWorkView.h"
#import "WYAVideoSlider.h"

@interface WYAVideoPlayerControlView () <WYAVideoSliderDelegate>

@property (nonatomic, strong) UIButton * likeButton;          //收藏按钮
@property (nonatomic, strong) UIButton * downloadButton;      //下载按钮
@property (nonatomic, strong) UIImageView * bottomImageView;  //底部控制栏
@property (nonatomic, strong) UIButton * playButton;          //播放和暂停按钮
@property (nonatomic, strong) UILabel * currentProgressLabel; //当前播放时间进度
@property (nonatomic, strong) UILabel * allProgressLabel;     //视频长度
@property (nonatomic, strong) WYAVideoSlider * slider;        // 滑块
@property (nonatomic, strong) WYAVideoItem * item;
@property (nonatomic, strong) UITapGestureRecognizer * oneFingerTap;
@property (nonatomic, strong) WYAVideoFastView * fastView;
@property (nonatomic, assign) CGFloat allTime; //当前视频的播放总长度
@property (nonatomic, strong) WYAVideoNetWorkView * networkView;
@end

@implementation WYAVideoPlayerControlView

- (instancetype)initWithPlayItem:(WYAVideoItem *)item
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        self.item            = item;

        [self addSubview:self.backButton];
        //        [self addSubview:self.likeButton];
        //        [self addSubview:self.downloadButton];
        [self addSubview:self.bottomImageView];
        [self addSubview:self.fastView];
        [self addSubview:self.networkView];

        [self.bottomImageView addSubview:self.playButton];
        [self.bottomImageView addSubview:self.currentProgressLabel];
        [self.bottomImageView addSubview:self.allProgressLabel];
        [self.bottomImageView addSubview:self.slider];
        [self.bottomImageView addSubview:self.zoomButton];

        [self autoFadeOutControlView];

        self.oneFingerClick = YES;

        [self wya_getNetWorkStatus:^(WYANetWorkStatus status) {
            if (status != WYANetWorkStatusWIFI) {
                self.networkView.hidden     = NO;
                self.bottomImageView.hidden = YES;
                if (status == WYANetWorkStatusNoReach) {
                    self.networkView.titleLabel.text = @"当前没有网络";
                    [self.networkView.button setTitle:@"重试" forState:UIControlStateNormal];
                } else {
                    self.networkView.titleLabel.text = @"当前是数据网络";
                    [self.networkView.button setTitle:@"继续播放" forState:UIControlStateNormal];
                }
            } else {
                self.networkView.hidden = YES;
            }
        }];
        [self.networkView netWorkStatus:nil];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.backButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.mas_left).with.offset(10);
        make.top.mas_equalTo(self.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    //
    //    [self.downloadButton mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.right.mas_equalTo(self.mas_right).with.offset(-10);
    //        make.centerY.mas_equalTo(self.backButton.mas_centerY);
    //        make.size.mas_equalTo(CGSizeMake(44, 44));
    //    }];
    //
    //    [self.likeButton mas_remakeConstraints:^(MASConstraintMaker *make) {
    //        make.right.mas_equalTo(self.downloadButton.mas_left).with.offset(-0);
    //        make.centerY.mas_equalTo(self.backButton.mas_centerY);
    //        make.size.mas_equalTo(CGSizeMake(44, 44));
    //    }];

    [self.bottomImageView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(44);
    }];

    [self.playButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.bottomImageView).with.offset(10);
        make.top.bottom.mas_equalTo(self.bottomImageView);
        make.width.mas_equalTo(44);
    }];

    [self.currentProgressLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.bottomImageView.mas_centerY);
        make.left.mas_equalTo(self.playButton.mas_right).with.offset(5);
        make.width.mas_lessThanOrEqualTo(100);
    }];

    [self.zoomButton mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.right.mas_equalTo(self.bottomImageView.mas_right).with.offset(-20);
        make.top.bottom.mas_equalTo(self.bottomImageView);
        make.width.mas_equalTo(44);
    }];

    [self.allProgressLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.bottomImageView.mas_centerY);
        make.right.mas_equalTo(self.zoomButton.mas_left).with.offset(-5);
        make.width.mas_lessThanOrEqualTo(100);
    }];

    [self.slider mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(self.bottomImageView.mas_centerY);
        make.left.mas_equalTo(self.currentProgressLabel.mas_right).with.offset(10);
        make.right.mas_equalTo(self.allProgressLabel.mas_left).with.offset(-10);
        make.height.mas_equalTo(self.bottomImageView.mas_height);
    }];

    [self.fastView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100 * SizeAdapter, 80 * SizeAdapter));
    }];

    [self.networkView mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(200 * SizeAdapter, 50 * SizeAdapter));
    }];
}

#pragma mark - Getter -
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self
                        action:@selector(backClick:)
              forControlEvents:UIControlEventTouchUpInside];
        _backButton.hidden = YES;
    }
    return _backButton;
}
//
//-(UIButton *)likeButton{
//    if (!_likeButton) {
//        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_likeButton setImage:[UIImage imageNamed:@"likeNormal"] forState:UIControlStateNormal];
//        [_likeButton setImage:[UIImage imageNamed:@"likeSelect"] forState:UIControlStateSelected];
//        [_likeButton addTarget:self action:@selector(likeClick:)
//        forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _likeButton;
//}
//
//-(UIButton *)downloadButton{
//    if (!_downloadButton) {
//        _downloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_downloadButton setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
//        [_downloadButton addTarget:self action:@selector(downloadClick:)
//        forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _downloadButton;
//}

- (UIImageView *)bottomImageView
{
    if (!_bottomImageView) {
        _bottomImageView                        = [[UIImageView alloc] init];
        _bottomImageView.userInteractionEnabled = YES;
        _bottomImageView.backgroundColor        = [UIColor colorWithWhite:0.5 alpha:0.2];
    }
    return _bottomImageView;
}

- (UIButton *)playButton
{
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton
        setImage:[UIImage loadBundleImage:@"icon_begin" ClassName:NSStringFromClass(self.class)]
        forState:UIControlStateNormal];
        [_playButton
        setImage:[UIImage loadBundleImage:@"icon_pause" ClassName:NSStringFromClass(self.class)]
        forState:UIControlStateSelected];
        _playButton.selected = NO;
        [_playButton addTarget:self
                        action:@selector(playButtonClick:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (UILabel *)currentProgressLabel
{
    if (!_currentProgressLabel) {
        _currentProgressLabel               = [[UILabel alloc] init];
        _currentProgressLabel.textColor     = [UIColor whiteColor];
        _currentProgressLabel.font          = [UIFont systemFontOfSize:12];
        _currentProgressLabel.text          = @"00:00";
        _currentProgressLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _currentProgressLabel;
}

- (UILabel *)allProgressLabel
{
    if (!_allProgressLabel) {
        _allProgressLabel               = [[UILabel alloc] init];
        _allProgressLabel.textColor     = [UIColor whiteColor];
        _allProgressLabel.font          = [UIFont systemFontOfSize:12];
        _allProgressLabel.text          = @"00:00";
        _allProgressLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _allProgressLabel;
}

- (WYAVideoSlider *)slider
{
    if (!_slider) {
        _slider          = [[WYAVideoSlider alloc] init];
        _slider.delegate = self;
    }
    return _slider;
}

- (UIButton *)zoomButton
{
    if (!_zoomButton) {
        _zoomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zoomButton setImage:[UIImage loadBundleImage:@"icon_enlarge"
                                             ClassName:NSStringFromClass(self.class)]
                     forState:UIControlStateNormal];
        [_zoomButton setImage:[UIImage loadBundleImage:@"icon_Shrinkscreen"
                                             ClassName:NSStringFromClass(self.class)]
                     forState:UIControlStateSelected];
        [_zoomButton addTarget:self
                        action:@selector(zoomClick:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _zoomButton;
}

- (WYAVideoFastView *)fastView
{
    if (!_fastView) {
        _fastView                     = [[WYAVideoFastView alloc] init];
        _fastView.hidden              = YES;
        _fastView.layer.cornerRadius  = 5.f;
        _fastView.layer.masksToBounds = YES;
    }
    return _fastView;
}

- (WYAVideoNetWorkView *)networkView
{
    if (!_networkView) {
        _networkView = ({
            WYAVideoNetWorkView * object = [[WYAVideoNetWorkView alloc] init];
            WeakSelf(weakSelf);
            object.retryHandle = ^{
                weakSelf.bottomImageView.hidden = NO;
                if (weakSelf.videoControlDelegate &&
                    [weakSelf.videoControlDelegate
                    respondsToSelector:@selector(videoControlRetry:)]) {
                    [weakSelf.videoControlDelegate videoControlRetry:weakSelf];
                }
            };
            object.goOnHandle = ^{
                weakSelf.bottomImageView.hidden = NO;
                if (weakSelf.videoControlDelegate &&
                    [weakSelf.videoControlDelegate
                    respondsToSelector:@selector(videoControlGoOn:)]) {
                    [weakSelf.videoControlDelegate videoControlGoOn:weakSelf];
                }
            };
            object;
        });
    }
    return _networkView;
}

#pragma mark - Setter -
- (void)setOneFingerClick:(BOOL)oneFingerClick
{
    _oneFingerClick = oneFingerClick;
    if (oneFingerClick) {
        self.oneFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(showBottomControl)];

        [self addGestureRecognizer:self.oneFingerTap];
    } else {
        if (self.oneFingerTap) {
            [self removeGestureRecognizer:self.oneFingerTap];
        }
    }
}

#pragma mark - Private Method -

- (void)backClick:(UIButton *)sender
{
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:backButton:)]) {
        [self.videoControlDelegate videoControl:self backButton:sender];
    }
}

- (void)likeClick:(UIButton *)sender
{
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:likeButton:)]) {
        [self.videoControlDelegate videoControl:self likeButton:sender];
    }
}

- (void)downloadClick:(UIButton *)sender
{
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:downloadButton:)]) {
        [self.videoControlDelegate videoControl:self downloadButton:sender];
    }
}

- (void)playButtonClick:(UIButton *)sender
{
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:PlayButton:)]) {
        [self.videoControlDelegate videoControl:self PlayButton:sender];
    }
    sender.selected = !sender.selected;
}

- (void)wya_SliderStartRun
{
    self.playButton.selected = NO;
    [self cancelAutoFadeOutControlView];
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:SlideBegin:)]) {
        [self.videoControlDelegate videoControl:self SlideBegin:self.slider];
    }
}

- (void)wya_SliderRunningWithValue:(CGFloat)value
{
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:SlideChange:)]) {
        [self.videoControlDelegate videoControl:self SlideChange:self.slider];
    }
}

- (void)wya_SliderEndRun
{
    self.playButton.selected = YES;
    [self hiddenBottomControl];
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:SlideEnd:)]) {
        [self.videoControlDelegate videoControl:self SlideEnd:self.slider];
    }
}

- (void)zoomClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (self.videoControlDelegate &&
        [self.videoControlDelegate respondsToSelector:@selector(videoControl:zoomButton:)]) {
        [self.videoControlDelegate videoControl:self zoomButton:sender];
    }
}

- (void)showBottomControl
{
    [self cancelAutoFadeOutControlView];
    [UIView animateWithDuration:0.5
    animations:^{
        self.bottomImageView.alpha = 1;
        //        self.bottomImageView.hidden = NO;
    }
    completion:^(BOOL finished) { [self autoFadeOutControlView]; }];
}

- (void)hiddenBottomControl
{
    [self cancelAutoFadeOutControlView];
    [UIView animateWithDuration:2
    animations:^{ self.bottomImageView.alpha = 0; }
    completion:^(BOOL finished){

    }];
}

- (void)autoFadeOutControlView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(hiddenBottomControl)
                                               object:nil];
    [self performSelector:@selector(hiddenBottomControl) withObject:nil afterDelay:2];
}

- (void)cancelAutoFadeOutControlView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

#pragma mark - Public Method -
- (void)getCurrentTime:(NSInteger)currentTime
             TotalTime:(NSInteger)totalTime
            SlideValue:(CGFloat)slideValue
{
    // 当前时长进度progress
    NSInteger proMin = currentTime / 60; //当前秒
    NSInteger proSec = currentTime % 60; //当前分钟
    // duration 总时长
    NSInteger durMin = totalTime / 60; //总秒
    NSInteger durSec = totalTime % 60; //总分钟
    // 更新slider
    self.slider.value = slideValue;
    self.allTime      = totalTime;
    // 更新当前播放时间
    self.currentProgressLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", proMin, proSec];
    // 更新总时间

    self.allProgressLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", durMin, durSec];
}

- (void)getDragTime:(NSInteger)dragTime
           AutoPlay:(BOOL)autoPlay
        FastForward:(BOOL)fastForward
     HiddenFastView:(BOOL)hiddenFastView
{
    if (autoPlay == YES) {
        self.playButton.selected = YES;
    } else {
        self.playButton.selected = NO;
    }

    // 当前时长进度progress
    NSInteger proMin = dragTime / 60; //当前秒
    NSInteger proSec = dragTime % 60; //当前分钟
    // 更新当前播放时间
    NSString * currentTime         = [NSString stringWithFormat:@"%02zd:%02zd", proMin, proSec];
    self.currentProgressLabel.text = currentTime;
    self.fastView.hidden           = hiddenFastView;
    self.fastView.isSpeed          = fastForward;
    NSString * string =
    [NSString stringWithFormat:@"%@/%@", currentTime, self.allProgressLabel.text];
    self.fastView.text   = string;
    CGFloat draggedValue = (CGFloat)dragTime / self.allTime;
    self.fastView.number = draggedValue;
}

- (void)playerEnd
{
    self.playButton.selected = NO;
}

- (void)resetVideoPlayControl
{
    self.playButton.selected       = NO;
    self.currentProgressLabel.text = @"00:00";
    self.allProgressLabel.text     = @"00:00";
}

- (void)wya_playerSetProgress:(CGFloat)progress
{
    self.slider.bufferValue = progress;
}

- (void)playFail
{
    self.networkView.hidden = NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
