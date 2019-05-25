//
//  WYAPhotoEditControlView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAPhotoBrowserEditBottomBar : UIView
@property (nonatomic, strong) UIButton * editButton;
@property (nonatomic, strong) UIButton * centerButton;
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, copy) void(^editBlock)(void);
@property (nonatomic, copy) void(^originalBlock)(BOOL select);
@property (nonatomic, copy) void(^doneBlock)(void);
@end

NS_ASSUME_NONNULL_END
