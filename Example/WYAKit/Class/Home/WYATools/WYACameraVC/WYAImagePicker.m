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

#define CameraCell @"WYACameraCell"
#define EditCameraCell @"WYAEditCameraCell"

@interface WYAImagePicker () <UICollectionViewDelegate, UICollectionViewDataSource,
                              UIPopoverPresentationControllerDelegate, UITextFieldDelegate, WYAImageBrowserDelegate>
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) UIButton * puzzleButton;
@property (nonatomic, assign) BOOL allImage;

@end

@implementation WYAImagePicker {
    NSMutableArray * videos;
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    [self showPopverPresentVC:sender];
}
#pragma mark ======= popverPresentVC
- (void)showPopverPresentVC:(UIButton *)sender
{
    WeakSelf(weakSelf);
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
            [weakSelf.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAHardware/WYAPhotoBrowser/README.md";
            [weakSelf.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 2) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAUIKit/WYAImageCrop/README.md";
            [weakSelf.navigationController pushViewController:vc animated:YES];
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
(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}
#pragma mark ======= end
- (void)viewDidLoad
{
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
    [self.view addSubview:self.puzzleButton];
}
#pragma mark--- Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection              = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize          = CGSizeMake(ScreenWidth, 0 * SizeAdapter);
            UICollectionView * object           = [[UICollectionView alloc] initWithFrame:CGRectMake(0, WYATopHeight + 50 * SizeAdapter, ScreenWidth, ScreenHeight - WYATopHeight - 100 * SizeAdapter - WYABottomHeight) collectionViewLayout:layout];
            object.delegate                     = self;
            object.dataSource                   = self;
            object.backgroundColor              = [UIColor groupTableViewBackgroundColor];
            [object registerNib:[UINib nibWithNibName:@"WYACameraCell" bundle:nil]
            forCellWithReuseIdentifier:CameraCell];
            [object registerClass:[WYAEditCameraCell class]
            forCellWithReuseIdentifier:EditCameraCell];
            object;
        });
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _dataSource;
}

