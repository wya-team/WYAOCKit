//
//  WYACalendarFlowLayout.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYACalendarFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

@end

@interface WYACalendarFlowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<WYACalendarFlowLayoutDelegate> delegate;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGSize headerSize;
@property (nonatomic, assign) CGSize footerSize;
@property (nonatomic, weak) WYACalendarView * calendar;
@end
NS_ASSUME_NONNULL_END
