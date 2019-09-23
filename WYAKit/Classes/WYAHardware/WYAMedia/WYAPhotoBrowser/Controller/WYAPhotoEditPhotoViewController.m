//
//  WYAPhotoEditViewController.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/29.
//

#import "WYAPhotoEditPhotoViewController.h"
#import "WYAImageCropViewController.h"
#import "WYAPhotoBrowser.h"
#import "WYAPhotoBrowserModel.h"
#import "WYAPhotoBrowserEditBottomBar.h"
#import "WYAPhotoPreviewCell.h"
#import "WYAPhotoEditVideoViewController.h"
#import "WYAPhotoBrowserManager.h"
#import <Photos/Photos.h>

@interface WYAPhotoEditPhotoViewController () <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate>
{
    UICollectionView * _collectionView;
    UICollectionViewFlowLayout * _layout;
    UIButton * _navRightButton;

    BOOL _isFirstAppear; // 判断视图是否是第一次出现
}

@property (nonatomic, strong) WYAPhotoBrowserEditBottomBar * bottomBar;

@end

@implementation WYAPhotoEditPhotoViewController{
    NSMutableArray * _cacheArray;
    NSMutableArray * _imageArray;
    NSMutableArray * _videoAssetArray;
    BOOL selectOriginalImage;
}
#pragma mark - LifeCircle
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self dataContainerInitialization];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChanged:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarHidden = NO;
    if (!_isFirstAppear) {
        return;
    }

    [_collectionView setContentOffset:CGPointMake((ScreenWidth+40)*self.selectIndex, 0)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (!_isFirstAppear) {
        return;
    }
    _isFirstAppear = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    if (@available(iOS 11, *)) {
        inset = self.view.safeAreaInsets;
    }
    _layout.minimumLineSpacing = 40;
    _layout.sectionInset = UIEdgeInsetsMake(0, 40/2, 0, 40/2);
    _layout.itemSize = CGSizeMake(ScreenWidth, ScreenHeight);
    [_collectionView setCollectionViewLayout:_layout];

    _collectionView.frame = CGRectMake(-40/2, 0, ScreenWidth+40, ScreenHeight);

//    [_collectionView setContentOffset:CGPointMake((ScreenWidth+40)*_indexBeforeRotation, 0)];
}

#pragma mark - 设备旋转
//- (void)deviceOrientationChanged:(NSNotification *)notify
//{
//    //    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.view.bounds));
//    _indexBeforeRotation = _currentPage - 1;
//}

