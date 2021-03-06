//
//  WYASingleViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/20.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYASingleVideoViewController.h"

@interface WYASingleVideoViewController ()<WYAVideoPlayerDelegate>
@property (nonatomic, strong) WYAVideoPlayerView * playView;
@property (nonatomic, assign) BOOL isFullScreen;
@end

@implementation WYASingleVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    float hei                    = 9.0 / 16.0 * ScreenWidth;
    CGRect frame                 = CGRectMake(0, WYATopHeight, ScreenWidth, hei);
    WYAVideoItem * item          = [[WYAVideoItem alloc] init];
    item.videoUrl                = [NSURL URLWithString:@"https://video.pc6.com/v/1810/pyqxxjc3.mp4"];
    item.superView               = self.view;
    item.rect                    = frame;
    item.seekTime                = 10;
    item.seekToTimeAutoPlay      = YES;
    item.autoNeedReplay          = YES;
    self.playView                = [[WYAVideoPlayerView alloc] init];
    self.playView.playerDelegate = self;
    self.playView.frame          = frame;
    self.playView.videoItem = item;
    [self.view addSubview:self.playView];


    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下载这个视频" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor redColor]]
                      forState:UIControlStateNormal];
    [button addCallBackAction:^(UIButton * button) {

        WYADownloadModel * model1  = [[WYADownloadModel alloc] init];
        model1.urlString           = @"https://video.pc6.com/v/1810/pyqxxjc3.mp4";
        model1.title               = @"下载测试内容";
        WYADownloader * downloader = [WYADownloader sharedDownloader];
        [downloader wya_DownloadTaskWithModel:model1
                                 ResultHandle:^(WYADownloadModel * _Nonnull resultModel,
                                                NSString * _Nonnull result) {
                                     [UIView wya_showBottomToastWithMessage:result];
                                 }];
    }];
    [self.view addSubview:button];
    CGFloat button_X      = (ScreenWidth - 200 * SizeAdapter) / 2;
    CGFloat button_Y      = CGRectGetMaxY(self.playView.frame) + 50 * SizeAdapter;
    CGFloat button_Width  = 200 * SizeAdapter;
    CGFloat button_Height = 50 * SizeAdapter;
    button.frame          = CGRectMake(button_X, button_Y, button_Width, button_Height);
}

- (void)dealloc
{
    NSLog(@"销毁");
    [self.playView wya_resetPlayer];
    [self.playView removeFromSuperview];
}

#pragma mark - Super Method  -
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.isFullScreen) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

#pragma mark - VideoPlayerDelegate -
- (void)wya_playerView:(UIView *)playerView isfullScreen:(BOOL)fullScreen
{
    self.isFullScreen = fullScreen;
    [self setNeedsStatusBarAppearanceUpdate];
    if (fullScreen) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - NavBarAction  -
- (void)wya_goBack
{
    [super wya_goBack];
    [self.playView wya_resetPlayer];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
