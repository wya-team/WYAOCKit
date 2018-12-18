//
//  WYAHomeModel.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAHomeModel.h"

@implementation WYAHomeItemModel


@end

@implementation WYAHomeModel

+(NSArray *)allModel{
    
    WYAHomeItemModel * item1 = [[WYAHomeItemModel alloc]init];
    item1.rowName = @"WYADrawerViewController 抽屉 ";
    item1.className = @"WYADrawerViewController";
    
    WYAHomeItemModel * item2 = [[WYAHomeItemModel alloc]init];
    item2.rowName = @"WYAChooseMenu 菜单";
    item2.className = @"WYAChooseMenuViewController";
    
    WYAHomeItemModel * item3 = [[WYAHomeItemModel alloc]init];
    item3.rowName = @"WYANavBar 导航栏";
    item3.className = @"WYANavBarViewController";

    WYAHomeItemModel * item4 = [[WYAHomeItemModel alloc]init];
    item4.rowName = @"WYAPaginationView 分页器";
    
    WYAHomeItemModel * item5 = [[WYAHomeItemModel alloc]init];
    item5.rowName = @"WYASegmentedControl 分段控制器";
    
    WYAHomeItemModel * item6 = [[WYAHomeItemModel alloc]init];
    item6.rowName = @"WYATabBar 底部导航";
    
    WYAHomeItemModel * item7 = [[WYAHomeItemModel alloc]init];
    item7.rowName = @"WYAPageViewController 分页控制器";
    item7.className = @"WYAPageViewController";
    
    WYAHomeItemModel * item8 = [[WYAHomeItemModel alloc]init];
    item8.rowName = @"WYASearchBar 搜索栏";
    
    WYAHomeItemModel * item9 = [[WYAHomeItemModel alloc]init];
    item9.rowName = @"UIPopoverPresentationController 气泡";
    item9.className = @"WYAPopViewController";
    
    WYAHomeModel * model1 = [[WYAHomeModel alloc]init];
    model1.sectionName = @"导航 Navigation";
    model1.rows = @[item1,item2,item3,item4,item5,item6,item7,item8,item9];
    
    WYAHomeItemModel * item10 = [[WYAHomeItemModel alloc]init];
    item10.rowName = @"WYAButton 按钮";
    item10.className = @"WYAButtonViewController";
    
    WYAHomeItemModel * item11 = [[WYAHomeItemModel alloc]init];
    item11.rowName = @"WYAPickerView 日期选择";
    item11.className = @"WYAPickerViewController";
    
    WYAHomeItemModel * item12 = [[WYAHomeItemModel alloc]init];
    item12.rowName = @"WYAImagePicker 图片选择器";
    item12.className = @"WYACameraVC";
    
    WYAHomeItemModel * item13 = [[WYAHomeItemModel alloc]init];
    item13.rowName = @"WYATextView 多行输入";
    item13.className = @"WYATextViewController";
    
    WYAHomeItemModel * item14 = [[WYAHomeItemModel alloc]init];
    item14.rowName = @"WYAInputItem 文本输入";
    
    WYAHomeItemModel * item15 = [[WYAHomeItemModel alloc]init];
    item15.rowName = @"WYASlidder 滑动输入";
    item15.className = @"WYASliderViewController";
    
    WYAHomeItemModel * item16 = [[WYAHomeItemModel alloc]init];
    item16.rowName = @"WYAStepperView 步进器";
    
    WYAHomeItemModel * item17 = [[WYAHomeItemModel alloc]init];
    item17.rowName = @"WYACameraViewController 拍照录制视频";
    
    WYAHomeItemModel * item18 = [[WYAHomeItemModel alloc]init];
    item18.rowName = @"WYAQRCodeViewController 扫码";
    
    WYAHomeModel * model2 = [[WYAHomeModel alloc]init];
    model2.sectionName = @"数据录入 Daya Entry";
    model2.rows = @[item10,item11,item12,item13,item14,item15,item16,item17,item18];
    
    WYAHomeItemModel * item19 = [[WYAHomeItemModel alloc]init];
    item19.rowName = @"WYAGridItem 宫格";
    
    WYAHomeItemModel * item20 = [[WYAHomeItemModel alloc]init];
    item20.rowName = @"WYACard 卡片";
    
    WYAHomeItemModel * item21 = [[WYAHomeItemModel alloc]init];
    item21.rowName = @"WYABannerView 轮播图";
    
    WYAHomeItemModel * item22 = [[WYAHomeItemModel alloc]init];
    item22.rowName = @"WYAList 列表";
    
    WYAHomeItemModel * item23 = [[WYAHomeItemModel alloc]init];
    item23.rowName = @"WYANoticeBar 通告栏";
    
    WYAHomeItemModel * item24 = [[WYAHomeItemModel alloc]init];
    item24.rowName = @"WYAIMGCode 二维码";
    
    WYAHomeModel * model3 = [[WYAHomeModel alloc]init];
    model3.sectionName = @"数据展示 Data Display";
    model3.rows = @[item19,item20,item21,item22,item23,item24];
    
    WYAHomeItemModel * item25 = [[WYAHomeItemModel alloc]init];
    item25.rowName = @"WYAAlert 弹框";
    item25.className = @"WYAUIAlertViewController";
    
    WYAHomeItemModel * item26 = [[WYAHomeItemModel alloc]init];
    item26.rowName = @"WYALoading 活动指示器";
    
    WYAHomeItemModel * item27 = [[WYAHomeItemModel alloc]init];
    item27.rowName = @"WYAProgressView 进度条";
    item27.className = @"WYAProgressViewController";
    
    WYAHomeItemModel * item28 = [[WYAHomeItemModel alloc]init];
    item28.rowName = @"UIView+WYAToast 轻提示";
    
    WYAHomeModel * model4 = [[WYAHomeModel alloc]init];
    model4.sectionName = @"操作反馈 Feedback";
    model4.rows = @[item25,item26,item27,item28];
    
    WYAHomeItemModel * item29 = [[WYAHomeItemModel alloc]init];
    item29.rowName = @"WYADownloader 下载";
    item29.className = @"WYADownloaderViewController";
    
    WYAHomeItemModel * item30 = [[WYAHomeItemModel alloc]init];
    item30.rowName = @"WYAVideoPlayer 视频播放";
    item30.className = @"WYAVideoPlayerViewController";
    
    WYAHomeItemModel * item31 = [[WYAHomeItemModel alloc]init];
    item31.rowName = @"WYAClearCache 清理缓存";
    
    WYAHomeItemModel * item32 = [[WYAHomeItemModel alloc]init];
    item32.rowName = @"WYARealm 数据库基本使用";
    
    WYAHomeModel * model5= [[WYAHomeModel alloc]init];
    model5.sectionName = @"其他 Other";
    model5.rows = @[item29,item30,item31,item32];
    
    return @[model1,model2,model3,model4,model5];
}

@end
