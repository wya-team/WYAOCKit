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
#import "WYAPhotoEditControlView.h"
#import "WYAPhotoPreviewCell.h"
#import <Photos/Photos.h>

@interface WYAPhotoEditViewController () <
    UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,
    WYAPhotoEditControlViewDelegate, WYAImageCropViewControllerDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) WYAPhotoEditControlView * controlView;
@property (nonatomic, strong) NSMutableArray * images;
@end

@implementation WYAPhotoEditViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.controlView];
    [self.controlView mas_makeConstraints:^(MASConstraintMaker * make) {
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

    [self loadImages];
}

#pragma mark - Private Method -
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)loadImages {
    for (WYAPhotoBrowserModel * model in self.models) {
        if (model.asset.mediaType == PHAssetMediaTypeImage) {
            if (model.cropImage) {
                //是否有之前裁剪的图片
                [self.images addObject:model.cropImage];
            } else if (model.cacheImage) {
                [self.images addObject:model.cacheImage];
            } else {
                PHImageManager * manager    = [PHImageManager defaultManager];
                PHImageRequestOptions * opi = [[PHImageRequestOptions alloc] init];

                [manager
                    requestImageForAsset:model.asset
                              targetSize:CGSizeMake(self.view.cmam_width, self.view.cmam_height)
                             contentMode:PHImageContentModeAspectFill
                                 options:opi
                           resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                               BOOL downloadFinined =
                                   ![[info objectForKey:PHImageCancelledKey] boolValue] &&
                                   ![info objectForKey:PHImageErrorKey] &&
                                   ![[info objectForKey:PHImageResultIsDegradedKey] boolValue];
                               if (downloadFinined) {
                                   //获取的高清图
                                   [self.images addObject:result];
                               }

                           }];
            }
        } else if (model.asset.mediaType == PHAssetMediaTypeVideo) {
            [self.images addObject:model.videoUrl];
        }
    }
}

- (void)cancelClick {
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    if (self.callback) { self.callback(self.models); }
}

- (void)doneClick {
}

#pragma mark - Getter -
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

- (WYAPhotoEditControlView *)controlView {
    if (!_controlView) {
        _controlView = ({
            WYAPhotoEditControlView * object = [[WYAPhotoEditControlView alloc] init];
            object.delegate                  = self;
            object;
        });
    }
    return _controlView;
}
- (NSMutableArray *)images {
    if (!_images) {
        _images = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _images;
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
        return cell;
    } else {
        return nil;
    }
}
- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserModel * model = self.models[indexPath.item];
    if (model.asset.mediaType == PHAssetMediaTypeVideo) {
        WYAVideoPreviewCell * videoCell = (WYAVideoPreviewCell *)cell;
        videoCell.model                 = model;
        self.controlView.videoHidden    = YES;

    } else if (model.asset.mediaType == PHAssetMediaTypeImage) {
        WYAPhotoPreviewCell * imageCell = (WYAPhotoPreviewCell *)cell;
        imageCell.model                 = model;
        [imageCell setScrollZoom];
        self.controlView.videoHidden = NO;
    } else {
        self.controlView.videoHidden = NO;
    }
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    WYAPhotoBrowserModel * model = self.models[indexPath.item];
    if (model.asset.mediaType == PHAssetMediaTypeVideo) {
    } else if (model.asset.mediaType == PHAssetMediaTypeImage) {
    } else {
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

#pragma mark---WYAPhotoEditControlViewDelegate
- (void)edit {
    NSInteger index              = self.collectionView.contentOffset.x / self.collectionView.cmam_width;
    WYAPhotoBrowserModel * model = self.models[index];

    WYAImageCropViewController * imageCrop =
        [[WYAImageCropViewController alloc] initWithImage:model.cacheImage];
    imageCrop.delegate = self;
    [self presentViewController:imageCrop animated:YES completion:nil];
}

/**
 获取原图

 @param original 如果为YES，获取的是本地的原图片
 */
- (void)editWithOriginalImage:(BOOL)original {
    NSInteger index              = self.collectionView.contentOffset.x / self.collectionView.cmam_width;
    WYAPhotoBrowserModel * model = self.models[index];
    if (model.cropImage) { return; }
    if (original) {
        WYAPhotoBrowserModel * model = self.models[(NSUInteger)(
            self.collectionView.contentOffset.x / self.collectionView.cmam_width)];
        PHImageManager * manager    = [PHImageManager defaultManager];
        PHImageRequestOptions * opi = [[PHImageRequestOptions alloc] init];

        [manager
            requestImageForAsset:model.asset
                      targetSize:PHImageManagerMaximumSize
                     contentMode:PHImageContentModeAspectFill
                         options:opi
                   resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                       [self.images
                           replaceObjectAtIndex:(NSUInteger)(self.collectionView.contentOffset.x /
                                                             self.collectionView.cmam_width)
                                     withObject:result];
                   }];
    }
}

- (void)done {
    WYAPhotoBrowser * photo = (WYAPhotoBrowser *)self.navigationController;
    if (photo.callBackBlock) {
        [self dismissViewControllerAnimated:YES completion:^{ photo.callBackBlock(self.images); }];
    }
}

#pragma mark - WYAImageCropViewControllerDelegate  -
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController
            didCropToImage:(nonnull UIImage *)image
                  withRect:(CGRect)cropRect
                     angle:(NSInteger)angle {
    [cropViewController dismissViewControllerAnimated:YES completion:nil];
    NSInteger index            = self.collectionView.contentOffset.x / self.collectionView.cmam_width;
    WYAPhotoPreviewCell * cell = (WYAPhotoPreviewCell *)[self.collectionView
        cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    cell.preview.imageView.image = image;
    WYAPhotoBrowserModel * model = self.models[index];
    model.cropImage              = image;
    [self.images replaceObjectAtIndex:index withObject:image];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
