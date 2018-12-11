//
//  WYAVideoPlayerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAVideoPlayerViewController.h"
#import "WYADownloaderViewController.h"

#define Path [[NSString wya_libCachePath] stringByAppendingPathComponent:@"xxx.mp4"]
@interface WYAVideoPlayerViewController ()<VideoPlayerDelegate>
@property (nonatomic, strong) WYAVideoPlayerView *playView;
@end

@implementation WYAVideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    float hei = 9.0 / 16.0 * ScreenWidth;
    CGRect frame = CGRectMake(0, WYATopHeight, ScreenWidth, hei);
    WYAVideoItem *item = [[WYAVideoItem alloc] init];
    item.videoUrl = [NSURL URLWithString:@"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4"];
    item.superV = self.view;
    item.rect = frame;
    item.seekTime = 10;
    item.seekToTimeAutoPlay = NO;

    self.playView = [[WYAVideoPlayerView alloc] init];
    self.playView.playerDelegate = self;
        self.playView.frame = frame;
    //    self.playView.needOneClick = NO;
    [self.view addSubview:self.playView];
    
    [self.playView wya_RegisterPlayerItem:item];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下载这个视频" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    button.bounds = CGRectMake(0, 0, 100*SizeAdapter, 50*SizeAdapter);
    [self.view addSubview:button];
    
    [self wya_addRightNavBarButtonWithNormalTitle:@[@"下载列表"]];

}
- (void)wya_goBack{
    [super wya_goBack];
    [self.playView wya_ResetPlayer];
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    WYADownloaderViewController * vc = [[WYADownloaderViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)downloadClick{
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    WYADownloadModel * model = [[WYADownloadModel alloc]init];
    model.urlString = @"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4";
    model.destinationPath = Path;
    [downloader wya_DownloadTaskWithModel:model ResultHandle:^(NSString * _Nonnull result) {
        NSLog(@"re==%@",result);
        [UIView wya_ShowBottomToastWithMessage:result];
    }];
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
