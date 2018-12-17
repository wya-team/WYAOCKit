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
@interface WYAHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * dataSource;
//@property (nonatomic, strong) UILabel * cellLabel;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYAHomeViewController
#pragma mark ======= Life Cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.collectionView reloadData];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.tableView];

}
#pragma mark ======= 懒加载
/*
- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = ({
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.headerReferenceSize = CGSizeMake(ScreenWidth, 260);
            layout.itemSize = CGSizeMake(ScreenWidth/3, 100);
            layout.minimumLineSpacing = 0;
            layout.minimumInteritemSpacing = 0;
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
*/

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) style:UITableViewStyleGrouped];
            object.delegate = self;
            object.dataSource = self;
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            [object registerClass:[WYAHomeTableCell class] forCellReuseIdentifier:@"cell"];
            [object registerClass:[WYAHomeHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
            
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10*SizeAdapter)];
            view.backgroundColor = [UIColor groupTableViewBackgroundColor];
            object.tableHeaderView = view;
            object;
        });
    }
    return _tableView;
}

- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = [WYAHomeModel allModel];
            object;
        });
    }
    return _dataSource;
}

#pragma mark - UITableViewDataSource  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WYAHomeModel * model = self.dataSource[section];
    return model.select ? model.rows.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WYAHomeTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    WYAHomeModel * model = self.dataSource[indexPath.section];
    WYAHomeItemModel * itemModel = model.rows[indexPath.row];
    cell.model = itemModel;
    return cell;
}

#pragma mark - UITableViewDelegate  -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44*SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60*SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10*SizeAdapter;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WYAHomeHeaderView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    WYAHomeModel * model = self.dataSource[section];
    header.model = model;
    WeakSelf(weakSelf);
    header.headerHandle = ^{
        model.select = !model.select;
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    return header;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WYAHomeModel * homeModel = self.dataSource[indexPath.section];
    WYAHomeItemModel * itemModel = homeModel.rows[indexPath.row];
    if (itemModel.className) {
        if ([itemModel.className isEqualToString:@"WYADrawerViewController"]) {
            [UIView wya_ShowCenterToastWithMessage:@"抽屉视图不能作为二级控制器使用"];
            return;
        }
        [self.navigationController pushViewController:[[NSClassFromString(itemModel.className) alloc]init] animated:YES];
    }
}
/*
- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"文本输入",
                                 @"生成二维码/条形码",
                                 @"扫描二维码/条形码",
                                 @"弹框/上拉框",
                                 @"相册/相机/录制视频",
                                 @"指示框",
                                 @"分级菜单选择",
                                 @"滑动条（开/闭区间）",
                                 @"分页控制器",
                                 @"滑动选择器",
                                 @"自定义cell",
                                 @"图片预览器",
                                 @"Stepper",
                                 @"ShareView",
                                 @"版本对比",
                                 @"Realm",
                                 @"进度条",
                                 @"视频播放器",
                                 @"下载管理器",
                                 @"清理缓存",
                                 @"按钮"];
            object;
        });
    }
    return _dataSource;
}*/
/*
#pragma mark ======= UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
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
//    headerView.backgroundColor = randomColor;
    return headerView;
}
#pragma mark ======= UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[WYATextViewController alloc]init] animated:YES];
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[[WYAIMGCodeViewController alloc]init] animated:YES];
    }else if (indexPath.row == 2){
        WYAQRCodeViewController * qr = [[WYAQRCodeViewController alloc]init];
        qr.ScanReault = ^(NSString *reault) {
            [UIView wya_ShowBottomToastWithMessage:reault];
        };
        [self.navigationController pushViewController:qr animated:YES];
    }else if (indexPath.row == 3){
        [self.navigationController pushViewController:[[WYAUIAlertViewController alloc]init] animated:YES];
    }else if (indexPath.row == 4){
        [self.navigationController pushViewController:[[WYACameraVC alloc]init] animated:YES];
    }else if (indexPath.row == 5){
        [self.navigationController pushViewController:[[WYAPopViewController alloc]init] animated:YES];
    }else if (indexPath.row == 6){
        [self.navigationController pushViewController:[[WYAChooseMenuViewController alloc]init] animated:YES];
    }else if (indexPath.row == 7){
        [self.navigationController pushViewController:[[WYASliderViewController alloc]init] animated:YES];
    }else if (indexPath.row == 8){
        [self.navigationController pushViewController:[[WYAPageViewController alloc]init] animated:YES];
    }else if (indexPath.row == 9){
        [self.navigationController pushViewController:[[WYAPickerViewController alloc]init] animated:YES];
    }else if (indexPath.row == 10){
        [self.navigationController pushViewController:[[WYACustomCellController alloc]init] animated:YES];
    }else if (indexPath.row == 11){
        [self.navigationController pushViewController:[[WYAImageBrowserViewController alloc]init] animated:YES];
    }else if (indexPath.row == 12){
        [self.navigationController pushViewController:[[WYAStepperController alloc]init] animated:YES];
    }else if (indexPath.row == 13){
        WYAShareView * view = [[WYAShareView alloc]initWithFrame:CGRectZero];
     view.dataArray = @[@[@"内购订单",@"内购订单",@"内购订单",@"内购订单",@"内购订单"], @[@"内购订单",@"内购订单",@"内购订单",@"内购订单"]];
        [view wya_showShareViewWithController:self];
    }else if (indexPath.row == 14){
        [self wya_versionUpdateAlertView];
    }else if (indexPath.row == 15){
        [self.navigationController pushViewController:[[WYAReamlViewController alloc]init] animated:YES];
    }else if (indexPath.row == 16) {
        [self.navigationController pushViewController:[[WYAProgressViewController alloc]init] animated:YES];
    }else if (indexPath.row == 17) {
        [self.navigationController pushViewController:[[WYAVideoPlayerViewController alloc]init] animated:YES];
    }else if (indexPath.row == 18) {
        [self.navigationController pushViewController:[[WYADownloaderViewController alloc]init] animated:YES];
    }else if (indexPath.row == 19){
        [WYAClearCache wya_defaultCachesFolderSizeBlock:^(float folderSize) {
            NSLog(@"%.2fMB",folderSize);
            [self showAlertWith:[NSString stringWithFormat:@"%.2fMB",folderSize]];
        } UnitType:WYAFileSizeUnitMB];
        
    }else if (indexPath.row == 20) {
        [self.navigationController pushViewController:[[WYAButtonViewController alloc]init] animated:YES];
    }
    NSLog(@"indexPath.row-------%ld",indexPath.row);
}
- (void)showAlertWith:(NSString *)size{
    WYAAlertController *alert = [WYAAlertController wya_AlertWithTitle:@"清理缓存"
                                                               Message:[NSString stringWithFormat:@"当前缓存%@，是否清理",size]
                                                      AlertLayoutStyle:WYAAlertLayoutStyleHorizontal];
    alert.backgroundButton.enabled = NO;
    // 创建 action
    WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"清理" style:WYAAlertActionStyleCancel handler:^{ NSLog(@"Default");
        [WYAClearCache wya_clearCachesClearStatusBlock:^(BOOL status) {
            NSLog(@"清理成功");
        }];
    }];
    WYAAlertAction *cancelAction = [WYAAlertAction wya_ActionWithTitle:@"取消" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Cancel"); }];
    [alert wya_AddAction:cancelAction];
    [alert wya_AddAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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
}*/




@end
