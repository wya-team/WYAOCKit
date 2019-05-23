//
//  WYACameraVC.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/24.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACameraCell.h"
#import "WYACameraModel.h"

#import "WYAImagePicker.h"
#import "WYAPopVerReadMeViewController.h"
#import <WYAKit/ZLPhotoActionSheet.h>
#define CameraCell @"WYACameraCell"
#define EditCameraCell @"WYAEditCameraCell"

@interface WYAImagePicker () <UICollectionViewDelegate, UICollectionViewDataSource,
                              UIPopoverPresentationControllerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, assign) BOOL allImage;

@end

@implementation WYAImagePicker
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    // 查看README文档
    NSLog(@"查看文档");
    [self showPopverPresentVC:sender];
}
#pragma mark ======= popverPresentVC
- (void)showPopverPresentVC:(UIButton *)sender {
    WYAPopVerReadMeViewController * test       = [[WYAPopVerReadMeViewController alloc] init];
    test.preferredContentSize                  = CGSizeMake(180 * SizeAdapter, 130 * SizeAdapter);
    test.dataSource                            = @[ @"WYACamera(相机)", @"WYAPhotoBrowser(相册)", @"WYAImageCrop(裁剪)" ];
    test.modalPresentationStyle                = UIModalPresentationPopover;
    __block WYAPopVerReadMeViewController * vc = test;
    test.pushCallback                          = ^(NSIndexPath * _Nonnull indexPath) {
        [vc dismissViewControllerAnimated:YES completion:nil];
        if (indexPath.row == 0) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAHardware/WYACamera/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAHardware/WYAPhotoBrowser/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 2) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAUIKit/WYAImageCrop/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }

    };
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate                          = self;
    popover.permittedArrowDirections          = UIPopoverArrowDirectionAny; //设置箭头位置
    popover.sourceView                        = sender;                     //设置目标视图
    popover.sourceRect                        = sender.bounds;              //弹出视图显示位置
    popover.backgroundColor                   = [UIColor whiteColor];       //设置弹窗背景颜色
    popover.popoverBackgroundViewClass        = [WYACustomPopoverBackgroundView class];
    [self presentViewController:test animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:
    (UIPresentationController *)controller {
    return UIModalPresentationNone;
}
#pragma mark ======= end
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    self.textField              = [[UITextField alloc] init];
    self.textField.placeholder  = @"请输入图片选择最大数量";
    self.textField.delegate     = self;
    self.textField.text         = @"9";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.textField];
    CGFloat textField_X      = 10;
    CGFloat textField_Y      = WYATopHeight + 5 * SizeAdapter;
    CGFloat textField_Width  = ScreenWidth - 20;
    CGFloat textField_Height = 40 * SizeAdapter;
    self.textField.frame     = CGRectMake(textField_X, textField_Y, textField_Width, textField_Height);

    [self.view addSubview:self.collectionView];
}
#pragma mark--- Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection              = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize          = CGSizeMake(ScreenWidth, 0 * SizeAdapter);
            UICollectionView * object           = [[UICollectionView alloc]
                       initWithFrame:CGRectMake(0, WYATopHeight + 50 * SizeAdapter, ScreenWidth,
                                                ScreenHeight - WYATopHeight)
                collectionViewLayout:layout];
            object.delegate        = self;
            object.dataSource      = self;
            object.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [object registerNib:[UINib nibWithNibName:@"WYACameraCell" bundle:nil]
                forCellWithReuseIdentifier:CameraCell];
            [object registerClass:[WYAEditCameraCell class]
                forCellWithReuseIdentifier:EditCameraCell];
            object;
        });
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _dataSource;
}

#pragma mark - UITextFieldDelegate  -
- (void)textFieldDidEndEditing:(UITextField *)textField {
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count + (self.allImage ? 0 : 1);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.allImage) {
        WYAEditCameraCell * cell =
            [collectionView dequeueReusableCellWithReuseIdentifier:EditCameraCell
                                                      forIndexPath:indexPath];
        return cell;
    } else {
        if (indexPath.item == self.dataSource.count) {
            WYACameraCell * cell =
                [collectionView dequeueReusableCellWithReuseIdentifier:CameraCell
                                                          forIndexPath:indexPath];
            return cell;
        } else {
            WYAEditCameraCell * cell =
                [collectionView dequeueReusableCellWithReuseIdentifier:EditCameraCell
                                                          forIndexPath:indexPath];
            return cell;
        }
    }
}

