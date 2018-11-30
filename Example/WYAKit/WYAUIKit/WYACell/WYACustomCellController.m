//
//  WYACustomCellController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACustomCellController.h"
#import "WYACellTableViewController.h"
#import "WYAInputItemCellController.h"
#import "WYAListCellController.h"
@interface WYACustomCellController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@end

@implementation WYACustomCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"自定义cell";
    [self.view addSubview:self.tableView];
}

#pragma mark ======= UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[WYAInputItemCellController new] animated:YES];
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[WYACellTableViewController new] animated:YES];
    }
    else if (indexPath.row == 2){
        
        [self.navigationController pushViewController:[[WYAListCellController alloc]init] animated:YES];

    }
}
#pragma mark ======= getter
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) style:UITableViewStylePlain];
            object.tableFooterView = [[UIView alloc]init];
            [object registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
            object.delegate = self;
            object.dataSource = self;
            object;
       });
    }
    return _tableView;
}

- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"InputItem",@"Accordion/Card",@"List"];
            object;
       });
    }
    return _dataSource;
}
@end
