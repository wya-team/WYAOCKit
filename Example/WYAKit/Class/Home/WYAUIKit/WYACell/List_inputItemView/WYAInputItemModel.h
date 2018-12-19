//
//  WYAInputItemModel.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAInputItemModel : NSObject
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, copy) NSString * TextFiledText;
@property (nonatomic, copy) NSString * instructionsString;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * imageNamed;

/**
 生成一个model实例

 @param titleString 左侧标题
 @param textFiledText textFiled文字
 @param instructionsString 右侧文字
 @param type 显示类型
 @param imageNamed 图片名字
 @return model
 */
+ (instancetype)modelWithTitle:(NSString *)titleString
                 textFiledText:(NSString *)textFiledText
            instructionsString:(NSString * _Nullable)instructionsString
                          type:(NSString *)type
                    imageNamed:(NSString * _Nullable)imageNamed;
@end

NS_ASSUME_NONNULL_END
