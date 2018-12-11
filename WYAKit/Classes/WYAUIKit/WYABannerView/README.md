# WYABannerView

图片浏览器

##属性
属性 | 说明 | 类型 | 默认值
---|---|---|---
images|图片数组| NSArray<UIImage *>|-

## 基础用法

导入头文件
```
#import <WYAKit/WYABannerView.h>
```

```object-C
NSArray * array = @[@"0",@"1",@"2"];
    
WYABannerView * view = [[WYABannerView alloc]initWithFrame:self.view.frame];
NSMutableArray * images = [[NSMutableArray alloc]init];
for (NSInteger index = 0; index<array.count; index++) {
    UIImage * image = [UIImage imageNamed:array[index]];
    [images addObject:image];
}
view.images = [images copy];
[self.view addSubview:view];
```

