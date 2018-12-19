//
//  WYASegmentedController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/19.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYASegmentedController.h"

@interface WYASegmentedController ()
@property (nonatomic, strong) WYASegmentedControl * segmentedControl;
@end

@implementation WYASegmentedController
#pragma mark ======= Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.segmentedControl];
}
#pragma mark ======= getter
- (WYASegmentedControl *)segmentedControl{
    if(!_segmentedControl){
        _segmentedControl = ({
            CGRect frame = CGRectMake(10*SizeAdapter, WYATopHeight + 20*SizeAdapter, ScreenWidth-20*SizeAdapter, 49);
            WYASegmentedControl * object = [WYASegmentedControl wya_initWithFrame:frame itemsTitleArray:@[@"segment1",@"segment2",@"segment3",@"segment4"]];
            
            object;
       });
    }
    return _segmentedControl;
}
@end
