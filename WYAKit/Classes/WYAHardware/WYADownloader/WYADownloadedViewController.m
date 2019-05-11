//
//  WYADownloadedViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadedViewController.h"
#import "WYAClearCache.h"
#import "WYADownloadBar.h"
#import "WYADownloadedCell.h"
#import "WYADownloader.h"
#import "WYANavBar.h"
#import "WYAProgressView.h"

@interface WYADownloadedViewController () <WYANavBarDelegate, UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) WYADownloader * downloader;
@property (nonatomic, strong) WYANavBar * customNavBar;
@property (nonatomic, strong) UILabel * cacheLabel;
@property (nonatomic, strong) WYAProgressView * cacheProgressView;
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) WYADownloadBar * downloadBar;
@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, assign) BOOL isAllSelect; //是否全部被选中
@property (nonatomic, strong) NSMutableArray<WYADownloadModel *> * array;
@property (nonatomic, strong) UIButton * navBarRightButton;
@end

@implementation WYADownloadedViewController
#pragma mark ======= LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.customNavBar];
    [self.view addSubview:self.cacheProgressView];
    [self.view addSubview:self.cacheLabel];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.downloadBar];
    [self setupCacheLabel];
    [self.downloader addObserver:self
                      forKeyPath:WYADownloaderCompleteArrayObserveKeyPath
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}

- (void)viewDidLayoutSubviews {
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

- (void)dealloc {
    [self.downloader removeObserver:self forKeyPath:WYADownloaderCompleteArrayObserveKeyPath];
}
#pragma mark - Private Method -
- (void)setupCacheLabel {
    //    double allMemory           = [NSString wya_phoneFreeMemory];
    [WYAClearCache wya_getDivceAvailableSizeBlock:^(NSString * _Nonnull folderSize) {
        WYADownloader * downloader = [WYADownloader sharedDownloader];
        double size                = [downloader.floder wya_fileSize] / 1024 / 1024;

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

- (void)downloadBarShow {
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGFloat downloadBar_X      = self.downloadBar.cmam_left;
                         CGFloat downloadBar_Y      = ScreenHeight - 44;
                         CGFloat downloadBar_Width  = self.downloadBar.cmam_width;
                         CGFloat downloadBar_Height = self.downloadBar.cmam_height;
                         self.downloadBar.frame     = CGRectMake(downloadBar_X, downloadBar_Y,
                                                                 downloadBar_Width, downloadBar_Height);
                     }];
}

- (void)downloadBarHidden {
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGFloat downloadBar_X      = self.downloadBar.cmam_left;
                         CGFloat downloadBar_Y      = ScreenHeight;
                         CGFloat downloadBar_Width  = self.downloadBar.cmam_width;
                         CGFloat downloadBar_Height = self.downloadBar.cmam_height;
                         self.downloadBar.frame     = CGRectMake(downloadBar_X, downloadBar_Y,
                                                                 downloadBar_Width, downloadBar_Height);
                     }];
}

#pragma mark - WYANavBarDelegate  -
- (void)wya_goBackPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)wya_rightBarButtonItemPressed:(UIButton *)sender {
    self.navBarRightButton = sender;
    sender.selected        = !sender.selected;
    if (sender.selected) {
        [sender setTitle:@"取消" forState:UIControlStateNormal];
        [self downloadBarShow];
    } else {
        [sender setTitle:@"管理" forState:UIControlStateNormal];
        [self downloadBarHidden];
    }
    self.isEdit = sender.selected;
    [self.tableView reloadData];
}

