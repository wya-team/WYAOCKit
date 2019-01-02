//
//  WYAInputItemModel.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAInputItemModel.h"

@implementation WYAInputItemModel
+ (instancetype)modelWithTitle:(NSString *)titleString textFiledText:(NSString *)textFiledText instructionsString:(NSString * _Nullable)instructionsString type:(nonnull NSString *)type imageNamed:(NSString * _Nullable)imageNamed
{
    WYAInputItemModel * model = [[WYAInputItemModel alloc] init];
    model.titleString         = titleString;
    model.TextFiledText       = textFiledText;
    model.instructionsString  = instructionsString;
    model.type                = type;
    model.imageNamed          = imageNamed;
    return model;
}
@end
