//
//  ImagePickerViewController.m
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/14.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "WYAPhotoBrowserViewController.h"
#import "WYAPhotoBrowser.h"
#import "WYAPhotoBrowserCell.h"
#import "WYAPhotoBrowserManager.h"
#import "WYAPhotoBrowserModel.h"
#import "WYAPhotoEditPhotoViewController.h"
#import "WYAPhotoBrowserBottomBar.h"

@interface WYAPhotoBrowserViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) WYAPhotoBrowserBottomBar * bottomBar;
@property (nonatomic, strong) NSMutableArray * assets;
@property (nonatomic, strong) WYAPhotoBrowserAlbumModel * albumModel;
@end

@implementation WYAPhotoBrowserViewController{
    NSMutableArray * _cacheArray; // 预加载缓存数组
    NSMutableArray * _preViewArray; // 预览视图数组
    BOOL selectOriginalImage;
}
#pragma mark ======= LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataContainerInitialization];
    [self setupUI];
    [self getDataSource];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];

    CGFloat width = (ScreenWidth - 25) / 4 * 1.7;
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] startCacheAssetWithArray:_cacheArray size:CGSizeMake(width, width)];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    CGFloat width = (ScreenWidth - 25) / 4 * 1.7;
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] stopCacheAssetWithArray:_cacheArray size:CGSizeMake(width, width)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDarkContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"调用了图片viewcontroll----2");
    self.albumModel = nil;
    self.dataSource = nil;
    self.assets = nil;
    _cacheArray = nil;
    _preViewArray = nil;
}

#pragma mark ======= UI
- (void)setupUI{
    self.title = @"相册胶卷";
    [self.view wya_addSubViews:@[self.bottomBar,self.collectionView]];

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    button.frame           = CGRectMake(0, 0, 40, 30);
    button.titleLabel.font = FONT(15);
    WeakSelf(weakSelf);
    [button addCallBackAction:^(UIButton * button) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.bottomBar.originalButton.hidden = ![self config].allowSelectOriginal;
}

#pragma mark - Private Method
- (void)dataContainerInitialization{
    WYAPhotoBrowserManager * manager = [WYAPhotoBrowserManager sharedPhotoBrowserManager];
    [manager setSortAscending:[self config].sortAscending];
    if (self.album) {
        self.albumModel = self.album;
    } else {
        self.albumModel = [manager getCameraRollAlbumList:[self config].allowSelectVideo allowSelectImage:[self config].allowSelectImage];
    }

    _cacheArray = [NSMutableArray array];
    [self.albumModel.models enumerateObjectsUsingBlock:^(WYAPhotoBrowserModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_cacheArray addObject:obj.asset];
    }];
    _preViewArray = [NSMutableArray array];
}

- (void)getDataSource {

    self.dataSource = [[WYAPhotoBrowserManager sharedPhotoBrowserManager] getPhotoInResult:self.albumModel.result allowSelectVideo:[self config].allowSelectVideo allowSelectImage:[self config].allowSelectImage allowSelectGif:[self config].allowSelectGif allowSelectLivePhoto:[self config].allowSelectLivePhoto];

    [self.collectionView reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self config].sortAscending) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
    });
}

