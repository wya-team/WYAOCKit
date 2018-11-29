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
@property (nonatomic, assign) BOOL  flag;
@property (nonatomic, strong) NSMutableArray * views;
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
        __block WYAAccordionCell * accordionCell = cell;
        cell.views = self.views;
        
        cell.viewHeights = self.flag ? [@[@(30),@(30)] mutableCopy]:nil;
        cell.buttonClick = ^(UIButton * _Nonnull button) {
            self.flag = !self.flag;
            if (self.flag == YES) {
                NSMutableArray * array = [NSMutableArray array];
                for (NSInteger i = 0; i<2; i++) {
                    UILabel * label = [[UILabel alloc]init];
                    label.text = @"自定义区域内容自定义区域内容";
                    label.font = FONT(15);
                    label.numberOfLines = 0;
                    [array addObject:label];
                }
                
                accordionCell.viewHeights = [@[@(30),@(30)] mutableCopy];
                accordionCell.views = array;
                self.views = array;
            }else{
                self.views = nil;
            }
            
            [self.tableView reloadData];
        };
        return cell;
    }else{
        WYACardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
        cell.contentString = @"文本内容文本内容文本内容文本内容文本内容";
        cell.subContentString = @"辅助说明";
        return cell;
    }
    
}
#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [WYAAccordionCell wya_cellHeight:self.flag ?[@[@(30),@(30)] mutableCopy]:nil];
    }else{
        return [WYACardCell wya_cellHeight:@"文本内容文本内容文本内容文本内容文本内容"];
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