#pragma mark - KVO  -
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:WYADownloaderCompleteArrayObserveKeyPath]) {
        if ([NSThread mainThread]) {
            [self.tableView reloadData];
            if (self.loadCacheCallback) { self.loadCacheCallback(); }
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
                if (self.loadCacheCallback) { self.loadCacheCallback(); }
            });
        }
    }
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.downloader.downloadCompleteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYADownloadedCell * cell =
    [tableView dequeueReusableCellWithIdentifier:@"cell"
                                    forIndexPath:indexPath];
    cell.isEdit       = self.isEdit;
    cell.model        = self.downloader.downloadCompleteArray[indexPath.row];
    cell.isAllSelect  = self.isAllSelect;
    cell.editCallback = ^(WYADownloadModel * _Nonnull model, BOOL isDelete) {
        if (model) {
            if (isDelete) {
                [self.array wya_safeAddObject:model];
                if (self.array.count == self.downloader.downloadingArray.count) {
                    self.downloadBar.allSelect = YES;
                }
            } else {
                [self.array removeObject:model];
            }
            self.downloadBar.arrayCount = self.array.count;
        }
    };
    return cell;
}

#pragma mark - UITableViewDelegate  -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Setter -
- (void)setIsEdit:(BOOL)isEdit {
    _isEdit = isEdit;
    NSLog(@"isEdit==%d", isEdit);
}

#pragma mark - Getter -
- (UILabel *)cacheLabel {
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

- (WYAProgressView *)cacheProgressView {
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

- (WYANavBar *)customNavBar {
    if (!_customNavBar) {
        _customNavBar = ({
            WYANavBar * object = [[WYANavBar alloc] init];
            object.navTitle    = @"已完成";
            [object wya_goBackButtonWithImage:@"返回"];
            [object wya_addRightNavBarButtonWithNormalTitle:@[ @"管理" ]];
            object.delegate = self;
            object;
        });
    }
    return _customNavBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = ({
            UITableView * object =
            [[UITableView alloc] initWithFrame:self.view.frame
                                         style:UITableViewStylePlain];
            object.delegate   = self;
            object.dataSource = self;
            [object registerClass:[WYADownloadedCell class] forCellReuseIdentifier:@"cell"];
            object;
        });
    }
    return _tableView;
}

- (WYADownloadBar *)downloadBar {
    if (!_downloadBar) {
        _downloadBar = ({
            WYADownloadBar * object    = [[WYADownloadBar alloc] init];
            CGFloat downloadBar_X      = 0;
            CGFloat downloadBar_Y      = ScreenHeight;
            CGFloat downloadBar_Width  = self.view.cmam_width;
            CGFloat downloadBar_Height = 44;
            object.frame =
            CGRectMake(downloadBar_X, downloadBar_Y, downloadBar_Width, downloadBar_Height);
            object.backgroundColor = [UIColor groupTableViewBackgroundColor];
            WeakSelf(weakSelf);
            object.selectCallback = ^(WYADownloadBar * _Nonnull bar, BOOL isAllSelect) {
                StrongSelf(strongSelf);
                strongSelf.isAllSelect = isAllSelect;
                [strongSelf.tableView reloadData];

                if (isAllSelect) {
                    strongSelf.array = [strongSelf.downloader.downloadCompleteArray mutableCopy];
                } else {
                    [strongSelf.array removeAllObjects];
                }
                bar.arrayCount = strongSelf.array.count;
            };
            object.deleteCallback = ^(WYADownloadBar * _Nonnull bar) {
                StrongSelf(strongSelf);
                [strongSelf.downloader wya_removeDownloadWithSomeModel:strongSelf.array];
                bar.arrayCount = 0;
                bar.allSelect  = NO;
                [strongSelf.navBarRightButton setTitle:@"管理" forState:UIControlStateNormal];
                [strongSelf downloadBarHidden];
                strongSelf.isEdit = NO;
                [strongSelf.tableView reloadData];
            };
            object;
        });
    }
    return _downloadBar;
}

- (WYADownloader *)downloader {
    if (!_downloader) {
        _downloader = ({
            WYADownloader * object = [WYADownloader sharedDownloader];
            object;
        });
    }
    return _downloader;
}

- (NSMutableArray<WYADownloadModel *> *)array {
    if (!_array) {
        _array = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _array;
}
@end
