//
//  WYAPopCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/17.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPopCell : UITableViewCell
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * imageName;
@property (nonatomic, strong) UIView * line;
@end

NS_ASSUME_NONNULL_END
