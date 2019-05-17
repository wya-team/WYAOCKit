//
//  WYAPhotoEditViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoEditViewController.h"
#import "WYAImageCropViewController.h"
#import "WYAPhotoBrowser.h"
#import "WYAPhotoBrowserModel.h"
#import "WYAPhotoBrowserEditBottomBar.h"
#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoBrowserManager.h"
#import <Photos/Photos.h>

@interface WYAPhotoEditViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, WYAImageCropViewControllerDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) WYAPhotoBrowserEditBottomBar * bottomBar;
@property (nonatomic, strong) NSMutableArray<WYAPhotoBrowserModel *> * images;
@end

@implementation WYAPhotoEditViewController{
    NSMutableArray * _cacheArray;
}
#pragma mark - LifeCircle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] stopCacheAssetWithArray:_cacheArray size:CGSizeMake(ScreenWidth * 1.7, ScreenHeight * 1.7)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadImages];
    [self setupUI];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark ======= UI
-(void)setupUI{
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.bottomBar];
    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(WYAiPhoneX ? -34 : 0);
        make.height.mas_equalTo(49 * SizeAdapter);
    }];

    UIView * topPreview        = [[UIView alloc] init];
    topPreview.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
    [self.view addSubview:topPreview];
    [topPreview mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(WYAiPhoneX ? 88 : 64);
    }];

    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = FONT(15);
    [cancelButton addTarget:self
                     action:@selector(cancelClick)
           forControlEvents:UIControlEventTouchUpInside];
    [topPreview addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(topPreview.mas_left).with.offset(15 * SizeAdapter);
        make.bottom.mas_equalTo(topPreview.mas_bottom).with.offset(-7);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    }];
}

#pragma mark - Private Method
- (void)loadImages {
    _cacheArray = [NSMutableArray array];
    for (WYAPhotoBrowserModel * model in self.models) {
        [_cacheArray addObject:model.asset];
    }
    [[WYAPhotoBrowserManager sharedPhotoBrowserManager] startCacheAssetWithArray:_cacheArray size:CGSizeMake(ScreenWidth * 1.7, ScreenHeight * 1.7)];
}

- (void)cancelClick {
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    if (self.callback) { self.callback(self.models); }
}

- (void)edit {
    NSInteger index              = self.collectionView.contentOffset.x / self.collectionView.cmam_width;
    WYAPhotoBrowserModel * model = self.models[index];

    WYAImageCropViewController * imageCrop =
        [[WYAImageCropViewController alloc] initWithImage:model.image];
    imageCrop.onDidCropToRect = ^(UIImage * _Nonnull image, CGRect cropRect, NSInteger angle) {
        [imageCrop dismissViewControllerAnimated:YES completion:nil];
        NSInteger index            = self.collectionView.contentOffset.x / self.collectionView.cmam_width;

        WYAPhotoBrowserModel * model = self.models[index];
        model.image              = image;
        [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]]];
    };
    [self presentViewController:imageCrop animated:YES completion:nil];
}

/**
 获取原图

 @param original 如果为YES，获取的是本地的原图片
 */
- (void)editWithOriginalImage:(BOOL)original {

}

- (void)done {
    __block NSMutableArray * array = [NSMutableArray array];
    [self.models enumerateObjectsUsingBlock:^(WYAPhotoBrowserModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.selected) {
            [array addObject:obj.image];
        }
    }];
    WYAPhotoBrowser * photo = (WYAPhotoBrowser *)self.navigationController;
    if (photo.callBackBlock) {
        [self dismissViewControllerAnimated:YES completion:^{ photo.callBackBlock(array); }];
    }
}

#pragma mark--- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.models.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserModel * model = self.models[indexPath.item];
    if (model.asset.mediaType == PHAssetMediaTypeVideo) {
        WYAVideoPreviewCell * cell =
            [collectionView dequeueReusableCellWithReuseIdentifier:@"video"
                                                      forIndexPath:indexPath];
        return cell;
    } else if (model.asset.mediaType == PHAssetMediaTypeImage) {
        WYAPhotoPreviewCell * cell =
            [collectionView dequeueReusableCellWithReuseIdentifier:@"image"
                                                      forIndexPath:indexPath];
        cell.model = self.models[indexPath.item];
        return cell;
    } else {
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.cmam_width, self.view.cmam_height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                             layout:(UICollectionViewLayout *)collectionViewLayout
    referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 * SizeAdapter, 0 * SizeAdapter, 0 * SizeAdapter, 0 * SizeAdapter);
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
    return 0 * SizeAdapter;
}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection              = UICollectionViewScrollDirectionHorizontal;
        _collectionView =
        [[UICollectionView alloc] initWithFrame:self.view.frame
                           collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        _collectionView.pagingEnabled   = YES;
        _collectionView.contentOffset   = CGPointMake(0, 0);
        _collectionView.scrollsToTop    = NO;
        _collectionView.contentInset    = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:[WYAPhotoPreviewCell class]
            forCellWithReuseIdentifier:@"image"];
        [_collectionView registerClass:[WYAVideoPreviewCell class]
            forCellWithReuseIdentifier:@"video"];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"cell"];
        [_collectionView setContentOffset:CGPointMake(self.selectIndex * _collectionView.cmam_width, 0) animated:NO];
    }
    return _collectionView;
}

- (NSMutableArray<WYAPhotoBrowserModel *> *)images{
    if(!_images){
        _images = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _images;
}

- (WYAPhotoBrowserEditBottomBar *)bottomBar{
    if(!_bottomBar){
        _bottomBar = ({
            WYAPhotoBrowserEditBottomBar * object = [[WYAPhotoBrowserEditBottomBar alloc]init];
            WeakSelf(weakSelf);
            object.editBlock = ^{
                [weakSelf edit];
            };
            object.originalBlock = ^{
                [weakSelf editWithOriginalImage:NO];
            };
            object.doneBlock = ^{
                [weakSelf done];
            };
            object;
       });
    }
    return _bottomBar;
}


@end
