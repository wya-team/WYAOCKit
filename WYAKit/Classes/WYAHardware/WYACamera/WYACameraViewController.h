

#import <UIKit/UIKit.h>

@interface WYACameraViewController : UIViewController

/**
 获取拍摄照片
 */
@property (nonatomic, copy) void(^TakePhoto)(UIImage * photo);

/**
 获取拍摄视频
 */
@property (nonatomic, copy) void(^TakeVideo)(NSString * videoPath);

/**
 设置录制时间
 */
@property (nonatomic, assign) CGFloat  time;

@end
