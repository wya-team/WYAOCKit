# NSArray

## 说明
- 该文件夹下对NSSarry 和NSMutableArray进行了扩展

## NSArray+Category扩展方法
```Object-C
/**
 数组转成json 字符串

@return json字符串
 */
- (NSString *)wya_transToJSONString;

/**
 反转数组
 
 @return 完成反转的数组
 */
- (NSArray *)wya_reverseArray;
```

## NSArray+Safe

```Object-C

/**
 保证该对象不为nil

 @param object 一个未知对象
 @return 返回一个数组
 */
+ (instancetype)wya_safeArrayWithObject:(id)object;

/**
 安全的取出数组下标对应的元素，可以防止越界

 @param index 需要取出的元素的index
 @return 返回一个index对应的元素
 */
- (id)wya_safeObjectAtIndex:(NSUInteger)index;

/**
 截取数组元素

 @param range 需要截取的起始位置以及长度
 @return 截取后的数组
 */
- (NSArray *)wya_safeSubarrayWithRange:(NSRange)range;

/**
 保证安全的获得一个元素的index

 @param anObject object
 @return index
 */
- (NSUInteger)wya_safeIndexOfObject:(id)anObject;
```
## NSArray+Sudoku

```Object-C
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
 @return array
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
```
## NSMutableArray+Safe

```Object-C

/**
 添加对象

 @param object 需要添加的对象
 */
- (void)wya_safeAddObject:(id)object;

/**
 在某个位置插入对象

 @param object 需要插入的对象
 @param index 插入的下标
 */
- (void)wya_safeInsertObject:(id)object atIndex:(NSUInteger)index;

/**
 在多个位置上插入一个数组

 @param objects 需要插入的对象
 @param indexs 需要插入的集合
 */
- (void)wya_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

/**
 移除某个位置的元素

 @param index 需要移除的位置
 */
- (void)wya_safeRemoveObjectAtIndex:(NSUInteger)index;

/**
 移除某个区间的元素

 @param range 需要移除的区间
 */
- (void)wya_safeRemoveObjectsInRange:(NSRange)range;

/**
 替换某个位置的元素

 @param index 需要替换的位置
 @param object 新的对象
 */
- (void)wya_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
```
## 基本用法

- 符合条件的对象都可直接调用

