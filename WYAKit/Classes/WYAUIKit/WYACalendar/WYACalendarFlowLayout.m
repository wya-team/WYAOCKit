//
//  WYACalendarFlowLayout.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/1.
//

#import "WYACalendarFlowLayout.h"

@interface WYACalendarFlowLayout ()
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, strong) NSMutableArray * rows;
@property (nonatomic, strong) NSMutableArray * layoutAttributesArray;

@property (nonatomic, strong) NSMutableDictionary<NSIndexPath *, UICollectionViewLayoutAttributes *> * layoutAttributesDic;

@end

@implementation WYACalendarFlowLayout

#pragma mark - LifeCircle

- (void)prepareLayout
{
    [self.rows removeAllObjects];
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        self.section = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        for (NSInteger i = 0; i < self.section; i++) {
            NSInteger number = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:i];
            [self.rows addObject:@(number)];
        }
    }
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.cmam_width * self.section, self.collectionView.cmam_height);
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    UICollectionViewLayoutAttributes * attrs = self.layoutAttributesDic[indexPath];
    if (!attrs) {
        attrs           = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attrs.indexPath = indexPath;
        attrs.size      = self.itemSize;

        CGRect frame = ({
            CGFloat width  = self.itemSize.width;
            CGFloat height = self.itemSize.height;
            CGRect frame;
            if (self.calendar.sectionOption == WYACalendarSectionMonth) {
                CGFloat x, y;
                NSInteger row    = indexPath.item / 7;
                NSInteger column = indexPath.item % 7;
                x                = column * self.itemSize.width + indexPath.section * self.collectionView.cmam_width;
                y                = row * height;
                frame            = CGRectMake(x, y, width, height);
            } else if (self.calendar.sectionOption == WYACalendarSectionWeek) {
                CGFloat x, y;
                y     = 0;
                x     = self.collectionView.cmam_width * indexPath.section + indexPath.item * width;
                frame = CGRectMake(x, y, width, height);
            }

            frame;
        });
        attrs.frame                         = frame;
        self.layoutAttributesDic[indexPath] = attrs;
    }

    return attrs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    NSInteger startColumn  = ({
        NSInteger startSection = rect.origin.x / self.collectionView.cmam_width > 0 ?: 0;
        CGFloat widthDelta     = fmodf(CGRectGetMinX(rect), self.collectionView.cmam_width);
        widthDelta             = MIN(MAX(0, widthDelta), self.collectionView.cmam_width);
        NSInteger countDelta   = 0;
        NSInteger startColumn  = startSection * 7 + countDelta;
        startColumn;
    });

    NSInteger endColumn = ({
        NSInteger endColumn;
        CGFloat section   = CGRectGetMaxX(rect) / self.collectionView.cmam_width;
        CGFloat remainder = fmodf(section, 1);

        if (remainder <= MAX(100 * FLT_EPSILON * ABS(remainder), FLT_MIN)) {
            endColumn = floorf(section) * 7 - 1;
        } else {
            CGFloat widthDelta   = fmodf(CGRectGetMaxX(rect), self.collectionView.cmam_width);
            widthDelta           = MIN(MAX(0, widthDelta), self.collectionView.cmam_width);
            NSInteger countDelta = 0;
            endColumn            = floorf(section) * 7 + countDelta - 1;
        }
        endColumn;
    });

    NSInteger numberOfRows = self.calendar.sectionOption == WYACalendarSectionMonth ? 6 : 1;

    for (NSInteger column = startColumn; column <= endColumn; column++) {
        for (NSInteger row = 0; row < numberOfRows; row++) {
            NSInteger section                                 = column / 7;
            NSInteger item                                    = column % 7 + row * 7;
            NSIndexPath * indexPath                           = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes * itemAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [array addObject:itemAttributes];
        }
    }
    return array;
}

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
//    return YES;
//}

// 设置collectionView最后偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    ;
}

#pragma mark - Lazy
- (NSMutableArray *)rows
{
    if (!_rows) {
        _rows = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _rows;
}

- (NSMutableArray *)layoutAttributesArray
{
    if (!_layoutAttributesArray) {
        _layoutAttributesArray = ({
            NSMutableArray * object = [[NSMutableArray alloc] init];
            object;
        });
    }
    return _layoutAttributesArray;
}

- (NSMutableDictionary<NSIndexPath *, UICollectionViewLayoutAttributes *> *)layoutAttributesDic
{
    if (!_layoutAttributesDic) {
        _layoutAttributesDic = ({
            NSMutableDictionary * object = [[NSMutableDictionary alloc] init];
            object;
        });
    }
    return _layoutAttributesDic;
}
@end
