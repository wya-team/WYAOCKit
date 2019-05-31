//
//  UIView+WYAToast.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/21.
//

#import "UIView+WYAToast.h"
#import <SVGKit/SVGKit.h>

@implementation UIView (WYAToast)

+ (void)wya_showBottomToastWithMessage:(NSString *)message {
    [self wya_showBottomToastWithMessage:message bgViewUserInteractionUse:NO];
}

+ (void)wya_showBottomToastWithMessage:(NSString *)message bgViewUserInteractionUse:(BOOL)use {
    UIView * tagView = [Window viewWithTag:17858629000];
    if (tagView) {
        [tagView removeFromSuperview];
    }
    UIButton * button             = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame                  = Window.bounds;
    button.userInteractionEnabled = use;
    button.tag = 17858629000;
    [button addCallBackAction:^(UIButton * button) { [button removeFromSuperview]; }];
    [Window addSubview:button];

    UIView * view = [[UIView alloc]init];
    view.backgroundColor = random(77, 77, 77, 1);
    view.layer.cornerRadius  = 5 * SizeAdapter;
    view.layer.masksToBounds = YES;
    [button addSubview:view];

    UILabel * label           = [[UILabel alloc] init];
    label.font                = FONT(15);
    label.text                = message;
    label.textColor           = [UIColor whiteColor];
    label.textAlignment       = NSTextAlignmentCenter;
    label.numberOfLines       = 0;
    [view addSubview:label];

    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    if (width > ScreenWidth / 2) { width = ScreenWidth / 2; }
    CGFloat height =
        [UILabel getHeightByWidth:width
                            title:message
                             font:label.font];

    [view mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.bottom.mas_equalTo(Window.mas_bottom).with.offset(-50 * SizeAdapter);
        make.width.mas_equalTo(width + 44 * SizeAdapter);
        if (width < ScreenWidth / 2) {
            make.height.mas_equalTo(30 * SizeAdapter);
        } else {
            make.height.mas_equalTo(height + 10 * SizeAdapter);
        }

    }];
    [label mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 22 * SizeAdapter, 0, 22 * SizeAdapter));
    }];

    [UIView animateWithDuration:0.3
        delay:2
        options:UIViewAnimationOptionAllowUserInteraction
        animations:^{ label.alpha = 0; }
        completion:^(BOOL finished) {
            [button removeFromSuperview];
        }];
}

+ (void)wya_showCenterToastWithMessage:(NSString *)message {
    [self wya_showCenterToastWithMessage:message bgViewUserInteractionUse:NO];
}

+ (void)wya_showCenterToastWithMessage:(NSString *)message bgViewUserInteractionUse:(BOOL)use {
    UIView * tagView = [Window viewWithTag:17858629000];
    if (tagView) {
        [tagView removeFromSuperview];
    }
    UIButton * button             = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame                  = Window.bounds;
    button.userInteractionEnabled = use;
    button.tag = 17858629000;
    [button addCallBackAction:^(UIButton * button) { [button removeFromSuperview]; }];
    [Window addSubview:button];

    UIView * view = [[UIView alloc]init];
    view.backgroundColor     = random(77, 77, 77, 1);
    view.layer.cornerRadius  = 5 * SizeAdapter;
    view.layer.masksToBounds = YES;
    [button addSubview:view];

    UILabel * label           = [[UILabel alloc] init];
    label.font                = [UIFont systemFontOfSize:15 * SizeAdapter];
    label.text                = message;
    label.textColor           = [UIColor whiteColor];
    label.textAlignment       = NSTextAlignmentCenter;
    label.numberOfLines       = 0;
    [view addSubview:label];

    CGFloat width = [UILabel getWidthWithTitle:message font:label.font];
    if (width > ScreenWidth / 2) { width = ScreenWidth / 2; }
    CGFloat height =
        [UILabel getHeightByWidth:width
                            title:message
                             font:label.font];
    [view mas_makeConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(Window.mas_centerX);
        make.centerY.mas_equalTo(Window.mas_centerY);
        make.width.mas_equalTo(width + 44 * SizeAdapter);
        if (width < ScreenWidth / 2) {
            make.height.mas_equalTo(30 * SizeAdapter);
        } else {
            make.height.mas_equalTo(height + 10 * SizeAdapter);
        }
    }];
    [label mas_makeConstraints:^(MASConstraintMaker * make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 22 * SizeAdapter, 0, 22 * SizeAdapter));
    }];

    [UIView animateWithDuration:0.3
        delay:2
        options:UIViewAnimationOptionAllowUserInteraction
        animations:^{ label.alpha = 0; }
        completion:^(BOOL finished) {
            [button removeFromSuperview];
        }];
}

