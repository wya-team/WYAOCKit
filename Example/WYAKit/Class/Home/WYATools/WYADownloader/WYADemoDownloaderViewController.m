//
//  WYADownloaderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADemoDownloaderViewController.h"
#import "WYADownloadCell.h"
#import "WYADownloadCompleteCell.h"

#define Path [[NSString wya_libCachePath] stringByAppendingPathComponent:@"video.mp4"]
#define OtherPath [[NSString wya_libCachePath] stringByAppendingPathComponent:@"other.mp4"]

@interface WYADemoDownloaderViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * models;
@property (nonatomic, strong) WYADownloader * downloader;

@end

@implementation WYADemoDownloaderViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/"
                   @"WYADownloader/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    WeakSelf(weakSelf);
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"下载视频" forState:UIControlStateNormal];
    [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    button.titleLabel.font = FONT(15);
    [button setBackgroundImage:[UIImage wya_createImageWithColor:BLUECOLOR]
                      forState:UIControlStateNormal];
    [button addCallBackAction:^(UIButton * button) {
        for (WYADownloadModel * model in weakSelf.models) {
            [weakSelf.downloader wya_DownloadTaskWithModel:model
                                              ResultHandle:^(WYADownloadModel * resultModel,
                                                             NSString * _Nonnull result) {
                                                  NSLog(@"re==%@", result);
                                                  [UIView wya_showBottomToastWithMessage:result];
                                              }];
        }
    }];
    [self.view addSubview:button];
    CGFloat button_X      = (ScreenWidth - 100 * SizeAdapter) / 2;
    CGFloat button_Y      = WYATopHeight + 20 * SizeAdapter;
    CGFloat button_Width  = 100 * SizeAdapter;
    CGFloat button_Height = 44 * SizeAdapter;
    button.frame          = CGRectMake(button_X, button_Y, button_Width, button_Height);

    self.tableView            = [[UITableView alloc] init];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WYADownloadCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[WYADownloadCompleteCell class]
           forCellReuseIdentifier:@"completeCell"];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    CGFloat tableView_X            = 0;
    CGFloat tableView_Y            = CGRectGetMaxY(button.frame) + 20 * SizeAdapter;
    CGFloat tableView_Width        = ScreenWidth;
    CGFloat tableView_Height       = ScreenHeight - tableView_Y;
    self.tableView.frame           = CGRectMake(tableView_X, tableView_Y, tableView_Width, tableView_Height);

    [self.downloader addObserver:self
                      forKeyPath:WYADownloaderDownloadArrayObserveKeyPath
                         options:NSKeyValueObservingOptionNew
                         context:nil];
    [self.downloader addObserver:self
                      forKeyPath:WYADownloaderCompleteArrayObserveKeyPath
                         options:NSKeyValueObservingOptionNew
                         context:nil];
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.downloader.downloadingArray.count;
    } else {
        return self.downloader.downloadCompleteArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        WYADownloadCell * cell =
        [tableView dequeueReusableCellWithIdentifier:@"cell"
                                        forIndexPath:indexPath];
        return cell;
    } else {
        WYADownloadCompleteCell * cell =
        [tableView dequeueReusableCellWithIdentifier:@"completeCell"
                                        forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - UITableViewDelegate  -
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        WYADownloadCell * downloadCell = (WYADownloadCell *)cell;
        downloadCell.model             = self.downloader.downloadingArray[indexPath.row];
        cell.selectionStyle            = UITableViewCellSelectionStyleNone;
    } else {
        WYADownloadCompleteCell * completeCell = (WYADownloadCompleteCell *)cell;
        completeCell.model                     = self.downloader.downloadCompleteArray[indexPath.row];
        cell.selectionStyle                    = UITableViewCellSelectionStyleNone;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView
         titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return self.downloader.downloadingArray.count > 0 ? @"下载中" : @"";
    } else {
        return self.downloader.downloadCompleteArray.count > 0 ? @"已完成" : @"";
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60 * SizeAdapter;
    }
    return 80 * SizeAdapter;
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.section == 1) {
            WYADownloadCompleteCell * cell = [tableView cellForRowAtIndexPath:indexPath];
            [self.downloader wya_removeDownloadWithModel:cell.model];
            cell.model = nil;
        }
        [tableView reloadData];
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark - KVO  -
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:WYADownloaderDownloadArrayObserveKeyPath] ||
        [keyPath isEqualToString:WYADownloaderCompleteArrayObserveKeyPath]) {
        if ([[NSThread currentThread] isMainThread]) {
            [self.tableView reloadData];
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{ [self.tableView reloadData]; });
        }
    }
}

