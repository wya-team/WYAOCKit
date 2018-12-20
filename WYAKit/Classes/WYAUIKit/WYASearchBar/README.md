#  WYASearchBar

## 工能

- 类似系统的searchBar，修改在ios11之后，文字未编辑情况下不居中的问题

---

## 方法

```Object-C
/**
 删除背景视图
 */
- (void)cleanOtherSubViews;
```
---

## 基本用法

导入头文件

```Object-C
self.searchBar = [[WYASearchBar alloc]initWithFrame:CGRectMake(0, WYATopHeight+20*SizeAdapter, self.view.cmam_width, 44)];
self.searchBar.placeholder = @"搜索";
self.searchBar.delegate = self;
self.searchBar.barTintColor = random(201, 201, 201, 1);
[self.view addSubview:self.searchBar];
```


