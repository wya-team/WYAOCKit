//
//  WYAAudioSettingViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2019/11/16.
//  Copyright © 2019 WYATeam. All rights reserved.
//

#import "WYAAudioSettingViewController.h"

@interface WYAAudioSettingViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSources;
@end

@implementation WYAAudioSettingViewController
{
    NSString * sound;
    NSString * speed;
    NSString * numberLoop;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

- (void)wya_goBack{
    [super wya_goBack];
    if (self.infoCallback) {
        self.infoCallback(sound, speed, numberLoop);
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell       = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary * dic = self.dataSources[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self showAlertWithIndex:indexPath Callback:^(NSString *string) {
        if (indexPath.row == 0) {
            sound = string;
        } else if (indexPath.row == 1) {
            speed = string;
        } else if (indexPath.row == 2) {
            numberLoop = string;
        }
    }];

}

- (void)showAlertWithIndex:(NSIndexPath *)indexPath Callback:(void(^)(NSString * string))callback{
    NSDictionary * dic = self.dataSources[indexPath.row];
    NSArray * array = dic[@"array"];
    WYAAlertController * alertVc = [WYAAlertController wya_alertSheetWithTitle:dic[@"title"] Message:nil AlertSheetCornerRadius:5];
    for (NSString * str in array) {
        WYAAlertAction * alertAction = [WYAAlertAction wya_actionWithTitle:str handler:^{
            if (callback) {
                callback(str);
            }
            [alertVc dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertVc wya_addAction:alertAction];
    }

    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark - Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView * object = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight) style:UITableViewStylePlain];
            object.delegate      = self;
            object.dataSource    = self;
            object;
        });
    }
    return _tableView;
}

- (NSArray *)dataSources
{
    if (!_dataSources) {
        _dataSources = ({
            NSArray * object = @[@{
                                     @"title":@"声音大小",
                                     @"array":@[@"0.3",@"0.6",@"1.0"],

            },@{
                                     @"title":@"播放速度",
                                     @"array":@[@"0.5",@"1.0",@"2.0"],

            },@{
                                     @"title":@"循环次数",
                                     @"array":@[@"1",@"2",@"3"],

            }];
            object;
        });
    }
    return _dataSources;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
