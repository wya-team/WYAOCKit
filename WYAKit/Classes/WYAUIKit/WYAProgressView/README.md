# WYAProgressView

## 功能

进度条

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
backGroundImage|背景图片|UIImage|-
trackTintColor|背景线显色|UIColor|灰色
progressTintColor|填充线的颜色|UIColor|红色
borderWidth|线宽|CGFloat|5
progress|进度（0~1）|CGFloat|0

## 方法
```Object-C
/**
 设置进度

 @param progress 进度
 @param animation 是否动画
 */
-(void)wya_setProgress:(CGFloat)progress Animation:(BOOL)animation;
```

## 基础用法
- 导入头文件

```
#import <WYAKit/WYAProgressView.h>
```


