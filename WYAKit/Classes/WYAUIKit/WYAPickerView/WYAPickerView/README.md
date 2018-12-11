# WYAPickerView

## 功能
选择器，分为单列选择，双列选择，三列选择

## 属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
pickerViewColumnStyle|pickerView列样式|WYAPickerViewColumnStyle|WYAPickerViewColumnStyleSingle
pickerItemColor|设置pickerView整体字体颜色|UIColor|blackColor
pickerItemFont|设置pickerView整体字体大小|UIFont|15
pickerHeight|设置pickerView高度|CGFloat|建议不大于220|
pickerItemHeight|设置pickerView的Item高度|CGFloat|44.0
titleKeyWords|标题关键字(需要先指定)|NSString|-
arrayKeyWords|array关键字(需要先指定)|NSString|-
dataArray|数据源|NSMutableArray|-

### WYAPickerViewColumnStyle
样式|说明
---|---
WYAPickerViewColumnStyleSingle|单列
WYAPickerViewColumnStyleDouble|双列
WYAPickerViewColumnStyleThree|三列

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
WYAPickerView * pickerView = [[WYAPickerView alloc]init];
pickerView.delegate = self;
pickerView.titleKeyWords = @"title";
pickerView.arrayKeyWords = @"array";
pickerView.frame = CGRectMake(0, 0, self.view.frame.size.width, [pickerView wya_GetPickerViewHeight]);
WYAAlertController * alert = [WYAAlertController wya_AlertWithCustomView:pickerView AlertStyle:WYAAlertStyleCustomSheet];
[self presentViewController:alert animated:YES completion:nil];
pickerView.viewController = alert;
```

