# WYASlider

## 功能

滑动条

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
sliderStyle|滑动条样式|WYASliderStyle|WYASliderStyleSingle
minTintColor|设置min进度条颜色|UIColor|redColor
maxTintColor|设置max进度条颜色(当在WYASliderStyleSingle模式下该样式无效)|UIColor|blueColor
mainTintColor|设置总进度条颜色|UIColor|grayColor
showNoteLabel|是否隐藏提示文字或图片|BOOL|YES
minText|设置最小值（当showNoteLabel==NO时无效）|NSString|-
maxText|设置最大值（当showNoteLabel==NO时无效）|NSString|-
minImage|设置最小值图片（当showNoteLabel==NO时无效）|UIImage|-
maxImage|设置最大值图片（当showNoteLabel==NO时无效）|UIImage|-
currentMinValue|当前最小值(当在WYASliderStyleSingle模式下该样式无效)|CGFloat|-
currentMaxValue|当前最大值(当在WYASliderStyleSingle模式下显示当前移动的值0~1)|CGFloat|-

### WYASliderStyle

样式|说明
---|---
WYASliderStyleSingle|单向
WYASliderStyleDouble|双向

## 基本用法

* 导入头文件
```
#import <WYAKit/WYASlider.h>
```

```object-C
WYASlider * slider = [[WYASlider alloc]initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 30)];
slider.showNoteLabel = NO;
[self.view addSubview:slider];
```


