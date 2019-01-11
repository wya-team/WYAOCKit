# WYADownloader
## 功能
提供下载相关的功能
下载相关模型请继承或使用<font color="red">`WYADownloadModel`</font>作为下载模型

---
## 属性

属性 | 说明 | 类型 | 默认值
---|---|---|---
allowsCellularAccess|是否允许蜂窝网下载|BOOL|NO
downloadingArray|正在下载的数组（只读）|NSArray|-
downloadCompleteArray|已经下载完成的数组（只读）|NSArray|-

## 方法

```objective-c
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
- (void)wya_DownloadTaskWithModel:(WYADownloadModel *)model ResultHandle:(void (^)(WYADownloadModel * resultModel, NSString * result))handle;

/**
 暂停下载

 @param model 数据模型
 */
- (void)wya_suspendDownloadWithModel:(WYADownloadModel *)model;

/**
 放弃下载任务（调用此方法resumeData将会不存在）

 @param model 数据模型
 */
- (void)wya_giveupDownloadWithModel:(WYADownloadModel *)model;

/**
放弃下载任务

@param models 数组
*/
- (void)wya_giveupDownloadWithSomeModel:(NSMutableArray <WYADownloadModel *>*)models;

/**
 继续下载

 @param model 数据模型
 */
- (void)wya_keepDownloadWithModel:(WYADownloadModel *)model;

/**
 移除下载完成的任务

 @param model 数据模型
 */
- (void)wya_removeDownloadWithModel:(WYADownloadModel *)model;

/**
移除下载完成的任务

@param models 数组
*/
- (void)wya_removeDownloadWithSomeModel:(NSMutableArray <WYADownloader *> *)models;

/**
 设置请求头
 
 @param value value
 @param field key
 */
- (void)wya_SetValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field;
```

---

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

```objective-c
#import <WYAKit/WYADownloader.h>
#import <WYAKit/WYADownloadModel.h>
```

* 如果需要程序启动恢复下载请在AppDelegate中的didFinishLaunchingWithOptions调用

```objective-c
[WYADownloader sharedDownloader];
```

* 开始下载

```objective-c
WYADownloadModel * model = [[WYADownloadModel alloc] init];
model.urlString          = @"https://video.pc6.com/v/1810/pyqxxjc3.mp4";
[object addObject:model2];
[self.downloader wya_DownloadTaskWithModel:model ResultHandle:^(WYADownloadModel * resultModel, NSString * _Nonnull result) {
    [UIView wya_showBottomToastWithMessage:result];
}];
```