+ (void)wya_showToastImage:(NSString *)imageString
              autoRotation:(BOOL)autoRotation
                 ImageType:(WYAToastImageType)imageType
      sourceInWYAKitBundle:(BOOL)isSource
               autoDismiss:(BOOL)autoDismiss {
    [UIView wya_toastWithMessage:@""
                     imageString:imageString
                    autoRotation:autoRotation
                       imageType:imageType
            sourceInWYAKitBundle:isSource
                     autoDismiss:autoDismiss
        bgViewUserInteractionUse:NO];
}

+ (void)wya_successToastWithMessage:(NSString *)message {
    [UIView wya_toastWithMessage:message
                     imageString:@"icon_succesful"
                    autoRotation:NO
                       imageType:WYAToastImageTypePNG
            sourceInWYAKitBundle:YES
                     autoDismiss:YES
        bgViewUserInteractionUse:NO];
}

+ (void)wya_failToastWithMessage:(NSString *)message {
    [UIView wya_toastWithMessage:message
                     imageString:@"icon_fail"
                    autoRotation:NO
                       imageType:WYAToastImageTypePNG
            sourceInWYAKitBundle:YES
                     autoDismiss:YES
        bgViewUserInteractionUse:NO];
}

+ (void)wya_warningToastWithMessage:(NSString *)message {
    [UIView wya_toastWithMessage:message
                     imageString:@"icon_waring"
                    autoRotation:NO
                       imageType:WYAToastImageTypePNG
            sourceInWYAKitBundle:YES
                     autoDismiss:YES
        bgViewUserInteractionUse:NO];
}