#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.allImage) {
        WYACameraModel * model       = self.dataSource[indexPath.item];
        WYAEditCameraCell * editCell = (WYAEditCameraCell *)cell;
        editCell.image               = model.image;
        editCell.editBlock           = ^{
            [self.dataSource removeObjectAtIndex:indexPath.row];
            if (self.dataSource.count == 0) { self.allImage = NO; }
            [self.collectionView reloadData];
        };
    } else {
        if (indexPath.item == self.dataSource.count) {
            WYACameraCell * cameraCell = (WYACameraCell *)cell;
            cameraCell.imageView.image = [UIImage imageNamed:@"icon_add"];
        } else {
            WYACameraModel * model       = self.dataSource[indexPath.item];
            WYAEditCameraCell * editCell = (WYAEditCameraCell *)cell;
            editCell.image               = model.image;
            editCell.editBlock           = ^{
                [self.dataSource removeObjectAtIndex:indexPath.row];
                if (self.dataSource.count == 0) { self.allImage = NO; }
                [self.collectionView reloadData];
            };
        }
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (ScreenWidth - 50) / 4;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10 * SizeAdapter, 10, 10 * SizeAdapter, 10);
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
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
    if (indexPath.item == self.dataSource.count) {
        if (self.textField.text.length < 1 || [self.textField.text integerValue] == 0) {
            [UIView wya_showCenterToastWithMessage:@"请输入正确的图片数量"];
            return;
        }
        WYAAlertController * alert = [WYAAlertController wya_alertSheetWithTitle:@"" Message:@"" AlertSheetCornerRadius:0];
        WeakSelf(weakSelf);
        WYAAlertAction * defaultAction = [WYAAlertAction wya_actionWithTitle:@"相机"
                                                                   textColor:nil
                                                                    textFont:nil
                                                                     handler:^{
                                                                         WYACameraViewController * camera =
                                                                             [[WYACameraViewController alloc] initWithType:WYACameraTypeVideo
                                                                                                         cameraOrientation:WYACameraOrientationFront];
                                                                         camera.preset    = WYAVideoPresetHigh;
                                                                         camera.saveAblum = YES;
                                                                         camera.albumName = @"测试";
                                                                         camera.takePhoto = ^(UIImage * photo, NSString * imagePath) {
                                                                             WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                             model.image            = photo;
                                                                             model.sourceType       = WYACameraSourceTypeImage;
                                                                             [self.dataSource insertObject:model atIndex:0];
                                                                             if ([self.textField.text integerValue] == self.dataSource.count) {
                                                                                 self.allImage = YES;
                                                                             }
                                                                             [self.collectionView reloadData];
                                                                         };
                                                                         camera.takeVideo = ^(NSString * videoPath) {
                                                                             WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                             UIImage * image        = [UIImage
                                                                                 wya_getVideoPreViewImage:[NSURL fileURLWithPath:videoPath]];
                                                                             model.image      = image;
                                                                             model.sourceType = WYACameraSourceTypeVideo;
                                                                             [self.dataSource insertObject:model atIndex:0];
                                                                             if ([self.textField.text integerValue] == self.dataSource.count) {
                                                                                 self.allImage = YES;
                                                                             }
                                                                             [self.collectionView reloadData];
                                                                         };
                                                                         [weakSelf presentViewController:camera animated:YES completion:nil];
                                                                     }];

        WYAAlertAction * cancelAction = [WYAAlertAction wya_actionWithTitle:@"相册"
                                                                  textColor:nil
                                                                   textFont:nil
                                                                    handler:^{
                                                                        NSInteger inter =
                                                                            [self.textField.text integerValue] - self.dataSource.count;
                                                                        if (inter == 0) { return; }
//                                                                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                                                                            ZLPhotoActionSheet * sheet = [self getPasWithNumber:inter];
//                                                                            [sheet showPhotoLibrary];
//                                                                        });
                                                                        WYAPhotoBrowser * photo = [[WYAPhotoBrowser alloc] init];
                                                                        photo.config.maxSelectCount = inter;
                                                                        photo.callBackBlock = ^(NSMutableArray * _Nonnull media) {
                                                                            NSLog(@"images==%@", media);
                                                                            NSMutableArray * array = [NSMutableArray array];
                                                                            for (NSObject * image in media) {
                                                                                if ([image isKindOfClass:[UIImage class]]) {
                                                                                    WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                                    model.image            = (UIImage *)image;
                                                                                    model.sourceType       = WYACameraSourceTypeImage;
                                                                                    [array addObject:model];
                                                                                }
                                                                            }
                                                                            [self.dataSource
                                                                             insertObjects:array
                                                                             atIndexes:[NSIndexSet
                                                                                        indexSetWithIndexesInRange:NSMakeRange(
                                                                                                                               0,
                                                                                                                               media
                                                                                                                               .count)]];
                                                                            if ([self.textField.text integerValue] == self.dataSource.count) {
                                                                                self.allImage = YES;
                                                                            }
                                                                            [self.collectionView reloadData];
                                                                        };
                                                                        [weakSelf presentViewController:photo animated:YES completion:nil];

                                                                    }];
        [alert wya_addAction:defaultAction];
        [alert wya_addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];

    } else {
        NSMutableArray * arr = [NSMutableArray array];
        for (NSInteger index = 0; index < self.dataSource.count; index++) {
            WYACameraModel * model = self.dataSource[index];
            [arr addObject:model.image];
        }

        WYAImageBrowser * imageBrowser = [WYAImageBrowser showImageBrowserWithCurrentImageIndex:indexPath.item
            imageCount:arr.count
            datasource:nil
            placeHoldImageBlock:^UIImage *(WYAImageBrowser * browser, NSInteger index) {
                return arr[index];
            }
            HighQualityImageURLBlock:^NSURL *(WYAImageBrowser * browser, NSInteger index) {
                return nil;
            }
            AssetBlock:^ALAsset *(WYAImageBrowser * browser, NSInteger index) {
                return nil;
            }
            SourceImageViewBlock:^UIImageView *(WYAImageBrowser * browser, NSInteger index) {
                WYAEditCameraCell * cell = (WYAEditCameraCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
                return cell.imageView;
            }];
        imageBrowser.hidesForSinglePage = NO;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (ZLPhotoActionSheet *)getPasWithNumber:(NSInteger)number {
    ZLPhotoActionSheet * actionSheet = [[ZLPhotoActionSheet alloc] init];

    actionSheet.configuration.allowSelectGif       = YES;
    actionSheet.configuration.allowSelectVideo     = YES;
    actionSheet.configuration.allowSelectLivePhoto = YES;
    actionSheet.configuration.allowForceTouch      = YES;
    actionSheet.configuration.allowEditImage       = YES;
    actionSheet.configuration.allowEditVideo       = YES;
    actionSheet.configuration.allowMixSelect       = YES;
    //设置相册内部显示拍照按钮
    actionSheet.configuration.allowTakePhotoInLibrary = YES;
    //设置在内部拍照按钮上实时显示相机俘获画面
    actionSheet.configuration.showCaptureImageOnTakePhotoBtn = YES;
    //设置照片最大预览数
    actionSheet.configuration.maxPreviewCount = 20;
    //设置照片最大选择数
    actionSheet.configuration.maxSelectCount = number;
    //设置允许选择的视频最大时长
    actionSheet.configuration.maxVideoDuration = 120;
    //设置照片cell弧度
    actionSheet.configuration.cellCornerRadio = 4;
    //单选模式是否显示选择按钮
    //    actionSheet.configuration.showSelectBtn = YES;
    //是否在选择图片后直接进入编辑界面
    actionSheet.configuration.editAfterSelectThumbnailImage = YES;
    //是否保存编辑后的图片
    //    actionSheet.configuration.saveNewImageAfterEdit = NO;
    //设置编辑比例
    //    actionSheet.configuration.clipRatios = @[GetClipRatio(7, 1)];
    //是否在已选择照片上显示遮罩层
    actionSheet.configuration.showSelectedMask = YES;
    //颜色，状态栏样式
    actionSheet.configuration.selectedMaskColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    actionSheet.configuration.navBarColor       = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    actionSheet.configuration.navTitleColor     = [UIColor blackColor];
    //    actionSheet.configuration.bottomBtnsNormalTitleColor = kRGB(80, 160, 100);
    //    actionSheet.configuration.bottomBtnsDisableBgColor = kRGB(190, 30, 90);
    actionSheet.configuration.bottomViewBgColor = [UIColor whiteColor];
    actionSheet.configuration.statusBarStyle    = UIStatusBarStyleDefault;
    //是否允许框架解析图片
    actionSheet.configuration.shouldAnialysisAsset = YES;
    //框架语言
    actionSheet.configuration.languageType = ZLLanguageChineseSimplified;
    //自定义多语言
    //    actionSheet.configuration.customLanguageKeyValue = @{@"ZLPhotoBrowserCameraText": @"没错，我就是一个相机"};
    //自定义图片
    //    actionSheet.configuration.customImageNames = @[@"zl_navBack"];

    //是否使用系统相机
    //    actionSheet.configuration.useSystemCamera = YES;
    //    actionSheet.configuration.sessionPreset = ZLCaptureSessionPreset1920x1080;
    //    actionSheet.configuration.exportVideoType = ZLExportVideoTypeMp4;
    //    actionSheet.configuration.allowRecordVideo = NO;
    //    actionSheet.configuration.maxVideoDuration = 5;
#pragma mark - required
    //如果调用的方法没有传sender，则该属性必须提前赋值
    actionSheet.sender = self;
    //记录上次选择的图片

    [actionSheet setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        NSMutableArray * array = [NSMutableArray array];
        for (NSObject * image in images) {
            if ([image isKindOfClass:[UIImage class]]) {
                WYACameraModel * model = [[WYACameraModel alloc] init];
                model.image            = (UIImage *)image;
                model.sourceType       = WYACameraSourceTypeImage;
                [array addObject:model];
            }
        }
        [self.dataSource insertObjects:array atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, images.count)]];
        if ([self.textField.text integerValue] == self.dataSource.count) {
            self.allImage = YES;
        }
        [self.collectionView reloadData];
    }];

    actionSheet.selectImageRequestErrorBlock = ^(NSArray<PHAsset *> * _Nonnull errorAssets, NSArray<NSNumber *> * _Nonnull errorIndex) {
        NSLog(@"图片解析出错的索引为: %@, 对应assets为: %@", errorIndex, errorAssets);
    };

    actionSheet.cancleBlock = ^{
        NSLog(@"取消选择图片");
    };

    return actionSheet;
}

@end
