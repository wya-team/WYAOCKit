//
//  WYARealmSectionView.h
//  WYAKit_Example
//
//  Created by 李俊恒 on 2018/12/5.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WYARealmHeaderViewDelegate <NSObject>

@required
- (void)wya_headerViewInsterButton:(UIButton *)sender;
- (void)wya_headerViewDeleteButton:(UIButton *)sender;
- (void)wya_headerViewUpdateButton:(UIButton *)sender;
- (void)wya_headerViewLookButton:(UIButton *)sender;

@end
@interface WYARealmHeaderView : UIView
@property (nonatomic, weak) id<WYARealmHeaderViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
