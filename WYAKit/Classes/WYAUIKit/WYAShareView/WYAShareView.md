# WYAShareView

## 功能
- 实现分享的UI底部弹出视图功能，分两组功能，分享和其他，<font color="red">每个按钮的图片名字要和按钮标题名一致</font>，遵守代理，点击事件由代理传出。视图大小固定，无法调整，每个按钮大小也是固定的无法调整

## 属性

属性 | 说明 | 类型 | 默认值 
--- | --- | --- | ----
dataArray | 存放元素为Array，分两组，第一个元素为分享的图片 第二组为其他功能图片（<font color="red">每个按钮的图片名字要和按钮标题名一致</font>）| NSArray | -
delegate | item点击事件 |WYAShareViewDelegate | -

## 方法

```Object-C
/**
 展示分享视图

 @param controller 需要展示的控制器
 */
- (void)wya_showShareViewWithController:(UIViewController *)controller;
```
## 代理

```Object-C
/**
 item点击事件

 @param shareView shareView
 @param indexPath indexPath
 */
- (void)wya_shareView:(WYAShareView *)shareView didSelectItemAtIndexPath:(NSIndexPath *)indexPath itemTitle:(NSString *)title;
```
## 基础用法

```Object-C
WYAShareView * view = [[WYAShareView alloc]init];
view.dataArray = @[@[@"微博",@"微信好友",@"微信朋友圈",@"QQ",@"QQ控件"], @[@"字号",@"刷新",@"复制链接",@"投诉"]];
view.delegate = self;

#pragma mark ======= WYAShareViewDelegate
- (void)wya_shareView:(WYAShareView *)shareView didSelectItemAtIndexPath:(NSIndexPath *)indexPath itemTitle:(NSString *)title{
// 点击事件可以根据title判断是哪个按钮点击了
}
```