- (void)showAlert {
    UIAlertController * alertController = [UIAlertController
                                           alertControllerWithTitle:nil
                                           message:@"您已选择最大个数，请删除后继续添加"
                                           preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction =
    [UIAlertAction actionWithTitle:@"知道了"
                             style:UIAlertActionStyleDefault
                           handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)previewClick{
    if (_preViewArray.count < 1) { return; }
    WYAPhotoEditPhotoViewController * vc = [[WYAPhotoEditPhotoViewController alloc] init];
    vc.models                       = _preViewArray;
    vc.selectedModels = _preViewArray;
    vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
//        NSArray * models = [self.dataSource copy];
//        for (WYAPhotoBrowserModel * photoModel in models) {
//            for (WYAPhotoBrowserModel * model in array) {
//                if ([photoModel.asset isEqual:model.asset]) {
//                    [self.dataSource wya_safeReplaceObjectAtIndex:[self.dataSource indexOfObject:photoModel] withObject:model];
//                }
//            }
//        }
//        [self.collectionView reloadData];

    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)originalImageWithSelect:(BOOL)select{
    selectOriginalImage = select;
}

- (void)doneClick{
    __block NSMutableArray * array = [NSMutableArray array];
    __block NSMutableArray * videoAsset = [NSMutableArray array];
    WeakSelf(weakSelf);
    [_preViewArray enumerateObjectsUsingBlock:^(WYAPhotoBrowserModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.type == WYAAssetMediaTypeVideo) {
            [videoAsset addObject:obj.asset];
        }
        if (obj.image) {
            [array addObject:obj.image];
        } else {
            [[WYAPhotoBrowserManager sharedPhotoBrowserManager] requestSelectedImageForAsset:obj isOriginal:selectOriginalImage allowSelectGif:[weakSelf config].allowSelectGif completion:^(UIImage * image, NSDictionary * info) {
                [array addObject:image];
            }];
        }
    }];
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    if (photoBrowser.callBackBlock) {
        photoBrowser.callBackBlock(array, videoAsset);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selectCellImageWithModel:(WYAPhotoBrowserModel *)model select:(BOOL)select{
    if (select) {
        //
        [[WYAPhotoBrowserManager sharedPhotoBrowserManager] requestSelectedImageForAsset:model isOriginal:selectOriginalImage allowSelectGif:[self config].allowSelectGif completion:^(UIImage * image, NSDictionary * info) {
            model.image = image;
        }];
        [_preViewArray addObject:model];
        if (_preViewArray.count == [self config].maxSelectCount) {
            for (WYAPhotoBrowserModel * model in self.dataSource) {
                if (![_preViewArray containsObject:model]) {
                    model.needCover = YES;
                }
            }
            [self.collectionView reloadData];
        }

    } else {
        if (model.image) {
            model.image = nil;
        }
        [_preViewArray removeObject:model];
        if (_preViewArray.count < [self config].maxSelectCount) {
            for (WYAPhotoBrowserModel * model in self.dataSource) {
                model.needCover = NO;
            }
            [self.collectionView reloadData];
        }
    }
    [self changePreviewButtonState];
    [self changeDoneButtonState];
}

-(void)changePreviewButtonState{
    if (_preViewArray.count > 0) {
        self.bottomBar.previewButton.enabled = YES;
    } else {
        self.bottomBar.previewButton.enabled = NO;
    }
}

-(void)changeDoneButtonState{
    if (_preViewArray.count > 0) {
        self.bottomBar.doneButton.enabled = YES;
        [self.bottomBar.doneButton setTitle:[NSString stringWithFormat:@"完成(%d)",_preViewArray.count] forState:UIControlStateNormal];
    } else {
        self.bottomBar.doneButton.enabled = NO;

    }
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserCell * cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"image"
                                              forIndexPath:indexPath];
    cell.model                        = self.dataSource[indexPath.row];
    WeakSelf(weakSelf);
    cell.selectImage = ^(WYAPhotoBrowserModel *model, BOOL isSelect) {
        [weakSelf selectCellImageWithModel:model select:isSelect];
    };
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (ScreenWidth - 25) / 4;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 * SizeAdapter, 5, 0 * SizeAdapter, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoEditPhotoViewController * vc = [[WYAPhotoEditPhotoViewController alloc] init];
    vc.models                       = self.dataSource;
    vc.selectedModels = _preViewArray;
    WYAPhotoBrowserModel * model    = self.dataSource[indexPath.item];
    vc.selectIndex                  = [self.dataSource indexOfObject:model];
    vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
//        NSArray * models = [self.dataSource copy];
//        for (WYAPhotoBrowserModel * photoModel in models) {
//            for (WYAPhotoBrowserModel * model in array) {
//                if ([photoModel.asset isEqual:model.asset]) {
//                    [self.dataSource
//                     wya_safeReplaceObjectAtIndex:[self.dataSource indexOfObject:photoModel]
//                     withObject:model];
//                }
//            }
//        }
//        [collectionView reloadData];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark--- Getter
- (NSMutableArray *)assets{
    if(!_assets){
        _assets = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _assets;
}

- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _dataSource;
}

- (WYAPhotoBrowserBottomBar *)bottomBar{
    if(!_bottomBar){
        _bottomBar = ({
            CGFloat object_x = 0;
            CGFloat object_y = ScreenHeight - WYABottomHeight - 49;
            CGFloat object_width = ScreenWidth;
            CGFloat object_height = 49;
            CGRect object_rect = CGRectMake(object_x, object_y,  object_width, object_height);
            WYAPhotoBrowserBottomBar * object = [[WYAPhotoBrowserBottomBar alloc]initWithFrame:object_rect];
            WeakSelf(weakSelf);
            object.previewBlock = ^{
                [weakSelf previewClick];
            };
            object.originalBlock = ^(BOOL select) {
                [weakSelf originalImageWithSelect:select];
            };
            object.doneBlock = ^{
                [weakSelf doneClick];
            };
            object;
        });
    }
    return _bottomBar;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat collectionView_X      = self.view.cmam_left;
        CGFloat collectionView_Y      = self.view.cmam_top;
        CGFloat collectionView_Width  = self.view.cmam_width;
        CGFloat collectionView_Height = self.view.cmam_height - WYABottomHeight - 49;
        CGRect rect = CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);
        _collectionView =
        [[UICollectionView alloc] initWithFrame:rect
                           collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        if (@available(iOS 11, *)) {
            _collectionView.contentInset = UIEdgeInsetsZero;
        } else {
            _collectionView.contentInset = UIEdgeInsetsMake(WYATopHeight, 0, 0, 0);
        }

        [_collectionView registerClass:[WYAPhotoBrowserCell class]
            forCellWithReuseIdentifier:@"image"];
    }
    return _collectionView;
}

-(WYAPhotoBrowserConfig *)config{
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    return photoBrowser.config;
}

@end
