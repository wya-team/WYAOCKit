//
//  WYANoticeBar.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYANoticeBar : UIView
@property (nonatomic, assign) BOOL  showNoticeButton;
@property (nonatomic, assign) BOOL  showRightButton;
@property (nonatomic, copy)   NSString * showText;
@property (nonatomic, strong) UIColor * showTextColor;
@property (nonatomic, assign) CGFloat  showTextFont;
@property (nonatomic, strong) UIImage * noticeButtonImage;
@property (nonatomic, strong) UIImage * rightButtonImage;
@property (nonatomic, strong) UIColor * noticeBackgroundColor;
- (void)start;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
