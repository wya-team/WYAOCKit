//
//  WYAInputItemCellController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemCellController.h"
#import "WYAInputItemCell.h"
@interface WYAInputItemCellController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray * annotationArray;
@property (nonatomic, strong) NSArray * formatArray;
@property (nonatomic, strong) NSArray * disableArray;
@property (nonatomic, strong) NSArray * checkArray;
@end

@implementation WYAInputItemCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark ======= UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [[self.dataSource wya_safeObjectAtIndex:section] count];
    return self.annotationArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WYAInputItemCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSInteger section = indexPath.section;
    cell.isEditor = YES;
//    switch (section) {
//        case 0:
//            {
                if (indexPath.row == 1) {
                    cell.textFiled.textColor = [UIColor blackColor];
                }if (indexPath.row == 2) {
                    cell.textFiled.textColor = [UIColor wya_hex:@"#108EE9"];
                }
                cell.dataArray = [self.annotationArray wya_safeObjectAtIndex:indexPath.row];
                return cell;
//            }
//            break;
//        case 1:
//        {
//            cell.dataArray = [self.formatArray wya_safeObjectAtIndex:indexPath.row];
//            if (indexPath.row == 2) {
//                cell.textFiled.secureTextEntry = YES;
//            }
//            return cell;
//        }
//            break;
//        case 2:
//        {
//            if (indexPath.row == 1) {
//                cell.leftButton.titleLabel.font = FONT(12);
//                cell.leftButton.titleLabel.textColor = [UIColor groupTableViewBackgroundColor];
//                cell.isEditor = NO;
//            }
//            cell.dataArray = [self.disableArray wya_safeObjectAtIndex:indexPath.row];
//            return cell;
//        }
//            break;
//        case 3:
//        {
//            cell.textFiled.textColor = [UIColor redColor];
//            cell.dataArray = [self.checkArray wya_safeObjectAtIndex:indexPath.row];
//            return cell;
//        }
//            break;
//        default:
//            break;
//    }
//    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * sectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 35*SizeAdapter)];
    sectionLabel.textColor = [UIColor grayColor];
    sectionLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    switch (section) {
        case 0:
            sectionLabel.text = @"  右侧注释";
            break;
        case 1:
            sectionLabel.text = @"  格式";
            break;
        case 2:
            sectionLabel.text = @"  不可编辑禁用";
            break;
        case 3:
            sectionLabel.text = @"  校验";
            break;
        default:
            break;
    }
    return sectionLabel;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35*SizeAdapter;
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
            [object registerClass:[WYAInputItemCell class] forCellReuseIdentifier:@"cellId"];
            object.delegate = self;
            object.separatorStyle = UITableViewCellSeparatorStyleNone;
            object.dataSource = self;
            object;
        });
    }
    return _tableView;
}

- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[self.annotationArray,self.formatArray,self.disableArray,self.checkArray];
            object;
        });
    }
    return _dataSource;
}

- (NSArray *)formatArray{
    if(!_formatArray){
        _formatArray = ({
            NSArray * object = @[@[@"手机号",@"180 7989 2818",@" ",@"yanjing",@"1"],@[@"银行卡",@"1212 1675 1268 2245",@" ",@" ",@"3"],@[@"密码",@"180 7989 2818",@" ",@"jiantou",@"1"],@[@"金额",@"100",@"元",@" ",@"0"]];
            object;
       });
    }
    return _formatArray;
}

- (NSArray *)disableArray{
    if(!_disableArray){
        _disableArray = ({
            NSArray * object = @[@[@"用户名",@"该用户名不存在",@" ",@" ",@"3"],@[@"标签",@"我是暗提示",@"右侧注释",@" ",@"0"]];
            object;
       });
    }
    return _disableArray;
}

- (NSArray *)checkArray{
    if(!_checkArray){
        _checkArray = ({
            NSArray * object = @[@[@"标签",@"我是暗提示",@"右侧注释",@"",@"0"]];
            object;
       });
    }
    return _checkArray;
}

- (NSArray *)annotationArray{
    if(!_annotationArray){
        _annotationArray = ({
            NSArray * object = @[@[@"标签",@"输入内容",@"右侧注释",@" ",@"0"],@[@"标签",@"1212 1675 1268 2245",@" ",@"yanjing",@"1"],@[@"标签",@"我是暗提示",@"使用说明",@" ",@"0"],@[@"标签",@"我是暗提示",@" ",@"jiantou",@"1"],@[@"标签",@"我是暗提示",@"右侧注释",@"jiantou",@"2"]];
            object;
       });
    }
    return _annotationArray;
}
@end
