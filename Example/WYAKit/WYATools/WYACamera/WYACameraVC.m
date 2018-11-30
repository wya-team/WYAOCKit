//
//  WYACameraVC.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/24.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACameraVC.h"

#import "WYACameraCell.h"
#import "WYAEditCameraCell.h"


#define CameraCell @"WYACameraCell"
#define EditCameraCell @"WYAEditCameraCell"

@interface WYACameraVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@end

@implementation WYACameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}
#pragma mark --- Getter
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize = CGSizeMake(ScreenWidth, 20*SizeAdapter);
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            object.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [object registerNib:[UINib nibWithNibName:@"WYACameraCell" bundle:nil] forCellWithReuseIdentifier:CameraCell];
            [object registerNib:[UINib nibWithNibName:@"WYAEditCameraCell" bundle:nil] forCellWithReuseIdentifier:EditCameraCell];
            object;
        });
    }
    return _collectionView;
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

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return self.dataSource.count;
    }
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WYACameraCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CameraCell forIndexPath:indexPath];
        return cell;
    }else{
        WYAEditCameraCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:EditCameraCell forIndexPath:indexPath];
        return cell;
    }
    
}

#pragma mark ======= UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WYACameraCell * cameraCell = (WYACameraCell *)cell;
        if (indexPath.item == 0) {
            cameraCell.imageView.image = [UIImage imageNamed:@"plus"];
        }else if (indexPath.item == 1) {
            cameraCell.imageView.image = [UIImage imageNamed:@"xiangce"];
        }else{
            cameraCell.imageView.image = [UIImage imageNamed:@"xiangji"];
        }
    }else{
        WYAEditCameraCell * editCell = (WYAEditCameraCell *)cell;
        editCell.imageView.image = self.dataSource[indexPath.item];
        editCell.editBlock = ^{
            [self.dataSource removeObjectAtIndex:indexPath.row];
            [self.collectionView reloadData];
        };
    }
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat width = (ScreenWidth-20)/3;
        return CGSizeMake(width, width);
    }else{
        CGFloat width = (ScreenWidth-25)/4;
        return CGSizeMake(width, width);
    }
    
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
    return UIEdgeInsetsMake(0*SizeAdapter, 5, 0*SizeAdapter, 5);
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
    if (indexPath.section == 0) {
        if (indexPath.item == 0 || indexPath.item == 1) {
            WYAPhotoBrowser * photo = [[WYAPhotoBrowser alloc]initWithMaxCount:5];
            photo.callBackBlock = ^(NSMutableArray<UIImage *> * _Nonnull images) {
                NSLog(@"images==%@",images);
                self.dataSource = images;
                [self.collectionView reloadData];
            };
            [self presentViewController:photo animated:YES completion:nil];
        }else{
            WYACameraViewController * camera = [[WYACameraViewController alloc]init];
            [self presentViewController:camera animated:YES completion:nil];
        }
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
