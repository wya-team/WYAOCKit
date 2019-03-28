//
//  UITextView+WYAPlaceHolder.h


#import <UIKit/UIKit.h>

@interface UITextView (WYAPlaceHolder)
/** 
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString * wya_placeHolder;
/** 
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString * placeholder;
/** 
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor * wya_placeHolderColor;

@end
