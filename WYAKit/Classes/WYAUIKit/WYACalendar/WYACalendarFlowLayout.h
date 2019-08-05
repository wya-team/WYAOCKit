//
//  WYACalendarFlowLayout.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYACalendarFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
@end

@interface WYACalendarFlowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<WYACalendarFlowLayoutDelegate> delegate;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGSize headerSize;
@property (nonatomic, assign) CGSize footerSize;

@end

@protocol WYACalendarOnlyOneRowLayoutDelegate <UICollectionViewDelegateFlowLayout>


@end

@interface WYACalendarOnlyOneRowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<WYACalendarOnlyOneRowLayoutDelegate> delegate;
@property (nonatomic, assign) CGSize itemSize;
@end
NS_ASSUME_NONNULL_END
