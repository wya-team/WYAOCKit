//
//  WYAVideoPlayerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAVideoPlayerViewController.h"
#import "WYADownloaderViewController.h"

@interface WYAVideoPlayerViewController () <VideoPlayerDelegate>
@property (nonatomic, strong) WYAVideoPlayerView * playView;
@property (nonatomic, assign) BOOL isFullScreen;
@end

@implementation WYAVideoPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navTitle             = @"WYAVideoPlayerView";

    float hei               = 9.0 / 16.0 * ScreenWidth;
    CGRect frame            = CGRectMake(0, WYATopHeight, ScreenWidth, hei);
    WYAVideoItem * item     = [[WYAVideoItem alloc] init];
    item.videoUrl           = [NSURL URLWithString:@"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4"];
    item.superV             = self.view;
    item.rect               = frame;
    item.seekTime           = 10;
    item.seekToTimeAutoPlay = YES;

    self.playView                = [[WYAVideoPlayerView alloc] init];
    self.playView.playerDelegate = self;
    self.playView.frame          = frame;
    //    self.playView.needOneClick = NO;
    [self.view addSubview:self.playView];

    [self.playView wya_RegisterPlayerItem:item];
}

- (void)dealloc
{
    NSLog(@"销毁");
    [self.playView wya_ResetPlayer];
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
    [self.playView wya_ResetPlayer];
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/WYAVideoPlayer/README.md";
    [self.navigationController pushViewController:vc animated:YES];
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