+ (void)wya_toastWithMessage:(NSString *)message
                 imageString:(NSString *)imageString
                autoRotation:(BOOL)autoRotation
                   imageType:(WYAToastImageType)imageType
        sourceInWYAKitBundle:(BOOL)isSource
                 autoDismiss:(BOOL)autoDismiss
    bgViewUserInteractionUse:(BOOL)use {
    UIButton * button;
    if (autoDismiss) {
        button                        = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame                  = Window.bounds;
        button.userInteractionEnabled = use;
        [Window addSubview:button];
        [button addCallBackAction:^(UIButton * button) { [button removeFromSuperview]; }];
    }
    UIView * view            = [[UIView alloc] init];
    view.backgroundColor     = random(77, 77, 77, 1);
    view.layer.cornerRadius  = 5 * SizeAdapter;
    view.layer.masksToBounds = YES;
    view.tag                 = 1080;
    if (button) {
        [button addSubview:view];
    } else {
        [Window addSubview:view];
    }

    UIView * iview;
    switch (imageType) {
        case WYAToastImageTypePNG: {
            UIImage * image;
            if (isSource) {
                image = [UIImage loadBundleImage:imageString ClassName:@"WYAAlertController"];

            } else {
                image = [UIImage imageNamed:imageString];
            }
            iview = [[UIImageView alloc] initWithImage:image];
            if (autoRotation) { [iview wya_setRotationAnimation:360 time:1 repeatCount:0]; }
        } break;
        case WYAToastImageTypeJPEG: {
            UIImage * image;
            if (isSource) {
                image = [UIImage loadBundleImage:imageString ClassName:@"WYAAlertController"];

            } else {
                image = [UIImage imageNamed:imageString];
            }
            iview = [[UIImageView alloc] initWithImage:image];

        } break;
        case WYAToastImageTypeSVG: {
            UIImage * image;
            if (isSource) {
                NSString * bundlePath =
                    [[NSBundle bundleForClass:NSClassFromString(@"WYAAlertController")]
                            .resourcePath stringByAppendingPathComponent:@"/WYAKit.bundle"];
                NSBundle * resource_bundle = [NSBundle bundleWithPath:bundlePath];
                SVGKImage * svgImage       = [SVGKImage imageNamed:imageString inBundle:resource_bundle];
                image                      = svgImage.UIImage;
            } else {
                //                image = [SVGKImage imageNamed:imageString];
                image = [UIImage wya_svgImageName:imageString
                                             size:CGSizeMake(30 * SizeAdapter, 30 * SizeAdapter)];
            }
            //            iview = [[SVGKFastImageView alloc] initWithSVGKImage:image];
            iview = [[UIImageView alloc] initWithImage:image];
            if (autoRotation) { [iview wya_setRotationAnimation:360 time:1 repeatCount:0]; }
        } break;
        case WYAToastImageTypeGIF: {
            NSLog(@"%d", isSource);
            NSAssert(isSource == NO, @"只加载项目中的gif图片");
            UIImage * image = [YYImage imageNamed:imageString];
            iview           = [[YYAnimatedImageView alloc] initWithImage:image];
        } break;
        default:
            break;
    }
    [view addSubview:iview];

    UILabel * label           = [[UILabel alloc] init];
    label.font                = FONT(13);
    label.text                = message;
    label.textColor           = [UIColor whiteColor];
    label.textAlignment       = NSTextAlignmentCenter;
    label.layer.cornerRadius  = 5 * SizeAdapter;
    label.layer.masksToBounds = YES;

    [view addSubview:label];
    CGFloat width = [UILabel getWidthWithTitle:message font:FONT(13)];
    if (width > 90 * SizeAdapter) {
        label.numberOfLines = 0;
    } else {
        label.numberOfLines = 1;
    }
    CGFloat height = [UILabel getHeightByWidth:90 * SizeAdapter title:label.text font:label.font];
    if (message.length < 1) { height = 0; }
    CGFloat hei = 50 * SizeAdapter + height;

    CGFloat view_X      = (ScreenWidth - 100 * SizeAdapter) / 2;
    CGFloat view_Y      = (ScreenHeight - hei) / 2;
    CGFloat view_Width  = 100 * SizeAdapter;
    CGFloat view_Height = hei;
    view.frame          = CGRectMake(view_X, view_Y, view_Width, view_Height);

    CGFloat iview_X      = (view.cmam_width - 30 * SizeAdapter) / 2;
    CGFloat iview_Y      = 10 * SizeAdapter;
    CGFloat iview_Width  = 30 * SizeAdapter;
    CGFloat iview_Height = 30 * SizeAdapter;
    iview.frame          = CGRectMake(iview_X, iview_Y, iview_Width, iview_Height);

    CGFloat label_X      = 5 * SizeAdapter;
    CGFloat label_Y      = CGRectGetMaxY(iview.frame) + 5 * SizeAdapter;
    CGFloat label_Width  = view.cmam_width - 10 * SizeAdapter;
    CGFloat label_Height = height;
    label.frame          = CGRectMake(label_X, label_Y, label_Width, label_Height);

    if (autoDismiss) {
        [UIView animateWithDuration:0.3
            delay:2
            options:UIViewAnimationOptionAllowUserInteraction
            animations:^{ view.alpha = 0; }
            completion:^(BOOL finished) { [button removeFromSuperview]; }];
    } else {
        Window.userInteractionEnabled = NO;
    }
}

+ (void)wya_dismissToast {
    UIView * view = (UIView *)[Window viewWithTag:1080];
    [view removeFromSuperview];
    Window.userInteractionEnabled = YES;
}

@end
