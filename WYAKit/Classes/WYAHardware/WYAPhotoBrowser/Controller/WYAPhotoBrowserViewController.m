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
#import "controlView.h"

@interface WYAPhotoBrowserViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) controlView * controlV;
@property (nonatomic, strong) NSMutableArray * images;
@property (nonatomic, strong) NSMutableArray * models;

@end

@implementation WYAPhotoBrowserViewController
#pragma mark ======= LifeCircle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self getDataSource];
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

    [self.view addSubview:self.controlV];
    [self.view addSubview:self.collectionView];
}

#pragma mark ======= DataSource
- (void)getDataSource {
//    if (self.collections) {
//        [WYAPhotoBrowserManager screenAssetWithCollection:self.collections resultBlock:^(NSMutableArray<WYAPhotoBrowserModel *> *models) {
//            if (models.count > 0) {
//                self.dataSource = [self deleteSomePHAssetWithArray:models photoType:self.photoBrowserType];
//                [self.collectionView reloadData];
//                if (self.dataSource.count < 1) {
//                    return;
//                }
//                [self.collectionView
//                 scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.count - 1
//                                                             inSection:0]
//                 atScrollPosition:UICollectionViewScrollPositionBottom
//                 animated:NO];
//            }
//
//        }];
//    } else {
//        [WYAPhotoBrowserManager screenAssetWithFilter:AssetCollectionTypeSmartAlbum
//                               AssetCollectionSubType:AssetCollectionSubTypeUserLibrary
//                                       CollectionSort:AssetCollectionStartDate
//                                            assetSort:AssetCreationDate resultBlock:^(NSMutableArray<WYAPhotoBrowserModel *> *models) {
//                                                if (models.count > 0) {
//                                                    self.dataSource = [self deleteSomePHAssetWithArray:models photoType:self.photoBrowserType];
//                                                    [self.collectionView reloadData];
//                                                    if (self.dataSource.count < 1) {
//                                                        return;
//                                                    }
//                                                    [self.collectionView
//                                                     scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.count - 1
//                                                                                                 inSection:0]
//                                                     atScrollPosition:UICollectionViewScrollPositionBottom
//                                                     animated:NO];
//                                                }
//                                            }];
//
//    }
}

#pragma mark--- Private Method
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
    if (self.models.count < 1) { return; }
    WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc] init];
    vc.models                       = self.models;
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
                                           photoBrowser.callBackBlock(self.images);
                                       }
                                   }];
}

- (NSMutableArray *)deleteSomePHAssetWithArray:(NSMutableArray *)array photoType:(WYAPhotoBrowserType)type {
    NSMutableArray * arr = [NSMutableArray array];
    switch (self.photoBrowserType) {
        case WYAPhotoBrowserTypeAll:
            return array;

        case WYAPhotoBrowserTypePhoto: {
            for (WYAPhotoBrowserModel * model in array) {

                if (model.asset.mediaType == PHAssetMediaTypeImage) {
                    [arr addObject:model];
                }
            }
            return arr;
        }

        case WYAPhotoBrowserTypeVideo: {
            for (WYAPhotoBrowserModel * model in array) {
                if (model.asset.mediaType == PHAssetMediaTypeVideo) {
                    [arr addObject:model];
                }
            }
            return arr;
        }
        default:
            return nil;
    }
}

- (void)imageSelectClickWithModel:(WYAPhotoBrowserModel *)model image:(UIImage *)image{
    if (model.selected) {
        model.selected = NO;
        for (WYAPhotoBrowserModel * photoModel in self.dataSource) {
            photoModel.isMaxCount = NO;
        }
        if (model.asset.mediaType == PHAssetMediaTypeImage) {
            [self.images removeObject:image];
        } else if (model.asset.mediaType == PHAssetMediaTypeVideo) {
            if (model.videoUrl == nil) {
                [self.images removeObject:image];
            } else {
                [self.images removeObject:model.videoUrl];
            }
        }
        [self.models removeObject:model];
    } else {
        if (model.asset.mediaType == PHAssetMediaTypeImage) {
            [self.images addObject:image];
        } else if (model.asset.mediaType == PHAssetMediaTypeVideo) {
            if (model.videoUrl == nil) {
                [self.images addObject:image];
            } else {
                [self.images addObject:model.videoUrl];
            }
        }

        [self.models addObject:model];
        model.selected = YES;
        if (self.images.count == self.maxCount) {
            for (WYAPhotoBrowserModel * photoModel in self.dataSource) {
                photoModel.isMaxCount = YES;
            }
        }
    }
    if (self.images.count == 0) {
        [self.controlV.doneButton setTitle:@"完成" forState:UIControlStateNormal];
    } else {
        [self.controlV.doneButton setTitle:[NSString stringWithFormat:@"完成(%lu)", (unsigned long)self.images.count] forState:UIControlStateNormal];
    }
    [self.collectionView reloadData];
}

#pragma mark--- UICollectionViewDataSource
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
    __block WYAPhotoBrowserCell * imageCell = cell;
    cell.selectImage                  = ^(UIButton * btn, WYAPhotoBrowserModel * model) {
        [self imageSelectClickWithModel:model image:imageCell.imageV.image];
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
    vc.models                       = self.models;
    WYAPhotoBrowserModel * model    = self.dataSource[indexPath.item];
    vc.selectIndex                  = [self.models indexOfObject:model];
    vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
        NSArray * models = [self.dataSource copy];
        for (WYAPhotoBrowserModel * photoModel in models) {
            for (WYAPhotoBrowserModel * model in array) {
                if ([photoModel.asset isEqual:model.asset]) {
                    [self.dataSource
                     wya_safeReplaceObjectAtIndex:[self.dataSource indexOfObject:photoModel]
                     withObject:model];
                }
            }
        }
        [collectionView reloadData];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark--- Getter
- (NSMutableArray *)images {
    if (!_images) { _images = [NSMutableArray array]; }
    return _images;
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _models;
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

- (controlView *)controlV{
    if(!_controlV){
        _controlV = ({
            CGFloat object_x = 0;
            CGFloat object_y = ScreenHeight - WYABottomHeight - 49;
            CGFloat object_width = ScreenWidth;
            CGFloat object_height = 49;
            CGRect object_rect = CGRectMake(object_x, object_y,  object_width, object_height);
            controlView * object = [[controlView alloc]initWithFrame:object_rect];
            object.previewBlock = ^{
                [self previewClick];
            };
            object.doneBlock = ^{
                [self doneClick];
            };
            object;
        });
    }
    return _controlV;
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
