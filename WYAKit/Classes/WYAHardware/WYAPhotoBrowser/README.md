# WYAPhotoBrowser

## 功能

获取相册中的照片

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
callBackBlock|返回选中的照片|block|-

## 方法

```Object-C
/**
 初始化

 @param maxCount 最大选中个数
 @return self
 */
-(instancetype)initWithMaxCount:(NSInteger)maxCount;
```

## 基础用法

- 添加关键key

```
<key>NSPhotoLibraryAddUsageDescription</key>
<string>填写关于写入本地相册的描述</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>填写关于相册的描述</string>
```
- 导入头文件

```
#import <WYAKit/WYAPhotoBrowser.h>
```



