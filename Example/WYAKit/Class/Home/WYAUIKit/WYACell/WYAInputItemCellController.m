//
//  WYAInputItemCellController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/29.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemCellController.h"
#import "WYAInputItemModel.h"
#import "WYAInputItemTwoCell.h"
#import "WYAInputOneCell.h"

#define ONECELLID @"WYAInputOneCell"
#define TWOCELLID @"WYAInputItemTwoCell"

@interface WYAInputItemCellController () <UITableViewDelegate, UITableViewDataSource, WYAInputItemTwoCellDelegate, WYAInputOneCellDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) NSArray * sectionArray;
@end

@implementation WYAInputItemCellController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    [UIView wya_showCenterToastWithMessage:@"如果无法退出键盘请点击完成即可"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];
}
#pragma mark ======= UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataSource wya_safeObjectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section             = indexPath.section;
    WYAInputOneCell * oneCell     = [tableView dequeueReusableCellWithIdentifier:ONECELLID];
    oneCell.delegate              = self;
    WYAInputItemTwoCell * twoCell = [tableView dequeueReusableCellWithIdentifier:TWOCELLID];
    twoCell.delegate              = self;
    switch (section) {
        case 0: {
            WYAInputItemModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            if (![model.type isEqualToString:@"2"]) {
                oneCell.model = model;
                if (indexPath.row == 0) {
                    [oneCell.textFiled wya_setPlaceholedr:model.TextFiledText
                                                     color:[UIColor blackColor]
                                                      font:14];
                }
                if (indexPath.row == 2) {
                    [oneCell.rightButton setTitleColor:WYA_RGB_COLOR(16, 142, 233) forState:UIControlStateNormal];
                }
                return oneCell;
            } else {
                twoCell.model = model;
                return twoCell;
            }
        } break;
        case 1: {
            WYAInputItemModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            if (![model.type isEqualToString:@"2"]) {
                oneCell.model = model;
                [oneCell.textFiled wya_setPlaceholedr:model.TextFiledText
                                                 color:[UIColor blackColor]
                                                  font:14];
                if (indexPath.row == 2) {
                    oneCell.textFiled.secureTextEntry = YES;
                }
                return oneCell;
            } else {
                twoCell.model = model;
                return twoCell;
            }
        } break;
        case 2: {
            WYAInputItemModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            if (![model.type isEqualToString:@"2"]) {
                oneCell.model    = model;
                oneCell.isEditor = NO;
                if (indexPath.row == 0) {
                    [oneCell.textFiled wya_setPlaceholedr:model.TextFiledText
                                                     color:[UIColor blackColor]
                                                      font:14];
                    [oneCell.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                if (indexPath.row == 1) {
                    [oneCell.textFiled wya_setPlaceholedr:model.TextFiledText
                                                     color:[UIColor blackColor]
                                                      font:14];
                    [oneCell.rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                }
                return oneCell;
            } else {
                twoCell.model = model;
                return twoCell;
            }
        } break;
        case 3: {
            WYAInputItemModel * model = [[self.dataSource wya_safeObjectAtIndex:section] wya_safeObjectAtIndex:indexPath.row];
            oneCell.model             = model;
            if (![model.type isEqualToString:@"2"]) {
                if (indexPath.row == 0) {
                    [oneCell.textFiled wya_setPlaceholedr:model.TextFiledText
                                                     color:[UIColor blackColor]
                                                      font:14];
                }
                return oneCell;
            } else {
                twoCell.model = model;
                return twoCell;
            }
        } break;

        default:
            break;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label       = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30 * SizeAdapter)];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.font            = FONT(16);
    label.textColor       = [UIColor grayColor];
    label.text            = [self.sectionArray wya_safeObjectAtIndex:section];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44 * SizeAdapter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30 * SizeAdapter;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark ======= getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object   = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) style:UITableViewStylePlain];
            object.tableFooterView = [[UIView alloc] init];
            [object registerClass:[WYAInputItemTwoCell class] forCellReuseIdentifier:TWOCELLID];
            [object registerClass:[WYAInputOneCell class] forCellReuseIdentifier:ONECELLID];
            object.delegate   = self;
            object.dataSource = self;
            object;
        });
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = ({
            NSArray * object = @[ [self createModelOneArray], [self createModelTwoArray], [self createModelThreeArray], [self createModelfourArray] ];
            object;
        });
    }
    return _dataSource;
}

