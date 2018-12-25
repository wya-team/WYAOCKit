

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
@property (nonatomic, copy) void(^takePhoto)(UIImage * photo);

/**
 获取拍摄视频
 */
@property (nonatomic, copy) void(^takeVideo)(NSString * videoPath);

/**
 设置录制时间
 */
@property (nonatomic, assign) CGFloat  time;

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

@end
