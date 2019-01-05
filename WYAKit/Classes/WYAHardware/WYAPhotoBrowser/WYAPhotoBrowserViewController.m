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
@property (nonatomic, strong) NSMutableArray<UIImage *> * images;
@property (nonatomic, strong) NSMutableArray * models;

@end

@implementation WYAPhotoBrowserViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册胶卷";
    [self.view addSubview:self.controlV];

    CGFloat collectionView_X      = self.view.cmam_left;
    CGFloat collectionView_Y      = self.view.cmam_top;
    CGFloat collectionView_Width  = self.view.cmam_width;
    CGFloat collectionView_Height = self.view.cmam_height - WYABottomHeight - 49;
    self.collectionView.frame     = CGRectMake(collectionView_X, collectionView_Y, collectionView_Width, collectionView_Height);
    [self.view addSubview:self.collectionView];

    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {

            if (status == PHAuthorizationStatusAuthorized) {
                NSLog(@"获取到权限了");
                [self performBlock];
            } else if (status == PHAuthorizationStatusDenied) {
                NSLog(@"不允许访问");

            } else if (status == PHAuthorizationStatusRestricted) {
                NSLog(@"此应用程序没有被授权访问");
            }
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        [self performBlock];
    }

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark--- Private Method
- (void)showAlert
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:@"您已选择最大个数，请删除后继续添加" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction            = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)performBlock
{
    self.dataSource = [NSMutableArray arrayWithCapacity:0];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.collection) {
            self.dataSource = [WYAPhotoBrowserManager screenAssetWithCollection:self.collection];
        } else {
            self.dataSource = [WYAPhotoBrowserManager screenAssetWithFilter:AssetCollectionTypeSmartAlbum AssetCollectionSubType:AssetCollectionSubTypeUserLibrary CollectionSort:AssetCollectionStartDate assetSort:AssetCreationDate];
        }

        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataSource.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
        });
    });

    WeakSelf(weakSelf);
    WYAPhotoBrowser * photoBrowser = (WYAPhotoBrowser *)self.navigationController;
    self.controlV.previewBlock     = ^{
        StrongSelf(strongSelf);
        if (strongSelf.models.count < 1) {
            return;
        }
        WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc] init];
        vc.models                       = strongSelf.models;
        vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
            NSArray * models = [strongSelf.dataSource copy];
            for (WYAPhotoBrowserModel * photoModel in models) {
                for (WYAPhotoBrowserModel * model in array) {
                    if ([photoModel.asset isEqual:model.asset]) {
                        [strongSelf.dataSource wya_safeReplaceObjectAtIndex:[strongSelf.dataSource indexOfObject:photoModel] withObject:model];
                    }
                }
            }
            [strongSelf.collectionView reloadData];

        };
        [strongSelf.navigationController pushViewController:vc animated:YES];
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

#pragma mark--- Getter
- (NSMutableArray<UIImage *> *)images
{
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

- (NSMutableArray *)models
{
    if (!_models) {
        _models = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _models;
}

- (controlView *)controlV
{
    if (!_controlV) {
        _controlV = [[controlView alloc] initWithFrame:CGRectMake(0, ScreenHeight - WYABottomHeight - 49, ScreenWidth, 49)];
    }
    return _controlV;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView                     = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor     = [UIColor whiteColor];
        _collectionView.dataSource          = self;
        _collectionView.delegate            = self;
        if (@available(iOS 11, *)) {
            _collectionView.contentInset = UIEdgeInsetsZero;
        } else {
            _collectionView.contentInset = UIEdgeInsetsMake(WYATopHeight, 0, 0, 0);
        }

        [_collectionView registerClass:[WYAPhotoBrowserCell class] forCellWithReuseIdentifier:@"image"];
    }
    return _collectionView;
}

#pragma mark--- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAPhotoBrowserCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAPhotoBrowserCell * imageCell        = (WYAPhotoBrowserCell *)cell;
    imageCell.model                        = self.dataSource[indexPath.row];
    __block WYAPhotoBrowserCell * pickCell = imageCell;
    imageCell.selectImage                  = ^(UIButton * btn) {
        WYAPhotoBrowserModel * model = self.dataSource[indexPath.item];
        if (model.selected) {
            model.selected = NO;
            for (WYAPhotoBrowserModel * photoModel in self.dataSource) {
                photoModel.isMaxCount = NO;
            }

            [self.images removeObject:pickCell.imageV.image];
            [self.models removeObject:model];
        } else {
            [self.images addObject:pickCell.imageV.image];
            [self.models addObject:model];
            model.selected = YES;
            if (self.images.count == self.maxCount) {
                for (WYAPhotoBrowserModel * photoModel in self.dataSource) {
                    photoModel.isMaxCount = YES;
                }
            }
        }
        [collectionView reloadData];
    };
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (ScreenWidth - 25) / 4;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0 * SizeAdapter, 5, 0 * SizeAdapter, 5);
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WYAPhotoEditViewController * vc = [[WYAPhotoEditViewController alloc] init];
    vc.models                       = [@[ self.dataSource[indexPath.item] ] mutableCopy];
    vc.callback                     = ^(NSMutableArray<WYAPhotoBrowserModel *> * _Nonnull array) {
        NSArray * models = [self.dataSource copy];
        for (WYAPhotoBrowserModel * photoModel in models) {
            for (WYAPhotoBrowserModel * model in array) {
                if ([photoModel.asset isEqual:model.asset]) {
                    [self.dataSource wya_safeReplaceObjectAtIndex:[self.dataSource indexOfObject:photoModel] withObject:model];
                }
            }
        }
        [collectionView reloadData];
    };
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
