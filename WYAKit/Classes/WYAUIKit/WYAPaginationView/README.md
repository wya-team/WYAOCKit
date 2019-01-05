# WYAPaginationView

## 功能

datePicker工具栏

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
wya_Delegate|事件代理|WYAPaginationViewDelegate|-
leftButton|左按钮|UIButton|-
rightButton|右按钮|UIButton|-
titleLabel|显示标题|UILabel|-

## 方法
```objective-c
/**
 设置左边按钮文字，颜色，字体大小

 @param title 文字
 @param titleColor 文字颜色
 @param titleFont 文字大小
 */
-(void)wya_SetLeftButtonWithTitle:(NSString *)title
                       TitleColor:(UIColor *)titleColor
                        TitleFont:(CGFloat)titleFont;

/**
 设置右边按钮文字，颜色，字体大小

 @param title 文字
 @param titleColor 文字颜色
 @param titleFont 文字大小
 */
-(void)wya_SetRightButtonWithTitle:(NSString *)title
                        TitleColor:(UIColor *)titleColor
                         TitleFont:(CGFloat)titleFont;

/**
 设置标题文字、颜色、字体大小

 @param text 文字
 @param textColor 文字颜色
 @param textFont 文字大小
 */
-(void)wya_SetTitleLabelWithText:(NSString *)text
                       TextColor:(UIColor *)textColor
                        TextFont:(CGFloat)textFont;
```

## delegate
```objective-c
@optional
/**
 左按钮点击事件
 */
- (void)wya_LeftAction;

/**
 右按钮点击事件
 */
- (void)wya_RightAction;
```

## 基础用法
- 导入头文件

```objective-c
#import <WYAKit/WYAPaginationView.h>
```

```objective-c
WYAPaginationView * object           = [[WYAPaginationView alloc] init];
object.wya_Delegate                  = self;
object.leftButton.layer.borderColor  = [UIColor clearColor].CGColor;
object.rightButton.layer.borderColor = [UIColor clearColor].CGColor;
[object.leftButton setTitle:@"减" forState:UIControlStateNormal];
object.leftButton.enabled = NO;
[object.rightButton setTitle:@"加" forState:UIControlStateNormal];
```

