//
//  WYADownloadingViewController.h
//  WYAKit
//
//  Created by 李世航 on 2019/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadingViewController : UIViewController
@property (nonatomic, copy) void (^loadCacheCallback)(void);
@end

NS_ASSUME_NONNULL_END
