//
//  WYAPhotoEditControlView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowserEditBottomBar : UIView
@property (nonatomic, assign) BOOL videoHidden;

@property (nonatomic, copy) void(^editBlock)(void);
@property (nonatomic, copy) void(^originalBlock)(void);
@property (nonatomic, copy) void(^doneBlock)(void);
@end

NS_ASSUME_NONNULL_END
