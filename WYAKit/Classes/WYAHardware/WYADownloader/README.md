# WYADownloader
## 功能
提供下载相关的功能，暂不支持后台下载
下载相关模型请继承或使用WYADownloadModel作为下载模型

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
allowsCellularAccess|是否允许蜂窝网下载|BOOL|NO
downloadingArray|正在下载的数组（只读）|NSArray|-
downloadCompleteArray|已经下载完成的数组（只读）|NSArray|-

## 方法

```Object-C
/**
 初始化

 @return self
 */
+ (instancetype)sharedDownloader;

/**
 开始下载

 @param model 数据模型
 @param handle 回调，用来提示下载是否成功加入下载列表
 */
- (void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void(^)(NSString * result))handle;

/**
 暂停下载

 @param model 数据模型
 */
- (void)wya_suspendDownloadWithModel:(WYADownloadModel *)model;

/**
 删除下载任务

 @param model 数据模型
 */
- (void)wya_giveupDownloadWithModel:(WYADownloadModel *)model;

/**
 继续下载

 @param model 数据模型
 */
- (void)wya_keepDownloadWithModel:(WYADownloadModel *)model;
```

# WYADownloadModel

## 功能

提供下载模型

## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
urlString|下载地址|NSString|-
destinationPath|要保存文件的地址|NSString|如果该项没有设置，默认存在~/Library/Caches/WYADownload/以url后缀命名
progress|下载进度（0~1）|CGFloat|-
downloadState|下载状态|WYADownloadState|WYADownloadStateNormal
speed|下载速度，直接显示就好|NSString|-

### WYADownloadState

类型|说明
---|---
WYADownloadStateNormal|正常状态
WYADownloadStateWait|等待下载
WYADownloadStateDownloading|正在下载
WYADownloadStateSuspend|下载暂停
WYADownloadStateComplete|下载完成
WYADownloadStateFail|下载失败

## 基础用法

* 导入头文件

```
#import <WYAKit/WYADownloader.h>
#import <WYAKit/WYADownloadModel.h>
#import <WYAKit/WYADownloadTaskManager.h>
```


