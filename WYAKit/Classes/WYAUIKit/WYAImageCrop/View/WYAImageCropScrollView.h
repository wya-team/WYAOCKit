//
//  WYAImageCropScrollView.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageCropScrollView : UIScrollView
@property (nullable, nonatomic, copy) void (^touchesBegan)(void);
@property (nullable, nonatomic, copy) void (^touchesCancelled)(void);
@property (nullable, nonatomic, copy) void (^touchesEnded)(void);
@end

NS_ASSUME_NONNULL_END
