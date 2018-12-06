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
#import "WYAPhotoEditViewController.h"
#import "WYAPhotoBrowserCell.h"
#import "controlView.h"
#import "WYAPhotoBrowserManager.h"
#import "WYAPhotoBrowser.h"

@interface WYAPhotoBrowserViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) controlView * controlV;
@property (nonatomic, strong) NSMutableArray<UIImage *> * images;
@property (nonatomic, strong) NSMutableArray * models;

@end

@implementation WYAPhotoBrowserViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册胶卷";
    [self.view addSubview:self.controlV];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-WYABottomHeight-49);
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            
            if (status == PHAuthorizationStatusAuthorized) {
                
                // TODO:...
                NSLog(@"获取到权限了");
                [self performBlock];
            }else if (status == PHAuthorizationStatusDenied) {
                NSLog(@"不允许访问");
                
            }else if (status == PHAuthorizationStatusRestricted) {
                NSLog(@"此应用程序没有被授权访问");
            }
        }];
    }else if (status == PHAuthorizationStatusAuthorized) {
        [self performBlock];
    }
    
    
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 30);
    button.titleLabel.font = FONT(15);
    [button addCallBackAction:^(UIButton *button) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- Private Method
- (void)showAlert{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:@"您已选择最大个数，请删除后继续添加" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)performBlock{
    
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.collection) {
            self.dataSource = [WYAPhotoBrowserManager screenAssetWithCollection:self.collection];
        }else{
            self.dataSource = [WYAPhotoBrowserManager screenAssetWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeUserLibrary CollectionSort:AssetCollectionStartDate assetSort:AssetCreationDate];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
        });
    });
    
    WeakSelf(weakSelf);
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    self.controlV.previewBlock = ^{
        if (self.models.count<1) {
            return;
        }
        WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc]init];
        vc.models = self.models;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    self.controlV.doneBlock = ^{
        StrongSelf(strongSelf);
        [strongSelf dismissViewControllerAnimated:YES completion:^{
            if (photoBrowser.callBackBlock) {
                photoBrowser.callBackBlock(strongSelf.images);
            }
        }];
    };
}

#pragma mark --- Getter
- (NSMutableArray<UIImage *> *)images{
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

- (NSMutableArray *)models{
    if(!_models){
        _models = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _models;
}

- (controlView *)controlV{
    if (!_controlV) {
        _controlV = [[controlView alloc]initWithFrame:CGRectMake(0, ScreenHeight-WYABottomHeight-49, ScreenWidth, 49)];
    }
    return _controlV;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        if (@available(iOS 11, *)) {
            _collectionView.contentInset = UIEdgeInsetsZero;
        }else{
            _collectionView.contentInset = UIEdgeInsetsMake(WYATopHeight, 0, 0, 0);
        }
        
        [_collectionView registerClass:[WYAPhotoBrowserCell class] forCellWithReuseIdentifier:@"image"];
    }
    return _collectionView;
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
        WYAPhotoBrowserModel * model = self.dataSource[indexPath.row];
        if (seleted) {
            if (self.images.count >= self.maxCount) {
                [self showAlert];
                [pickCell uncheckButton];
                [self.images removeObject:pickCell.imageV.image];
                [self.models removeObject:model];
                return ;
            }
            [self.images addObject:pickCell.imageV.image];
            [self.models addObject:model];
        }else{
            [pickCell uncheckButton];
            [self.images removeObject:pickCell.imageV.image];
            [self.models removeObject:model];
        }
    };
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (ScreenWidth-25)/4;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0*SizeAdapter, 5, 0*SizeAdapter, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc]init];
    vc.models = [@[self.dataSource[indexPath.item]] mutableCopy];
    [self.navigationController pushViewController:vc animated:YES];
    
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
