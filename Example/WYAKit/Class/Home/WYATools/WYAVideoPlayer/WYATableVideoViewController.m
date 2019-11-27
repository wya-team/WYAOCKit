//
//  WYATableVideoViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/20.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYATableVideoViewController.h"
#import "WYAVideoCell.h"
#import <ZFPlayer/ZFPlayer.h>
#import <ZFPlayer/ZFPlayerControlView.h>
#import <ZFPlayer/ZFAVPlayerManager.h>
#import "WYACustomVideoControlView.h"

@interface WYATableVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray * urls;
@property (nonatomic, strong) NSArray * coverImageUrls;
@property (nonatomic, strong) ZFPlayerController * player;
@property (nonatomic, strong) ZFPlayerControlView * controlView;
@property (nonatomic, strong) WYACustomVideoControlView * customControlView;
@end

@implementation WYATableVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];

    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];


        /// player的tag值必须在cell里，tag值必须要和cell中视频的承载视图的tag一致
        self.player = [ZFPlayerController playerWithScrollView:self.tableView playerManager:playerManager containerViewTag:123456789];
        self.player.controlView = self.customControlView;
        self.player.assetURLs = self.urls;
        /// 0.8是消失80%时候，默认0.5
        self.player.playerDisapperaPercent = 0.8;
        /// 移动网络依然自动播放
        self.player.WWANAutoPlay = YES;

        @weakify(self)
    // 视频播放完成后调用
        self.player.playerDidToEnd = ^(id  _Nonnull asset) {
            @strongify(self)
            if (self.player.playingIndexPath.row < self.urls.count - 1) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.player.playingIndexPath.row+1 inSection:0];
                [self playTheVideoAtIndexPath:indexPath scrollToTop:YES];
            } else {
                [self.player stopCurrentPlayingCell];
            }
        };

        self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
            @strongify(self)
            [self setNeedsStatusBarAppearanceUpdate];
            [UIViewController attemptRotationToDeviceOrientation];
            self.tableView.scrollsToTop = !isFullScreen;
        };
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    @weakify(self)
    [self.tableView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @strongify(self)
        [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
    }];
}

- (void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath scrollToTop:(BOOL)scrollToTop {
    [self.player playTheIndexPath:indexPath scrollToTop:scrollToTop];
    // 如果使用zf的控制视图的话，要设置控制视图
    [self.controlView showTitle:@"sadsad"
                 coverURLString:self.coverImageUrls[indexPath.row]
                 fullScreenMode:ZFFullScreenModeLandscape];
    // 如果自定义了视图，可以在此处去设置样式
}

- (BOOL)shouldAutorotate {
    /// 如果只是支持iOS9+ 那直接return NO即可，这里为了适配iOS8
    return self.player.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.player.isFullScreen && self.player.orientationObserver.fullScreenMode == ZFFullScreenModeLandscape) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.player.isFullScreen) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return self.player.isStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}

#pragma mark - UIScrollViewDelegate 列表播放必须实现

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidEndDecelerating];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [scrollView zf_scrollViewDidEndDraggingWillDecelerate:decelerate];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScrollToTop];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewWillBeginDragging];
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYAVideoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"video" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 如果正在播放的index和当前点击的index不同，则停止当前播放的index
    if (self.player.playingIndexPath != indexPath) {
        [self.player stopCurrentPlayingCell];
    }
    /// 如果没有播放，则点击进详情页会自动播放
    if (!self.player.currentPlayerManager.isPlaying) {
        [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
    }
//    /// 到详情页
//    ZFPlayerDetailViewController *detailVC = [ZFPlayerDetailViewController new];
//    detailVC.player = self.player;
//    @weakify(self)
//    /// 详情页返回的回调
//    detailVC.detailVCPopCallback = ^{
//        @strongify(self)
//        [self.player addPlayerViewToCell];
//    };
//    /// 详情页点击播放的回调
//    detailVC.detailVCPlayCallback = ^{
//        @strongify(self)
//        [self zf_playTheVideoAtIndexPath:indexPath];
//    };
//    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, self.view.cmam_width, self.view.cmam_height - WYATopHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[WYAVideoCell class] forCellReuseIdentifier:@"video"];
        /// 停止的时候找出最合适的播放
        @weakify(self)
        _tableView.zf_scrollViewDidStopScrollCallback = ^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            if (!self.player.playingIndexPath) {
                [self playTheVideoAtIndexPath:indexPath scrollToTop:NO];
            }
        };
    }
    return _tableView;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.fastViewAnimated = YES;
        _controlView.horizontalPanShowControlView = NO;
        _controlView.prepareShowLoading = YES;
    }
    return _controlView;
}

- (NSArray *)urls{
    if (!_urls) {
        _urls = @[[self coverUrl:@"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/3612804_e50cb68f52adb3c4c3f6135c0edcc7b0_3.mp4"],
                  [self coverUrl:@"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/20985849_722f981a5ce0fc6d2a5a4f40cb0327a5_3.mp4"],
                  [self coverUrl:@"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/27089192_abcedcf00b503195b7d09f2c91814ef2_3.mp4"],
                  [self coverUrl:@"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/2767299_3ded146196ab765676dca902202eaee2_0.mp4"],
                  [self coverUrl:@"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/5606217_77c117e630a2c2479ee85a7d15a1da78_3.mp4"]];
    }
    return _urls;
}

- (NSArray *)coverImageUrls{
    if (!_coverImageUrls) {
        _coverImageUrls = @[@"http://imgsrc.baidu.com/forum/eWH%3D240%2C176/sign=183252ee8bd6277ffb784f351a0c2f1c/5d6034a85edf8db15420ba310523dd54564e745d.jpg",@"http://imgsrc.baidu.com/forum/eWH%3D640%2C360/sign=265d1891f11f4134f25d7873132ba5e6/4e4a20a4462309f7101128607e0e0cf3d7cad642.jpg",@"http://imgsrc.baidu.com/forum/eWH%3D640%2C360/sign=5215f006ffdeb48fe903dcd3c62b0a05/9f2f070828381f3046cbe7cea5014c086f06f083.jpg",@"http://imgsrc.baidu.com/forum/pic/item/c9177f3e6709c93d857285a6933df8dcd00054db.jpg",@"http://imgsrc.baidu.com/forum/eWH%3D1280%2C720/sign=57bd983359fbb2fb2641251f7e781894/7e3e6709c93d70cf35943a63f4dcd100baa12b75.jpg"];
    }
    return _coverImageUrls;
}

- (NSURL *)coverUrl:(NSString *)url{
    NSString * urlString  = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:urlString];
}

- (WYACustomVideoControlView *)customControlView{
    if (!_customControlView) {
        _customControlView = [[WYACustomVideoControlView alloc] init];
    }
    return _customControlView;
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
