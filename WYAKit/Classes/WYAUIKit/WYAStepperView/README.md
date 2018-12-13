#  WYAStepperView
## 功能
- 步进器，实现左右按钮加减功能


## 属性

属性 | 说明 | 类型 |默认值
--- | --- | --- | ---
childFrame | 按钮的frame不能为空 | CGRect | -
ImageNamedArray | 左右两侧按钮名 | NSArray | -
stepperTextFiled | 显示数值的UI | UITextFiled | -
delegate | 按钮点击事件代理 | WYAStepperViewDelegate | -

## 代理

```Object-C
/**
 左侧按钮点击事件传递

 @param stepperView stepperView
 @param sender button
 */
- (void)wya_stepperView:(WYAStepperView *)stepperView leftButtonPressed:(UIButton *)sender;

/**
 右侧按钮点击事件传递

 @param stepperView stepperView
 @param sender button
 */
- (void)wya_stepperView:(WYAStepperView *)stepperView rightButtonPressed:(UIButton *)sender;
```
## 基本用法

```Object-C
 WYAStepperView * object = [[WYAStepperView alloc]initWithFrame:CGRectMake(10, WYATopHeight + 20 + 40, ScreenWidth*0.35, 40)];
 object.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
 object.layer.borderWidth = 0.5;        
 object.childFrame = CGRectMake(0, 0, 30, 30);
 object.ImageNamedArray = @[@"sub_disable", @"add_disable"];
 object.delegate = self;
 
 #pragma mark ======= delegate
- (void)wya_stepperView:(WYAStepperView *)stepperView leftButtonPressed:(UIButton *)sender{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    if (value > 0) {
        value -= 1 ;
        stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
    }
}
- (void)wya_stepperView:(WYAStepperView *)stepperView rightButtonPressed:(UIButton *)sender{
    NSInteger value = [stepperView.stepperTextFiled.text integerValue];
    value += 1 ;
    stepperView.stepperTextFiled.text = [NSString stringWithFormat:@"%ld",value];
}
```

