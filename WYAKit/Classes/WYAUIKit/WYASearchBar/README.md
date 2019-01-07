#  WYACustomSearchBar

## 工能

-  继承与UISearchBar,用法和系统一样，添加了一些自定义的属性和方法用来实现非编辑状态居中显示图标，在编辑状态居左显示。

- <font color="red">注意：这里设置占位文字只能使用：`placeholderString`这个属性</font>

---

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
customBgColor | 背景色默认白色 | UIColor | 白色
roundRate | 切圆角的系数 | CGFloat | 8
placeholderString | 占位文字,用来代替系统的placeholder | NSString | -
placeholderColor | 占位文字颜色 | UIColor | 系统灰色
placeholderFont | 占位文字字体大小 | CGFloat | 12 
---

## 方法

```objective-c
/**
 点击搜索状态
 */
- (void)wya_searchButtonClickedState;

/**
 取消按钮点击
 */
- (void)wya_cancleButtonClickedState;

/**
 编辑状态
 */
- (void)wya_shouldBeginEditingState;

/**
 点击屏幕任意地方
 */
- (void)wya_touchesBeganState;

```
---

## 基本用法

导入头文件

```objective-c
#import "WYACustomSearchController.h"
@interface WYACustomSearchController ()<UISearchBarDelegate>

@property (nonatomic, strong) WYACustomSearchBar * customSearchBar;

@end

@implementation WYACustomSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.customSearchBar];
}

#pragma mark ======= getter

- (WYACustomSearchBar *)customSearchBar{
    if(!_customSearchBar){
        _customSearchBar = ({
            WYACustomSearchBar * object = [[WYACustomSearchBar alloc]initWithFrame:CGRectMake(10, WYATopHeight, ScreenWidth - 20, 44)];
            object.delegate = self;
            object.placeholderString = @"搜索";
            object.tintColor = BLACKTEXTCOLOR;
            object;
       });
    }
    return _customSearchBar;
}

#pragma mark ======= UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.customSearchBar setShowsCancelButton:YES animated:YES];
    [self.customSearchBar wya_shouldBeginEditingState];// 自定义方法将图标位置改变移动到左侧
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.customSearchBar resignFirstResponder];
    [self.customSearchBar wya_searchButtonClickedState];// 自定义方法将图标根据是否有内容移动到合适位置（没有内容移动到居中，否则在最左侧）
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{

    [self.customSearchBar resignFirstResponder];
    [self.customSearchBar wya_searchButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
          
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.customSearchBar setShowsCancelButton:NO animated:YES];
    [self.customSearchBar resignFirstResponder];
    [self.customSearchBar wya_cancleButtonClickedState];// 自定义方法将图标根据内容移动到合适位置（没有内容移动到居中，否则在最左侧）
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.customSearchBar wya_touchesBeganState];
    [self.customSearchBar resignFirstResponder];
}
@end

```

