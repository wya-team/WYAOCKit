//
//  WYADownloaderViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYADownloaderViewController.h"
#import "WYADownloadCell.h"

#define Path [[NSString wya_libCachePath] stringByAppendingPathComponent:@"xxx.mp4"]
#define OtherPath [[NSString wya_libCachePath] stringByAppendingPathComponent:@"other.mp4"]
@interface WYADownloaderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * models;
@property (nonatomic, strong) WYADownloader * downloader;
@end

@implementation WYADownloaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight-WYABottomHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WYADownloadCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
}

-(void)wya_goBack{
    [super wya_goBack];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WYADownloadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    WYADownloadCell * downloadCell = (WYADownloadCell *)cell;
    downloadCell.model = self.models[indexPath.row];
    downloadCell.actionHandle = ^(BOOL select){
        if (select) {
            if (downloadCell.model.downloadState == WYADownloadStateSuspend) {
                [self keepDownloadWithIndex:indexPath.row];
            }else{
                [self startDownloadWithIndex:indexPath.row];
            }
            
        } else {
            [self suspendDownloadWithIndex:indexPath.row];
        }
        
    };
}

/**
 开始下载

 @param index 索引
 */
-(void)startDownloadWithIndex:(NSInteger)index{
    
    [self.downloader wya_DownloadTaskWithModel:self.models[index]];
}

/**
 暂停下载

 @param index 索引
 */
-(void)suspendDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_suspendDownloadWithModel:self.models[index]];
}

/**
 继续下载

 @param index 索引
 */
-(void)keepDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_keepDownloadWithModel:self.models[index]];
}

/**
 移除下载

 @param index 索引
 */
-(void)removeDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_giveupDownloadWithModel:self.models[index]];
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

- (NSMutableArray *)models{
    if(!_models){
        _models = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            WYADownloadModel * model = [[WYADownloadModel alloc]init];
            model.urlString = @"https://vdse.bdstatic.com//e509104a380c00fa8d2cb13d2fa2c1ec?authorization=bce-auth-v1%2F40f207e648424f47b2e3dfbb1014b1a5%2F2017-05-11T09%3A02%3A31Z%2F-1%2F%2F9f71c27b020218c3dc417156e4b6dc243373f6c7c1caf189ffacc83a580ca57a";
            model.destinationPath = Path;
            [object addObject:model];
            WYADownloadModel * model1 = [[WYADownloadModel alloc]init];
            model1.urlString = @"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4";
            model1.destinationPath = OtherPath;
            [object addObject:model1];
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
