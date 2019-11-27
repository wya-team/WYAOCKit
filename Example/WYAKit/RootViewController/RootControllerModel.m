//
//  RootControllerModel.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/3.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "RootControllerModel.h"

@implementation RootControllerModel

/**
 create RootControllerModel

 @param tabBarTitle title
 @param className controllerClassName
 @param normalImageName normalImage
 @param selectedImageName selectedImage
 @return RootControllerModel instance
 */
- (instancetype)initWithTitle:(NSString *)tabBarTitle
                    className:(NSString *)className
              normalImageName:(NSString *)normalImageName
            selectedImageName:(NSString *)selectedImageName
{
    if (self = [super init]) {
        _className         = className;
        _tabBarTitle       = tabBarTitle;
        _normalImageName   = normalImageName;
        _selectedImageName = selectedImageName;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)tabBarTitle
                     className:(NSString *)className
               normalImageName:(NSString *)normalImageName
             selectedImageName:(NSString *)selectedImageName
{
    return [[self alloc] initWithTitle:tabBarTitle
                             className:className
                       normalImageName:normalImageName
                     selectedImageName:selectedImageName];
}

- (UIImage *)normalImage
{
    return [[UIImage imageNamed:self.normalImageName]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)selectedImage
{
    return [[UIImage imageNamed:self.selectedImageName]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
