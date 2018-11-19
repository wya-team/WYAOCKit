//
//  ImagePickerViewController.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/14.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

/*
 PHAsset: 代表照片库中的一个资源，跟 ALAsset 类似，通过 PHAsset 可以获取和保存资源
 PHFetchOptions: 获取资源时的参数，可以传 nil，即使用系统默认值
 PHAssetCollection: PHCollection 的子类，表示一个相册或者一个时刻，或者是一个「智能相册（系统提供的特定的一系列相册，例如：最近删除，视频列表，收藏等等，如下图所示）
 PHFetchResult: 表示一系列的资源结果集合，也可以是相册的集合，从?PHCollection 的类方法中获得
 PHImageManager: 用于处理资源的加载，加载图片的过程带有缓存处理，可以通过传入一个 PHImageRequestOptions 控制资源的输出尺寸等规格
 PHImageRequestOptions: 如上面所说，控制加载图片时的一系列参数
*/

//PHAssetCollectionType  相簿类型(手机相册APP中三个分组)
// PHAssetCollectionTypeAlbum          (可能是自己创建的相册)
// PHAssetCollectionTypeSmartAlbum     （相簿）
// PHAssetCollectionTypeMoment          (照片)

//PHAssetCollectionSubtype 子类型
    //PHAssetCollectionTypeAlbum regular subtypes
        // PHAssetCollectionSubtypeAlbumRegular (用户相册，照片APP中的相册)
    //PHAssetCollectionTypeAlbum shared subtypes
        // PHAssetCollectionSubtypeAlbumMyPhotoStream
    //PHAssetCollectionTypeSmartAlbum subtypes
        //  PHAssetCollectionSubtypeSmartAlbumGeneric

//获取用户创建的所有相册
//    PHFetchResult *topLevelUserCollections = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
//
//    for (NSInteger tag = 0; tag<topLevelUserCollections.count; tag++) {
//        PHCollectionList * list = topLevelUserCollections[tag];
//        NSLog(@"listName==%@",list.localizedLocationNames);
//    }
//
//    // 获取所有资源的集合，并按资源的创建时间排序（默认选择的是PHAssetSourceTypeUserLibrary）
//    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
//    NSLog(@"ass==%@,ass.count==%d ",assetsFetchResults, assetsFetchResults.count);

#import "WYAPhotoBrowserViewController.h"
#import <Photos/Photos.h>
#import "WYAPhotoBrowserCell.h"


#import "controlView.h"
#import "WYAPhotoTypeView.h"
#import "WYAPhotoBrowserManager.h"

@interface WYAPhotoBrowserViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, ImageTypeDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) NSMutableDictionary * cells;
@property (nonatomic, strong) controlView * controlV;
@property (nonatomic, strong) NSMutableArray * images;
@property (nonatomic, strong) WYAPhotoTypeView * typeView;
@property (nonatomic, strong) NSMutableArray * datas;
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) WYAPhotoBrowserManager * imagePickerManager;
@end

@implementation WYAPhotoBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册胶卷";
    self.navigationItem.titleView = self.button;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self.view addSubview:self.controlV];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-WYATopHeight-49);

    [self.view addSubview:self.typeView];
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.dataSource = [self.imagePickerManager screenAssetWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeAny CollectionSort:AssetCollectionEndDate assetSort:AssetModificationDate];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    });
    
    
    [self.typeView reload];
    [self performBlock];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(WYAPhotoBrowserManager *)imagePickerManager{
    if (!_imagePickerManager) {
        _imagePickerManager = [[WYAPhotoBrowserManager alloc]init];
    }
    return _imagePickerManager;
}

- (NSMutableDictionary *)cells{
    if (!_cells) {
        _cells = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _cells;
}

- (NSMutableArray *)images{
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray arrayWithCapacity:0];
    }
    return _datas;
}

- (controlView *)controlV{
    if (!_controlV) {
        _controlV = [[controlView alloc]initWithFrame:CGRectMake(0, ScreenHeight-WYATopHeight-49, ScreenWidth, 49)];
    }
    return _controlV;
}

