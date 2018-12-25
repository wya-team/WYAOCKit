#  WYACustomPopoverBackgroundView

## 功能
 
 - 继承与UIPopoverBackgroundView做的可以修改弹出箭头颜色，的扩展，去除阴影，可以修改弹出视图圆角大小。

- 配置类`WYAArrowBackgroundColorConfig`可通过方法设置颜色

---

## 属性

- 暂无

---

## 方法

```Object-C
/**
 十六进制字符串方式修改颜色
 
 @param colorString 颜色默认为白色
 */
+ (void)wya_arrowBackgroundColorString:(NSString *)colorString;

/**
 UIColor方式修改箭头颜色

 @param arrowColor 箭头颜色 默认白色
 */
+ (void)wya_arrowBackgroundColor:(UIColor *)arrowColor;
```
---

## 基本用法

跟使用系统的UIPopoverPresentationController没有区别
需要注意几点：
1.你需要设置UIPopoverPresentationController的popoverBackgroundViewClass。

```Object-C
popover.popoverBackgroundViewClass = [WYACustomPopoverBackgroundView class];
```

2. 如果需要修改箭头颜色，需要在设置popoverBackgroundViewClass之前设置颜色，代码如下：

```Object-C

[WYAArrowBackgroundColorConfig wya_arrowBackgroundColorString:@"#333333"];

[WYAArrowBackgroundColorConfig wya_arrowBackgroundColor:[UIColor greenColor]];
```

3. 设置视图圆角，需要外部手动设置，关闭圆角设置也需要外部关闭。两种方法：

方法一在退出控制器时写入代码：

```Object-C
[self presentViewController:test animated:YES completion:^{
  // 设置关闭圆角
  test.view.superview.clipsToBounds = NO;
    test.view.layer.cornerRadius = 0.f;// 也可设置圆角
    test.view.layer.masksToBounds = YES;
    }];
    
```

方法二，在目标控制器中写入代码：

```
- (void)viewWillAppear:(BOOL)animated
{
    self.view.superview.clipsToBounds = NO;
    self.view.layer.cornerRadius = 3.f;
    self.view.layer.masksToBounds = YES;
}
```

代码如下：

```Object-C
 WYATestViewController * test = [[WYATestViewController alloc]init];
    test.preferredContentSize = CGSizeMake(120*SizeAdapter, 132*SizeAdapter);
    test.modalPresentationStyle = UIModalPresentationPopover;
    __block WYATestViewController * vc = test;
    test.popCallback = ^(NSIndexPath * _Nonnull indexPath) {
        [vc dismissViewControllerAnimated:YES completion:nil];
        if (indexPath.row == 0) {
            WYAQRCodeViewController * qr = [[WYAQRCodeViewController alloc]init];
            [self presentViewController:qr animated:YES completion:nil];
        }else if (indexPath.row == 1) {
            WYAIMGCodeViewController * imgCode = [[WYAIMGCodeViewController alloc]init];
            [self.navigationController pushViewController:imgCode animated:YES];
        }

    };
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate = self;
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;//设置箭头位置
    popover.sourceView = sender;//设置目标视图
    popover.sourceRect = sender.bounds;//弹出视图显示位置
    popover.backgroundColor = [UIColor whiteColor];//设置弹窗背景颜色
//    [WYAArrowBackgroundColorConfig wya_arrowBackgroundColorString:@"#333333"];
//    [WYAArrowBackgroundColorConfig wya_arrowBackgroundColor:[UIColor greenColor]];
    popover.popoverBackgroundViewClass = [WYACustomPopoverBackgroundView class];
    
    [self presentViewController:test animated:YES completion:^{
  
    }];
```


