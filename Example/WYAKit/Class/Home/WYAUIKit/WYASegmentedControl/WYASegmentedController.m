//
//  WYASegmentedController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASegmentedController.h"

@interface WYASegmentedController ()<WYASegmentedControlDelegate>
@property (nonatomic, strong) WYASegmentedControl * segmentedControl1;
@property (nonatomic, strong) WYASegmentedControl * segmentedControl2;
@end

@implementation WYASegmentedController
#pragma mark ======= Life Cycle

- (void)wya_customrRightBarButtonItemPressed:(UIButton *)sender{
    // 查看README文档
    NSLog(@"查看文档");
    WYAReadMeViewController * vc = [[WYAReadMeViewController alloc]init];
    vc.readMeUrl = @"https://github.com/wya-team/WYAOCKit/blob/master/WYAKit/Classes/WYAUIKit/WYASegmentedControl/README.md";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wya_addRightNavBarButtonWithNormalImage:@[@"icon_help"] highlightedImg:@[]];

    [self.view addSubview:self.segmentedControl1];
    [self.view addSubview:self.segmentedControl2];

}
#pragma mark ======= getter
- (WYASegmentedControl *)segmentedControl1{
    if(!_segmentedControl1){
        _segmentedControl1 = ({
            CGRect frame = CGRectMake(10*SizeAdapter, WYATopHeight + 20*SizeAdapter, ScreenWidth-20*SizeAdapter, 49);
            WYASegmentedControl * object = [WYASegmentedControl wya_initWithFrame:frame itemsTitleArray:@[@"segment1",@"segment2",@"segment3",@"segment4"]];
            object.delegate = self;
            object;
       });
    }
    return _segmentedControl1;
}

- (WYASegmentedControl *)segmentedControl2{
    if(!_segmentedControl2){
        _segmentedControl2 = ({
            CGRect frame = CGRectMake(10*SizeAdapter, WYATopHeight + 8*SizeAdapter + CGRectGetMaxY(self.segmentedControl1.frame), ScreenWidth-20*SizeAdapter, 49);
            WYASegmentedControl * object = [WYASegmentedControl wya_initWithFrame:frame itemsTitleArray:@[@"segment1",@"segment2",@"segment3",@"segment4"]];
            object.delegate = self;
            object.itemsFont = 10;
            object.selectedSegmentIndex = 3;
            object.borderColor = REDCOLOR;
            object.itemSelectColor = WHITECOLOR;
            object.itemNormalColor = REDCOLOR;
            object;
        });
    }
    return _segmentedControl2;
}

#pragma mark ======= WYASegmentedControlDelegate
- (void)wya_segmentedControlChangeValue:(WYASegmentedControl *)segmentedControl{
//        if (segmentedControl == self.segmentedControl1) {
//            [UIView wya_ShowBottomToastWithMessage:[NSString stringWithFormat:@"segmentedControl1---选中第%ld个",segmentedControl.getSelectedIndex+1]];
//        }else{
//              [UIView wya_ShowBottomToastWithMessage:[NSString stringWithFormat:@"segmentedControl2---选中第%ld个",segmentedControl.getSelectedIndex+1]];
//        }
}
@end