- (UIButton *)puzzleButton
{
    if (!_puzzleButton) {
        _puzzleButton = ({
            UIButton * object = [[UIButton alloc] initWithFrame:CGRectMake(0, self.collectionView.cmam_bottom, self.view.cmam_width, 50 * SizeAdapter)];
            [object setTitle:@"拼图" forState:UIControlStateNormal];
            [object setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:15];
            [object setBackgroundImage:[UIImage wya_createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            WeakSelf(weakSelf);
            [object addCallBackAction:^(UIButton * button) {
                WYAPuzzleViewController * vc         = [[WYAPuzzleViewController alloc] init];
                vc.selectIndex                       = 0;
                vc.title                             = @"拼图制作";
                vc.menuViewStyle                     = WYAMenuViewStyleDefault;
                vc.automaticallyCalculatesItemWidths = YES;
                vc.titleColorSelected                = BLUECOLOR;
                vc.titleColorNormal                  = BLACKTITLECOLOR;
                vc.progressColor                     = BLUECOLOR;
                vc.titleSizeSelected                 = 16;
                vc.hidesBottomBarWhenPushed          = YES;
                NSMutableArray * arr                 = [NSMutableArray arrayWithCapacity:0];
                for (WYACameraModel * model in weakSelf.dataSource) {
                    [arr addObject:model.image];
                }
                vc.images = arr;
                [self.navigationController pushViewController:vc animated:YES];
            }];

            object;
        });
    }
    return _puzzleButton;
}

#pragma mark - WYAImageBrowserDelegate
- (void)photoBrowser:(WYAPhotoBrowser *)browser clickActionSheetIndex:(NSInteger)actionSheetindex currentImageIndex:(NSInteger)currentImageIndex
{
    NSLog(@"actionindex==%ld,currentImageindex==%ld", (long)actionSheetindex, (long)currentImageIndex);
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count + (self.allImage ? 0 : 1);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
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

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.allImage) {
        WYACameraModel * model       = self.dataSource[indexPath.item];
        WYAEditCameraCell * editCell = (WYAEditCameraCell *)cell;
        editCell.image               = model.image;
        editCell.editBlock           = ^{
            [self.dataSource removeObjectAtIndex:indexPath.row];
            if (self.dataSource.count == 0) {
                self.allImage = NO;
            }
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
                if (self.dataSource.count == 0) {
                    self.allImage = NO;
                }
                [self.collectionView reloadData];
            };
        }
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (ScreenWidth - 50) / 4;
    return CGSizeMake(width, width);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10 * SizeAdapter, 10, 10 * SizeAdapter, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 * SizeAdapter;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                             layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
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
                                                                         StrongSelf(strongSelf);
                                                                         WYACameraViewController * camera =
                                                                         [[WYACameraViewController alloc] initWithType:WYACameraTypeVideo
                                                                                                     cameraOrientation:WYACameraOrientationFront];
                                                                         camera.preset    = AVCaptureSessionPresetMedium;
                                                                         camera.saveAblum = YES;
                                                                         camera.albumName = @"测试";
                                                                         camera.takePhoto = ^(UIImage * photo, NSString * imagePath) {
                                                                             WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                             model.image            = photo;
                                                                             model.sourceType       = WYACameraSourceTypeImage;
                                                                             [strongSelf.dataSource insertObject:model atIndex:0];
                                                                             if ([strongSelf.textField.text integerValue] == strongSelf.dataSource.count) {
                                                                                 strongSelf.allImage = YES;
                                                                             }
                                                                             [strongSelf.collectionView reloadData];
                                                                         };
                                                                         camera.takeVideo = ^(NSString * videoPath) {
                                                                             WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                             UIImage * image        = [UIImage
                                                                             wya_getVideoPreViewImage:[NSURL fileURLWithPath:videoPath]];
                                                                             model.image      = image;
                                                                             model.sourceType = WYACameraSourceTypeVideo;
                                                                             [strongSelf.dataSource insertObject:model atIndex:0];
                                                                             if ([strongSelf.textField.text integerValue] == strongSelf.dataSource.count) {
                                                                                 strongSelf.allImage = YES;
                                                                             }
                                                                             [strongSelf.collectionView reloadData];
                                                                         };
                                                                         [weakSelf presentViewController:camera animated:YES completion:nil];
                                                                     }];

        WYAAlertAction * cancelAction = [WYAAlertAction wya_actionWithTitle:@"相册"
                                                                  textColor:nil
                                                                   textFont:nil
                                                                    handler:^{
                                                                        StrongSelf(strongSelf);
                                                                        NSInteger inter =
                                                                        [strongSelf.textField.text integerValue] - strongSelf.dataSource.count;
                                                                        if (inter == 0) {
                                                                            return;
                                                                        }

                                                                        WYAPhotoBrowser * photo     = [[WYAPhotoBrowser alloc] init];
                                                                        photo.config.maxSelectCount = inter;
                                                                        photo.config.sortAscending  = NO;
            photo.config.canTakePicture = YES;
            photo.config.maxEditVideoTime = 60;
            photo.config.maxVideoDuration = 60;
                                                                        photo.callBackBlock         = ^(NSMutableArray<UIImage *> * _Nonnull medias, NSMutableArray<PHAsset *> * _Nonnull assets) {
                                                                            NSLog(@"images==%@", medias);
                                                                            videos                 = assets;
                                                                            NSMutableArray * array = [NSMutableArray array];
                                                                            for (UIImage * image in medias) {
                                                                                WYACameraModel * model = [[WYACameraModel alloc] init];
                                                                                model.image            = image;
                                                                                model.sourceType       = WYACameraSourceTypeImage;
                                                                                [array addObject:model];
                                                                            }
                                                                            [strongSelf.dataSource insertObjects:array atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, medias.count)]];
                                                                            if ([strongSelf.textField.text integerValue] == strongSelf.dataSource.count) {
                                                                                strongSelf.allImage = YES;
                                                                            }
                                                                            [strongSelf.collectionView reloadData];
                                                                        };
                                                                        photo.modalPresentationStyle = UIModalPresentationFullScreen;
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
        imageBrowser.browserStyle       = WYAImageBrowserStyleSimple;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
