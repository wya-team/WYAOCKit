

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

@end
