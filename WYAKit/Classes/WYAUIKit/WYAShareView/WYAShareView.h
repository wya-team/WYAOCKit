//
//  WYAShareView.h
//  CocoaLumberjack
//
//  Created by 李俊恒 on 2018/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSInteger, WYAShareViewItemType) {
    WYAShareViewAllItems                  = 0,         //show all shareItems
    WYAShareViewItemWeChat                = 1 << 0,    //WeChat friends
    WYAShareViewItemWeChatFriends         = 1 << 1,    //WeChat friends circle
    WYAShareViewItemQQ                    = 1 << 2,    //QQ friends
    WYAShareViewItemQQZone                = 1 << 3,    //QQZone
    WYAShareViewItemSina                  = 1 << 4     //Sina Microblog
};
@protocol WYAShareViewDelegate <NSObject>
/**
 * @Description  share callback
 */
- (void)shareButtonClicked:(WYAShareViewItemType )senderType;
@end
@interface WYAShareView : UIView
@property (nonatomic, weak) id<WYAShareViewDelegate> WYAShareDekegate;
@property (nonatomic, strong)UIViewController * controller;
/**
 *
 * @Description Show a Shared view in the current viewController
 *
 * @param onViewController UIViewController
 * Add self to onViewCOntroller
 *
 * @param wyaShareViewItems wyaShareViewItems
 * Share the item that the self View will display items content is "微信、朋友圈、QQ好友、QQ空间、微博"
 */
+ (instancetype)showShareViewController:(UIViewController *)onViewController withItems:(WYAShareViewItemType) wyaShareViewItems;
@end

NS_ASSUME_NONNULL_END
