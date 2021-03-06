# WYACamera
## 功能
- 相机拍摄照片、拍摄视频。<font color="red">注意：要使用`WYACameraViewController`</font>
- 二维码扫描，和本地相册二维码扫描。<font color="red">注意：要使用`WYAQRCodeViewController`</font>

---

## 属性
- WYACameraViewController

属性 | 说明 | 类型 | 默认值
---|---|---|---
takePhoto|获取拍摄的照片|block|-
takeVideo|获取拍摄的视频路径|block|-
time|录制视频时间|CGFloat|不能小于0

- WYACameraType

类型 | 说明
---|---
WYACameraTypeAll|拍照和录制（默认）
WYACameraTypeImage|拍照
WYACameraTypeVideo|录制

- WYAQRCodeViewController

属性 | 说明 | 类型 | 默认值
---|---|---|---
scanReault|返回扫描结果|block|-

---

## 方法
```objective-c
/**
初始化

@param type 相机类型
@return self
*/
- (instancetype)initWithType:(WYACameraType)type;

/**
清除缓存
*/
- (void)clearCache;
```
---

## 基础用法
- 添加关键key

```objective-c
<key>NSCameraUsageDescription</key>
<string>填写关于相机的描述</string>
<key>NSMicrophoneUsageDescription</key>
<string>填写关于麦克风的描述</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>填写关于写入本地相册的描述</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>填写关于相册的描述</string>
```

- 导入头文件

```objective-c
#import <WYAKit/WYACameraViewController.h>
#import <WYAKit/WYAQRCodeViewController.h>
```
```objective-c
WYACameraViewController * cameraVC = [[WYACameraViewController alloc] initWithType:self.type];
cameraVC.takePhoto                 = ^(UIImage * photo) {

};
cameraVC.takeVideo = ^(NSString * videoPath) {

};
[weakSelf presentViewController:cameraVC animated:YES completion:nil];
```
