//
//  WYADownloadCompleteCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/12.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadCompleteCell : UITableViewCell
@property (nonatomic, copy) NSString * title;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) WYADownloadModel * model;
@end

NS_ASSUME_NONNULL_END
