//
//  WYAPickerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPickerViewController.h"
#import <WYAKit/WYAPickerView.h>
#import <WYAKit/WYAAlertController.h>
#import <WYAKit/WYADatePicker.h>
#import <WYAKit/WYAPickerManager.h>
@interface WYAPickerViewController ()<WYAPickerViewDelegate>

@end

@implementation WYAPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"单列";
        }else if (indexPath.row == 1) {
            cell.textLabel.text = @"双列";
        }else {
            cell.textLabel.text = @"三列";
        }
    }else if (indexPath.section == 1) {
        cell.textLabel.text = @"年月日时分秒";
    }else if (indexPath.section == 2) {
        cell.textLabel.text = @"";
    }else{
        cell.textLabel.text = @"";
    }
    return cell;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"WYAPickerSystem";
    }else if (section == 1) {
        return @"WYADatePickerSystem";
    }else if (section == 2) {
        return @"WYAPickerCustom";
    }else {
        return @"WYADatePickerCustom";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0) {
        WYAPickerView * pickerView = [[WYAPickerView alloc]init];
        pickerView.delegate = self;
        if (indexPath.row == 0) {
            pickerView.pickerViewStyle = WYAPickerViewStyleSingle;
            pickerView.fristDataArray = [@[@"A",@"B",@"C"] mutableCopy];
        }else if (indexPath.row == 1) {
            pickerView.pickerViewStyle = WYAPickerViewStyleDouble;
            pickerView.fristDataArray = [@[@"A",@"B",@"C"] mutableCopy];
            pickerView.secondDataArray = [@[@[@"a",@"b",@"c"],@[@"1",@"2",@"3"],@[@",",@"-",@"+"]] mutableCopy];
        }else{
            pickerView.pickerViewStyle = WYAPickerViewStyleThree;
            pickerView.fristDataArray = [@[@"A"] mutableCopy];
            pickerView.secondDataArray = [@[@[@"a",@"b",@"c"]] mutableCopy];
            pickerView.threeDataArray = [@[@[@[@"北京",@"上海",@"广州",@"重庆"],@[@"杭州",@"郑州",@"长沙"],@[@"大洋洲",@"北冰洋"]]] mutableCopy];
        }
        pickerView.pickerHeight = 160;
        pickerView.pickerItemHeight = 30;
        pickerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [pickerView getPickerViewHeight]);
        WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:pickerView AlertStyle:WYAAlertStyleCustomSheet];
        [self presentViewController:alert animated:YES completion:nil];
        pickerView.viewController = alert;
    }else if (indexPath.section == 1){
        WYADatePicker * datePicker = [[WYADatePicker alloc]init];
        WYAPickerManager * manager = [[WYAPickerManager alloc]init];
        if (indexPath.row == 0) {
            datePicker.datePickerStyle = WYADatePickerStyleDateHourMinuteSecond;
        }
        datePicker.datePickerManager = manager;
        datePicker.frame = CGRectMake(0, 0, self.view.frame.size.width, [datePicker getPickerViewHeight]);
        WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:datePicker AlertStyle:WYAAlertStyleCustomSheet];
        [self presentViewController:alert animated:YES completion:nil];
        datePicker.viewController = alert;
    }
}

- (void)wya_ChooseWithPickerView:(UIView *)pickerView ResultString:(NSString *)result{
    NSLog(@"result==%@",result);
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
