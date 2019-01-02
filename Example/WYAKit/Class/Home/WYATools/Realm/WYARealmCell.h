//
//  WYARealmCell.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/5.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYARealmCell : UITableViewCell
@property (nonatomic, strong) Student * model;
@end

NS_ASSUME_NONNULL_END
