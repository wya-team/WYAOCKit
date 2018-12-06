//
//  WYADownloaderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADownloaderViewController.h"

#define Path [[NSString wya_libCachePath] stringByAppendingPathComponent:@"xxx.mp4"]

@interface WYADownloaderViewController ()
@property (nonatomic, strong) UIProgressView * progressView;

@property (nonatomic, strong) WYAVideoPlayerView *playView;
@property (nonatomic, strong) WYAVideoItem *item;
@end

@implementation WYADownloaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, WYATopHeight+20, self.view.cmam_width-20, 30)];
    self.progressView.trackTintColor = [UIColor grayColor];
    self.progressView.progressTintColor = [UIColor redColor];
    [self.view addSubview:self.progressView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(startDownload) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake((self.view.cmam_width-50)/2, CGRectGetMaxY(self.progressView.frame)+30, 50, 50);
    [self.view addSubview:button];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"暂停下载" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.titleLabel.font = FONT(15);
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 addTarget:self action:@selector(suspendDownload) forControlEvents:UIControlEventTouchUpInside];
    button1.frame = CGRectMake(10, CGRectGetMaxY(button.frame)+30, 80, 50);
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"继续下载" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.titleLabel.font = FONT(15);
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 addTarget:self action:@selector(keepDownload) forControlEvents:UIControlEventTouchUpInside];
    button2.frame = CGRectMake(CGRectGetMaxX(button1.frame)+30, CGRectGetMaxY(button.frame)+30, 80, 50);
    [self.view addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"取消下载" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.titleLabel.font = FONT(15);
    [button3 setBackgroundColor:[UIColor redColor]];
    [button3 addTarget:self action:@selector(cancelDownload) forControlEvents:UIControlEventTouchUpInside];
    button3.frame = CGRectMake(CGRectGetMaxX(button2.frame)+30, CGRectGetMaxY(button.frame)+30, 80, 50);
    [self.view addSubview:button3];
    
}

-(void)wya_goBack{
    [super wya_goBack];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtURL:[NSURL fileURLWithPath:Path] error:nil];
    [self.playView wya_ResetPlayer];
}

-(void)startDownload{
    
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    
//    [downloader wya_DownloadTaskWithUrl:@"http://pic28.photophoto.cn/20130818/0020033143720852_b.jpg"];
//    http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4
    
    [downloader wya_DownloadTaskWithUrl:@"https://vdse.bdstatic.com//e509104a380c00fa8d2cb13d2fa2c1ec?authorization=bce-auth-v1%2F40f207e648424f47b2e3dfbb1014b1a5%2F2017-05-11T09%3A02%3A31Z%2F-1%2F%2F9f71c27b020218c3dc417156e4b6dc243373f6c7c1caf189ffacc83a580ca57a" FilePath:Path DownloadHandle:^(CGFloat progress, BOOL isFinish) {
        NSLog(@"outProgress==%f",progress);
        self.progressView.progress = progress;
        if (isFinish) {
            [UIView wya_ShowCenterToastWithMessage:@"下载完成"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                float hei = 9.0 / 16.0 * ScreenWidth;
                CGRect frame = CGRectMake(0, 300, ScreenWidth, hei);
                self.item = [[WYAVideoItem alloc] init];
                self.item.videoUrl = [NSURL fileURLWithPath:Path];
                self.item.superV = self.view;
                self.item.rect = frame;
                self.item.seekTime = 0;
                self.item.seekToTimeAutoPlay = NO;
                
                
                self.playView = [[WYAVideoPlayerView alloc] init];
                self.playView.frame = frame;
                [self.view addSubview:self.playView];
                
                [self.playView wya_RegisterPlayerItem:self.item];
            });
            
        }
    }];
}

-(void)suspendDownload{
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    [downloader wya_suspendDownload];
}

-(void)keepDownload{
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    [downloader wya_keepDownload];
}

-(void)cancelDownload{
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    [downloader wya_giveupDownload:^(BOOL result) {
        NSLog(@"result==%d",result);
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
