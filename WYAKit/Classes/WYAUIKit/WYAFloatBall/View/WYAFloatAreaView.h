//
//  WYAFloatAreaView.h
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    WYAFloatAreaViewStyle_default,
    WYAFloatAreaViewStyle_cancel,
} WYAFloatAreaViewStyle;

@interface WYAFloatAreaView : UIView
@property (nonatomic, assign) BOOL highlight;
@property (nonatomic, assign) WYAFloatAreaViewStyle style;
@end

NS_ASSUME_NONNULL_END