-(WYAPhotoTypeView *)typeView{
    if (!_typeView) {
        _typeView = [[WYAPhotoTypeView alloc]initWithFrame:self.view.frame];
        _typeView.hidden = YES;
        _typeView.delegate = self;
    }
    return _typeView;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSizeMake((ScreenWidth-5)/4, (ScreenWidth-5)/4);
        layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[WYAPhotoBrowserCell class] forCellWithReuseIdentifier:@"image"];
    }
    return _collectionView;
}

-(UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"相机胶卷" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        _button.bounds = CGRectMake(0, 0, 50, 30);
        [_button addTarget:self action:@selector(switchImageType) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

#pragma mark --- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WYAPhotoBrowserCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0){
    WYAPhotoBrowserCell * imageCell = (WYAPhotoBrowserCell *)cell;
    imageCell.model = self.dataSource[indexPath.row];
    __block WYAPhotoBrowserCell * pickCell = imageCell;
    imageCell.selectImage = ^(BOOL seleted) {
        
        if (seleted) {
            if (self.images.count >= self.maxCount) {
                [self showAlert];
                [pickCell uncheckButton];
                [self.images removeObject:pickCell.imageV.image];
                return ;
            }
            [self.images addObject:pickCell.imageV.image];
        }else{
            [pickCell uncheckButton];
            [self.images removeObject:pickCell.imageV.image];
        }
    };
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    ImageCollectionViewCell * cell = (ImageCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    WYAPhotoBrowserCell * cell = (WYAPhotoBrowserCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    WYAImageScrollViewController * vc = [[WYAImageScrollViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)showAlert{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:@"您已选择最大个数，请删除后继续添加" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)performBlock{
    self.controlV.previewBlock = ^{
        
    };
    
    self.controlV.doneBlock = ^{
        if (self.selectedImages) {
            self.selectedImages(self.images);
        }
    };
}

- (void)switchImageType{
    self.typeView.hidden = NO;
    
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    for (PHAssetCollection * col  in self.datas) {
        NSLog(@"col==%@",col);
        [array addObject:col];
    }
//    self.typeView.dataSource = array;
}

- (NSMutableArray *)imageTypeDatas{
    NSMutableArray * systemArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeUserLibrary CollectionSort:AssetCollectionEndDate]; //相机胶卷
    NSMutableArray * videoArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeVideo CollectionSort:AssetCollectionEndDate]; //视频
    NSMutableArray * screenshortArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeScreenshots CollectionSort:AssetCollectionEndDate]; //截图
    NSMutableArray * addArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeRecentlyAdded CollectionSort:AssetCollectionEndDate]; //最近添加
    NSMutableArray * livePhotoArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeLivePhotos CollectionSort:AssetCollectionEndDate]; //实况照片
    NSMutableArray * userArray = [self.imagePickerManager screenAssetCollectionWithFilter:AssetCollectionTypeAlbum AssetCollectionSubType:AssetCollectionSubTypeAlbumRegular CollectionSort:AssetCollectionEndDate];
    
    
    NSMutableArray * allArray = [NSMutableArray arrayWithCapacity:0];
    [allArray addObjectsFromArray:systemArray];
    [allArray addObjectsFromArray:videoArray];
    [allArray addObjectsFromArray:screenshortArray];
    [allArray addObjectsFromArray:addArray];
    [allArray addObjectsFromArray:livePhotoArray];
    [allArray addObjectsFromArray:userArray];
    
    return allArray;
}

- (void)imageTypeView:(UIView *)imageTypeView didSelectData:(id)data{
    PHAssetCollection * collection = (PHAssetCollection *)data;
    [self.button setTitle:collection.localizedTitle forState:UIControlStateNormal];
    
    PHAssetCollection * coll = (PHAssetCollection *)data;
    NSMutableArray * array = [self.imagePickerManager screenAssetFromAssetCollectionWithFilter:coll.assetCollectionType AssetCollectionSubType:coll.assetCollectionSubtype CollectionSort:AssetCollectionEndDate assetSort:AssetModificationDate];
    self.dataSource = array;
    [self.collectionView reloadData];
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
