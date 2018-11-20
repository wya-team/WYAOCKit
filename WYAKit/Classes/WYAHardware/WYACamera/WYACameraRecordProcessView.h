
#import <UIKit/UIKit.h>
#define lineWith    5

@interface WYACameraRecordProcessView : UIView

//初始化
- (instancetype)initWithCenter:(CGPoint )center radius:(CGFloat)radius;

@property  (nonatomic, assign) CGFloat progress;
@end
