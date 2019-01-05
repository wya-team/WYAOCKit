# WYAOptionMenu

适用于列表间的联动，例如天猫的物品种类效果

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
titleArray|存放第一列数据|NSMutableArray <WYAOptionMenuModel *>|-
contentArray|存放第一列对应数据|NSMutableArray <WYAOptionMenuSecondLevelModel *>|-
leftTableProportion|取值范围0~1，适用于左侧table，右侧table自适应|CGFloat|0.3

## 方法


## delegate

```objective-c
/**
 左侧tablecell点击事件

 @param indexPath indexPath
 */
-(void)wya_leftTableDidSelectedRow:(NSIndexPath *)indexPath;
```

## 基础用法

- 导入头文件

```objective-c
#import <WYAKit/WYAOptionMenu.h>
#import <WYAKit/WYAOptionMenuModel.h>
```
- 数据需要自己拼接数组元素必须是WYAOptionMenuModel和WYAOptionMenuSecondLevelModel的二维数组

```objective-c
WYAOptionMenu * object     = [[WYAOptionMenu alloc] initWithFrame:CGRectZero optionMenuStyle:WYAOptionMenuStyleTable];
object.titleArray          = [self.titles mutableCopy];
object.wya_delegate        = self;
object.leftTableProportion = 0.5;
```

