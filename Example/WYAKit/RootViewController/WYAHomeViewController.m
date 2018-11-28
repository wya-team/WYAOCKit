//
//  WYAHomeViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeViewController.h"
#import "WYAStepperCell.h"
#define STEPPERCELLID @"WYAStepperCell"
#define HEADERVIEW @"HEADERVIEW"
@interface WYAHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UIImageView * collectionHeaderView;
@property (nonatomic, strong) NSArray * dataSource;
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
            [object registerClass:[WYAStepperCell class] forCellWithReuseIdentifier:STEPPERCELLID];
            [object registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW];
            object;
       });
    }
    return _collectionView;
}
- (UIImageView *)collectionHeaderView{
    if(!_collectionHeaderView){
        _collectionHeaderView = ({
            UIImageView * object = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
            object.backgroundColor = [UIColor brownColor];
            object;
        });
    }
    return _collectionHeaderView;
}
- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"stepper",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"stepper",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"stepper",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
            object;
        });
    }
    return _dataSource;
}
#pragma mark ======= UICollectionViewDelegateFlowLayout
////设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth*0.5-20, 80);
}

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
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAStepperCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:STEPPERCELLID forIndexPath:indexPath];
//    cell.backgroundColor = randomColor;
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW forIndexPath:indexPath];
    headerView.backgroundColor = randomColor;
    return headerView;
}
#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
   
    NSLog(@"indexPath.row-------%ld",indexPath.row);
}

@end
