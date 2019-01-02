//
//  WYAPhotoEditControlView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYAPhotoEditControlViewDelegate <NSObject>

@optional
- (void)edit;

- (void)editWithOriginalImage:(BOOL)original;

- (void)done;
@end

@interface WYAPhotoEditControlView : UIView
@property (nonatomic, assign) BOOL videoHidden;

@property (nonatomic, weak) id<WYAPhotoEditControlViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
