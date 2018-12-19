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
@interface WYAHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;

@end

@implementation WYAHomeViewController
#pragma mark ======= Life Cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];

}
#pragma mark ======= 懒加载

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight - WYATabBarHeight) style:UITableViewStyleGrouped];
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
    return 70*SizeAdapter;
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
        WYABaseViewController * vc = [[NSClassFromString(itemModel.className) alloc]init];
        vc.navTitle = itemModel.className;
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([itemModel.rowName isEqualToString:@"WYAClearCache 清理缓存"]) {
        // 清理缓存
        [WYAClearCache wya_defaultCachesFolderSizeBlock:^(float folderSize) {
            NSLog(@"%.2fMB",folderSize);
            [self showAlertWith:[NSString stringWithFormat:@"%.2fMB",folderSize]];
        } UnitType:WYAFileSizeUnitMB];
    }
}
// 缓存弹框提示
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

@end
