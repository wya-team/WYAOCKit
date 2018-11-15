//
//  WYAUIAlertViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/14.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAUIAlertViewController.h"
#import <WYAKit/WYAAlertController.h>
@interface WYAUIAlertViewController ()
@property (nonatomic, strong) NSArray * systemTitleArray;
@property (nonatomic, strong) NSArray * customTitleArray;
@end

@implementation WYAUIAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSStringFromClass([self class]);
    self.systemTitleArray = @[@"PresentSystem & DismissFadeOut",
                              @"PresentBounce & DismissFadeOut",
                              @"PresentFadeIn & DismissFadeOut",
                              @"PresentExpand & DismissContract(Horizontal)",
                              @"PresentExpand & DismissContract(Vertical)",
                              @"PresentSlideDown & DismissSlideDown",
                              @"PresentSlideUp & DismissSlideUp",
                              @"PresentSlideLeft & DismissSlideLeft",
                              @"PresentSlideRight & DismissSlideRight"];
    
    self.customTitleArray = @[@"AlertSheetView",
                              @"CustomAlertView"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.systemTitleArray.count;
    }else {
        return self.customTitleArray.count;
    }
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"默认样式";
    }else{
        return @"自定义样式";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.systemTitleArray[indexPath.row];
    }else{
        cell.textLabel.text = self.customTitleArray[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            WYAAlertController * alert = [WYAAlertController wya_AlertSheetWithTitle:@"哈哈哈" Message:@"内容信息" AlertStyle:WYAAlertStyleSheet];
            // 创建 action
            WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"确定" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Default"); }];
            
            WYAAlertAction *cancelAction = [WYAAlertAction wya_ActionWithTitle:@"取消" style:WYAAlertActionStyleCancel handler:^{ NSLog(@"Cancel"); }];
            [alert wya_AddActions:@[defaultAction, cancelAction]];
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);

        WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:view AlertStyle:WYAAlertStyleCustom];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    WYAAlertController *alert = [WYAAlertController wya_AlertWithTitle:@"警告！警告！💥"
                                                               Message:@"逗你玩儿呢 ~ 😜"
                                                            AlertStyle:WYAAlertStyleDefalut];
    alert.backgroundButton.enabled = NO;
    
    // 创建 action
    WYAAlertAction *defaultAction = [WYAAlertAction wya_ActionWithTitle:@"确定" style:WYAAlertActionStyleDefault handler:^{ NSLog(@"Default"); }];

    WYAAlertAction *cancelAction = [WYAAlertAction wya_ActionWithTitle:@"取消" style:WYAAlertActionStyleCancel handler:^{ NSLog(@"Cancel"); }];



    // 一次性添加
    [alert wya_AddActions:@[defaultAction, cancelAction]];


    // 设置转场方式
    switch (indexPath.row) {
        case 0:
            alert.presentStyle = WYAPopupPresentStyleSystem;
            break;
        case 1:
            alert.presentStyle = WYAPopupPresentStyleBounce;
            break;
        case 2:
            alert.presentStyle = WYAPopupPresentStyleFadeIn;
            break;
        case 3:
            alert.presentStyle = WYAPopupPresentStyleExpandHorizontal;
            alert.dismissStyle = WYAPopupDismissStyleContractHorizontal;
            break;
        case 4:
            alert.presentStyle = WYAPopupPresentStyleExpandVertical;
            alert.dismissStyle = WYAPopupDismissStyleContractVertical;
            break;
        case 5:
            alert.presentStyle = WYAPopupPresentStyleSlideDown;
            alert.dismissStyle = WYAPopupDismissStyleSlideDown;
            break;
        case 6:
            alert.presentStyle = WYAPopupPresentStyleSlideUp;
            alert.dismissStyle = WYAPopupDismissStyleSlideUp;
            break;
        case 7:
            alert.presentStyle = WYAPopupPresentStyleSlideLeft;
            alert.dismissStyle = WYAPopupDismissStyleSlideLeft;
            break;
        case 8:
            alert.presentStyle = WYAPopupPresentStyleSlideRight;
            alert.dismissStyle = WYAPopupDismissStyleSlideRight;
            break;
        default:
            break;
    }

    [self presentViewController:alert animated:YES completion:nil];
    
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
