//
//  WYAPhotoBrowser.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserAlbum.h"
#import "WYAPhotoBrowserAlbumCell.h"
#import "WYAPhotoBrowserManager.h"
#import "WYAPhotoBrowserViewController.h"
#import <Photos/Photos.h>
#import "WYAPhotoBrowserAlbumModel.h"
@interface WYAPhotoBrowserAlbum () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * table;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation WYAPhotoBrowserAlbum
#pragma mark ======= LifeCircle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setupUI];
    [self photoAlbum];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WYAPhotoBrowserViewController * vc = [[WYAPhotoBrowserViewController alloc] init];
    vc.maxCount                        = self.maxCount;
    vc.photoBrowserType                = self.photoBrowserType;
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark ======= UI
-(void)setupUI{
    self.title                 = @"照片";
    self.view.backgroundColor  = [UIColor colorWithWhite:0.2 alpha:0.5];

    [self.view addSubview:self.table];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    button.frame           = CGRectMake(0, 0, 40, 30);
    button.titleLabel.font = FONT(15);
    [button addCallBackAction:^(UIButton * button) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)configModelWithIndexPath:(NSIndexPath *)indexPath modelBlock:(void(^)(WYAPhotoBrowserAlbumModel * model))modelBlock{
    WYAPhotoBrowserAlbumModel * model = [[WYAPhotoBrowserAlbumModel alloc]init];
    NSMutableArray * array               = self.dataSource[indexPath.row];
    PHAssetCollection * collection       = [array firstObject];
    PHFetchResult * smartSubResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
    model.title = [NSString stringWithFormat:@"%@(%lu)", collection.localizedTitle,(unsigned long)smartSubResult.count];

    id obj = [smartSubResult lastObject];

    if (obj) {
        if ([obj isKindOfClass:[PHAsset class]]) {
            PHAsset * asset          = (PHAsset *)obj;
            PHImageManager * manager = [PHImageManager defaultManager];
            PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
            options.synchronous = NO; //默认no，异步加载
            options.resizeMode = PHImageRequestOptionsResizeModeFast;
            options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
            // 从iCloud上下载图片
            options.networkAccessAllowed = YES;
            // 图片获取进度
            options.progressHandler = ^(double progress, NSError * _Nullable error, BOOL * _Nonnull stop, NSDictionary * _Nullable info) {
                NSLog(@"progress==%f,errror==%@,stop==%d,info==%@", progress, [error localizedDescription], *stop, info);
            };
            [manager requestImageForAsset:asset
                               targetSize:CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter)
                              contentMode:PHImageContentModeAspectFit
                                  options:options
                            resultHandler:^(UIImage * _Nullable result,
                                            NSDictionary * _Nullable info) {
                                model.image = result;
                                modelBlock(model);
                            }];
        }
    }
}

#pragma mark ======= Private Method
- (void)photoAlbum {
    //相机胶卷
    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeUserLibrary
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];
    //视频
    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeVideo
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];
    //截图
    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeScreenshots
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];
    //最近添加
    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeRecentlyAdded
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];
    //实况照片
    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeLivePhotos
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];

    [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeAlbum
                                     AssetCollectionSubType:AssetCollectionSubTypeAlbumRegular
                                             CollectionSort:AssetCollectionEndDate
                                      assertCollectionBlock:^(NSMutableArray<PHAssetCollection *> *collections) {
                                          [self.dataSource addObject:collections];
                                          [self.table reloadData];
                                      }];
}

#pragma mark ======= UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserAlbumCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self configModelWithIndexPath:indexPath modelBlock:^(WYAPhotoBrowserAlbumModel *model) {
        cell.model = model;
    }];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSMutableArray * arr             = self.dataSource[indexPath.row];
    NSMutableArray * collectionArray = [NSMutableArray array];
    for (PHAssetCollection * collection in arr) {
        PHFetchResult * smartSubResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
        if (smartSubResult.count > 0) {
            [collectionArray addObject:collection];
        }
    }

    WYAPhotoBrowserViewController * vc = [[WYAPhotoBrowserViewController alloc] init];
    vc.collections                     = collectionArray;
    vc.maxCount                        = self.maxCount;
    vc.photoBrowserType                = self.photoBrowserType;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ======= Getter
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _dataSource;
}

- (UITableView *)table{
    if(!_table){
        _table = ({
            UITableView * object       = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
            object.dataSource      = self;
            object.delegate        = self;
            object.backgroundColor = [UIColor whiteColor];
            object.rowHeight       = 60 * SizeAdapter;
            [object registerClass:[WYAPhotoBrowserAlbumCell class] forCellReuseIdentifier:@"cell"];
            object;
       });
    }
    return _table;
}

@end
