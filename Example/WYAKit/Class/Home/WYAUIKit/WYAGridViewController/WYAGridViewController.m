//
//  WYAGridViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAGridViewController.h"
#import "WYAAdjustCell.h"
#import "WYAGridHeaderView.h"
#import "WYAGridItemCell.h"
#import "WYALeftIconCell.h"
#import "WYANoBorderCell.h"

#define LEFTICONCELL @"WYALeftIconCell"
#define HEADERVIEW @"WYAGridHeaderView"
#define GRIDCELL @"GridCell"
#define NOBORDERCELL @"WYANoBorderCell"
#define ADJUSTCELL @"WYAAdjustCell"

@interface WYAGridViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray * titleArray;
@end

@implementation WYAGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}
#pragma mark ======= 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection              = UICollectionViewScrollDirectionVertical;
            layout.itemSize                     = CGSizeMake(ScreenWidth / 4, 100);
            layout.headerReferenceSize          = CGSizeMake(ScreenWidth, 30 * SizeAdapter);
            layout.minimumLineSpacing           = 0;
            layout.minimumInteritemSpacing      = 0;
            UICollectionView * object           = [[UICollectionView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) collectionViewLayout:layout];
            object.delegate                     = self;
            object.dataSource                   = self;
            object.backgroundColor              = BGCOLOR;
            [object registerClass:[WYAGridItemCell class] forCellWithReuseIdentifier:GRIDCELL];
            [object registerClass:[WYAAdjustCell class] forCellWithReuseIdentifier:ADJUSTCELL];
            [object registerClass:[WYANoBorderCell class] forCellWithReuseIdentifier:NOBORDERCELL];
            [object registerClass:[WYALeftIconCell class] forCellWithReuseIdentifier:LEFTICONCELL];
            [object registerClass:[WYAGridHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW];
            object;
        });
    }
    return _collectionView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth / 4, 100);
    }
    if (indexPath.section == 1) {
        return CGSizeMake(ScreenWidth / 4, 130);
    } else if (indexPath.section == 2) {
        return CGSizeMake(ScreenWidth / 3, 100);
    } else {
        return CGSizeMake(ScreenWidth / 2, 40);
    }
}
- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = ({
            NSArray * object = @[ @"item0",
                                  @"item1",
                                  @"item2",
                                  @"item3",
                                  @"item4",
                                  @"item5",
                                  @"item6",
                                  @"item7",
                                  @"item8",
                                  @"item9" ];
            object;
        });
    }
    return _dataSource;
}

#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section != 3) {
        return self.dataSource.count;
    }
    return 4;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        WYAGridItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:GRIDCELL forIndexPath:indexPath];
        cell.titleString       = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
        return cell;
    } else if (indexPath.section == 1) {
        WYAAdjustCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ADJUSTCELL forIndexPath:indexPath];
        cell.titleString     = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
        return cell;
    } else if (indexPath.section == 2) {
        WYANoBorderCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NOBORDERCELL forIndexPath:indexPath];
        cell.titleString       = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
        return cell;
    } else {
        WYALeftIconCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:LEFTICONCELL forIndexPath:indexPath];
        cell.titleString       = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
        return cell;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    WYAGridHeaderView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADERVIEW forIndexPath:indexPath];
    view.title               = [self.titleArray wya_safeObjectAtIndex:indexPath.section];
    return view;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = ({
            NSArray * object = @[ @"  Alwats square grid item", @"  Grid item adjust accrodiding to img size", @"  No border", @"  leftIcon layout" ];
            object;
        });
    }
    return _titleArray;
}
@end
