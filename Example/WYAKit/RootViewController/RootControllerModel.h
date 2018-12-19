//
//  RootControllerModel.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/3.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootControllerModel : NSObject
/**
 tabbaritem 的文字
 */
@property (nonatomic, copy) NSString * tabBarTitle;

/**
 tabBar对应的控制器的名字
 */
@property (nonatomic, copy) NSString * className;

/**
 tabbarItem普通状态的图片
 */
@property (nonatomic, copy) NSString * normalImageName;

/**
 选中状态
 */
@property (nonatomic, copy) NSString * selectedImageName;


/**
 create model object

 @param tabBarTitle title
 @param className controllerClassName
 @param normalImageName normalImage
 @param selectedImageName selectedImage
 @param normalTitleColor normalTitleColor
 @param selectedTitleColor selectedTitleColor
 @param tabBarTitleFont title
 @return RootControllerModel instance
 */
+ (instancetype)modelWithTitle:(nonnull NSString *)tabBarTitle className:(nonnull NSString *)className normalImageName:(nonnull NSString *)normalImageName selectedImageName:(nonnull NSString *)selectedImageName;

- (UIImage *)normalImage;
- (UIImage *)selectedImage;
@end
