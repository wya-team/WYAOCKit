//
//  WYAImageCropToolBar.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYAImageCropToolBarDelegate <NSObject>

- (void)rotatingAction;

- (void)originalAction;

- (void)cancelAction;

- (void)doneAction;

@end

@interface WYAImageCropToolBar : UIView
@property (nonatomic, weak) id<WYAImageCropToolBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
