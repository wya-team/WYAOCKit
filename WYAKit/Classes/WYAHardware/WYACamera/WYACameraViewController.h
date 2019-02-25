

#import "WYACameraTool.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WYACameraType) {
    WYACameraTypeAll,
    WYACameraTypeImage,
    WYACameraTypeVideo,
};

@interface WYACameraViewController : UIViewController

/**
 获取拍摄照片
 */
@property (nonatomic, copy) void (^takePhoto)(UIImage * photo, NSString * imagePath);

/**
 获取拍摄视频
 */
@property (nonatomic, copy) void (^takeVideo)(NSString * videoPath);

/**
 设置录制时间
 */
@property (nonatomic, assign) CGFloat time;

/**
 录制视频质量
 */
@property (nonatomic, assign) WYAVideoPreset preset;

/**
 是否保存图片或视频至相册
 */
@property (nonatomic, assign) BOOL saveAblum;

/**
 相册名
 */
@property (nonatomic, copy) NSString * albumName;
/**
 初始化

 @param type 相机类型
 @return self
 */
- (instancetype)initWithType:(WYACameraType)type cameraOrientation:(WYACameraOrientation)cameraOrientation;

/**
 清除缓存
 */
- (void)clearCache;

@end
