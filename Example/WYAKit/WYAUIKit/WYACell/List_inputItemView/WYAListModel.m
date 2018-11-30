//
//  WYAListModel.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAListModel.h"

@implementation WYAListModel
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *)iconNamed titleString:(NSString *)titleString rightString:(NSString *)rightString arrowImageNamed:(NSString *)arrowImageNamed{
    WYAListModel * model = [[WYAListModel alloc]init];
    model.type = type;
    model.iconNamed = iconNamed;
    model.titleString = titleString;
    model.rightString = rightString;
    model.arrowImageNamed = arrowImageNamed;
    return model;
}

@end
@implementation WYATwoRowListModel
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *)iconNamed titleString:(NSString *)titleString subTitleString:(NSString *)subTitleString rightString:(NSString *)rightString arrowImageNamed:(NSString *)arrowImageNamed
{
    WYATwoRowListModel * model = [[WYATwoRowListModel alloc]init];
    model.type = type;
    model.iconNamed = iconNamed;
    model.titleString = titleString;
    model.subTitleString = subTitleString;
    model.rightString = rightString;
    model.arrowImageNamed = arrowImageNamed;
    return model;
}


@end
@implementation WYATextListModel
+ (instancetype)modelWith:(NSInteger)type titleString:(nonnull NSString *)titleString rightImage:(NSString * _Nullable)rightImage rightString:(NSString * _Nullable)rightString arrowImageNamed:(nonnull NSString *)arrowImageNamed{
    WYATextListModel * model = [[WYATextListModel alloc]init];
    model.type = type;
    model.titleString = titleString;
    model.rightImage = rightImage;
    model.rightString = rightString;
    model.arrowImageNamed = arrowImageNamed;
    return model;
}


@end
@implementation WYAListCellModel
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *)iconNamed titleString:(NSString *)titleString arrowImageNamed:(NSString *)arrowImageNamed{
    WYAListCellModel * model = [[WYAListCellModel alloc]init];
    model.type = type;
    model.iconImageNamed = iconNamed;
    model.titleString = titleString;
    model.arrowImageNamed = arrowImageNamed;
    return model;
}


@end
