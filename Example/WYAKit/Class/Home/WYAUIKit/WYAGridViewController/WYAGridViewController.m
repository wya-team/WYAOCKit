//
//  WYAGridViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAGridViewController.h"
#import "WYAGridItemCell.h"

#define GRIDCELL @"GridCell"

@interface WYAGridViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
@end

@implementation WYAGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 [self.view addSubview:self.collectionView];
}
#pragma mark ======= 懒加载
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.itemSize = CGSizeMake(ScreenWidth/4, 100);
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
            UICollectionView * object = [[UICollectionView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) collectionViewLayout:layout];
            object.delegate = self;
            object.dataSource = self;
            object.backgroundColor = [UIColor whiteColor];
            [object registerClass:[WYAGridItemCell class] forCellWithReuseIdentifier:GRIDCELL];
            
            object;
        });
    }
    return _collectionView;
}

- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"item0",
                                 @"item1",
                                 @"item2",
                                 @"item3",
                                 @"item4",
                                 @"item5",
                                 @"item6",
                                 @"item7",
                                 @"item8",
                                 @"item9"];
            object;
        });
    }
    return _dataSource;
}
#pragma mark ======= UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WYAGridItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:GRIDCELL forIndexPath:indexPath];
    cell.titleString = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
    return cell;
}
@end