#pragma mark - Getter -
- (WYADownloader *)downloader
{
    if (!_downloader) {
        _downloader = ({
            WYADownloader * object      = [WYADownloader sharedDownloader];
            object.allowsCellularAccess = YES;
            object;
        });
    }
    return _downloader;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Getter -
- (NSMutableArray *)models
{
    if (!_models) {
        _models = ({
            NSMutableArray * object  = [[NSMutableArray alloc] init];
            WYADownloadModel * model = [[WYADownloadModel alloc] init];
            model.urlString          = [@"https://vdse.bdstatic.com//"
                               @"e509104a380c00fa8d2cb13d2fa2c1ec?authorization=bce-auth-v1%"
                               @"2F40f207e648424f47b2e3dfbb1014b1a5%2F2017-05-11T09%3A02%3A31Z%2F-"
                               @"1%2F%"
                               @"2F9f71c27b020218c3dc417156e4b6dc243373f6c7c1caf189ffacc83a580ca57"
                               @"a" stringByRemovingPercentEncoding];
            [object addObject:model];

            WYADownloadModel * model1 = [[WYADownloadModel alloc] init];
            model1.urlString          = @"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/"
                               @"sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4";
            [object addObject:model1];

            WYADownloadModel * model2 = [[WYADownloadModel alloc] init];
            model2.urlString          = @"https://video.pc6.com/v/1810/pyqxxjc3.mp4";
            [object addObject:model2];

            object;
        });
    }
    return _models;
}

- (void)dealloc
{
    [self.downloader removeObserver:self forKeyPath:WYADownloaderDownloadArrayObserveKeyPath];
    [self.downloader removeObserver:self forKeyPath:WYADownloaderCompleteArrayObserveKeyPath];
}

// WYADownloadModel * model3 = [[WYADownloadModel alloc]init];
// model3.urlString =
// @"https://apd-be7f098cb46803543625d32da488fcbc.v.smtcdns.com/vhot2.qqvideo.tc.qq.com/AoEBhsvIR0G-OwdwjRRF0S-BpORiwZkFGqDaBhEkQOWo/b030000qq7z.p702.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=1CDED0B8B68A42BF4D8C44846B8057C6749AAEE60591590E348EF84354802EC3097B4C51BAA42DFAE7012EC2382EC1A03983B9DF9111304A2C00863DA46FE0AAB96414579EE195069D59DFE76605BC4BD7E0A8F16A504269714C8B8E95D5C2394B0395806F24EE794A19E410379D6D0C201AC399FB15AD79";
//[object addObject:model3];
//
// WYADownloadModel * model4 = [[WYADownloadModel alloc]init];
// model4.urlString =
// @"https://ugcydzd.qq.com/uwMRJfz-r5jAYaQXGdGnC2_ppdhgmrDlPaRvaV7F2Ic/f0377ohr6ph.p712.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=2DEC7E613D9B1A05D041731B9EF8045259DDD32301998410226BE956DDC3BCB1DA59CC3E5AC32AFD950B501330B1835D37EDA1881393A0476647FDE31B7D536C8E991B38DAA492EE01B23E2452ED5B075467398BB179DDBEFC04884F59E0009DD50B0440A8900CDCB62FC976552E8E73AB9D6627CD337911#t=4";
//[object addObject:model4];

@end
