//
//  WYADownloadBar.h
//  WYAKit
//
//  Created by 李世航 on 2019/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADownloadBar : UIView
@property (nonatomic, copy) void (^selectCallback)(WYADownloadBar * bar, BOOL isAllSelect);
@property (nonatomic, copy) void (^deleteCallback)(WYADownloadBar * bar);
@property (nonatomic, assign) NSUInteger arrayCount; //控制删除按钮个数的显示和全选按钮是否禁用
@property (nonatomic, assign) BOOL allSelect;        //外部传入控制全选按钮显示状态

@end

NS_ASSUME_NONNULL_END
