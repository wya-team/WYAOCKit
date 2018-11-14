//
//  HeadView.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/19.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView

@property (nonatomic, copy)   void(^backBlock)(void);

@property (nonatomic, copy)   void(^rightBlock)(void);

@property (nonatomic, strong) UIImage * rightImage;
@end
