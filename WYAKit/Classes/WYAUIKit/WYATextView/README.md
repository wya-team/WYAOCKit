# WYATextView (文本输入框)

## 功能

给TextView添加PalceHolder设置，添加占位文字、颜色、文字大小，添加标题字段，，高度随内容文字大小自动适应

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
title| 标题 | NSString |-
showTitle | 是否显示标题 | BOOL | YES
showWordsCount | 是否显示输入字数和最大限度 |BOOL | YES
textViewMaxHeight | textView最大高度，超过这个高度不会再自适应 | CGFloat | 750.0
textViewWordsCount | 输入框最大字数限制 | NSUInteger | 0
textView | 输入框（只读类型）| UITextView | -

## 方法
设置placeholder

```objective-c
/**
 设置textView的PlaceHolder

 @param placeHoldString 文字
 @param placeHoldColor 颜色
 @param placeHoldFont 大小
 */
-(void)wya_PlaceHoldString:(NSString *)placeHoldString PlaceHoldColor:(UIColor *)placeHoldColor PlaceHoldFont:(CGFloat)placeHoldFont;
```

## delegate
```objective-c

- (BOOL)wya_TextViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)wya_TextViewShouldEndEditing:(UITextView *)textView;

- (void)wya_TextViewDidBeginEditing:(UITextView *)textView;
- (void)wya_TextViewDidEndEditing:(UITextView *)textView;

- (BOOL)wya_TextView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)wya_TextViewDidChange:(UITextView *)textView;

- (void)wya_TextViewDidChangeSelection:(UITextView *)textView;

- (BOOL)wya_TextView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0);
- (BOOL)wya_TextView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0);
```
## 基础用法
* 导入头文件

```objective-c
#import <WYAKit/WYATextView.h>
```

```objective-c
WYATextView * textView = [[WYATextView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
[textView wya_PlaceHoldString:@"占位文字" PlaceHoldColor:[UIColor grayColor] PlaceHoldFont:15.f];
textView.textViewWordsCount = 1000;
textView.layer.borderColor = [UIColor grayColor].CGColor;
textView.layer.borderWidth = 0.5;
[self.view addSubview:textView];
```


