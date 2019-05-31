//
//  WYAImageBrowserAlertView.h
//  WYAKit
//
//  Created by 李世航 on 2019/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAAlertButton;
@interface WYAImageBrowserAlertView : UIView

- (void)addAlertButton:(WYAAlertButton *)button;
- (void)show;
- (void)hidden;
@end

@interface WYAAlertButton : UIButton
@property (nonatomic, weak) WYAImageBrowserAlertView * alertView;
- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage clickBlock:(void(^)(WYAAlertButton *))block;
@end

NS_ASSUME_NONNULL_END
