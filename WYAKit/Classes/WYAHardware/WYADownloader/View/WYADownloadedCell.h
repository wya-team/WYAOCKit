//
//  WYADownloadedTableViewCell.h
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import "WYADownloadModel.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadedCell : UITableViewCell
@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, strong) WYADownloadModel * model;
@property (nonatomic, copy) void (^editCallback)(WYADownloadModel * model, BOOL isDelete);
@property (nonatomic, assign) BOOL isAllSelect;
@end

NS_ASSUME_NONNULL_END
