# WYADatePicker
## 功能
时间选择器
## 属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
datePickerStyle|时间选择器种类|WYADatePickerStyle|WYADatePickerStyleDateHourMinuteSecond
pickerHeight|设置pickerView高度|CGFloat|建议不大于220|
pickerItemHeight|设置pickerView的Item高度|CGFloat|44.0

###WYADatePickerStyle
样式|说明
---|---
WYADatePickerStyleDateHourMinuteSecond|年月日时分秒
WYADatePickerStyleYear|年
WYADatePickerStyleMouth|月
WYADatePickerStyleHour|时
WYADatePickerStyleMinute|分
WYADatePickerStyleSecond,|秒
WYADatePickerStyleYearAndMonth|年月
WYADatePickerStyleDate|年月日
WYADatePickerStyleDateHour|年月日时
WYADatePickerStyleDateHourMinute|年月日时分
WYADatePickerStyleMonthDay|月日 (只有选择当前年份)
WYADatePickerStyleMonthDayHour|月日时 (只有选择当前年份)
WYADatePickerStyleMonthDayHourMinute|月日时分 (只有选择当前年份)
WYADatePickerStyleMonthDayHourMinuteSecond|月日时分秒 (只有选择当前年份)
WYADatePickerStyleTime|时分
WYADatePickerStyleTimeAndSecond|时分秒
WYADatePickerStyleMinuteAndSecond|分秒

## 方法
```Object-C
/**
 获取pickerView高度

 @return 高度
 */
-(CGFloat)wya_GetPickerViewHeight;
```

##基本用法
* 导入头文件

```
#import <WYAKit/WYAPickerView.h>
```

```object-C
WYADatePicker * datePicker = [[WYADatePicker alloc]init];
datePicker.datePickerStyle = WYADatePickerStyleDateHourMinuteSecond;
datePicker.frame = CGRectMake(0, 0, self.view.frame.size.width, [datePicker getPickerViewHeight]);
WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:datePicker AlertStyle:WYAAlertStyleCustomSheet];
[self presentViewController:alert animated:YES completion:nil];
datePicker.viewController = alert;
```

