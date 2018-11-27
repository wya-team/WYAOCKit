//
//  WYALeftViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYALeftViewController.h"
#import <WYAKit/WYAPhotoBrowserViewController.h>
#import <WYAKit/WYADrawerViewController.h>

@interface WYALeftViewController ()
@property (nonatomic, strong) NSArray * uiArray;
@property (nonatomic, strong) NSArray * hardwareArray;
@end

@implementation WYALeftViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"left.view.willAppear");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"left.view.willDisAppear");
}

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
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.uiArray.count;
    }else {
        return self.hardwareArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.uiArray[indexPath.row];
    }else {
        cell.textLabel.text = self.hardwareArray[indexPath.row];
    }
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"UI组件";
    }else{
        return @"硬件相关";
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        NSString * classString = self.uiArray[indexPath.row];
        if ([classString isEqualToString:@"WYAPhotoBrowserViewController"]) {
            WYAPhotoBrowserViewController * vc = [[WYAPhotoBrowserViewController alloc]init];
            vc.maxCount =5;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [self.navigationController pushViewController:[[NSClassFromString(classString) alloc]init] animated:YES];
        }
    }else{
        NSString * classString = self.hardwareArray[indexPath.row];
        [self.navigationController pushViewController:[[NSClassFromString(classString) alloc]init] animated:YES];
    }
    
    
}

-(NSArray *)uiArray{
    if (!_uiArray) {
        _uiArray = [NSArray arrayWithObjects:@"WYATextViewController",
                    @"WYAIMGCodeViewController",
                    @"WYAUIAlertViewController",
                    @"WYABannerViewController",
                    @"WYAPhotoBrowserViewController",
                    @"WYAPopViewController",
                    @"WYAPaginationViewController",
                    @"WYAChooseMenuViewController",
                    @"WYASliderViewController",
                    @"WYANoticeViewController",
                    @"WYAToastViewController",
                    @"WYAPageViewController",
                    @"WYAPickerViewController",
                    nil];
    }
    return _uiArray;
}


-(NSArray *)hardwareArray{
    if (!_hardwareArray) {
        _hardwareArray = @[@"WYACameraVC"];
    }
    return _hardwareArray;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
