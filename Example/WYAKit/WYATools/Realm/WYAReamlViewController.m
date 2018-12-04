//
//  WYAReamlViewController.m
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/3.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAReamlViewController.h"
#import "Student.h"
#import <WYAKit/WYARealmBaseManager.h>
@interface WYAReamlViewController ()

@end

@implementation WYAReamlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor;
//    Student * student1 = [[Student alloc]initWithValue:@[@"周杰伦",@1,@96.4,@"三年级二班"]];
//    Student * student2 = [[Student alloc]initWithValue:@[@"李雷",@1,@66.6,@"二年级二班"]];
//    Student * student3 = [[Student alloc]initWithValue:@[@"韩梅梅",@0,@96.4,@"一年级二班"]];
//    NSArray * array= @[student1,student2,student3];
    WYARealmBaseManager * dbManager = [WYARealmBaseManager wya_defaultRealm];
//    for (Student * stu in array) {
//        [dbManager wya_insertRealmWithObject:stu];
//    }
//   RLMResults * resArr = [dbManager wya_lookupRealmWithAllClassName:@"Student" whereFormat:@"gender=0"];
//    NSLog(@"%@",[resArr firstObject]);
//    Student * tempStu = [[Student alloc]initWithValue:@[@"韩梅梅",@0,@96.4,@"春野·樱"]];
//    [dbManager wya_updateRealmWithClassName:tempStu];
//    [dbManager wya_deleteRealmWithObject:[resArr firstObject]];
//    [dbManager wya_updateRealmWithClassName:@"Student" withValue:@{@"name":@"韩梅梅",@"className":@"江户川柯南"}];
}

@end
