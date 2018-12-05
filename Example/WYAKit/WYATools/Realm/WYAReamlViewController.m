//
//  WYAReamlViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/3.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAReamlViewController.h"
#import "Student.h"
#import "WYARealmHeaderView.h"
#import "WYARealmCell.h"
#import "WYARealmSectionView.h"
#import <WYAKit/WYARealmBaseManager.h>
#define CELLID @"cellId"
#define REALMCELL @"RealmCell"
@interface WYAReamlViewController ()
<UITableViewDelegate,UITableViewDataSource,WYARealmHeaderViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) WYARealmHeaderView * headerView;
@property (nonatomic, strong) WYARealmSectionView * sectionView;
@property (nonatomic, strong) UILabel  * createTableLabel;
@property (nonatomic, strong) NSArray * sectionOneRowArray;
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, strong) NSArray * nameArray;
@property (nonatomic, strong) NSArray * ageArray;
@property (nonatomic, strong) NSArray * heighArray;
@property (nonatomic, strong) NSArray * weightArray;
@property (nonatomic, strong) NSArray * scoreArray;
@property (nonatomic, strong) NSArray * gradeArray;
@property (nonatomic, strong) UITapGestureRecognizer * tap;
@end

@implementation WYAReamlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
//    [dbManager wya_deleteAllObjects];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[self getRealmArray] count] > 0) {
        self.titleString = @"   插入";
        [self.dataSource wya_safeAddObject:[self.sectionOneRowArray wya_safeObjectAtIndex:0]];
        [self.dataSource wya_safeAddObject:[self getRealmArray]];
        [self.view addSubview:self.tableView];
    }else{
    [self.view addGestureRecognizer:self.tap];
    [self.view addSubview:self.createTableLabel];
    }
}
- (void)createTable:(UITapGestureRecognizer *)sender{
    // 建表
    [self.createTableLabel removeFromSuperview];
    self.createTableLabel = nil;
    [self.view removeGestureRecognizer:self.tap];
    self.titleString = @"   插入";
    [self.dataSource wya_safeAddObject:[self.sectionOneRowArray wya_safeObjectAtIndex:0]];
    [self.dataSource wya_safeAddObject:[self getRealmArray]];
    [self.view addSubview:self.tableView];
}
#pragma mark ======= gette
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) style:UITableViewStylePlain];
            object.delegate = self;
            object.dataSource = self;
            object.tableHeaderView = self.headerView;
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            object.tableFooterView = [[UIView alloc]init];
            [object registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
            [object registerClass:[WYARealmCell class] forCellReuseIdentifier:REALMCELL];
            object;
       });
    }
    return _tableView;
}
- (WYARealmHeaderView *)headerView{
    if(!_headerView){
        _headerView = ({
            WYARealmHeaderView * object = [[WYARealmHeaderView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 49*SizeAdapter)];
            object.delegate = self;
            object;
        });
    }
    return _headerView;
}
- (UILabel *)createTableLabel{
    if(!_createTableLabel){
        _createTableLabel = ({
            UILabel * object = [[UILabel alloc]initWithFrame:CGRectMake(20*SizeAdapter, WYATopHeight + 100*SizeAdapter, ScreenWidth - 40*SizeAdapter, 200*SizeAdapter)];
            object.textColor = [UIColor whiteColor];
            object.backgroundColor = wya_rgb(24, 144, 255);
            object.font = FONT(16);
            object.numberOfLines = 0;
            object.layer.cornerRadius = 8*SizeAdapter;
            object.layer.masksToBounds = YES;
            object.text = @"已默认创建数据库，但是没有表，点击任意区域创建表，字段由RLMObject子类生成";
            object;
        });
    }
    return _createTableLabel;
}
- (WYARealmSectionView *)sectionView{
    if(!_sectionView){
        _sectionView = ({
            WYARealmSectionView * object = [[WYARealmSectionView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
            object;
        });
    }
    return _sectionView;
}
- (UITapGestureRecognizer *)tap{
    if(!_tap){
        _tap = ({
            UITapGestureRecognizer * object =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(createTable:)];
            object;
        });
    }
    return _tap;
}

#pragma mark ======= WYARealmHeaderViewDelegate
- (void)wya_headerViewInsterButton:(UIButton *)sender{
    // 插入
    self.titleString = @"   插入";
    [self.dataSource wya_safeReplaceObjectAtIndex:0 withObject:[self.sectionOneRowArray wya_safeObjectAtIndex:0]];
    [self.dataSource wya_safeRemoveObjectAtIndex:1];
    [self.dataSource wya_safeAddObject:[self getRealmArray]];
    [self.tableView reloadData];
}
- (void)wya_headerViewDeleteButton:(UIButton *)sender
{
    // 删除
    self.titleString = @"   删除";
    [self.dataSource wya_safeReplaceObjectAtIndex:0 withObject:[self.sectionOneRowArray wya_safeObjectAtIndex:1]];
    [self.dataSource wya_safeRemoveObjectAtIndex:1];
    [self.dataSource wya_safeAddObject:[self getRealmArray]];
    [self.tableView reloadData];
}
- (void)wya_headerViewUpdateButton:(UIButton *)sender{
    // 更新
    self.titleString = @"   更新";
    [self.dataSource wya_safeReplaceObjectAtIndex:0 withObject:[self.sectionOneRowArray wya_safeObjectAtIndex:2]];
    [self.dataSource wya_safeRemoveObjectAtIndex:1];
    [self.dataSource wya_safeAddObject:[self getRealmArray]];
    [self.tableView reloadData];
}
- (void)wya_headerViewLookButton:(UIButton *)sender{
    // 查询
    self.titleString = @"   查询";
    [self.dataSource wya_safeReplaceObjectAtIndex:0 withObject:[self.sectionOneRowArray wya_safeObjectAtIndex:3]];
    [self.dataSource wya_safeRemoveObjectAtIndex:1];
    [self.dataSource wya_safeAddObject:[self getRealmArray]];
    [self.tableView reloadData];
}


#pragma mark ======= UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataSource wya_safeObjectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * sectionArr = [self.dataSource wya_safeObjectAtIndex:indexPath.section];
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
        cell.textLabel.text = [sectionArr wya_safeObjectAtIndex:indexPath.row];
        cell.backgroundColor = randomColor;
        cell.textLabel.textColor = [UIColor whiteColor];
        return  cell;
    }else{
        WYARealmCell * cell = [tableView dequeueReusableCellWithIdentifier:REALMCELL];
        cell.model = [sectionArr wya_safeObjectAtIndex:indexPath.row];
        return cell;
    }
  
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor groupTableViewBackgroundColor];
        label.font = FONT(18);
        label.text = self.titleString;
        return label;
    }else{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        label.textColor = [UIColor blackColor];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        label.font = FONT(18);
        label.text = @"Student";
        [view addSubview:label];
        [view addSubview:self.sectionView];
        return view;
    }
}
#pragma mark ======= UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0?40:64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    if (indexPath.section == 0) {
        if ([self.titleString hasSuffix:@"插入"]) {
            switch (index) {
                case 0:
                    {
                        [self realmAddData];
                        [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                    break;
                case 1:{
                    for (int i = 0; i < 3; i++) {
                        [self realmAddData];
                    }
                        [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                    
                default:
                    break;
            }
        }else if ([self.titleString hasSuffix:@"  删除"]){
            WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
            switch (index) {
                case 0:
                    {
                        Student * model = [[self getRealmArray] lastObject];
                        [dbManager wya_deleteRealmWithObject:model];
                        [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                    }
                    break;
                case 1:
                {
                    Student * model = [[self getRealmArray] firstObject];
                    [dbManager wya_deleteRealmWithObject:model];
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                case 2:
                {
                    [dbManager wya_deleteAllObjects];
                    [self.tableView removeFromSuperview];
                    self.tableView = nil;
                    [self.dataSource removeAllObjects];
                    [self.view addGestureRecognizer:self.tap];
                    [self.view addSubview:self.createTableLabel];
                }
                    break;
                case 3:
                {
                    [dbManager wya_deleteRealmWithObjectName:@"Student" whereFormat:@"score<60"];
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                default:
                    break;
            }
        }else if ([self.titleString hasSuffix:@"  更新"]){
              WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
            switch (index) {
                case 0:
                {
                    Student * model = [[self getRealmArray] lastObject];
                    [dbManager wya_updateRealmWithClassName:@"Student" withValue:@{@"name":@"蒙奇D·路飞",@"studentId":model.studentId}];
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                case 1:
                {
                    for (Student * stu in [self getRealmArray]) {
                            [dbManager wya_updateRealmWithClassName:@"Student" withValue:@{@"score":@100,@"studentId":stu.studentId}];
                    }
                
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                default:
                    break;
            }
            
        }else if ([self.titleString hasSuffix:@"  查询"]){
              WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
            switch (index) {
                case 0:
                {
                    ///[self getRealmArray]就是获取所有数据
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[self getRealmArray]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                case 1:
                {
                   RLMResults * results = [dbManager wya_lookupRealmWithAllClassName:@"Student" whereFormat:@"height>170"];
                   RLMResults * res = [results objectsWhere:@"height<180"];
                    NSMutableArray * tempArray = [NSMutableArray array];
                    for (Student * model in res) {
                        [tempArray wya_safeAddObject:model];
                    }
                    [self.dataSource wya_safeReplaceObjectAtIndex:1 withObject:[tempArray copy]];
                    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                    break;
                default:
                    break;
            }
        }
    }
}
#pragma mark ======= getArray

- (NSArray *)sectionOneRowArray{
    if(!_sectionOneRowArray){
        _sectionOneRowArray = ({
            NSArray * object = @[@[@"插入一条数据",@"插入一组数据"],@[@"删除最后一条数据",@"删除第一条数据",@"删除全部数据",@"删除分不及格的数据"],@[@"更新最后一条数据name=蒙奇D·路飞",@"把表中的score全部改成100"],@[@"查找表中所有数据",@"查找height在170~180之间的数据"]];
            object;
       });
    }
    return _sectionOneRowArray;
}

- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSMutableArray * object = [NSMutableArray array];
            object;
       });
    }
    return _dataSource;
}
/// 获取所有数据
- (NSArray *)getRealmArray{
    WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
    NSMutableArray * array = [NSMutableArray array];
    RLMResults * results = [dbManager wya_lookupRealmWithAllClassName:@"Student"];
    for (Student * stu in results) {
        [array wya_safeAddObject:stu];
    }
    return [array copy];
}


#pragma mark ======= Student DataArray
- (NSArray *)nameArray{
    if(!_nameArray){
        _nameArray = ({
            NSArray * object = @[@"路飞",@"索隆",@"娜美",@"山治",@"乌索普",@"乔巴",@"罗宾",@"弗兰奇",@"布鲁克",@"甚平",@"旋涡鸣人",@"宇智波佐助",@"春野樱",@"日向宁次",@"日向雏田",@"宇智波鼬",@"旗木卡卡西"];
            object;
       });
    }
    return _nameArray;
}

- (NSArray *)ageArray{
    if(!_ageArray){
        _ageArray = ({
            NSArray * object = @[@"22",@"24",@"18",@"19",@"19",@"7",@"22",@"16",@"89",@"40",@"22",@"22",@"22",@"24",@"22",@"32",@"34"];
            object;
       });
    }
    return _ageArray;
}

- (NSArray *)heighArray{
    if(!_heighArray){
        _heighArray = ({
            NSArray * object = @[@"177",@"180",@"166",@"179",@"175",@"120",@"168",@"177",@"180",@"170",@"181",@"182",@"164",@"177",@"162",@"180",@"184"];
            object;
       });
    }
    return _heighArray;
}

- (NSArray *)weightArray{
    if(!_weightArray){
        _weightArray = ({
            NSArray * object = @[@"150",@"160",@"86",@"140",@"120",@"88",@"86",@"180",@"60",@"200",@"150",@"148",@"90",@"137",@"82",@"155",@"134"];
            object;
       });
    }
    return _weightArray;
}

- (NSArray *)scoreArray{
    if(!_scoreArray){
        _scoreArray = ({
            NSArray * object = @[@"40",@"50",@"86",@"70",@"56",@"78",@"90",@"89",@"84",@"76",@"44",@"88",@"80",@"90",@"80",@"99",@"94"];
            object;
       });
    }
    return _scoreArray;
}

- (NSArray *)gradeArray{
    if(!_gradeArray){
        _gradeArray = ({
            NSArray * object = @[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级",@"七年级",@"八年级",@"九年级",@"高一",@"高二",@"高三",@"大一",@"大二",@"大三",@"大四",@"毕业班"];;
            object;
       });
    }
    return _gradeArray;
}
#pragma mark ======= 增删改查
- (void)realmAddData{
    NSArray * tempArray = [self getRealmArray];
    Student * tempStu = [tempArray lastObject];
    NSInteger  idValue = [tempStu.studentId integerValue] + 1;
    NSString * studentId = [NSString stringWithFormat:@"%ld",idValue];
    Student * model = [[Student alloc]init];
    if (idValue - 1 < self.nameArray.count) {
        model.name = [self.nameArray wya_safeObjectAtIndex:(idValue - 1)];
        model.age = [[self.ageArray wya_safeObjectAtIndex:(idValue -1)] intValue];
        model.height = [[self.heighArray wya_safeObjectAtIndex:(idValue -1)] floatValue];
        model.weight = [[self.weightArray wya_safeObjectAtIndex:(idValue -1)] floatValue];
        model.score = [[self.scoreArray wya_safeObjectAtIndex:(idValue -1)] floatValue];
        model.grade = [self.gradeArray wya_safeObjectAtIndex:(idValue -1)];
        
    }else{
        model.name = @"娜美";
        model.age = 18;
        model.height = 166;
        model.weight = 84;
        model.score = 80;
        model.grade = @"三年级二班";
    }
    model.studentId = studentId;
    WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
    [dbManager wya_insertRealmWithObject:model];
}

@end

