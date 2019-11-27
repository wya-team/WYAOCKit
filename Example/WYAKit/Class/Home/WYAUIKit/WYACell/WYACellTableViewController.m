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

@interface WYACellTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong) NSMutableArray * views;
@end

@implementation WYACellTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]
    initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)
            style:UITableViewStyleGrouped];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //    [self.tableView registerClass:[WYAAccordionCell class]
    //    forCellReuseIdentifier:@"accordionCell"];
    //    [self.tableView registerClass:[WYACardCell class] forCellReuseIdentifier:@"cardCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.navTitle = NSStringFromClass([self class]);
    self.flag     = YES;
}

#pragma mark--- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.flag ? 10 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =
    [tableView dequeueReusableCellWithIdentifier:@"cell"
                                    forIndexPath:indexPath];
    cell.textLabel.text = @"这是文本内容";
    return cell;
}
#pragma mark--- UITableViewDelegate
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view        = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.cmam_width, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton * button    = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor redColor]];
    button.frame = CGRectMake(self.tableView.cmam_width - 32 * SizeAdapter,
                              (30 - 16 * SizeAdapter) / 2, 16 * SizeAdapter, 16 * SizeAdapter);
    [button addCallBackAction:^(UIButton * button) {
        self.flag = !self.flag;
        [self.tableView reloadData];
    }];
    [button setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    [view addSubview:button];
    UITextField * titleTextField = [[UITextField alloc]
    initWithFrame:CGRectMake(16 * SizeAdapter, 0, self.tableView.cmam_width - 50 * SizeAdapter,
                             30)];
    titleTextField.placeholder = @"aaa";
    [view addSubview:titleTextField];

    UIView * line =
    [[UIView alloc] initWithFrame:CGRectMake(0, 29.5, self.tableView.cmam_width, 0.5)];
    line.backgroundColor = random(233, 233, 233, 1);
    [view addSubview:line];
    return view;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view        = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.cmam_width, 30)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    WYACard * card =
    [[WYACard alloc] initWithFrame:CGRectMake(10, 5, self.tableView.cmam_width - 20, 90)];
    card.layer.cornerRadius  = 4.f;
    card.layer.masksToBounds = YES;
    [view addSubview:card];
    return view;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before
navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
