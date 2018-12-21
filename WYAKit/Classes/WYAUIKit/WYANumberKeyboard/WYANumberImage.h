//
//  WYANumberImage.h
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WYANumberImageDelegate <NSObject>

@required

/**
 删除退格键点击

 @param sender sender
 */
- (void)wya_deletePressed:(NSString *)senderTitle;

/**
 确定按钮点击

 @param sender sender
 */
- (void)wya_surePressed:(NSString *)senderTitle;
@end
@interface WYANumberImage : UICollectionReusableView
@property (nonatomic, weak) id<WYANumberImageDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
