//
//  WYATwoTableViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATwoTableViewController.h"
#import "MJRefresh.h"

@interface WYATwoTableViewController ()

@end

@implementation WYATwoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"twoCellID"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.tableHeaderView = [[UIView alloc] init];
    self.tableView.mj_header       = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self performSelector:@selector(end) withObject:self afterDelay:0.5];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self performSelector:@selector(enddd) withObject:self afterDelay:0.5];
    }];
}
- (void)end
{
    [self.tableView.mj_header endRefreshing];
}
- (void)enddd
{
    [self.tableView.mj_footer endRefreshing];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGPoint point = scrollView.contentOffset;
        NSLog(@"%f", scrollView.contentOffset.y);
        [[NSNotificationCenter defaultCenter]
        postNotificationName:self.notificationName
                      object:self
                    userInfo:[NSDictionary dictionaryWithObject:@(point.y) forKey:@"key"]];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =
    [tableView dequeueReusableCellWithIdentifier:@"twoCellID"
                                    forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath.row = %d", (int)indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath
*)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath]
withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new
row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
