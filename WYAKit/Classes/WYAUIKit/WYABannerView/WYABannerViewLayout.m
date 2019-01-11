//
//  WYABannerViewLayout.m
//  WYAKit
//
//  Created by 李世航 on 2019/1/5.
//

#import "WYABannerViewLayout.h"

@implementation WYABannerViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset    = UIEdgeInsetsMake(0, 0 / 2, 0, 0 / 2);
}

// 当bounds发生变化的时候是否应该重新进行布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//  初始的layout外观将由该方法返回的UICollctionViewLayoutAttributes来决定
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size   = self.collectionView.bounds.size;
    for (UICollectionViewLayoutAttributes * attributes in array) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;

            CGFloat normalizedDistance = distance / 200 * SizeAdapter;
            if (ABS(distance) < 200 * SizeAdapter) {
                CGFloat zoom           = 1 + 0.4 * (1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex      = 1;
            }
        }
    }
    return array;
}

//  自动对齐到网格
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
    //  proposedContentOffset是没有对齐到网格时本来应该停下来的位置
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter =
        proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    //  当前显示的区域
    CGRect targetRect =
        CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width,
                   self.collectionView.bounds.size.height);
    //  取当前显示的item
    NSArray * array = [super layoutAttributesForElementsInRect:targetRect];
    //  对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
    for (UICollectionViewLayoutAttributes * layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
