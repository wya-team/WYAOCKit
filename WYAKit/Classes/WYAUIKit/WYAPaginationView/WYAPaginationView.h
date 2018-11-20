//
//  WYAPaginationView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYAPaginationViewDelegate <NSObject>

@optional

- (void)wya_LeftAction;

- (void)wya_RightAction;

@end

@interface WYAPaginationView : UIView

@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, weak) id<WYAPaginationViewDelegate> wya_Delegate;

/**
 设置左边按钮文字，颜色，字体大小

 @param title 文字
 @param titleColor 文字颜色
 @param titleFont 文字大小
 */
-(void)wya_SetLeftButtonWithTitle:(NSString *)title
                       TitleColor:(UIColor *)titleColor
                        TitleFont:(CGFloat)titleFont;

/**
 设置右边按钮文字，颜色，字体大小

 @param title 文字
 @param titleColor 文字颜色
 @param titleFont 文字大小
 */
-(void)wya_SetRightButtonWithTitle:(NSString *)title
                        TitleColor:(UIColor *)titleColor
                         TitleFont:(CGFloat)titleFont;

/**
 设置标题文字、颜色、字体大小

 @param text 文字
 @param textColor 文字颜色
 @param textFont 文字大小
 */
-(void)wya_SetTitleLabelWithText:(NSString *)text
                       TextColor:(UIColor *)textColor
                        TextFont:(CGFloat)textFont;
@end

NS_ASSUME_NONNULL_END
