//
//  controlView.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/15.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYAPhotoBrowserBottomBar : UIView
@property (nonatomic, strong) UIButton * previewButton;
@property (nonatomic, strong) UIButton * originalButton;
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, copy) void (^previewBlock)(void);
@property (nonatomic, copy) void (^originalBlock)(BOOL select);
@property (nonatomic, copy) void (^doneBlock)(void);
@end
