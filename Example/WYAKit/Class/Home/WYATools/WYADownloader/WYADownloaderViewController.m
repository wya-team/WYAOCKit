//
//  WYADownloaderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADownloaderViewController.h"
#import "WYADownloadCell.h"
#import "WYADownloadCompleteCell.h"
@interface WYADownloaderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) WYADownloader * downloader;


@end

@implementation WYADownloaderViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/WYADownloader/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight-WYABottomHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WYADownloadCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[WYADownloadCompleteCell class] forCellReuseIdentifier:@"completeCell"];
    [self.view addSubview:self.tableView];
    
    [self.downloader addObserver:self forKeyPath:WYADownloaderDownloadArrayObserveKeyPath options:NSKeyValueObservingOptionNew context:nil];
    [self.downloader addObserver:self forKeyPath:WYADownloaderCompleteArrayObserveKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

-(void)wya_goBack{
    [super wya_goBack];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.downloader.downloadingArray.count;
    }else {
        return self.downloader.downloadCompleteArray.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WYADownloadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }else{
        WYADownloadCompleteCell * cell = [tableView dequeueReusableCellWithIdentifier:@"completeCell" forIndexPath:indexPath];
        return cell;
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        WYADownloadCell * downloadCell = (WYADownloadCell *)cell;
        downloadCell.model = self.downloader.downloadingArray[indexPath.row];
        downloadCell.actionHandle = ^(NSInteger index){
            switch (index) {
                case 0:
                    [self startDownloadWithIndex:indexPath.row];
                    break;
                case 1:
                    
                    break;
                case 2:
                    [self suspendDownloadWithIndex:indexPath.row];
                    break;
                case 3:
                    [self keepDownloadWithIndex:indexPath.row];
                    break;
                case 4:
                    //完成
                    break;
                case 5:
                    //失败
                    break;
                default:
                    break;
            }
            
        };
    }else{
        WYADownloadCompleteCell * completeCell = (WYADownloadCompleteCell *)cell;
        completeCell.model = self.downloader.downloadCompleteArray[indexPath.row];
    }
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"下载中";
    } else {
        return @"已完成";
    }
}
/**
 开始下载

 @param index 索引
 */
-(void)startDownloadWithIndex:(NSInteger)index{
    
    
}

/**
 暂停下载

 @param index 索引
 */
-(void)suspendDownloadWithIndex:(NSInteger)index{
    
}

/**
 继续下载

 @param index 索引
 */
-(void)keepDownloadWithIndex:(NSInteger)index{
    
}

/**
 移除下载

 @param index 索引
 */
-(void)removeDownloadWithIndex:(NSInteger)index{
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:WYADownloaderDownloadArrayObserveKeyPath] || [keyPath isEqualToString:WYADownloaderCompleteArrayObserveKeyPath]) {
        if ([[NSThread currentThread] isMainThread]) {
            [self.tableView reloadData];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }
}

- (WYADownloader *)downloader{
    if(!_downloader){
        _downloader = ({
            WYADownloader * object = [WYADownloader sharedDownloader];
            object;
        });
    }
    return _downloader;
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
