//
//  WYASegmentedControl.h
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/19.
//

#import <UIKit/UIKit.h>
@class WYASegmentedControl;

NS_ASSUME_NONNULL_BEGIN
@protocol WYASegmentedControlDelegate <NSObject>

@required

/**
 items被点击

 @param segmentedControl 传出instance
 */
- (void)wya_segmentedControlChangeValue:(WYASegmentedControl *)segmentedControl;

@end

@interface WYASegmentedControl : UIView

@property (nonatomic, weak) id<WYASegmentedControlDelegate> delegate;

/**
 设置圆角系数默认8
 */
@property (nonatomic, assign) CGFloat cornerRadius;




/**
 设置默认选择项索引,默认选中第一个只写
 */
@property (nonatomic, assign, readwrite) NSInteger selectedSegmentIndex;

/**
 只读获取当前选中的索引，只读
 */
@property (nonatomic, assign, readonly) NSInteger getSelectedIndex;
/**
 按钮以及视图的边框色默认蓝色
 */
@property (nonatomic, strong) UIColor * borderColor;

/**
 普通状态颜色默认蓝色
 */
@property (nonatomic, strong) UIColor * itemBgNormalColor;

/**
 选中状态颜色默认白色
 */
@property (nonatomic, strong) UIColor * itemBgSelectColor;

/**
 高亮颜色默认白色
 */
@property (nonatomic, strong) UIColor * itemBgHighlightedColor;

/**
 普通状态颜色默认蓝色
 */
@property (nonatomic, strong) UIColor * titleBgNormalColor;

/**
 选中状态颜色默认白色
 */
@property (nonatomic, strong) UIColor * titleBgSelectColor;

/**
 高亮颜色默认白色
 */
@property (nonatomic, strong) UIColor * titleBgHighlightedColor;


/**
 items字体大小默认15
 */
@property (nonatomic, assign) CGFloat itemsFont;

@property (nonatomic, assign) BOOL itemsIsEnable;
/**
 构造方法返回一个实例对象

 @param frame frame
 @param itemsTitleArray 标题数据
 @return instance
 */
+ (instancetype)wya_initWithFrame:(CGRect)frame
                  itemsTitleArray:(NSArray<NSString *> *)itemsTitleArray;

/**
 构造方法返回一个实例对象

 @param frame frame
 @param imagesNormalArray 普通状态的images
 @param imagesSelectlArray 选中状态images
 @return instance
 */
+ (instancetype)wya_initWithFrame:(CGRect)frame
                imagesNormalArray:(NSArray<NSString *> *)imagesNormalArray
               imagesSelectlArray:(NSArray<NSString *> *)imagesSelectlArray;

@end

NS_ASSUME_NONNULL_END
