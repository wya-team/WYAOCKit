//
//  WYACameraVC.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/24.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACameraVC.h"
#import "WYACameraCell.h"
#import "WYAPopVerReadMeViewController.h"
#define CameraCell @"WYACameraCell"
#define EditCameraCell @"WYAEditCameraCell"

@interface WYACameraVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UIPopoverPresentationControllerDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@end

@implementation WYACameraVC
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    [self showPopverPresentVC:sender];
    
}
#pragma mark ======= popverPresentVC
- (void)showPopverPresentVC:(UIButton *)sender{
    WYAPopVerReadMeViewController * test = [[WYAPopVerReadMeViewController alloc]init];
    test.preferredContentSize = CGSizeMake(180*SizeAdapter, 130*SizeAdapter);
    test.dataSource = @[@"WYACamera(相机)",@"WYAPhotoBrowser(相册)",@"WYAImageCrop(裁剪)"];
    test.modalPresentationStyle = UIModalPresentationPopover;
    __block WYAPopVerReadMeViewController * vc = test;
    test.pushCallback = ^(NSIndexPath * _Nonnull indexPath) {
        [vc dismissViewControllerAnimated:YES completion:nil];
        if (indexPath.row == 0) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
            vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/WYACamera/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
            vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAHardware/WYAPhotoBrowser/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
            vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYAImageCrop/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    };
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate = self;
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;//设置箭头位置
    popover.sourceView = sender;//设置目标视图
    popover.sourceRect = sender.bounds;//弹出视图显示位置
    popover.backgroundColor = [UIColor whiteColor];//设置弹窗背景颜色
    popover.popoverBackgroundViewClass = [WYACustomPopoverBackgroundView class];
    [self presentViewController:test animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
    return UIModalPresentationNone;
    
}
#pragma mark ======= end
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];
    
    self.textField = [[UITextField alloc]init];
    self.textField.placeholder = @"请输入图片选择最大数量";
    self.textField.delegate = self;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.textField];
    CGFloat textField_X = 10;
    CGFloat textField_Y = WYATopHeight + 5*SizeAdapter;
    CGFloat textField_Width = ScreenWidth-20;
    CGFloat textField_Height = 40*SizeAdapter;
    self.textField.frame = CGRectMake(textField_X, textField_Y, textField_Width, textField_Height);
    
    [self.view addSubview:self.collectionView];
}
#pragma mark --- Getter
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize = CGSizeMake(ScreenWidth, 0*SizeAdapter);
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectMake(0, WYATopHeight+50*SizeAdapter, ScreenWidth, ScreenHeight-WYATopHeight) collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            object.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [object registerNib:[UINib nibWithNibName:@"WYACameraCell" bundle:nil] forCellWithReuseIdentifier:CameraCell];
            [object registerClass:[WYAEditCameraCell class] forCellWithReuseIdentifier:EditCameraCell];
            object;
        });
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            [object addObject:@""];
            object;
        });
    }
    return _dataSource;
}

#pragma mark - UITextFieldDelegate  -
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == self.dataSource.count-1) {
        WYACameraCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CameraCell forIndexPath:indexPath];
        return cell;
    }else{
        WYAEditCameraCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:EditCameraCell forIndexPath:indexPath];
        return cell;
    }
    
}

#pragma mark ======= UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == self.dataSource.count-1) {
        WYACameraCell * cameraCell = (WYACameraCell *)cell;
        cameraCell.imageView.image = [UIImage imageNamed:@"icon_add"];
    }else{
        WYAEditCameraCell * editCell = (WYAEditCameraCell *)cell;
        editCell.image = self.dataSource[indexPath.item];
        editCell.editBlock = ^{
            [self.dataSource removeObjectAtIndex:indexPath.row];
            [self.collectionView reloadData];
        };
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (ScreenWidth-50)/4;
    return CGSizeMake(width, width);
    
}
//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10*SizeAdapter, 10, 10*SizeAdapter, 10);
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
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
    if (indexPath.item == self.dataSource.count-1) {
        WYAAlertController * alert = [WYAAlertController wya_AlertSheetWithTitle:@"" Message:@""];
        WeakSelf(weakSelf);
        WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"相机" style:WYAAlertActionStyleDefault handler:^{
            WYACameraViewController * camera = [[WYACameraViewController alloc]initWithType:WYACameraTypeAll];
            camera.takePhoto = ^(UIImage *photo) {
                [self.dataSource insertObject:photo atIndex:0];
                [self.collectionView reloadData];
            };
            [weakSelf presentViewController:camera animated:YES completion:nil];
            
        }];
        WYAAlertAction *cancelAction = [WYAAlertAction wya_ActionWithTitle:@"相册" style:WYAAlertActionStyleDefault handler:^{
            
            WYAPhotoBrowser * photo = [[WYAPhotoBrowser alloc]initWithMaxCount:[self.textField.text integerValue]];
            photo.callBackBlock = ^(NSMutableArray<UIImage *> * _Nonnull images) {
                NSLog(@"images==%@",images);
                [self.dataSource insertObjects:images atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, images.count)]];
                [self.collectionView reloadData];
            };
            [weakSelf presentViewController:photo animated:YES completion:nil];
            
        }];
        
        [alert wya_AddAction:defaultAction];
        [alert wya_AddAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
