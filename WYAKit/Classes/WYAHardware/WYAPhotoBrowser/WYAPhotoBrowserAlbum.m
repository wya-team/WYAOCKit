//
//  WYAPhotoBrowser.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoBrowserAlbum.h"
#import <Photos/Photos.h>
#import "WYAPhotoBrowserManager.h"

@interface WYAPhotoBrowserAlbum ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * table;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) NSMutableArray * images;

@end

@implementation WYAPhotoBrowserAlbum

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//
    self.title = @"照片";
    self.images = [NSMutableArray array];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    self.table = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.backgroundColor = [UIColor whiteColor];
    self.table.rowHeight = 60 * SizeAdapter;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource.count>0) {
        PHAssetCollection * collection = self.dataSource[indexPath.row];
        PHFetchResult * smartSubResult = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
        cell.textLabel.text = [NSString stringWithFormat:@"%@(%lu)",collection.localizedTitle,(unsigned long)smartSubResult.count];
        cell.imageView.image = [UIImage loadBundleImage:@"mistake" ClassName:NSStringFromClass(self.class)];
        if (self.images.count>0) {
            id object = self.images[indexPath.row];
            if ([object isKindOfClass:[UIImage class]]) {
                UIImage * image = (UIImage *)object;
                cell.imageView.image = image;
            }
        }
        id obj = [smartSubResult firstObject];
        
        if (obj) {
            if ([obj isKindOfClass:[PHAsset class]]) {
                PHAsset * asset = (PHAsset *)obj;
                PHImageManager * manager = [PHImageManager defaultManager];
                //                PHImageRequestOptions * opi = [[PHImageRequestOptions alloc]init];
                //                opi.resizeMode = PHImageRequestOptionsResizeModeFast;
                //                opi.deliveryMode = PHImageRequestOptionsDeliveryModeFastFormat;
                [manager requestImageForAsset:asset targetSize:CGSizeMake(30*SizeAdapter, 30*SizeAdapter) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.imageView.image = result;
                        if (result) {
                            [self.images addObject:result];
                        }else{
                            [self.images addObject:@""];
                        }
                    });
                    NSLog(@"result==%@",result);
                    NSLog(@"info==%@",info);
                }];
            }
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        PHAssetCollection * collection = self.dataSource[indexPath.row];
}


- (NSMutableArray *)dataSource{
    NSMutableArray * systemArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeUserLibrary CollectionSort:AssetCollectionEndDate]; //相机胶卷
    NSMutableArray * videoArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeVideo CollectionSort:AssetCollectionEndDate]; //视频
    NSMutableArray * screenshortArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeScreenshots CollectionSort:AssetCollectionEndDate]; //截图
    NSMutableArray * addArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeRecentlyAdded CollectionSort:AssetCollectionEndDate]; //最近添加
    NSMutableArray * livePhotoArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeLivePhotos CollectionSort:AssetCollectionEndDate]; //实况照片
    NSMutableArray * userArray = [WYAPhotoBrowserManager screenAssetCollectionWithFilter:AssetCollectionTypeAlbum AssetCollectionSubType:AssetCollectionSubTypeAlbumRegular CollectionSort:AssetCollectionEndDate];
    
    
    NSMutableArray * allArray = [NSMutableArray arrayWithCapacity:0];
    [allArray addObjectsFromArray:systemArray];
    [allArray addObjectsFromArray:videoArray];
    [allArray addObjectsFromArray:screenshortArray];
    [allArray addObjectsFromArray:addArray];
    [allArray addObjectsFromArray:livePhotoArray];
    [allArray addObjectsFromArray:userArray];
    _dataSource = allArray;
    return _dataSource;
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
