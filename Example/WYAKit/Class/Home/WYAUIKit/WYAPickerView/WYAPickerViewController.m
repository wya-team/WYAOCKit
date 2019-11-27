//
//  WYAPickerViewController.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/22.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAPickerViewController.h"
#import "WYAPopVerReadMeViewController.h"

@interface WYAPickerViewController () <WYAPickerViewDelegate, WYADatePickerDelegate, UITableViewDelegate,
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

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender
{
    // 查看README文档
    NSLog(@"查看文档");
    [self showPopverPresentVC:sender];
}
#pragma mark ======= popverPresentVC
- (void)showPopverPresentVC:(UIButton *)sender
{
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
(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}
#pragma mark ======= end
- (void)viewDidLoad
{
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 2) {
        return 3;
    } else {
        return dateStyles.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
         titleForHeaderInSection:(NSInteger)section
{
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0) {
        //        self.pickerView.titleLabel.text = @"测试";
        //        self.pickerView.autoTitleChange = NO;
        //        self.pickerView.backButton.titleLabel.font = FONT(10);
        //        pickerView.pickerViewStyle = WYAPickerViewStyleSystem;
        if (indexPath.row == 0) {
            self.pickerView                  = [[WYAPickerView alloc] initWithFrame:CGRectZero];
            self.pickerView.delegate         = self;
            self.pickerView.titleKeyWords    = @"title";
            self.pickerView.arrayKeyWords    = @"array";
            self.pickerView.paramWords       = @"index";
            self.pickerView.pickerHeight     = 220;
            self.pickerView.pickerItemHeight = 44;
            self.pickerView.titleLabel.text  = @"sd";
            self.pickerView.autoTitleChange  = NO;
            self.pickerView.selectValues     = @[ @"B" ];
            self.pickerView.dataArray        = [@[ @{ @"title" : @"A",
                                               @"index" : @"1" },
                                            @{ @"title" : @"B",
                                               @"index" : @"2" },
                                            @{ @"title" : @"C",
                                               @"index" : @"3" } ] mutableCopy];
        } else if (indexPath.row == 1) {
            self.pickerView                  = [[WYAPickerView alloc] initWithFrame:CGRectZero style:WYAPickerViewColumnStyleDouble];
            self.pickerView.delegate         = self;
            self.pickerView.titleKeyWords    = @"title";
            self.pickerView.arrayKeyWords    = @"array";
            self.pickerView.paramWords       = @"index";
            self.pickerView.pickerHeight     = 220;
            self.pickerView.pickerItemHeight = 44;
            self.pickerView.titleLabel.text  = @"sd";
            self.pickerView.autoTitleChange  = NO;
            self.pickerView.selectValues     = @[ @"B", @"bc" ];
            self.pickerView.dataArray        = [@[
                @{
                    @"title" : @"A",
                    @"index" : @"6",
                    @"array" : @[
                        @{
                           @"title" : @"aa",
                           @"index" : @"1",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"ab",
                           @"index" : @"2",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"ac",
                           @"index" : @"3",
                           @"array" : @[],
                        }
                    ]
                },
                @{
                    @"title" : @"B",
                    @"index" : @"7",
                    @"array" : @[
                        @{
                           @"title" : @"bb",
                           @"index" : @"4",
                           @"array" : @[],
                        },
                        @{
                           @"title" : @"bc",
                           @"index" : @"5",
                           @"array" : @[],
                        }
                    ]
                }
            ] mutableCopy];

        } else {
            self.pickerView                  = [[WYAPickerView alloc] initWithFrame:CGRectZero style:WYAPickerViewColumnStyleThree];
            self.pickerView.delegate         = self;
            self.pickerView.titleKeyWords    = @"title";
            self.pickerView.arrayKeyWords    = @"array";
            self.pickerView.paramWords       = @"index";
            self.pickerView.pickerHeight     = 220;
            self.pickerView.pickerItemHeight = 44;
            self.pickerView.titleLabel.text  = @"sd";
            self.pickerView.autoTitleChange  = NO;
            self.pickerView.selectValues     = @[ @"生鲜", @"时令生鲜", @"板栗" ];
            self.pickerView.dataArray        = [@[
                @{
                    @"title" : @"男装",
                    @"index" : @"0",
                    @"array" : @[
                        @{
                           @"title" : @"短外套",
                           @"index" : @"01",
                           @"array" : @[
                               @{
                                  @"title" : @"夹克",
                                  @"array" : @[],
                                  @"index" : @"001",
                               },
                               @{
                                  @"title" : @"休闲",
                                  @"array" : @[],
                                  @"index" : @"002",
                               },
                               @{
                                  @"title" : @"学院风",
                                  @"array" : @[],
                                  @"index" : @"003",
                               },
                           ],
                        },
                        @{
                           @"title" : @"休闲长裤",
                           @"index" : @"02",
                           @"array" : @[
                               @{
                                  @"title" : @"修身",
                                  @"array" : @[],
                                  @"index" : @"021",
                               },
                               @{
                                  @"title" : @"牛仔",
                                  @"array" : @[],
                                  @"index" : @"022",
                               },
                               @{
                                  @"title" : @"九分裤",
                                  @"array" : @[],
                                  @"index" : @"023",
                               },
                           ],
                        },
                        @{
                           @"title" : @"衬衫",
                           @"index" : @"03",
                           @"array" : @[
                               @{
                                  @"title" : @"修身",
                                  @"array" : @[],
                                  @"index" : @"031",
                               },
                               @{
                                  @"title" : @"九分",
                                  @"array" : @[],
                                  @"index" : @"032",
                               },
                               @{
                                  @"title" : @"圆领",
                                  @"array" : @[],
                                  @"index" : @"033",
                               },
                           ],
                        }
                    ]
                },
                @{
                    @"title" : @"生鲜",
                    @"index" : @"1",
                    @"array" : @[
                        @{
                           @"title" : @"水果",
                           @"index" : @"11",
                           @"array" : @[
                               @{
                                  @"title" : @"火龙果",
                                  @"array" : @[],
                                  @"index" : @"111",
                               },
                               @{
                                  @"title" : @"青提",
                                  @"array" : @[],
                                  @"index" : @"112",
                               },
                               @{
                                  @"title" : @"蜜柚",
                                  @"array" : @[],
                                  @"index" : @"113",
                               },
                           ],
                        },
                        @{
                           @"title" : @"时令生鲜",
                           @"index" : @"12",
                           @"array" : @[
                               @{
                                  @"title" : @"大闸蟹",
                                  @"array" : @[],
                                  @"index" : @"121",
                               },
                               @{
                                  @"title" : @"板栗",
                                  @"array" : @[],
                                  @"index" : @"122",
                               },
                               @{
                                  @"title" : @"蜜薯",
                                  @"array" : @[],
                                  @"index" : @"123",
                               },
                           ],
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
        if (indexPath.row == 0) {
            self.datePicker                = [[WYADatePicker alloc] initWithFrame:CGRectZero];
            self.datePicker.pickerItemFont = FONT(15);
            self.datePicker.minDate        = [NSDate wya_dateWithString:@"2018-09-29 10:10:10" format:@"yyyy-MM-dd HH:mm:ss"];
            self.datePicker.maxDate        = [NSDate wya_dateWithString:@"2020-09-29 10:10:10" format:@"yyyy-MM-dd HH:mm:ss"];

        } else if (indexPath.row == 1) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleYear];
        } else if (indexPath.row == 2) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMouth];
        } else if (indexPath.row == 3) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleHour];
        } else if (indexPath.row == 4) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMinute];
        } else if (indexPath.row == 5) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleSecond];
        } else if (indexPath.row == 6) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleYearAndMonth];
        } else if (indexPath.row == 7) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleDate];
        } else if (indexPath.row == 8) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleDateHour];
        } else if (indexPath.row == 9) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleDateHourMinute];
        } else if (indexPath.row == 10) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMonthDay];
        } else if (indexPath.row == 11) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMonthDayHour];
        } else if (indexPath.row == 12) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMonthDayHourMinute];
        } else if (indexPath.row == 13) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMonthDayHourMinuteSecond];
        } else if (indexPath.row == 14) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleTime];
        } else if (indexPath.row == 15) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleTimeAndSecond];
        } else if (indexPath.row == 16) {
            self.datePicker = [[WYADatePicker alloc] initWithFrame:CGRectZero style:WYADatePickerStyleMinuteAndSecond];
        }
        self.datePicker.wya_delegate = self;
        self.datePicker.pickerHeight = 260;
        self.datePicker.selectDate   = [[[NSDate date] wya_offsetYears:-1] wya_offsetDays:1];
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
- (NSDate *)wya_MinDateWithDatePicker:(WYADatePicker *)datePicker style:(WYADatePickerStyle)style
{
    switch (style) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-09-29 10:10:10" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleYear: {
            // 最好是个完整的时间
            NSDate * date = [NSDate wya_dateWithString:@"2018" format:@"yyyy"];
            return date;
        } break;
        case WYADatePickerStyleMouth: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01" format:@"yyyy-MM"];
            return date;
        } break;
        case WYADatePickerStyleHour: { // 最好是个完整的时间
            NSDate * date = [NSDate wya_dateWithString:@"2019-09-30 01" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleMinute: {
            // 最好是个完整的时间
            NSDate * date = [NSDate wya_dateWithString:@"2019-09-30 01:01" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2019-09-30 01:59:01" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleYearAndMonth: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01" format:@"yyyy-MM"];
            return date;
        } break;
        case WYADatePickerStyleDate: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05" format:@"yyyy-MM-dd"];
            return date;
        } break;
        case WYADatePickerStyleDateHour: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleDateHourMinute: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08:08" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleMonthDay: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05" format:@"yyyy-MM-dd"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHour: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHourMinute: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08:08" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08:08:08" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleTime: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 08:08" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleTimeAndSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 08:08:08" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleMinuteAndSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 09:08:55" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        default:
            break;
    }
    return nil;
}
- (NSDate *)wya_MaxDateWithDatePicker:(WYADatePicker *)datePicker style:(WYADatePickerStyle)style
{
    switch (style) {
        case WYADatePickerStyleDateHourMinuteSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2020-09-29 10:10:10" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleYear: {
            NSDate * date = [NSDate wya_dateWithString:@"2020" format:@"yyyy"];
            return date;
        } break;
        case WYADatePickerStyleMouth: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-12" format:@"yyyy-MM"];
            return date;
        } break;
        case WYADatePickerStyleHour: {
            NSDate * date = [NSDate wya_dateWithString:@"2019-9-30 24" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleMinute: {
            NSDate * date = [NSDate wya_dateWithString:@"2019-09-30 01:59" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2019-09-30 01:59:59" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleYearAndMonth: {
            NSDate * date = [NSDate wya_dateWithString:@"2020-01" format:@"yyyy-MM"];
            return date;
        } break;
        case WYADatePickerStyleDate: {
            NSDate * date = [NSDate wya_dateWithString:@"2020-01-05" format:@"yyyy-MM-dd"];
            return date;
        } break;
        case WYADatePickerStyleDateHour: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-06-05 08" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleDateHourMinute: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-06-05 08:08" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleMonthDay: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-02" format:@"yyyy-MM-dd"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHour: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 23" format:@"yyyy-MM-dd HH"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHourMinute: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08:55" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleMonthDayHourMinuteSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-01-05 08:08:55" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleTime: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 23:08" format:@"yyyy-MM-dd HH:mm"];
            return date;
        } break;
        case WYADatePickerStyleTimeAndSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 23:23:23" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        case WYADatePickerStyleMinuteAndSecond: {
            NSDate * date = [NSDate wya_dateWithString:@"2018-10-01 09:55:55" format:@"yyyy-MM-dd HH:mm:ss"];
            return date;
        } break;
        default:
            break;
    }
    return nil;
}
- (void)wya_ChooseWithPickerView:(WYAPickerView *)pickerView ResultString:(NSString *)result
{
    NSLog(@"result==%@", result);
}

- (void)wya_ChooseWithPickerView:(WYAPickerView *)pickerView ResultValues:(NSString *)result
{
    NSLog(@"result==%@", result);
}

- (void)wya_ChooseWithDatePicker:(WYADatePicker *)datePicker ResultString:(NSString *)result
{
    NSLog(@"result==%@", result);
}

@end
