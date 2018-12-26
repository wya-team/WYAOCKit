
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WYAAlertActionStyle) {
    WYAAlertActionStyleDefault, //蓝色 (0, 122, 1)
    WYAAlertActionStyleCancel, //黑色 （0，0，0）
    WYAAlertActionStyleDestructive //红色 (244, 51, 60)
};

@interface WYAAlertAction : NSObject

@property (nonatomic, copy)NSString *title; // 标题
@property (nonatomic, copy)void (^handler) (void);//回调事件
@property (nonatomic, assign)WYAAlertActionStyle style; //风格

/**
 *    创建一个 action
 *
 *    @param title   标题
 *    @param style   风格
 *    @param handler 回调
 *
 */
+ (instancetype)wya_ActionWithTitle:(NSString *)title style:(WYAAlertActionStyle)style handler:(void(^)(void))handler;

@end
