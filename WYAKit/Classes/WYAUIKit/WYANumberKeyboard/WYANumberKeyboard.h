//
//  WYANumberKeyboard.h
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface WYANumberKeyboard : UIView
@property (nonatomic, strong) UIColor * bgColor;

/**
 textFileds光标位置用空格来控制，默认两个空格
 */
@property (nonatomic, assign) NSInteger  spaceNum;
/**
 必须用此方法初始化

 @param textFiled 传入一个textFiled
 @return 返回一个键盘对象 (高度为200 + 底部安全区域（0/34）的键盘)
 */
+ (instancetype)initWithTextFiled:(UITextField *)textFiled;

/**
 随机键盘必须用此方法初始化

 @param textFiled 传入一个textFiled
 @return 返回一个随机数字键盘对象 (高度为200 + 底部安全区域（0/34）的键盘)
 */
+(instancetype)initRandomKeyboardWithTextFiled:(UITextField *)textFiled;

/**
 输入框value改变的事件回调

 @param numberKeyboardChangeValue numberKeyboardChangeValue
 */
- (void)wya_numberKeyboadrDidChanged:(void(^)(NSString * value))numberKeyboardChangeValue;

/**
 确定按钮点击事件

 @param sureButtonBlock sureButtonBlock
 */
- (void)wya_numberKeyboadrSurePressed:(void (^)(void))sureButtonBlock;

@end
NS_ASSUME_NONNULL_END
