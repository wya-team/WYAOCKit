# WYACard
## 功能
裁剪图片

## 属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
delegate|事件代理|WYAImageCropViewControllerDelegate|-
image|初始化传入图片|UIImage 只读类型|-
cropView|裁剪视图view|WYAImageCropView 只读类型|-
toolbar|裁剪工具栏|WYAImageCropToolBar 只读类型|-
croppingStyle|裁剪框样式|WYACropViewCroppingStyle 只读类型|-
onDidFinishCancelled|完成时调用|block|-
onDidCropImageToRect|裁剪区域和角度，完成时调用|block|-
onDidCropToRect|裁剪图片、裁剪区域和角度，完成时调用|block|-
onDidCropToCircleImage|圆形裁剪器完成时回调|block|-

## 方法
```Object-C
/**
 初始化

 @param image 要裁剪的图片
 @return self
 */
- (nonnull instancetype)initWithImage:(nonnull UIImage *)image;

/**
 初始化

 @param style 裁剪器样式
 @param image 要裁剪的图片
 @return self
 */
- (nonnull instancetype)initWithCroppingStyle:(WYACropViewCroppingStyle)style image:(nonnull UIImage *)image;
```

## delegate
```Object-C
@optional
/**
 提供当前裁剪的矩形

 @param cropViewController self
 @param cropRect 矩形大小
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController didCropImageToRect:(CGRect)cropRect angle:(NSInteger)angle;


/**
 获取裁剪后的图片

 @param cropViewController self
 @param image image
 @param cropRect 裁剪的image坐标
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController didCropToImage:(nonnull UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle;


/**
 获取圆形模板裁剪的图片

 @param cropViewController self
 @param image image
 @param cropRect 裁剪的image坐标
 @param angle 角度
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController didCropToCircularImage:(nonnull UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle;


/**
 完成时调用

 @param cropViewController self
 @param cancelled YES
 */
- (void)cropViewController:(nonnull WYAImageCropViewController *)cropViewController didFinishCancelled:(BOOL)cancelled;
```

## 基础用法
- 导入头文件

```
#import <WYAKit/WYAImageCropViewController.h>
```


