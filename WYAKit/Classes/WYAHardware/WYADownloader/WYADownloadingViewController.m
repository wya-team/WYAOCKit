//
//  WYADownloadingViewController.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadingViewController.h"
#import "WYADownloader.h"
#import "WYADownloadingCell.h"

@interface WYADownloadingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) WYADownloader * downloader;

@end

@implementation WYADownloadingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];

    [self.downloader addObserver:self forKeyPath:WYADownloaderDownloadArrayObserveKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - KVO  -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:WYADownloaderDownloadArrayObserveKeyPath]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            if (self.loadCacheCallback) {
                self.loadCacheCallback();
            }
        });
    }
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.downloader.downloadingArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYADownloadingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate  -
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYADownloadingCell * downloadCell = (WYADownloadingCell *)cell;
    if (self.downloader.downloadingArray.count > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            downloadCell.model = self.downloader.downloadingArray[indexPath.row];
        });
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
    WYADownloader * downloader = [WYADownloader sharedDownloader];
    WYADownloadingCell * cell  = [tableView cellForRowAtIndexPath:indexPath];
    switch (cell.model.downloadState) {
        case WYADownloadStateDownloading: {
            [downloader wya_suspendDownloadWithModel:cell.model];
        } break;
        case WYADownloadStateSuspend: {
            [downloader wya_keepDownloadWithModel:cell.model];
        } break;
        default:
            break;
    }
}

#pragma mark - Getter -
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
            object.delegate      = self;
            object.dataSource    = self;
            [object registerClass:[WYADownloadingCell class] forCellReuseIdentifier:@"cell"];
            object;
        });
    }
    return _tableView;
}

- (WYADownloader *)downloader
{
    if (!_downloader) {
        _downloader = ({
            WYADownloader * object = [WYADownloader sharedDownloader];
            object;
        });
    }
    return _downloader;
}

- (void)dealloc
{
    [self.downloader removeObserver:self forKeyPath:WYADownloaderDownloadArrayObserveKeyPath];
}

@end