- (NSArray *)createModelOneArray
{
    NSMutableArray * array     = [NSMutableArray array];
    WYAInputItemModel * model1 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"输入内容" instructionsString:@"右侧注释" type:@"0" imageNamed:nil];

    WYAInputItemModel * model2 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:nil type:@"1" imageNamed:@"icon_eye"];

    WYAInputItemModel * model3 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:@"使用说明" type:@"0" imageNamed:nil];

    WYAInputItemModel * model4 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:nil type:@"1" imageNamed:@"icon_arrow"];

    WYAInputItemModel * model5 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:@"右侧注释" type:@"2" imageNamed:@"icon_arrow"];

    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    [array wya_safeAddObject:model3];
    [array wya_safeAddObject:model4];
    [array wya_safeAddObject:model5];

    return [array copy];
}

- (NSArray *)createModelTwoArray
{
    NSMutableArray * array     = [NSMutableArray array];
    WYAInputItemModel * model1 = [WYAInputItemModel modelWithTitle:@"手机号" textFiledText:@"180 7989 2818" instructionsString:nil type:@"1" imageNamed:@"icon_eye"];

    WYAInputItemModel * model2 = [WYAInputItemModel modelWithTitle:@"银行卡" textFiledText:@"1212 1675 1268 2245" instructionsString:nil type:@"3" imageNamed:nil];

    WYAInputItemModel * model3 = [WYAInputItemModel modelWithTitle:@"密码" textFiledText:@"123456" instructionsString:nil type:@"1" imageNamed:@"icon_eye"];

    WYAInputItemModel * model4 = [WYAInputItemModel modelWithTitle:@"金额" textFiledText:@"100" instructionsString:@"元" type:@"0" imageNamed:nil];

    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    [array wya_safeAddObject:model3];
    [array wya_safeAddObject:model4];

    return [array copy];
}

- (NSArray *)createModelThreeArray
{
    NSMutableArray * array     = [NSMutableArray array];
    WYAInputItemModel * model1 = [WYAInputItemModel modelWithTitle:@"用户名" textFiledText:@"该用户名不存在" instructionsString:nil type:@"3" imageNamed:nil];

    WYAInputItemModel * model2 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:@"右侧注释" type:@"0" imageNamed:nil];

    [array wya_safeAddObject:model1];
    [array wya_safeAddObject:model2];
    return [array copy];
}

- (NSArray *)createModelfourArray
{
    NSMutableArray * array     = [NSMutableArray array];
    WYAInputItemModel * model1 = [WYAInputItemModel modelWithTitle:@"标签" textFiledText:@"我是暗提示" instructionsString:@"我是右侧注释" type:@"0" imageNamed:nil];

    [array wya_safeAddObject:model1];
    return [array copy];
}

- (NSArray *)sectionArray
{
    if (!_sectionArray) {
        _sectionArray = ({
            NSArray * object = @[ @"    右侧注释", @"    格式", @"    不可编辑 禁用", @"    校验" ];
            object;
        });
    }
    return _sectionArray;
}
#pragma mark ======= WYAInputItemTwoCellDelegate
- (void)wya_inputOneCell:(WYAInputOneCell *)cell rightButtonDidSelected:(UIButton *)sender
{
    NSLog(@"twoCellRightView---------%@", sender.titleLabel.text);
    if (!sender.titleLabel.text.length) {
        BOOL isShow                    = cell.textFiled.secureTextEntry;
        cell.textFiled.secureTextEntry = !isShow;
    }
}
- (void)wya_inputOneCell:(WYAInputOneCell *)cell textFiledChangeingValue:(nonnull NSString *)text
{
    NSLog(@"twoCellText----%@", text);
}
#pragma mark ======= WYAInputOneCellDelegate
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell textFiledChangeingValue:(NSString *)text
{
    NSLog(@"twoCellText----%@", text);
}
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell rightButtonDidSelected:(UIButton *)sender
{
    NSLog(@"twoCellRightView---------%@", sender.titleLabel.text);
}
- (void)wya_inputItemTwoCell:(WYAInputItemTwoCell *)cell imageButtonDidSelected:(UIButton *)sender
{
    BOOL isShow                    = cell.textFiled.secureTextEntry;
    cell.textFiled.secureTextEntry = !isShow;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
}
@end
