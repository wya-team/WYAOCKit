//
//  controlView.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/15.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface controlView : UIView
@property (nonatomic, strong) UIButton * doneButton;
@property (nonatomic, copy) void (^previewBlock)(void);
@property (nonatomic, copy) void (^doneBlock)(void);
@end
