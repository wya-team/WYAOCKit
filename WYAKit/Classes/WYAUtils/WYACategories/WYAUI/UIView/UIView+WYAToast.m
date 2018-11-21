//
//  UIView+WYAToast.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "UIView+WYAToast.h"

@implementation UIView (WYAToast)

+ (void)wya_ShowBottomToastWithMessage:(NSString *)message{
    UILabel * label = [[UILabel alloc]init];
    label.font = FONT(15);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    [Window addSubview:label];
    
    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    CGFloat height = [UILabel getHeightByWidth:ScreenWidth-20*SizeAdapter-30*SizeAdapter title:message font:label.font];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.bottom.mas_equalTo(Window.mas_bottom).with.offset(-50*SizeAdapter);
        if (width<ScreenWidth-20*SizeAdapter-30*SizeAdapter) {
            make.width.mas_equalTo(width+30*SizeAdapter);
            make.height.mas_equalTo(50*SizeAdapter);
        }else{
            make.width.mas_equalTo(ScreenWidth-20*SizeAdapter-30*SizeAdapter);
            make.height.mas_equalTo(height+30*SizeAdapter);
        }
        
    }];
    
    [UIView animateWithDuration:3 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}

+ (void)wya_ShowCenterToastWithMessage:(NSString *)message{
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15*SizeAdapter];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    label.numberOfLines = 0;
    [Window addSubview:label];
    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    CGFloat height = [UILabel getHeightByWidth:ScreenWidth-20*SizeAdapter-30*SizeAdapter title:message font:label.font];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.centerY.mas_equalTo(Window.mas_centerY);
        if (width<ScreenWidth-20*SizeAdapter-30*SizeAdapter) {
            make.width.mas_equalTo(width+30*SizeAdapter);
            make.height.mas_equalTo(50*SizeAdapter);
        }else{
            make.width.mas_equalTo(ScreenWidth-20*SizeAdapter-30*SizeAdapter);
            make.height.mas_equalTo(height+30*SizeAdapter);
        }
    }];
    
    [UIView animateWithDuration:3 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}

+(void)wya_SuccessToastWithMessage:(NSString *)message{
    
}

+(void)wya_FailToastWithMessage:(NSString *)message{
    
}

+(void)wya_WarningToastWithMessage:(NSString *)message{
    
}

+(void)wya_ToastWithMessage:(NSString *)message Image:(UIImage *)image{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    view.layer.cornerRadius = 5*SizeAdapter;
    view.layer.masksToBounds = YES;
    [Window addSubview:view];
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:image];
    [view addSubview:imageView];
    
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15*SizeAdapter];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    label.numberOfLines = 0;
    [Window addSubview:label];
}
@end
