//
//  WYAListModel.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAListModel : NSObject
@property (nonatomic, assign) NSInteger  type;// 0右边图片,1（文+图）,2（开关）,
@property (nonatomic, copy) NSString * iconNamed;
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, copy) NSString * arrowImageNamed;
@property (nonatomic, copy) NSString * rightString;
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *)iconNamed titleString:(NSString *)titleString rightString:(NSString * _Nullable)rightString arrowImageNamed:(NSString *_Nullable)arrowImageNamed;
@end

@interface WYATwoRowListModel : NSObject
@property (nonatomic, assign) NSInteger  type;// 0无图片,1有图片,
@property (nonatomic, copy) NSString * iconNamed;
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, copy) NSString * subTitleString;
@property (nonatomic, copy) NSString * rightString;
@property (nonatomic, copy) NSString * arrowImageNamed;
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *_Nullable)iconNamed titleString:(NSString *)titleString subTitleString:(NSString *)subTitleString rightString:(NSString *)rightString arrowImageNamed:(NSString *)arrowImageNamed;
@end

@interface WYATextListModel : NSObject
@property (nonatomic, assign) NSInteger  type;// 0无图片,1有图片,
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, copy) NSString * rightImage;
@property (nonatomic, copy) NSString * rightString;
@property (nonatomic, copy) NSString * arrowImageNamed;
+ (instancetype)modelWith:(NSInteger)type titleString:(NSString *)titleString rightImage:(NSString *_Nullable)rightImage rightString:(NSString *_Nullable)rightString arrowImageNamed:(NSString *)arrowImageNamed;
@end

@interface WYAListCellModel : NSObject
@property (nonatomic, assign) NSInteger  type;// 0左侧无图 右侧有图，1左侧有图右侧无图，2右侧左侧都有图
@property (nonatomic, copy) NSString * iconImageNamed;
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, copy) NSString * arrowImageNamed;
+ (instancetype)modelWith:(NSInteger)type iconNamed:(NSString *_Nullable)iconNamed titleString:(NSString *)titleString  arrowImageNamed:(NSString *_Nullable)arrowImageNamed;
@end
NS_ASSUME_NONNULL_END
