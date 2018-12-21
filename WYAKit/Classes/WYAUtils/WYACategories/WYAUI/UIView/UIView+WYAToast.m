//
//  UIView+WYAToast.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "UIView+WYAToast.h"
#import <SVGKit/SVGKit.h>
#import <YYImage/YYImage.h>
@implementation UIView (WYAToast)

+ (void)wya_ShowBottomToastWithMessage:(NSString *)message{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = Window.bounds;
    [button addCallBackAction:^(UIButton *button) {
        [button removeFromSuperview];
    }];
    [Window addSubview:button];
    
    UILabel * label = [[UILabel alloc]init];
    label.font = FONT(15);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    [button addSubview:label];

    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    if (width>ScreenWidth/2) {
        width = ScreenWidth/2;
    }
    CGFloat height = [UILabel getHeightByWidth:width+10*SizeAdapter title:message font:label.font];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.bottom.mas_equalTo(Window.mas_bottom).with.offset(-50*SizeAdapter);
        make.width.mas_equalTo(width+10*SizeAdapter);
        if (width<ScreenWidth/2) {
            make.height.mas_equalTo(20*SizeAdapter);
        }else{
            make.height.mas_equalTo(height+20*SizeAdapter);
        }
        
    }];
    
    [UIView animateWithDuration:3 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [button removeFromSuperview];
    }];
}

+ (void)wya_ShowCenterToastWithMessage:(NSString *)message{

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = Window.bounds;
    [button addCallBackAction:^(UIButton *button) {
        [button removeFromSuperview];
    }];
    [Window addSubview:button];
    
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15*SizeAdapter];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    label.numberOfLines = 0;
    [button addSubview:label];
    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    if (width>ScreenWidth/2) {
        width = ScreenWidth/2;
    }
    CGFloat height = [UILabel getHeightByWidth:width+10*SizeAdapter title:message font:label.font];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.centerY.mas_equalTo(Window.mas_centerY);
        make.width.mas_equalTo(width+10*SizeAdapter);
        if (width<ScreenWidth/2) {
            make.height.mas_equalTo(20*SizeAdapter);
        }else{
            make.height.mas_equalTo(height+20*SizeAdapter);
        }
    }];
    
    [UIView animateWithDuration:3 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}

+ (void)wya_SuccessToastWithMessage:(NSString *)message{
    [UIView wya_ToastWithMessage:message ImageString:@"" imageType:WYAToastImageTypePNG SourceInWYAKitBundle:YES AutoDismiss:YES];
}

+ (void)wya_FailToastWithMessage:(NSString *)message{
    [UIView wya_ToastWithMessage:message ImageString:@"" imageType:WYAToastImageTypePNG SourceInWYAKitBundle:YES AutoDismiss:YES];
}

+ (void)wya_WarningToastWithMessage:(NSString *)message{
    [UIView wya_ToastWithMessage:message ImageString:@"" imageType:WYAToastImageTypePNG SourceInWYAKitBundle:YES AutoDismiss:YES];
}

+ (void)wya_ToastWithMessage:(NSString *)message
                 ImageString:(NSString *)imageString
                   imageType:(WYAToastImageType)imageType
        SourceInWYAKitBundle:(BOOL)isSource
                 AutoDismiss:(BOOL)autoDismiss
{
    UIButton * button;
    if (autoDismiss) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = Window.bounds;
        [button addCallBackAction:^(UIButton *button) {
            [button removeFromSuperview];
        }];
        [Window addSubview:button];
    }
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    view.layer.cornerRadius = 5*SizeAdapter;
    view.layer.masksToBounds = YES;
    view.tag = 1080;
    if (button) {
        [button addSubview:view];
    }else{
        [Window addSubview:view];
    }
    
    
    
    UIView * iview;
    switch (imageType) {
        case WYAToastImageTypePNG:
        {
            UIImage * image;
            if (isSource) {
                image = [UIImage loadBundleImage:imageString ClassName:@"WYAAlertController"];
                
            }else{
                image = [UIImage imageNamed:imageString];
            }
            iview = [[UIImageView alloc]initWithImage:image];
            
        }
            break;
        case WYAToastImageTypeJPEG:
        {
            UIImage * image;
            if (isSource) {
                image = [UIImage loadBundleImage:imageString ClassName:@"WYAAlertController"];
                
            }else{
                image = [UIImage imageNamed:imageString];
            }
            iview = [[UIImageView alloc]initWithImage:image];
            
        }
            break;
        case WYAToastImageTypeSVG:
        {
            SVGKImage * image;
            if (isSource) {
                NSString *bundlePath = [[NSBundle bundleForClass:NSClassFromString(@"WYAAlertController")].resourcePath
                                        stringByAppendingPathComponent:@"/WYAKit.bundle"];
                NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
                image = [SVGKImage imageNamed:imageString inBundle:resource_bundle];
            }else{
                image = [SVGKImage imageNamed:imageString];
            }
            iview = [[SVGKLayeredImageView alloc] initWithSVGKImage:image];
        }
            break;
        case WYAToastImageTypeGIF:
        {
            NSLog(@"%d",isSource);
            NSAssert(isSource == NO, @"只加载项目中的gif图片");
            UIImage * image = [YYImage imageNamed:imageString];
            iview = [[YYAnimatedImageView alloc]initWithImage:image];
        }
            break;
        default:
            break;
    }
    [view addSubview:iview];
    
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15*SizeAdapter];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 5*SizeAdapter;
    label.layer.masksToBounds = YES;
    
    [view addSubview:label];
    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    if (width>80*SizeAdapter) {
        label.numberOfLines = 0;
    }else{
        label.numberOfLines = 1;
    }
    CGFloat height = [UILabel getHeightByWidth:80*SizeAdapter title:message font:label.font];
    [iview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view.mas_centerX);
        make.top.mas_equalTo(view.mas_top).with.offset(10*SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(30*SizeAdapter, 30*SizeAdapter));
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view.mas_centerX);
        make.left.mas_equalTo(view.mas_left).with.offset(5*SizeAdapter);
        make.right.mas_equalTo(view.mas_right).with.offset(-5*SizeAdapter);
        make.height.mas_equalTo(height);
        make.top.mas_equalTo(iview.mas_bottom).with.offset(10*SizeAdapter);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.centerY.mas_equalTo(Window.mas_centerY);
        make.width.mas_equalTo(90*SizeAdapter);
        CGFloat hei = 60*SizeAdapter+height;
        make.height.mas_equalTo(hei);
    }];
    
    if (autoDismiss) {
        [UIView animateWithDuration:3 animations:^{
            view.alpha = 0;
        } completion:^(BOOL finished) {
            [button removeFromSuperview];
        }];
    }else{
        Window.userInteractionEnabled = NO;
    }
    
}

+(void)wya_DismissToast{
    UIView * view = (UIView *)[Window viewWithTag:1080];
    [view removeFromSuperview];
    Window.userInteractionEnabled = YES;
}

@end
