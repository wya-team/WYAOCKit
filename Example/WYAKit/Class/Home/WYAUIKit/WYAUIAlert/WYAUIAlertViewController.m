//
//  WYAUIAlertViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/14.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAUIAlertViewController.h"

@interface WYAUIAlertViewController () <UITableViewDelegate, UITableViewDataSource,
                                        WYAShareViewDelegate>
@property (nonatomic, strong) NSArray * systemAlertTitleArray;
@property (nonatomic, strong) NSArray * systemSheetTitleArray;
@property (nonatomic, strong) NSArray * customAlertTitleArray;
@property (nonatomic, strong) NSArray * customSheetTitleArray;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) WYAShareView * shareView;
@end

@implementation WYAUIAlertViewController
- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
    vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/"
                   @"WYAAlert/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    self.tableView = [[UITableView alloc]
        initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)
                style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.navTitle = @"WYAAlertController";

    self.systemAlertTitleArray =
        @[ @"只有一个按钮",
           @"默认样式",
           @"加输入框的alert",
           @"没有标题的alert",
           @"有标题的alert" ];
    self.systemSheetTitleArray = @[ @"只有取消", @"多个选项", @"有标题的多个选项" ];
    self.customAlertTitleArray = @[ @"自定义alert" ];
    self.customSheetTitleArray = @[ @"自定义alertSheet", @"分享" ];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.systemAlertTitleArray.count;
    } else if (section == 1) {
        return self.systemSheetTitleArray.count;
    } else if (section == 2) {
        return self.customAlertTitleArray.count;
    } else {
        return self.customSheetTitleArray.count;
    }
}
- (nullable NSString *)tableView:(UITableView *)tableView
         titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"WYAAlertStyleDefalut";
    } else if (section == 1) {
        return @"WYAAlertStyleSheet";
    } else if (section == 2) {
        return @"WYAAlertStyleCustomAlert";
    } else {
        return @"WYAAlertStyleCustomSheet";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:nil];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.systemAlertTitleArray[indexPath.row];
    } else if (indexPath.section == 1) {
        cell.textLabel.text = self.systemSheetTitleArray[indexPath.row];
    } else if (indexPath.section == 2) {
        cell.textLabel.text = self.customAlertTitleArray[indexPath.row];
    } else {
        cell.textLabel.text = self.customSheetTitleArray[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            WYAAlertController * alert =
                [WYAAlertController wya_alertWithTitle:@"Welcome"
                                               Message:@"欢迎使用 WYAKit ！！"
                                      AlertLayoutStyle:WYAAlertLayoutStyleVertical];
            alert.backgroundButton.enabled = NO;
            // 创建 action
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"知道了"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            [alert wya_addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (indexPath.row == 1) {
            WYAAlertController * alert =
                [WYAAlertController wya_alertWithTitle:@"操作失败"
                                               Message:@"账号或密码不一致，请重试"
                                      AlertLayoutStyle:WYAAlertLayoutStyleHorizontal];
            alert.backgroundButton.enabled = NO;
            alert.presentStyle             = WYAPopupPresentStyleBounce;
            alert.dismissStyle             = WYAPopupDismissStyleShrink;
            // 创建 action
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"关闭"
                                              style:WYAAlertActionStyleCancel
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"重试"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (indexPath.row == 2) {
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];

            UITextField * tf       = [[UITextField alloc] init];
            tf.layer.borderColor   = [UIColor grayColor].CGColor;
            tf.layer.borderWidth   = 0.5;
            tf.layer.cornerRadius  = 4.f;
            tf.layer.masksToBounds = YES;
            tf.placeholder         = @"给朋友留言";
            tf.font                = [UIFont systemFontOfSize:15];
            tf.leftView            = view;
            tf.leftViewMode        = UITextFieldViewModeAlways;
            WYAAlertController * alert =
                [WYAAlertController wya_alertWithTitle:@"操作失败"
                                               Message:@"账号或密码不一致，请重试"
                                      AlertLayoutStyle:WYAAlertLayoutStyleHorizontal];
            alert.backgroundButton.enabled = NO;
            alert.presentStyle             = WYAPopupPresentStyleExpandHorizontal;
            alert.dismissStyle             = WYAPopupDismissStyleContractHorizontal;
            // 创建 action
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"关闭"
                                              style:WYAAlertActionStyleCancel
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"重试"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [alert wya_addTextField:tf];
            [self presentViewController:alert animated:YES completion:nil];

        } else if (indexPath.row == 3) {
            WYAAlertController * alert = [WYAAlertController
                wya_alertWithTitle:@""
                           Message:@"辅"
                                   @"助"
                                   @"说"
                                   @"明"
                                   @"文"
                                   @"字辅助说明文字辅助说明文字辅助说明文字辅助说明文字"
                  AlertLayoutStyle:WYAAlertLayoutStyleVertical];
            alert.backgroundButton.enabled = NO;
            alert.presentStyle             = WYAPopupPresentStyleExpandVertical;
            alert.dismissStyle             = WYAPopupDismissStyleContractVertical;
            // 创建 action
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"选项一"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"选项二"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            WYAAlertAction * defaultAction1 =
                [WYAAlertAction wya_actionWithTitle:@"选项三"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [alert wya_addAction:defaultAction1];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (indexPath.row == 4) {
            WYAAlertController * alert = [WYAAlertController
                wya_alertWithTitle:@"标题文字"
                           Message:@"辅"
                                   @"助"
                                   @"说"
                                   @"明"
                                   @"文"
                                   @"字辅助说明文字辅助说明文字辅助说明文字辅助说明文字"
                  AlertLayoutStyle:WYAAlertLayoutStyleVertical];
            alert.backgroundButton.enabled = NO;
            alert.presentStyle             = WYAPopupPresentStyleSlideDown;
            alert.dismissStyle             = WYAPopupDismissStyleSlideDown;
            // 创建 action
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"选项一"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"选项二"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            WYAAlertAction * defaultAction1 =
                [WYAAlertAction wya_actionWithTitle:@"选项三"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [alert wya_addAction:defaultAction1];
            [self presentViewController:alert animated:YES completion:nil];
        }

    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            WYAAlertController * alert =
                [WYAAlertController wya_alertSheetWithTitle:@""
                                                    Message:@""];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (indexPath.row == 1) {
            WYAAlertController * alert =
                [WYAAlertController wya_alertSheetWithTitle:@""
                                                    Message:@""];
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"选项一(警示项)"
                                              style:WYAAlertActionStyleDestructive
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"选项二"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            WYAAlertAction * defaultAction1 =
                [WYAAlertAction wya_actionWithTitle:@"选项三"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [alert wya_addAction:defaultAction1];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            WYAAlertController * alert =
                [WYAAlertController wya_alertSheetWithTitle:@"标题文字"
                                                    Message:@"详细信息"];
            WYAAlertAction * defaultAction =
                [WYAAlertAction wya_actionWithTitle:@"选项一"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            WYAAlertAction * cancelAction =
                [WYAAlertAction wya_actionWithTitle:@"选项二"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Cancel"); }];
            WYAAlertAction * defaultAction1 =
                [WYAAlertAction wya_actionWithTitle:@"选项三"
                                              style:WYAAlertActionStyleDefault
                                            handler:^{ NSLog(@"Default"); }];
            [alert wya_addAction:defaultAction];
            [alert wya_addAction:cancelAction];
            [alert wya_addAction:defaultAction1];
            [self presentViewController:alert animated:YES completion:nil];
        }

    } else if (indexPath.section == 2) {
        UIView * view        = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.bounds          = CGRectMake(0, 0, ScreenWidth - 50 * SizeAdapter, 100);
        WYAAlertController * alert =
            [WYAAlertController wya_alertWithCustomView:view
                                             AlertStyle:WYAAlertStyleCustomAlert];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        if (indexPath.row == 0) {
            UIView * view        = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            view.bounds          = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
            WYAAlertController * alert =
                [WYAAlertController wya_alertWithCustomView:view
                                                 AlertStyle:WYAAlertStyleCustomSheet];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            [self.shareView wya_showShareViewWithController:self];
        }
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in
-tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc]
initWithNibName:<#@"Nib name"#> bundle:nil];

    // Pass the selected object to the new view controller.

    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
/*
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
 */

- (WYAShareView *)shareView {
    if (!_shareView) {
        _shareView = ({
            WYAShareView * object = [[WYAShareView alloc] init];
            object.dataArray      = @[
                @[ @"新浪微博", @"微信朋友圈", @"微信好友", @"QQ" ],
                @[ @"字号", @"刷新", @"复制链接", @"投诉" ]
            ];
            object.delegate = self;
            object;
        });
    }
    return _shareView;
}
- (void)wya_shareView:(WYAShareView *)shareView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                   itemTitle:(NSString *)title {
    [UIView wya_showCenterToastWithMessage:title];
}
@end
