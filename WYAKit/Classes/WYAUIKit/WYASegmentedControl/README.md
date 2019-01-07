#  WYASegmentedControl

## 工能

- 实现类似于系统的`UISegmentedControl`功能。可以设置每个item的边框、背景色、字体大小、也可设置图片

---

## 属性

属性 | 说明 | 类型 | 默认值
--- | --- | --- | ---
cornerRadius | 圆角值 | CGFloat | 8
selectedSegmentIndex | 选中的Index(只写) | CGFloat | 0
getSelectedIndex | 获取点击选中的index(只读) | CGFloat | -
borderColor | item和视图本身边框色 | UIColor | 蓝色（#108DE7）
itemNormalColor | 标题的普通颜色 （也是selected的item的背景色）| UIColor | 默认蓝色（#108DE7）
itemSelectColor | 标题选中的颜色（也是normal的背景色） | UIColor | 白色（#FFFFFF）
itemHighlightedColor | 高亮标题颜色 | UIColor | 默认白色（#FFFFFF）
itemsFont | items标题字号 | CGFloat | 15
delegate | item点击的代理方法 | WYASegmentedControlDelegate | -
---
## 方法

<font color="red">注意：只能使用一下提供的两个构造方法初始化该控件</font>

```objective-c
/**
 构造方法返回一个实例对象

 @param frame frame
 @param itemsTitleArray 标题数据
 @return instance
 */
+ (instancetype)wya_initWithFrame:(CGRect)frame itemsTitleArray:(NSArray <NSString *> *)itemsTitleArray;


/**
 构造方法返回一个实例对象

 @param frame frame
 @param imagesNormalArray 普通状态的images
 @param imagesSelectlArray 选中状态images
 @return instance
 */
+ (instancetype)wya_initWithFrame:(CGRect)frame imagesNormalArray:(NSArray <NSString *> *)imagesNormalArray imagesSelectlArray:(NSArray <NSString *> *)imagesSelectlArray;
```
---
##代理

```objective-c
/**
 items被点击

 @param segmentedControl 传出instance
 */
- (void)wya_segmentedControlChangeValue:(WYASegmentedControl *)segmentedControl;
```
---

## 基本用法

导入头文件

```objective-c
- (WYASegmentedControl *)segmentedControl{
    if(!_segmentedControl){
        _segmentedControl = ({
            CGRect frame = CGRectMake(10*SizeAdapter, WYATopHeight + 8*SizeAdapter + CGRectGetMaxY(self.segmentedControl1.frame), ScreenWidth-20*SizeAdapter, 49);
            WYASegmentedControl * object = [WYASegmentedControl wya_initWithFrame:frame itemsTitleArray:@[@"segment1",@"segment2",@"segment3",@"segment4"]];
            object.delegate = self;
            object.itemsFont = 10;
            object.selectedSegmentIndex = 3;
            object.borderColor = REDCOLOR;
            object.itemSelectColor = WHITECOLOR;
            object.itemNormalColor = REDCOLOR;
            object;
        });
    }
    return _segmentedControl;
}
            
            #pragma mark ======= WYASegmentedControlDelegate
- (void)wya_segmentedControlChangeValue:(WYASegmentedControl *)segmentedControl{

[UIView wya_ShowBottomToastWithMessage:[NSString stringWithFormat:@"segmentedControl1---选中第%ld个",segmentedControl.getSelectedIndex+1]];
       
}
```


