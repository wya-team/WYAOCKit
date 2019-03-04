//
//  WYAPickerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPickerViewController.h"
#import "WYAPopVerReadMeViewController.h"

@interface WYAPickerViewController () <WYAPickerViewDelegate, UITableViewDelegate,
                                       UITableViewDataSource,
                                       UIPopoverPresentationControllerDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) WYAPickerView * pickerView;
@property (nonatomic, strong) WYADatePicker * datePicker;
@property (nonatomic, strong) WYAAlertController * alert;
//@property (nonatomic, strong) WYAAlertController * dateAlert;
@end

@implementation WYAPickerViewController {
    NSArray * dateStyles;
}

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender {
    // 查看README文档
    NSLog(@"查看文档");
    [self showPopverPresentVC:sender];
}
#pragma mark ======= popverPresentVC
- (void)showPopverPresentVC:(UIButton *)sender {
    WYAPopVerReadMeViewController * test       = [[WYAPopVerReadMeViewController alloc] init];
    test.preferredContentSize                  = CGSizeMake(150 * SizeAdapter, 87 * SizeAdapter);
    test.dataSource                            = @[ @"DatePickerView", @"CustomPickerView", @"dsf" ];
    test.modalPresentationStyle                = UIModalPresentationPopover;
    __block WYAPopVerReadMeViewController * vc = test;
    test.pushCallback                          = ^(NSIndexPath * _Nonnull indexPath) {
        [vc dismissViewControllerAnimated:YES completion:nil];
        if (indexPath.row == 0) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAUIKit/WYAPickerView/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            // 跳转链接
            WYAReadMeViewController * vc = [[WYAReadMeViewController alloc] init];
            vc.readMeUrl                 = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/"
                           @"WYAUIKit/WYAPickerView/WYAPickerView/README.md";
            [self.navigationController pushViewController:vc animated:YES];
        }

    };
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate                          = self;
    popover.permittedArrowDirections          = UIPopoverArrowDirectionAny; //设置箭头位置
    popover.sourceView                        = sender;                     //设置目标视图
    popover.sourceRect                        = sender.bounds;              //弹出视图显示位置
    popover.backgroundColor                   = [UIColor whiteColor];       //设置弹窗背景颜色
    popover.popoverBackgroundViewClass        = [WYACustomPopoverBackgroundView class];
    [self presentViewController:test animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:
    (UIPresentationController *)controller {
    return UIModalPresentationNone;
}
#pragma mark ======= end
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[ @"icon_help" ] highlightedImg:@[]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view
    // controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navTitle = NSStringFromClass([self class]);
    dateStyles    = @[
        @"年月日时分秒",
        @"年",
        @"月",
        @"时",
        @"分",
        @"秒",
        @"年月",
        @"年月日",
        @"年月日时",
        @"年月日时分",
        @"月日",
        @"月日时",
        @"月日时分",
        @"月日时分秒",
        @"时分",
        @"时分秒",
        @"分秒"
    ];

    self.tableView = [[UITableView alloc]
        initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight - WYATopHeight)
                style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 3;
    } else {
        return dateStyles.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:nil];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"单列";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"双列";
        } else {
            cell.textLabel.text = @"三列";
        }
    } else if (indexPath.section == 1) {
        cell.textLabel.text = dateStyles[indexPath.row];
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"单列";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"双列";
        } else {
            cell.textLabel.text = @"三列";
        }
    } else {
        cell.textLabel.text = @"";
    }
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView
         titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"WYAPickerSystem";
    } else if (section == 1) {
        return @"WYADatePickerSystem";
    } else if (section == 2) {
        return @"WYAPickerCustom";
    } else {
        return @"WYADatePickerCustom";
    }
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
        self.pickerView                  = [[WYAPickerView alloc] init];
        self.pickerView.delegate         = self;
        self.pickerView.titleKeyWords    = @"title";
        self.pickerView.arrayKeyWords    = @"array";
        self.pickerView.pickerHeight     = 220;
        self.pickerView.pickerItemHeight = 44;
        self.pickerView.titleLabel.text = @"sd";
        self.pickerView.autoTitleChange = NO;
        //        self.pickerView.titleLabel.text = @"测试";
        //        self.pickerView.autoTitleChange = NO;
        //        self.pickerView.backButton.titleLabel.font = FONT(10);
        //        pickerView.pickerViewStyle = WYAPickerViewStyleSystem;
        if (indexPath.row == 0) {
            self.pickerView.pickerViewColumnStyle = WYAPickerViewColumnStyleSingle;
            self.pickerView.dataArray             = [@[ @"A", @"B", @"C" ] mutableCopy];
        } else if (indexPath.row == 1) {
            self.pickerView.pickerViewColumnStyle = WYAPickerViewColumnStyleDouble;
            self.pickerView.dataArray             = [@[
                @{
                    @"title" : @"A",
                    @"array" : @[
                        @{
                           @"title" : @"aa",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"ab",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"ac",
                           @"array" : @[],
                        }
                    ]
                },
                @{
                    @"title" : @"B",
                    @"array" : @[
                        @{
                           @"title" : @"bb",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"bc",
                           @"array" : @[],
                        }
                    ]
                }
            ] mutableCopy];

        } else {
            self.pickerView.pickerViewColumnStyle = WYAPickerViewColumnStyleThree;
            self.pickerView.dataArray             = [@[
                @{
                    @"title" : @"A",
                    @"array" : @[
                        @{
                           @"title" : @"aa",
                           @"array" : @[ @{@"title" : @"aaa", @"array" : @[]} ],
                        },
                        @{
                           @"title" : @"ab",
                           @"array" : @[ @{@"title" : @"abb", @"array" : @[]} ],
                        },
                        @{
                           @"title" : @"ac",
                           @"array" : @[ @{@"title" : @"acc", @"array" : @[]} ],
                        }
                    ]
                },
                @{
                    @"title" : @"B",
                    @"array" : @[
                        @{
                           @"title" : @"bb",
                           @"array" : @[ @{@"title" : @"bbb", @"array" : @[]} ],
                        },
                        @{
                           @"title" : @"bc",
                           @"array" : @[ @{@"title" : @"bbc", @"array" : @[]} ],
                        }
                    ]
                }
            ] mutableCopy];
        }

        self.pickerView.bounds =
            CGRectMake(0, 0, self.view.frame.size.width, [self.pickerView wya_GetPickerViewHeight]);
        
        self.alert = [WYAAlertController wya_alertWithCustomView:self.pickerView
                                                      AlertStyle:WYAAlertStyleCustomSheet];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else if (indexPath.section == 1) {
        self.datePicker              = [[WYADatePicker alloc] init];
        self.datePicker.pickerHeight = 260;
        if (indexPath.row == 0) {
            self.datePicker.datePickerStyle = WYADatePickerStyleDateHourMinuteSecond;
        } else if (indexPath.row == 1) {
            self.datePicker.datePickerStyle = WYADatePickerStyleYear;
        } else if (indexPath.row == 2) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMouth;
        } else if (indexPath.row == 3) {
            self.datePicker.datePickerStyle = WYADatePickerStyleHour;
        } else if (indexPath.row == 4) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMinute;
        } else if (indexPath.row == 5) {
            self.datePicker.datePickerStyle = WYADatePickerStyleSecond;
        } else if (indexPath.row == 6) {
            self.datePicker.datePickerStyle = WYADatePickerStyleYearAndMonth;
        } else if (indexPath.row == 7) {
            self.datePicker.datePickerStyle = WYADatePickerStyleDate;
        } else if (indexPath.row == 8) {
            self.datePicker.datePickerStyle = WYADatePickerStyleDateHour;
        } else if (indexPath.row == 9) {
            self.datePicker.datePickerStyle = WYADatePickerStyleDateHourMinute;
        } else if (indexPath.row == 10) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMonthDay;
        } else if (indexPath.row == 11) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMonthDayHour;
        } else if (indexPath.row == 12) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMonthDayHourMinute;
        } else if (indexPath.row == 13) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMonthDayHourMinuteSecond;
        } else if (indexPath.row == 14) {
            self.datePicker.datePickerStyle = WYADatePickerStyleTime;
        } else if (indexPath.row == 15) {
            self.datePicker.datePickerStyle = WYADatePickerStyleTimeAndSecond;
        } else if (indexPath.row == 16) {
            self.datePicker.datePickerStyle = WYADatePickerStyleMinuteAndSecond;
        }

        self.datePicker.bounds =
            CGRectMake(0, 0, self.view.frame.size.width, [self.datePicker getPickerViewHeight]);
        WYAAlertController * dateAlert = [WYAAlertController wya_alertWithCustomView:self.datePicker
                                                          AlertStyle:WYAAlertStyleCustomSheet];
        [self presentViewController:dateAlert animated:YES completion:nil];

    } else if (indexPath.section == 2) {
        //        WYAPickerView * pickerView = [[WYAPickerView alloc]init];
        //        pickerView.pickerViewStyle = WYAPickerViewStyleCustom;
        //        if (indexPath.row == 0) {
        //            pickerView.pickerViewColumnStyle = WYAPickerViewColumnStyleSingle;
        //            pickerView.fristDataArray = [@[@"A",@"B",@"C"] mutableCopy];
        //        }
        //        pickerView.pickerHeight = 300;
        //        pickerView.pickerItemHeight = 44;
        //        pickerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [pickerView
        //        wya_GetPickerViewHeight]);
        //        WYAAlertController * alert = [WYAAlertController
        //        wya_AlertWithCustomView:pickerView AlertStyle:WYAAlertStyleCustomSheet];
        //        [self presentViewController:alert animated:YES completion:nil];
        //        pickerView.viewController = alert;
    }
}

- (void)wya_ChooseWithPickerView:(WYAPickerView *)pickerView ResultString:(NSString *)result {
    NSLog(@"result==%@", result);

}

- (void)wya_ChooseWithDatePicker:(WYADatePicker *)datePicker ResultString:(NSString *)result {
    
}

@end
