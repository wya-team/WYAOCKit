
#import <Foundation/Foundation.h>

@interface WYAAlertAction : NSObject
/// 标题
@property (nonatomic, copy) NSString * title;
/// 标题颜色
@property (nonatomic, strong) UIColor * textColor;
/// 标题字体
@property (nonatomic, strong) UIFont * textFont;
/// 回调事件
@property (nonatomic, copy) void (^handler)(void);

+ (instancetype)wya_actionWithTitle:(NSString *)title
                            handler:(void (^)(void))handler;

+ (instancetype)wya_actionWithTitle:(NSString *)title
                          textColor:(UIColor *)textColor
                            handler:(void (^)(void))handler;

+ (instancetype)wya_actionWithTitle:(NSString *)title
                          textColor:(UIColor *)textColor
                           textFont:(UIFont *)textFont
                            handler:(void (^)(void))handler;

@end
