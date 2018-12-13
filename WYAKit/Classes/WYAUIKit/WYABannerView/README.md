# WYABannerView

轮播图

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
images|图片数组| NSArray<UIImage *>|-
placeholdImage|占位图片（加载图片时用于占位的图片）|-
imageContentModel|图片展示模式|UIViewContentMode|UIViewContentModeScaleToFill
touchImageHandle|点击图片回调|block|-

## 方法

```Object-C
/**
 初始化使用这种方式，指定加载资源类型，同时数据源要给准确的类型，本地类型请传入要加载本地图片的名字，网络类型请传入url

 @param frame frame
 @param sourceStyle 资源类型
 @param time 时间间隔（默认2s）
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame BannerSourceStyle:(WYABannerSourceStyle)sourceStyle TimeInterval:(CGFloat)time;
```

## 基础用法

导入头文件

```
#import <WYAKit/WYABannerView.h>
```

```object-C
NSArray * array = @[@"0",@"1",@"2"];
    
WYABannerView * view = [[WYABannerView alloc]initWithFrame:self.view.frame];
view.images = [@[@"0",@"1",@"2",] mutableCopy];
[self.view addSubview:view];
```


