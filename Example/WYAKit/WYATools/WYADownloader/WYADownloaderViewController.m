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
    WYADownloadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    WYADownloadCell * downloadCell = (WYADownloadCell *)cell;
    if (indexPath.section == 0) {
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
        downloadCell.model = self.downloader.downloadCompleteArray[indexPath.row];
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
    
    [self.downloader wya_DownloadTaskWithModel:self.downloader.downloadingArray[index] ResultHandle:^(NSString * _Nonnull result) {
        NSLog(@"result=%@",result);
    }];
}

/**
 暂停下载

 @param index 索引
 */
-(void)suspendDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_suspendDownloadWithModel:self.downloader.downloadingArray[index]];
}

/**
 继续下载

 @param index 索引
 */
-(void)keepDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_keepDownloadWithModel:self.downloader.downloadingArray[index]];
}

/**
 移除下载

 @param index 索引
 */
-(void)removeDownloadWithIndex:(NSInteger)index{
    [self.downloader wya_giveupDownloadWithModel:self.downloader.downloadingArray[index]];
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
            
            WYADownloadModel * model2 = [[WYADownloadModel alloc]init];
            model2.urlString = @"https://video.pc6.com/v/1810/pyqxxjc3.mp4";
            [object addObject:model2];
            
            WYADownloadModel * model3 = [[WYADownloadModel alloc]init];
            model3.urlString = @"https://apd-be7f098cb46803543625d32da488fcbc.v.smtcdns.com/vhot2.qqvideo.tc.qq.com/AoEBhsvIR0G-OwdwjRRF0S-BpORiwZkFGqDaBhEkQOWo/b030000qq7z.p702.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=1CDED0B8B68A42BF4D8C44846B8057C6749AAEE60591590E348EF84354802EC3097B4C51BAA42DFAE7012EC2382EC1A03983B9DF9111304A2C00863DA46FE0AAB96414579EE195069D59DFE76605BC4BD7E0A8F16A504269714C8B8E95D5C2394B0395806F24EE794A19E410379D6D0C201AC399FB15AD79";
            [object addObject:model3];
            
            WYADownloadModel * model4 = [[WYADownloadModel alloc]init];
            model4.urlString = @"https://ugcydzd.qq.com/uwMRJfz-r5jAYaQXGdGnC2_ppdhgmrDlPaRvaV7F2Ic/f0377ohr6ph.p712.1.mp4?sdtfrom=v1010&guid=190311d5693f25480207bbe135ce28b0&vkey=2DEC7E613D9B1A05D041731B9EF8045259DDD32301998410226BE956DDC3BCB1DA59CC3E5AC32AFD950B501330B1835D37EDA1881393A0476647FDE31B7D536C8E991B38DAA492EE01B23E2452ED5B075467398BB179DDBEFC04884F59E0009DD50B0440A8900CDCB62FC976552E8E73AB9D6627CD337911#t=4";
            [object addObject:model4];
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
