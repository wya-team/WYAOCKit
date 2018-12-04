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
@property (nonatomic, strong) WYARealmBaseManager * manager;
@end

@implementation WYAReamlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor;
    Student * obj = [[Student alloc]initWithValue:@[@"小明",@1,@68.7,@"三年级二班"]];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
   dispatch_async(queue, ^{
    [RLMRealm asyncOpenWithConfiguration:[RLMRealmConfiguration defaultConfiguration] callbackQueue:queue callback:^(RLMRealm * _Nullable realm, NSError * _Nullable error) {
            NSLog(@"存储成功");
            [realm beginWriteTransaction];
            [realm addObject:obj];
            [realm commitWriteTransaction];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.view.backgroundColor = [UIColor redColor];
        });
    }];
});

}


@end
