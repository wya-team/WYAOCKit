//
//  WYATableViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/13.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYATableViewController.h"
#import <WYAKit/WYAPhotoBrowserViewController.h>
#import <WYAKit/WYADrawerViewController.h>
#import "WYALeftViewController.h"
#import "WYACenterViewController.h"
#import "WYARightViewController.h"
@interface WYATableViewController ()
@property (nonatomic, strong) NSArray * array;
@end

@implementation WYATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * classString = self.array[indexPath.row];
    if ([classString isEqualToString:@"WYAPhotoBrowserViewController"]) {
        WYAPhotoBrowserViewController * vc = [[WYAPhotoBrowserViewController alloc]init];
        vc.maxCount =5;
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([classString isEqualToString:@"WYADrawerViewController"]) {
        WYADrawerViewController * drawer = [[WYADrawerViewController alloc]initWithCenterViewController:[[WYACenterViewController alloc] init] LeftViewController:[[WYALeftViewController alloc] init] RightViewController:[[WYARightViewController alloc] init]];
        [self.navigationController pushViewController:drawer animated:YES];
    }else{
        [self.navigationController pushViewController:[[NSClassFromString(classString) alloc]init] animated:YES];
    }
    
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
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(NSArray *)array{
    if (!_array) {
        _array = [NSArray arrayWithObjects:@"WYATextViewController",
                                           @"WYAIMGCodeViewController",
                                           @"WYAUIAlertViewController",
                                           @"WYABannerViewController",
                                           @"WYAPhotoBrowserViewController",
                                           @"WYAPopViewController",
                                           @"WYADrawerViewController",
                                           @"WYAPaginationViewController",
                                           @"WYAChooseMenuViewController",
                                           @"WYASliderViewController",
                                           @"WYANoticeViewController",
                                           @"WYAToastViewController",
                                           @"WYAPageViewController",
                                           @"WYAPickerViewController",
                                           nil];
    }
    return _array;
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
