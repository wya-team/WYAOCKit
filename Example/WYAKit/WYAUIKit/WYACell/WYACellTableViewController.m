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
#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WYAAccordionCell * accordionCell = (WYAAccordionCell *)cell;
//        accordionCell.downButton
        __weak WYAAccordionCell * accordionCellCopy = accordionCell;
        accordionCell.buttonClick = ^(UIButton * _Nonnull button) {
            self.flag = !self.flag;
            if (self.flag == YES) {
                UILabel * label = [[UILabel alloc]init];
                label.text = @"adsd";
                label.font = FONT(15);
                label.numberOfLines = 0;
                accordionCellCopy.viewHeights = [@[@(20)] mutableCopy];
                accordionCellCopy.views = [@[label] mutableCopy];
            }else{
                accordionCellCopy.views = nil;
            }
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        };
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
        CGFloat height = [WYAAccordionCell wya_cellHeight];
        NSLog(@"height==%f",height);
        return height;
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
