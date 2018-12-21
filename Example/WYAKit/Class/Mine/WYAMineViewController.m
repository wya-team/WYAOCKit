//
//  WYAMineViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/20.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAMineViewController.h"

@interface WYAMineViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSource;
@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) WYANumberKeyboard * customKeybodView;
@property (nonatomic, strong) UITextField * textfiledView;
@end

@implementation WYAMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"关于WYAKit";
    _textfiledView = [[UITextField alloc]initWithFrame:CGRectMake(0, WYATopHeight ,ScreenWidth,30)];
    _textfiledView.placeholder = @"点我呀";
    [self.view addSubview:_textfiledView];
   _customKeybodView =  [WYANumberKeyboard initRandomKeyboardWithTextFiled:_textfiledView];
    [_customKeybodView wya_numberKeyboadrDidChanged:^(NSString * _Nonnull value) {
        NSLog(@"value %@",value);
    }];
    [_customKeybodView wya_numberKeyboadrSurePressed:^{
        NSLog(@"提交");
    }];
//    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = ({
            UITableView * object = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight - WYATabBarHeight) style:UITableViewStylePlain];
            object.delegate = self;
            object.dataSource = self;
            object.tableFooterView = [[UIView alloc]init];
            object.tableHeaderView = self.headerView;
            [object registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
            object;
       });
    }
    return _tableView;
}

- (UIView *)headerView{
    if(!_headerView){
        _headerView = ({
            UIView * object = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 230*SizeAdapter)];
            object.backgroundColor = BGCOLOR;
            UIView * contentView = [[UIView alloc]initWithFrame:CGRectMake(15*SizeAdapter, 15*SizeAdapter, ScreenWidth-30*SizeAdapter, 200*SizeAdapter)];
            contentView.layer.cornerRadius = 10*SizeAdapter;
            contentView.layer.masksToBounds = YES;
            contentView.backgroundColor = WHITECOLOR;
            
            CGFloat width = ScreenWidth-30*SizeAdapter;
            CGFloat height = 25*SizeAdapter;
            CGFloat font = 16;
            
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15*SizeAdapter, width, height)];
            titleLabel.font = FONT(font);
            titleLabel.text = @"WYAKiT SDK Version";
            titleLabel.textColor = GRAYTITLECOLOR;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel * versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5*SizeAdapter + CGRectGetMaxY(titleLabel.frame), width, 30*SizeAdapter)];
            versionLabel.font = FONTS(24);
            versionLabel.text = [NSObject wya_version];
            versionLabel.textColor = BLACKTITLECOLOR;
            versionLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel * platformLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5*SizeAdapter + CGRectGetMaxY(versionLabel.frame), width, height)];
            platformLabel.font = FONT(font);
            platformLabel.text = @"platform    iOS";
            platformLabel.textColor = GRAYTITLECOLOR;
            platformLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel * osVersionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5*SizeAdapter + CGRectGetMaxY(platformLabel.frame), width, height)];
            osVersionLabel.font = FONT(font);
            osVersionLabel.text = @"osVersion    12.1";
            osVersionLabel.textColor = GRAYTITLECOLOR;
            osVersionLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel * deviceModelLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5*SizeAdapter + CGRectGetMaxY(osVersionLabel.frame), width, height)];
            deviceModelLabel.font = FONT(font);
            deviceModelLabel.text = @"deviceModel    iPhone6sPlus";
            deviceModelLabel.textColor = GRAYTITLECOLOR;
            deviceModelLabel.textAlignment = NSTextAlignmentCenter;
            
            [contentView addSubview:titleLabel];
            [contentView addSubview:versionLabel];
            [contentView addSubview:platformLabel];
            [contentView addSubview:osVersionLabel];
            [contentView addSubview:deviceModelLabel];
            
            [object addSubview:contentView];
            
            object;
        });
    }
    return _headerView;
}
- (NSArray *)dataSource{
    if(!_dataSource){
        _dataSource = ({
            NSArray * object = @[@"WYAKit GitHub地址",@"参与贡献",@"版本变更"];
            object;
       });
    }
    return _dataSource;
}
#pragma mark ======= UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.dataSource wya_safeObjectAtIndex:indexPath.row];
    cell.textLabel.textColor = BLACKTEXTCOLOR;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60*SizeAdapter;
}
#pragma mark ======= UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    switch (indexPath.row) {
        case 0:{
            vc.isAllowPush = YES;
            [vc wya_addRightNavBarButtonWithNormalTitle:@[@"复制链接"]];
             vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit";
        }
            break;
        case 1:
        {
            vc.isAllowPush = YES;
             vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/CONTRIBUTING.md";
        }
            break;
        case 2:
        {
             vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/CHANGELOG.md";
        }
            break;
        default:
            break;
    }
      [self.navigationController pushViewController:vc animated:YES];
}



- (WYANumberKeyboard *)customKeybodView{
    if(!_customKeybodView){
        _customKeybodView = ({
            WYANumberKeyboard * object = [[WYANumberKeyboard alloc]init];
            object;
       });
    }
    return _customKeybodView;
}

//- (UITextField *)textfiledView{
//    if(!_textfiledView){
//        _textfiledView = ({
//            UITextField * object = [[UITextField alloc]initWithFrame:CGRectMake(0, WYATopHeight ,ScreenWidth,30)];
//            object.placeholder = @"点我呀";
//            object;
//       });
//    }
//    return _textfiledView;
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textfiledView resignFirstResponder];
}
@end
