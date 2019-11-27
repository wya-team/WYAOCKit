
#import <UIKit/UIKit.h>

@interface UIImage (FixSource)

/**
 修正图片方向

 @param orient 设置方向
 @return image
 */
- (UIImage *)rotate:(UIImageOrientation)orient;

@end
