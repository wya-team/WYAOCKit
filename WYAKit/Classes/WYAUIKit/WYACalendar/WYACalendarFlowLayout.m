//
//  WYACalendarFlowLayout.m
//  WYAKit
//
//  Created by 李世航 on 2019/8/1.
//

#import "WYACalendarFlowLayout.h"

@interface WYACalendarFlowLayout ()
@property(nonatomic, assign) NSInteger section;
@property (nonatomic, strong) NSMutableArray * rows;
@property (nonatomic, strong) NSMutableArray * layoutAttributesArray;

@end

@implementation WYACalendarFlowLayout

#pragma mark - LifeCircle

- (void)prepareLayout{
    [super prepareLayout];

    if (self.section && self.rows.count > 0) {
        return;
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        self.section = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        for (NSInteger i = 0; i<self.section; i++) {
            NSInteger number = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:i];
            [self.rows addObject:@(number)];
        }
    }
    [self updateMoreStyle];
}

- (CGSize)collectionViewContentSize{
    CGSize size = [super collectionViewContentSize];
    NSLog(@"size==%@",NSStringFromCGSize(size));
    return CGSizeMake(self.collectionView.cmam_width * self.section, size.height);
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewLayoutAttributes * attrs = [super layoutAttributesForItemAtIndexPath:indexPath];
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    return attrs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSArray * array = [super layoutAttributesForElementsInRect:rect];

    NSMutableArray * array = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes * att in self.layoutAttributesArray) {
        CGFloat x = att.frame.origin.x;
        CGFloat y = att.frame.origin.y;
        CGFloat width = att.size.width;
        CGFloat height = att.size.height;
        if ((x + width) <= (rect.origin.x + rect.size.width) && (y + height) <= (rect.origin.y + rect.size.height)) {
            [array addObject:att];
        }
    }
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

// 设置collectionView最后偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    CGPoint point = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    NSLog(@"point==%@",NSStringFromCGPoint(point));
//    if (self.onlyOneRow) {
//        return point;
//    }
//    CGFloat width = self.collectionView.cmam_width * (self.section - 1);
//    if (proposedContentOffset.x > width) {
//        return CGPointMake(self.collectionView.cmam_width * (self.section - 1), proposedContentOffset.y);
//    }
    return point;
}

#pragma mark - Private Method
- (void)updateMoreStyle{
    UICollectionViewLayoutAttributes * lastAtt;
    NSInteger itemCount = 0;
    for (NSInteger i = 0; i<self.section; i++) {
        NSNumber * number = self.rows[i];
        NSInteger rowCount = number.integerValue;
        for (NSInteger j = 0; j<rowCount; j++) {
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:j inSection:i];

            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
                self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            }
            UICollectionViewLayoutAttributes * att = [self layoutAttributesForItemAtIndexPath:indexPath];
            att.indexPath = indexPath;
            att.size = self.itemSize;
            CGFloat width = att.size.width;
            CGFloat height = att.size.height;

            CGFloat x;
            CGFloat y;
            NSInteger number = self.collectionView.cmam_width / width;

            NSInteger row = j / number;
            NSInteger column = j % number;

            CGFloat longwidth = att.indexPath.section * self.collectionView.cmam_width;

            x = longwidth + column * width;
            y = row * height;
            att.frame = CGRectMake(x, y, width, height);
            lastAtt = att;
            [self.layoutAttributesArray addObject:att];
        }
    }
}

#pragma mark - Lazy
- (NSMutableArray *)rows{
    if(!_rows){
        _rows = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _rows;
}

- (NSMutableArray *)layoutAttributesArray{
    if(!_layoutAttributesArray){
        _layoutAttributesArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _layoutAttributesArray;
}


@end


@interface WYACalendarOnlyOneRowLayout ()
@property(nonatomic, assign) NSInteger section;
@property (nonatomic, strong) NSMutableArray * rows;
@property (nonatomic, strong) NSMutableArray * oneRowLayoutAttributesArray;
@end

@implementation WYACalendarOnlyOneRowLayout

- (void)prepareLayout{
    [super prepareLayout];

    if (self.section && self.rows.count > 0) {
        return;
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        self.section = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        for (NSInteger i = 0; i<self.section; i++) {
            NSInteger number = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:i];
            [self.rows addObject:@(number)];
        }
    }
    NSLog(@"section==%d,\nrows==%@",self.section,self.rows);
    [self updateOneRowStyle];
}

- (void)updateOneRowStyle{
    //    for (NSInteger index = 0; index<self.layoutAttributesArray.count; index++) {
    //        UICollectionViewLayoutAttributes * att = self.layoutAttributesArray[index];
    //        CGFloat width = att.size.width;
    //        CGFloat height = att.size.height;
    //        CGFloat x = index * width;
    //        CGFloat y = 0;
    //        att.frame = CGRectMake(x, y, width, height);
    //    }
    UICollectionViewLayoutAttributes * lastAtt;

    for (NSInteger i = 0; i<self.section; i++) {
        NSNumber * number = self.rows[i];
        NSInteger rowCount = number.integerValue;
        for (NSInteger j = 0; j< rowCount; j++) {
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
                self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            }
            UICollectionViewLayoutAttributes * att = [self layoutAttributesForItemAtIndexPath:indexPath];
            att.indexPath = indexPath;
            att.size = self.itemSize;
            CGFloat width = att.size.width;
            CGFloat height = att.size.height;

            CGFloat x = lastAtt.frame.origin.x + lastAtt.frame.size.width;
            CGFloat y = 0;

            att.frame = CGRectMake(x, y, width, height);
            lastAtt = att;
            [self.oneRowLayoutAttributesArray addObject:att];
        }
    }
}

- (CGSize)collectionViewContentSize{
    CGSize size = [super collectionViewContentSize];
    return CGSizeMake(self.itemSize.width * self.oneRowLayoutAttributesArray.count, size.height);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    return attrs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.oneRowLayoutAttributesArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    CGPoint point = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    NSLog(@"point==%@",NSStringFromCGPoint(point));
    return point;
}

#pragma mark - Lazy
- (NSMutableArray *)rows{
    if(!_rows){
        _rows = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _rows;
}

- (NSMutableArray *)oneRowLayoutAttributesArray{
    if(!_oneRowLayoutAttributesArray){
        _oneRowLayoutAttributesArray = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _oneRowLayoutAttributesArray;
}
@end
