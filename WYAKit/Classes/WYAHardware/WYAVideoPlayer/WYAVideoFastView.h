//
//  WYAVideoFastView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAVideoFastView : UIView

@property (nonatomic, assign) BOOL isSpeed; //是否是快进
@property (nonatomic, copy) NSString * text;
@property (nonatomic, assign) CGFloat number; //进度值
@end

NS_ASSUME_NONNULL_END
