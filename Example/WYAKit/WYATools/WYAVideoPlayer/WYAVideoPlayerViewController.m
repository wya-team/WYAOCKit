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
#define OtherPath [[NSString wya_libCachePath] stringByAppendingPathComponent:@"other.mp4"]
@interface WYAVideoPlayerViewController ()<VideoPlayerDelegate>
@property (nonatomic, strong) WYAVideoPlayerView *playView;
@property (nonatomic, strong) NSMutableArray * models;
@property (nonatomic, assign) BOOL  isFullScreen;
@end

@implementation WYAVideoPlayerViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

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

-(void)dealloc{
    NSLog(@"销毁");
    [self.playView removeFromSuperview];
}

#pragma mark - Super Method  -
- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    if (self.isFullScreen) {
        return UIStatusBarStyleLightContent;
    }else{
        return UIStatusBarStyleDefault;
    }
}

- (BOOL)shouldAutorotate {
    return NO;
}


#pragma mark - VideoPlayerDelegate -
- (void)wya_playerView:(UIView *)playerView isfullScreen:(BOOL)fullScreen{
    self.isFullScreen = fullScreen;
    [self setNeedsStatusBarAppearanceUpdate];
    if (fullScreen) {
        self.view.backgroundColor = [UIColor blackColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - NavBarAction  -
- (void)wya_goBack{
    [super wya_goBack];
    [self.playView wya_ResetPlayer];
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    WYADownloaderViewController * vc = [[WYADownloaderViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Private Method -
-(void)downloadClick{
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    downloader.allowsCellularAccess = YES;
    
    for (WYADownloadModel * model in self.models) {
        [downloader wya_DownloadTaskWithModel:model ResultHandle:^(WYADownloadModel * resultModel, NSString * _Nonnull result) {
            NSLog(@"re==%@",result);
            [UIView wya_ShowBottomToastWithMessage:result];
        }];
    }
    
    
}

#pragma mark - Getter -
- (NSMutableArray *)models{
    if(!_models){
        _models = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
//            WYADownloadModel * model = [[WYADownloadModel alloc]init];
//            model.urlString = @"https://vdse.bdstatic.com//e509104a380c00fa8d2cb13d2fa2c1ec?authorization=bce-auth-v1%2F40f207e648424f47b2e3dfbb1014b1a5%2F2017-05-11T09%3A02%3A31Z%2F-1%2F%2F9f71c27b020218c3dc417156e4b6dc243373f6c7c1caf189ffacc83a580ca57a";
//            model.destinationPath = Path;
//            [object addObject:model];
//            WYADownloadModel * model1 = [[WYADownloadModel alloc]init];
//            model1.urlString = @"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4";
//            model1.destinationPath = OtherPath;
//            [object addObject:model1];
//            
//            WYADownloadModel * model2 = [[WYADownloadModel alloc]init];
//            model2.urlString = @"https://video.pc6.com/v/1810/pyqxxjc3.mp4";
//            [object addObject:model2];

            WYADownloadModel * model3 = [[WYADownloadModel alloc]init];
            model3.urlString = @"https://apd-be7f098cb46803543625d32da488fcbc.v.smtcdns.com/vhot2.qqvideo.tc.qq.com/AoEBhsvIR0G-OwdwjRRF0S-BpORiwZkFGqDaBhEkQOWo/b030000qq7z.p702.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=1CDED0B8B68A42BF4D8C44846B8057C6749AAEE60591590E348EF84354802EC3097B4C51BAA42DFAE7012EC2382EC1A03983B9DF9111304A2C00863DA46FE0AAB96414579EE195069D59DFE76605BC4BD7E0A8F16A504269714C8B8E95D5C2394B0395806F24EE794A19E410379D6D0C201AC399FB15AD79";
            [object addObject:model3];

//            WYADownloadModel * model4 = [[WYADownloadModel alloc]init];
//            model4.urlString = @"https://ugcydzd.qq.com/uwMRJfz-r5jAYaQXGdGnC2_ppdhgmrDlPaRvaV7F2Ic/f0377ohr6ph.p712.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=2DEC7E613D9B1A05D041731B9EF8045259DDD32301998410226BE956DDC3BCB1DA59CC3E5AC32AFD950B501330B1835D37EDA1881393A0476647FDE31B7D536C8E991B38DAA492EE01B23E2452ED5B075467398BB179DDBEFC04884F59E0009DD50B0440A8900CDCB62FC976552E8E73AB9D6627CD337911#t=4";
//            [object addObject:model4];
            object;
        });
    }
    return _models;
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
