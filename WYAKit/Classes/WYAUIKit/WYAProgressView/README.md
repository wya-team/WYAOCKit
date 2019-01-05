# WYAProgressView

## 功能

进度条

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
backgroundImage|背景图片|UIImage|-
trackTintColor|背景线显色|UIColor|灰色
progressTintColor|填充线的颜色|UIColor|红色
borderWidth|线宽|CGFloat|5
progress|进度（0~1）|CGFloat|0

## 方法
```objective-c
/**
 设置进度

 @param progress 进度
 @param animation 是否动画
 */
-(void)wya_setProgress:(CGFloat)progress Animation:(BOOL)animation;
```

## 基础用法
- 导入头文件

```objective-c
#import <WYAKit/WYAProgressView.h>
```

```objective-c
WYAProgressView * progressV = [[WYAProgressView alloc] initWithFrame:rect];
progressV.borderWidth       = 2;
[self.view addSubview:progressV];
```

