//
//  WYADownloaderViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloaderViewController.h"
#import "WYAClearCache.h"
#import "WYADownloadModel.h"
#import "WYADownloadedViewController.h"
#import "WYADownloader.h"
#import "WYADownloader.h"
#import "WYADownloaderCell.h"
#import "WYADownloadingViewController.h"
#import "WYANavBar.h"
#import "WYAProgressView.h"

@interface WYADownloaderViewController () <WYANavBarDelegate, UITableViewDelegate,
                                           UITableViewDataSource>
@property (nonatomic, strong) WYANavBar * customNavBar;
@property (nonatomic, strong) UILabel * cacheLabel;
@property (nonatomic, strong) WYAProgressView * cacheProgressView;
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYADownloaderViewController
#pragma mark ======= LifeCircle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.customNavBar];
    [self.view addSubview:self.cacheProgressView];
    [self.view addSubview:self.cacheLabel];
    [self.view addSubview:self.tableView];
    [self setupCacheLabel];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGFloat customNavBar_X      = 0;
    CGFloat customNavBar_Y      = 0;
    CGFloat customNavBar_Width  = ScreenWidth;
    CGFloat customNavBar_Height = WYATopHeight;
    self.customNavBar.frame =
    CGRectMake(customNavBar_X, customNavBar_Y, customNavBar_Width, customNavBar_Height);

    CGFloat cacheLabel_X      = 0;
    CGFloat cacheLabel_Y      = self.view.cmam_height - 30 - WYABottomHeight;
    CGFloat cacheLabel_Width  = ScreenWidth;
    CGFloat cacheLabel_Height = 30;
    self.cacheLabel.frame =
    CGRectMake(cacheLabel_X, cacheLabel_Y, cacheLabel_Width, cacheLabel_Height);

    CGFloat tableView_X     = 0;
    CGFloat tableView_Y     = WYATopHeight;
    CGFloat tableView_Width = ScreenWidth;
    CGFloat tableView_Height =
    self.view.cmam_height - WYATopHeight - self.cacheLabel.cmam_height - WYABottomHeight;
    self.tableView.frame = CGRectMake(tableView_X, tableView_Y, tableView_Width, tableView_Height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======= Private Method
- (void)setupCacheLabel
{
    //    double allMemory           = [NSString wya_phoneFreeMemory];
    [WYAClearCache wya_getDivceAvailableSizeBlock:^(NSString * _Nonnull folderSize) {
        WYADownloader * downloader = [WYADownloader sharedDownloader];
        double size                = [UIDevice wya_fileSizeWithPath:downloader.floder] / 1024 / 1024;

        NSString * useSize = [NSString stringWithFormat:@"%2.fM", size];
        NSString * string  = [NSString stringWithFormat:@"已下载%@,可用空间%@", useSize, folderSize];
        NSMutableAttributedString * text =
        [[NSMutableAttributedString alloc] initWithString:string];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor redColor]
                     range:[string rangeOfString:useSize]];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor redColor]
                     range:[string rangeOfString:folderSize]];
        self.cacheLabel.attributedText = text;
    }];

    //    self.cacheProgressView.progress = (size / 1024) / allMemory;
}

#pragma mark - WYANavBarDelegate  -
- (void)wya_goBackPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYADownloaderCell * cell =
    [tableView dequeueReusableCellWithIdentifier:@"cell"
                                    forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.titleLabel.text = @"下载中";
        cell.fileNumberLabel.text =
        [NSString stringWithFormat:@"当前%d个任务正在下载",
                                   [WYADownloader sharedDownloader].downloadingArray.count];
    } else {
        cell.titleLabel.text      = @"已完成";
        cell.fileNumberLabel.text = [NSString
        stringWithFormat:@"已下载%d个文件",
                         [WYADownloader sharedDownloader].downloadCompleteArray.count];
    }
    return cell;
}

#pragma mark - UITableViewDelegate  -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90 * SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        WYADownloadingViewController * vc = [[WYADownloadingViewController alloc] init];
        WeakSelf(weakSelf);
        vc.loadCacheCallback = ^{ [weakSelf setupCacheLabel]; };
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        WYADownloadedViewController * vc = [[WYADownloadedViewController alloc] init];
        WeakSelf(weakSelf);
        vc.loadCacheCallback = ^{ [weakSelf setupCacheLabel]; };
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Getter -
- (UILabel *)cacheLabel
{
    if (!_cacheLabel) {
        _cacheLabel = ({
            UILabel * object       = [[UILabel alloc] init];
            object.backgroundColor = [UIColor clearColor];
            object.textAlignment   = NSTextAlignmentCenter;
            object;
        });
    }
    return _cacheLabel;
}

- (WYAProgressView *)cacheProgressView
{
    if (!_cacheProgressView) {
        _cacheProgressView = ({
            CGFloat cacheLabel_X      = 0;
            CGFloat cacheLabel_Y      = self.view.cmam_height - 30 - WYABottomHeight;
            CGFloat cacheLabel_Width  = ScreenWidth;
            CGFloat cacheLabel_Height = 30;
            CGRect rect =
            CGRectMake(cacheLabel_X, cacheLabel_Y, cacheLabel_Width, cacheLabel_Height);
            WYAProgressView * object =
            [[WYAProgressView alloc] initWithFrame:rect
                                 progressViewStyle:WYAProgressViewStyleStraight];
            object.progressTintColor = [UIColor redColor];
            object.trackTintColor    = random(244, 244, 244, 1);
            object;
        });
    }
    return _cacheProgressView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object =
            [[UITableView alloc] initWithFrame:CGRectZero
                                         style:UITableViewStylePlain];
            object.delegate   = self;
            object.dataSource = self;
            [object registerClass:[WYADownloaderCell class] forCellReuseIdentifier:@"cell"];
            object;
        });
    }
    return _tableView;
}

- (WYANavBar *)customNavBar
{
    if (!_customNavBar) {
        _customNavBar = ({
            WYANavBar * object = [[WYANavBar alloc] init];
            object.navTitle    = @"下载管理器";
            [object wya_goBackButtonWithImage:@"返回"];
            object.delegate = self;
            object;
        });
    }
    return _customNavBar;
}
@end
