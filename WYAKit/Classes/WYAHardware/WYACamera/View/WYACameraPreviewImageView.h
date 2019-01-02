//
//  WYACameraPreviewImageView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYACameraPreviewImageView : UIImageView

@property (nonatomic, copy) void (^cancelHandle)(void);
@property (nonatomic, copy) void (^finishHandle)(UIImage * previewImage);
@property (nonatomic, copy) void (^editHandle)(UIImage * previewImage);
@end

NS_ASSUME_NONNULL_END
