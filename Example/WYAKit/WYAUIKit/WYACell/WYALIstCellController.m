//
//  WYAListCellController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAListCellController.h"
#import "WYAListOneCell.h"
#import "WYAListTwoCell.h"
#import "WYAListThreeCell.h"
#import "WYAListFourCell.h"
#import "WYAListModel.h"
#define ONECELLID @"oneCellId"
#define TWOCELLId @"twoCellId"
#define THREECELLID @"threeCellId"
#define FOURCELLID @"fourCellId"

@interface WYAListCellController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray * sectionArray;
@end
@implementation WYAListCellController
#pragma mark ======= Life Cycle
- (void)viewDidLoad{
    self.navTitle = @"List";
    [self.view addSubview:self.tableView];
}
#pragma mark ======= UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataSource wya_safeObjectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
        {
            WYAListOneCell * cell = [tableView dequeueReusableCellWithIdentifier:ONECELLID];
            cell.model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            return cell;
        }
            break;
        case 1:
        {
            WYAListTwoCell * cell = [tableView dequeueReusableCellWithIdentifier:TWOCELLId];
            cell.model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            return cell;
        }
            break;
        case 2:
        {
            WYAListThreeCell * cell = [tableView dequeueReusableCellWithIdentifier:THREECELLID];
            WYATextListModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            cell.model = model;
            return cell;
        }
            break;
        case 3:
        {
            WYAListFourCell * cell = [tableView dequeueReusableCellWithIdentifier:FOURCELLID];
            WYAListCellModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            cell.model = model;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30*SizeAdapter)];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.font = FONT(16);
    label.textColor = [UIColor grayColor];
    label.text = [self.sectionArray wya_safeObjectAtIndex:section];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 65*SizeAdapter;
    }
    return 44*SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30*SizeAdapter;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark ======= getter
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) style:UITableViewStylePlain];
            object.tableFooterView = [[UIView alloc]init];
            [object registerClass:[WYAListOneCell class] forCellReuseIdentifier:ONECELLID];
            [object registerClass:[WYAListTwoCell class] forCellReuseIdentifier:TWOCELLId];
            [object registerClass:[WYAListThreeCell class] forCellReuseIdentifier:THREECELLID];
            [object registerClass:[WYAListFourCell class] forCellReuseIdentifier:FOURCELLID];
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
            NSArray * object = @[[self createModelOneArray],[self createModelTwoArray],[self createModelThreeArray],[self createModelfourArray]];
            object;
        });
    }
    return _dataSource;
}

- (NSArray *)createModelOneArray{
    NSMutableArray * array = [NSMutableArray array];
    
    WYAListModel * model1 = [WYAListModel modelWith:0 iconNamed:@"icon_list" titleString:@"标题文字" rightString:nil arrowImageNamed:@"jiantou"];
    WYAListModel * model2 = [WYAListModel modelWith:2 iconNamed:@"icon_list" titleString:@"标题文字" rightString:nil arrowImageNamed:nil];
    WYAListModel * model3 = [WYAListModel modelWith:0 iconNamed:@"icon_list" titleString:@"标题文字" rightString:nil arrowImageNamed:@"jiantou"];
    WYAListModel * model4 = [WYAListModel modelWith:1 iconNamed:@"icon_list" titleString:@"标题文字" rightString:@"详细信息" arrowImageNamed:@"jiantou"];
    
    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    [array wya_safeAddObject:model3];
    [array wya_safeAddObject:model4];
    
    return [array copy];
}

- (NSArray *)createModelTwoArray{
    NSMutableArray * array = [NSMutableArray array];
    WYATwoRowListModel * model1 = [WYATwoRowListModel modelWith:1 iconNamed:nil titleString:@"双行列表" subTitleString:@"描述信息" rightString:@"详细信息" arrowImageNamed:@"jiantou"];
    
    WYATwoRowListModel * model2 = [WYATwoRowListModel modelWith:0 iconNamed:@"icon_list" titleString:@"双行列表" subTitleString:@"描述信息" rightString:@"详细信息" arrowImageNamed:@"jiantou"];
    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    return [array copy];
}

- (NSArray *)createModelThreeArray{
    NSMutableArray * array = [NSMutableArray array];
   
    WYATextListModel * model1 = [WYATextListModel modelWith:0 titleString:@"单行列表" rightImage:@"icon_list" rightString:nil arrowImageNamed:@"jiantou"];
    
    WYATextListModel * model2 = [WYATextListModel modelWith:1 titleString:@"单行列表" rightImage:nil rightString:@"我是描述信息" arrowImageNamed:@"jiantou"];
    
    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    return [array copy];
}

- (NSArray *)createModelfourArray{
    NSMutableArray * array = [NSMutableArray array];
    WYAListCellModel * model1 = [WYAListCellModel modelWith:0 iconNamed:nil titleString:@"单项" arrowImageNamed:@"icon_list_selected"];
    WYAListCellModel * model2 = [WYAListCellModel modelWith:0 iconNamed:nil titleString:@"单项" arrowImageNamed:@"icon_list_selected"];
   WYAListCellModel * model3 = [WYAListCellModel modelWith:1 iconNamed:@"xuanzhong" titleString:@"多项选择" arrowImageNamed:nil];
   WYAListCellModel * model4 = [WYAListCellModel modelWith:1 iconNamed:@"xuanzhong" titleString:@"多项选择" arrowImageNamed:nil];
   WYAListCellModel * model5 = [WYAListCellModel modelWith:2 iconNamed:@"icon_subtract_enable" titleString:@"标题文字" arrowImageNamed:@"jiantou"];
   WYAListCellModel * model6 = [WYAListCellModel modelWith:2 iconNamed:@"icon_subtract_enable" titleString:@"标题文字" arrowImageNamed:@"jiantou"];
    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    [array wya_safeAddObject:model3];
    [array wya_safeAddObject:model4];
    [array wya_safeAddObject:model5];
    [array wya_safeAddObject:model6];
    return [array copy];
}

- (NSArray *)sectionArray{
    if(!_sectionArray){
        _sectionArray = ({
            NSArray * object = @[@"    单行列表",@"    双行列表",@"    说明内容",@"    编辑"];
            object;
        });
    }
    return _sectionArray;
}
@end
