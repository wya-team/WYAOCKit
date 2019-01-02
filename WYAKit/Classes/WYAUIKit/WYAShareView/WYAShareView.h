//
//  WYAShareView.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/12/3.
//

#import <UIKit/UIKit.h>
@class WYAShareView;
NS_ASSUME_NONNULL_BEGIN
@protocol WYAShareViewDelegate <NSObject>

@required

/**
 item点击事件

 @param shareView shareView
 @param indexPath indexPath
 */
- (void)wya_shareView:(WYAShareView *)shareView didSelectItemAtIndexPath:(NSIndexPath *)indexPath itemTitle:(NSString *)title;
@end

@interface WYAShareView : UIView
/**
 存放shareArray otherArray例如:@[@[@“微博”，@“微信”],@[@"复制链接"，@“刷新”]]
 */
@property (nonatomic, strong, nonnull) NSArray<NSArray *> * dataArray;

@property (nonatomic, weak) id<WYAShareViewDelegate> delegate;
/**
 展示分享视图

 @param controller 需要展示的控制器
 */
- (void)wya_showShareViewWithController:(UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
