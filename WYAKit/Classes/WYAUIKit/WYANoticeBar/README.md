# WYANoticeBar

## 功能

通知栏

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
showNoticeButton|是否显示左侧按钮（显示的是图片或者文字）|BOOL|NO
showRightButton|是否显示右侧按钮（显示的是图片或者文字）|BOOL|NO
showText|显示的文字|NSString|-
showTextColor|显示的文字颜色|UIColor|blackColor
showTextFont|显示的文字大小|CGFloat|15
noticeButtonImage|左侧要显示的图片|UIImage|-
rightButtonImage|右侧要显示的图片|UIImage|-
noticeBackgroundColor|背景颜色|UIColor|-

## 方法

```Object-C
/**
 开始动画
 */
- (void)wya_start;

/**
 结束动画
 */
- (void)wya_stop;
```

## 基础用法

* 导入头文件

```
#import <WYAKit/WYANoticeBar.h>
```
```object-C
WYANoticeBar * bar = [[WYANoticeBar alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
bar.showNoticeButton = YES;
bar.noticeButtonImage = [UIImage imageNamed:@"喇叭"];
bar.showRightButton = YES;
bar.rightButtonImage = [UIImage imageNamed:@"喇叭"];
bar.showText = @"今天天气不错，阳光明媚，好像出去装转,哈哈哈哈哈哈哈哈哈哈";
[self.view addSubview:bar];
```


