//
//  WYACellTableViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/27.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYACellTableViewController.h"
#import <WYAKit/WYAAccordionCell.h>
#import <WYAKit/WYACardCell.h>

@interface WYACellTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation WYACellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight-WYATopHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[WYAAccordionCell class] forCellReuseIdentifier:@"accordionCell"];
    [self.tableView registerClass:[WYACardCell class] forCellReuseIdentifier:@"cardCell"];
    self.navTitle = NSStringFromClass([self class]);
}

#pragma mark --- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        WYAAccordionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accordionCell" forIndexPath:indexPath];
        
        return cell;
    }else{
        WYACardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
        
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [WYAAccordionCell wya_cellHeight];
    }else{
        return [WYACardCell wya_cellHeight];
    }
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
