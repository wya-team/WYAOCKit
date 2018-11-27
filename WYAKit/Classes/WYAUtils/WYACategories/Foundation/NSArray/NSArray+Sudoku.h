//
//  NSArray+Sudoku.h
//  WYA_iOS_Scaffold
//
//  Created by 李世航 on 18/7/8.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//


@interface NSArray (Sudoku)

/**
 *  九宫格布局 固定ItemSize 可变ItemSpacing
 *
 *  @param fixedItemWidth  固定宽度
 *  @param fixedItemHeight 固定高度
 *  @param warpCount       折行点
 *  @param topSpacing      顶间距
 *  @param bottomSpacing   底间距
 *  @param leadSpacing     左间距
 *  @param tailSpacing     右间距
 */
- (void)wya_mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                    fixedItemHeight:(CGFloat)fixedItemHeight
                                          warpCount:(NSInteger)warpCount
                                         topSpacing:(CGFloat)topSpacing
                                      bottomSpacing:(CGFloat)bottomSpacing
                                        leadSpacing:(CGFloat)leadSpacing
                                        tailSpacing:(CGFloat)tailSpacing;

/**
 *  九宫格布局 可变ItemSize 固定ItemSpacing
 *
 *  @param fixedLineSpacing      行间距
 *  @param fixedInteritemSpacing 列间距
 *  @param warpCount             折行点
 *  @param topSpacing            顶间距
 *  @param bottomSpacing         底间距
 *  @param leadSpacing           左间距
 *  @param tailSpacing           右间距
 */
- (void)wya_mas_distributeSudokuViewsWithFixedLineSpacing:(CGFloat)fixedLineSpacing
                                fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                            warpCount:(NSInteger)warpCount
                                           topSpacing:(CGFloat)topSpacing
                                        bottomSpacing:(CGFloat)bottomSpacing
                                          leadSpacing:(CGFloat)leadSpacing
                                          tailSpacing:(CGFloat)tailSpacing;

/**
 *  九宫格布局 固定ItemSize 固定ItemSpacing
 *  可由九宫格的内容控制SuperView的大小
 *  如果warpCount大于[self count]，该方法将会用空白的View填充到superview中
 *
 *  Sudoku Layout, has fixed item size, and fix item space
 *  If warp count greater than self.count, It's fill empty view to superview
 *
 *  @param fixedItemWidth        固定宽度，如果设置成0，则表示自适应，If set it to zero, indicates the adaptive.
 *  @param fixedItemHeight       固定高度，如果设置成0，则表示自适应，If set it to zero, indicates the adaptive.
 *  @param fixedLineSpacing      行间距
 *  @param fixedInteritemSpacing 列间距
 *  @param warpCount             折行点
 *  @param topSpacing            顶间距
 *  @param bottomSpacing         底间距
 *  @param leadSpacing           左间距
 *  @param tailSpacing           右间距
 *
 *  @return 一般情况下会返回[self copy], 如果warpCount大于[self count]，则会返回一个被空白view填充过的数组，可以让你循环调用removeFromSuperview或者干一些其他的事情;
 *  @return Normal will return [self copy], If warpCount bigger than [self count] , It will return a empty views filled array, you could enumerate [subview removeFromSuperview] or do other things;
 */
- (NSArray *)wya_mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                             fixedItemHeight:(CGFloat)fixedItemHeight
                                            fixedLineSpacing:(CGFloat)fixedLineSpacing
                                       fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                                   warpCount:(NSInteger)warpCount
                                                  topSpacing:(CGFloat)topSpacing
                                               bottomSpacing:(CGFloat)bottomSpacing
                                                 leadSpacing:(CGFloat)leadSpacing
                                                 tailSpacing:(CGFloat)tailSpacing;


/**
 特殊的布局方式（一行或者一列）

 @param fixedItemWidths 各个item的宽度，当一列时该属性可传nil
 @param fixedItemHeights 各个item的高度，当一行时该属性可传nil
 @param fixedLineSpacing 行间距
 @param fixedInteritemSpacing 列间距
 @param warpCount 折行点
 @param topSpacing 顶间距
 @param bottomSpacing 底间距
 @param leadSpacing 左间距
 @param tailSpacing 右间距
 @return <#return value description#>
 */
- (NSArray *)wya_mas_distributeSpecialSudokuViewsWithFixedItemWidths:(NSArray<NSNumber*>*)fixedItemWidths
                                                    fixedItemHeights:(NSArray<NSNumber*>*)fixedItemHeights
                                                    fixedLineSpacing:(CGFloat)fixedLineSpacing
                                               fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                                           warpCount:(NSInteger)warpCount
                                                          topSpacing:(CGFloat)topSpacing
                                                       bottomSpacing:(CGFloat)bottomSpacing
                                                         leadSpacing:(CGFloat)leadSpacing
                                                         tailSpacing:(CGFloat)tailSpacing;
@end
