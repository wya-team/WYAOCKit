# WYACamera
## 功能
- 相机拍摄照片、拍摄视频。<font color="red">注意：要使用`WYACameraViewController`</font>
- 二维码扫描，和本地相册二维码扫描。<font color="red">注意：要使用`WYAQRCodeViewController`</font>

## 属性
- WYACameraViewController

属性 | 说明 | 类型 | 默认值
---|---|---|---
TakePhoto|获取拍摄的照片|block|-
TakeVideo|获取拍摄的视频路径|block|-

- WYAQRCodeViewController

属性 | 说明 | 类型 | 默认值
---|---|---|---
ScanReault|返回扫描结果|block|-

## 基础用法
- 添加关键key

```
<key>NSCameraUsageDescription</key>
<string>填写关于相机的描述</string>
<key>NSMicrophoneUsageDescription</key>
<string>填写关于麦克风的描述</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>填写关于写入本地相册的描述</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>填写关于相册的描述</string>
```
```objc
/**
初始化

@param type 相机类型
@return self
*/
- (instancetype)initWithType:(WYACameraType)type;
```
- 导入头文件

```
#import <WYAKit/WYACameraViewController.h>
#import <WYAKit/WYAQRCodeViewController.h>
```

