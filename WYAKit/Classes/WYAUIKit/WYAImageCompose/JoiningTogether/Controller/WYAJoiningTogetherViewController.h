//
//  WYAJoiningTogetherViewController.h
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAJoiningTogetherViewController : UIViewController
/// 截图使用的tableView
@property (nonatomic, strong) UITableView * screenshotsTableView;
@property (nonatomic, strong) NSMutableArray * images;
@end

NS_ASSUME_NONNULL_END
