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
#import "WYAPhotoEditViewController.h"
#import "WYAPhotoBrowserBottomBar.h"

@interface WYAPhotoBrowserViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) WYAPhotoBrowserBottomBar * bottomBar;
@property (nonatomic, strong) NSMutableArray * assets;
@property (nonatomic, strong) WYAPhotoBrowserAlbumModel * albumModel;
@end

@implementation WYAPhotoBrowserViewController{
    NSMutableArray * _cacheArray;
    NSMutableArray * _preViewArray; // 预览视图数组
}
#pragma mark ======= LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumModel = [[WYAPhotoBrowserManager sharedPhotoBrowserManager] getCameraRollAlbumList:YES allowSelectImage:YES];
    _cacheArray = [NSMutableArray array];
    [self.albumModel.models enumerateObjectsUsingBlock:^(WYAPhotoBrowserModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_cacheArray addObject:obj.asset];
    }];
    _preViewArray = [NSMutableArray array];
    [self setupUI];
    [self getDataSource];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];

    CGFloat width = (ScreenWidth - 25) / 4 * 1.7;
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] startCacheAssetWithArray:_cacheArray size:CGSizeMake(width, width)];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    CGFloat width = (ScreenWidth - 25) / 4 * 1.7;
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] stopCacheAssetWithArray:_cacheArray size:CGSizeMake(width, width)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======= UI
- (void)setupUI{
    self.title = @"相册胶卷";
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:random(51, 51, 51, 1) forState:UIControlStateNormal];
    button.frame           = CGRectMake(0, 0, 40, 30);
    button.titleLabel.font = FONT(15);
    [button addCallBackAction:^(UIButton * button) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    [self.view addSubview:self.bottomBar];
    [self.view addSubview:self.collectionView];
}

#pragma mark - Private Method
- (void)getDataSource {

    self.dataSource = [[WYAPhotoBrowserManager sharedPhotoBrowserManager] getPhotoInResult:self.albumModel.result allowSelectVideo:YES allowSelectImage:YES allowSelectGif:YES allowSelectLivePhoto:YES];


    [self.collectionView reloadData];
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
    WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc] init];
    vc.models                       = _preViewArray;
    vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
        NSArray * models = [self.dataSource copy];
        for (WYAPhotoBrowserModel * photoModel in models) {
            for (WYAPhotoBrowserModel * model in array) {
                if ([photoModel.asset isEqual:model.asset]) {
                    [self.dataSource
                     wya_safeReplaceObjectAtIndex:[self.dataSource
                                                   indexOfObject:photoModel]
                     withObject:model];
                }
            }
        }
        [self.collectionView reloadData];

    };
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)doneClick{
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    [self dismissViewControllerAnimated:YES
                                   completion:^{
                                       if (photoBrowser.callBackBlock) {
                                           photoBrowser.callBackBlock(self.assets);
                                       }
                                   }];
}

- (void)selectCellImageWithModel:(WYAPhotoBrowserModel *)model select:(BOOL)select{
    if (select) {
        [_preViewArray addObject:model];
    } else {
        [_preViewArray removeObject:model];
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
    WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc] init];
    vc.models                       = self.albumModel.models;
    WYAPhotoBrowserModel * model    = self.dataSource[indexPath.item];
    vc.selectIndex                  = [self.albumModel.models indexOfObject:model];
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
            object.previewBlock = ^{
                [self previewClick];
            };
            object.doneBlock = ^{
                [self doneClick];
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




@end
