//
//  Student.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/3.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : RLMObject
@property NSString * name;
@property int age;
@property float height;
@property float weight;
@property float score;
@property NSString * grade;
@property NSString * studentId;
@end
RLM_ARRAY_TYPE(Student);

NS_ASSUME_NONNULL_END
