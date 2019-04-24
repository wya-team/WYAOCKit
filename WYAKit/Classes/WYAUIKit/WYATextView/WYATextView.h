//
//  WYATextView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYATextView : UIView

@property (nonatomic, strong) UITextView * textView;
/// 标题
@property (nonatomic, copy) NSString * title;
/// 是否显示标题,default is YES
@property (nonatomic, assign) BOOL showTitle;
/// 是否显示字数限制，default is YES
@property (nonatomic, assign) BOOL showWordsCount;
/// 是否需要自适应高度，default is NO
@property (nonatomic, assign) BOOL autoChangeHeight;
/// 最大高度
@property (nonatomic, assign) CGFloat textViewMaxHeight;
/// 最大字数
@property (nonatomic, assign) NSUInteger textViewWordsCount;
/// 如果需要显示字数个数，请先设置最大字数
@property (nonatomic, copy) NSString * text;
/// 占位文字
@property (nonatomic, copy) NSString * placeHoldString;
/// 占位文字颜色
@property (nonatomic, strong) UIColor * placeHoldColor;
/// textView的上下距离
@property (nonatomic, assign) CGFloat textViewPadding;
/// 控件高度随输入文字变化高度
@property (nonatomic, copy) void (^textViewContentFrame)(void);
@end

NS_ASSUME_NONNULL_END