#pragma mark - UI
- (void)setupUI
{
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    [_collectionView registerClass:[WYAPhotoPreviewCell class] forCellWithReuseIdentifier:@"WYAPhotoPreviewCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.scrollsToTop = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.contentSize = CGSizeMake((ScreenWidth + 40) * self.models.count, ScreenHeight);
    [self.view addSubview:_collectionView];
    [self.view addSubview:self.bottomBar];
    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-WYABottomHeight);
        make.height.mas_equalTo(49 * SizeAdapter);
    }];

    UIView * topPreview        = [[UIView alloc] init];
    topPreview.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.5];
    [self.view addSubview:topPreview];
    [topPreview mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(WYATopHeight);
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

    _navRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_navRightButton setImage:[UIImage loadBundleImage:@"icon_radio_normal" ClassName:NSStringFromClass(self.class)] forState:UIControlStateNormal];
    [_navRightButton setImage:[UIImage loadBundleImage:@"icon_radio_selected" ClassName:NSStringFromClass(self.class)] forState:UIControlStateSelected];
    [_navRightButton addTarget:self
                     action:@selector(rightBtnClick)
           forControlEvents:UIControlEventTouchUpInside];
    [topPreview addSubview:_navRightButton];
    [_navRightButton mas_makeConstraints:^(MASConstraintMaker * make) {
        make.right.mas_equalTo(topPreview.mas_right).with.offset(-15 * SizeAdapter);
        make.centerY.mas_equalTo(cancelButton.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
}

- (void)dataContainerInitialization{
    _isFirstAppear = YES;
    if (!self.selectedModels) {
        self.selectedModels = [NSMutableArray array];
    }
    _imageArray = [NSMutableArray arrayWithCapacity:0];
    _videoAssetArray = [NSMutableArray arrayWithCapacity:0];
    for (WYAPhotoBrowserModel * model in self.selectedModels) {
        if (model.selected == YES) {
            if (model.type == WYAAssetMediaTypeImage) {
                [_imageArray addObject:model.image];
            } else if (model.type == WYAAssetMediaTypeVideo) {
                [_videoAssetArray addObject:model.asset];
            }
        }
    }
}

#pragma mark - Event
- (void)editWithOriginalImageWithSelect:(BOOL)isSelect
{
    selectOriginalImage = isSelect;
    WYAPhotoBrowserModel * model = [self photoBrowserModel];
    if (isSelect) {
        WeakSelf(weakSelf);
        [[WYAPhotoBrowserManager sharedPhotoBrowserManager] requestOriginalImageForAsset:model.asset progressHandler:^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {

        } completion:^(UIImage * image, NSDictionary * info) {
            model.image = image;
            model.selected = YES;
            _navRightButton.selected = model.selected;
            if (![weakSelf.selectedModels containsObject:model]) {
                [weakSelf.selectedModels addObject:model];
            }
            if (![[info objectForKey:PHImageResultIsDegradedKey] boolValue]) {
                [_imageArray addObject:image];
            }
        }];
    } else {

        model.image = nil;
        model.selected = NO;
        _navRightButton.selected = model.selected;
        if ([self.selectedModels containsObject:model]) {
            [self.selectedModels removeObject:model];
        }
        if ([_imageArray containsObject:model.image]) {
            [_imageArray removeObject:model.image];
        }
    }
}

- (void)edit
{
    NSInteger index              = _collectionView.contentOffset.x / _collectionView.cmam_width;
    WYAPhotoPreviewCell * cell = [_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    WYAPhotoBrowserModel * model = self.models[index];

    WeakSelf(weakSelf);
    if (model.type == WYAAssetMediaTypeImage) {
        
        WYAImageCropViewController * imageCrop = [[WYAImageCropViewController alloc] initWithImage:cell.previewView.imageGifView.image];
        imageCrop.onDidCropToRect = ^(UIImage * _Nonnull image, CGRect cropRect, NSInteger angle) {
            [imageCrop dismissViewControllerAnimated:YES completion:nil];
            if ([_imageArray containsObject:model.image]) {
                [_imageArray removeObject:model.image];
            }
            model.image              = image;
            model.selected = YES;
            _navRightButton.selected = model.selected;

            if (![weakSelf.selectedModels containsObject:model]) {
                [weakSelf.selectedModels addObject:model];
            }
            [_imageArray addObject:image];
            [_collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]]];
        };
        [self presentViewController:imageCrop animated:YES completion:nil];

    } else if (model.type == WYAAssetMediaTypeVideo) {

        WYAPhotoEditVideoViewController * video = [[WYAPhotoEditVideoViewController alloc]init];
        video.model = model;
        video.editVideoFinishBlock = ^(WYAPhotoBrowserModel * _Nonnull videoModel) {
            model.asset = videoModel.asset;
            model.selected = YES;
            _navRightButton.selected = model.selected;
            if (![weakSelf.selectedModels containsObject:videoModel]) {
                [weakSelf.selectedModels addObject:videoModel];
            }
            [_videoAssetArray addObject:videoModel.asset];
            [_collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]]];
        };
        [self.navigationController pushViewController:video animated:YES];
    }

}

