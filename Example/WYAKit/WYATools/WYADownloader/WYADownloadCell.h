//
//  WYADownloadCell.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/10.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYADownloadModel;



NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadCell : UITableViewCell
@property (nonatomic, copy)   void(^actionHandle)(BOOL select);
@property (nonatomic, strong) WYADownloadModel * model;
@end

NS_ASSUME_NONNULL_END
