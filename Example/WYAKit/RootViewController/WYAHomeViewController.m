//
//  WYAHomeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeViewController.h"
#import "HomeHeader.h"

#define HOMEITEMCELL @"WYAHomeItemCell"
#define HEADERVIEW @"HEADERVIEW"
@interface WYAHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) UILabel * cellLabel;
@end

@implementation WYAHomeViewController
#pragma mark ======= Life Cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
    NSLog(@"center.view.willAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"center.view.willDisAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.collectionView];

}
#pragma mark ======= 懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize = CGSizeMake(ScreenWidth, 200);
            layout.itemSize = CGSizeMake(100, 100);
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            object.backgroundColor = [UIColor whiteColor];
            [object registerClass:[WYAHomeItemCell class] forCellWithReuseIdentifier:HOMEITEMCELL];
            [object registerClass:[WYABannerHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW];

            object;
       });
    }
    return _collectionView;
}

- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"文本输入",
                                 @"二维码/条形码",
                                 @"弹框/上拉框",
                                 @"相册/相机/录制视频",
                                 @"指示框",
                                 @"分级菜单选择",
                                 @"滑动条（开/闭区间）",
                                 @"分页控制器",
                                 @"滑动选择器",
                                 @"自定义cell",
                                 @"图片预览器"];
            object;
        });
    }
    return _dataSource;
}
#pragma mark ======= UICollectionViewDelegateFlowLayout
////设置每个item的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(ScreenWidth*0.5-20, 80);
//}

////footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}
//
////header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAHomeItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOMEITEMCELL forIndexPath:indexPath];
    cell.titleString = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    WYABannerHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW forIndexPath:indexPath];
    headerView.backgroundColor = randomColor;
    return headerView;
}
#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
   
    NSLog(@"indexPath.row-------%ld",indexPath.row);
}


- (UILabel *)cellLabel{
    if(!_cellLabel){
        _cellLabel = ({
            UILabel * object = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            object.textColor= [UIColor whiteColor];
            object.numberOfLines = 0;
            object.textAlignment = NSTextAlignmentCenter;
            object;
       });
    }
    return _cellLabel;
}
@end