- (void)done
{
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    if (photoBrowser.callBackBlock) {
        photoBrowser.callBackBlock(_imageArray, _videoAssetArray);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelClick
{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    if (self.callback) { self.callback(self.models); }
}

- (void)rightBtnClick
{
    WYAPhotoBrowserModel * model = [self photoBrowserModel];
    model.selected = !model.selected;
    _navRightButton.selected = model.selected;
    if (model.selected) {
        [self.selectedModels addObject:model];
        if (model.type == WYAAssetMediaTypeVideo) {
            [_videoAssetArray addObject:model.asset];
        } else if (model.type == WYAAssetMediaTypeImage) {
            if (!model.image) {
                [[WYAPhotoBrowserManager sharedPhotoBrowserManager] requestSelectedImageForAsset:model isOriginal:selectOriginalImage allowSelectGif:[self config].allowSelectGif completion:^(UIImage * image, NSDictionary * info) {
                    BOOL isPreview = [[info objectForKey:PHImageResultIsDegradedKey] boolValue];
                    if (!isPreview) {
                        model.image = image;
                        [_imageArray addObject:model.image];
                    }
                }];
            }else {
                [_imageArray addObject:model.image];
            }
        }
    } else {
        [self.selectedModels removeObject:model];
        if ([_videoAssetArray containsObject:model.asset]) {
            [_videoAssetArray removeObject:model.asset];
        }
        if ([_imageArray containsObject:model.image]) {
            [_imageArray removeObject:model.image];
        }
    }
    [self resetDontBtnState];
}

#pragma mark - 更新按钮、导航条等显示状态
- (void)resetDontBtnState
{
    if (self.selectedModels.count > 0) {
        [self.bottomBar.doneButton setTitle:[NSString stringWithFormat:@"完成(%ld)", self.selectedModels.count] forState:UIControlStateNormal];
    } else {
        [self.bottomBar.doneButton setTitle:@"完成" forState:UIControlStateNormal];
    }
}

- (void)resetEditBtnState
{
    if ([self photoBrowserModel].type == WYAAssetMediaTypeImage) {
        if ([self config].allowEditImage == NO) {
            self.bottomBar.editButton.hidden = YES;
        } else {
            self.bottomBar.editButton.hidden = NO;
        }
    } else if ([self photoBrowserModel].type == WYAAssetMediaTypeVideo){
        if ([self config].allowEditVideo == NO) {
            self.bottomBar.editButton.hidden = YES;
        } else {
            self.bottomBar.editButton.hidden = NO;
        }
    }
}

- (void)resetOriginalBtnState
{
    if ([self photoBrowserModel].type == WYAAssetMediaTypeImage && [self config].allowSelectOriginal == YES) {
        self.bottomBar.centerButton.hidden = NO;
    } else {
        self.bottomBar.centerButton.hidden = YES;
    }
}

#pragma mark - UICollectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.models.count;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAPhotoPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WYAPhotoPreviewCell" forIndexPath:indexPath];
    WYAPhotoBrowserModel *model = self.models[indexPath.row];

    cell.model = model;
    WeakSelf(weakSelf);
    cell.singleTapCallBack = ^() {
        StrongSelf(strongSelf);
    };
    __weak typeof(cell) weakCell = cell;
    cell.longPressCallBack = ^{
        StrongSelf(strongSelf);
        __strong typeof(weakCell) strongCell = weakCell;
        if (!strongCell.previewView.image) {
            return;
        }
        
    };

    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = _collectionView.contentOffset;

    CGFloat page = offset.x/(_collectionView.cmam_width > 0 ? _collectionView.cmam_width : 1);
    if (ceilf(page) >= self.models.count) {
        return;
    }
    NSInteger index = (NSInteger)page;
    WYAPhotoBrowserModel * model = self.models[index];
    _navRightButton.selected = model.selected;
    [self resetDontBtnState];
    [self resetEditBtnState];
    [self resetOriginalBtnState];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}

#pragma mark ======= Getter
- (WYAPhotoBrowserEditBottomBar *)bottomBar{
    if(!_bottomBar){
        _bottomBar = ({
            WYAPhotoBrowserEditBottomBar * object = [[WYAPhotoBrowserEditBottomBar alloc]init];
            WeakSelf(weakSelf);
            object.editBlock = ^{
                [weakSelf edit];
            };
            object.originalBlock = ^(BOOL select) {
                [weakSelf editWithOriginalImageWithSelect:select];
            };
            object.doneBlock = ^{
                [weakSelf done];
            };
            object;
        });
    }
    return _bottomBar;
}

- (WYAPhotoBrowserConfig *)config{
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    return photoBrowser.config;
}

- (WYAPhotoBrowserModel *)photoBrowserModel{
    NSInteger index              = _collectionView.contentOffset.x / (_collectionView.cmam_width > 0 ? _collectionView.cmam_width : 1);
    WYAPhotoBrowserModel * model = self.models[index];
    return model;
}
@end
