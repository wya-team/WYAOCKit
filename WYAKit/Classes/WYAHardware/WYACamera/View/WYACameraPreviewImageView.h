//
//  WYACameraPreviewImageView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYACameraPreviewImageView : UIImageView
/// 取消按钮回调事件
@property (nonatomic, copy) void (^cancelHandle)(void);
/// 完成按钮编辑事件
@property (nonatomic, copy) void (^finishHandle)(UIImage * previewImage);
/// 编辑按钮回调事件
@property (nonatomic, copy) void (^editHandle)(UIImage * previewImage);
@end

NS_ASSUME_NONNULL_END
