//
//  ImageTypeView.h
//  ImagePickerDemo
//
//  Created by 李世航 on 2018/6/19.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageTypeDelegate <NSObject>
@required
- (NSMutableArray *)imageTypeDatas;

@optional
- (void)imageTypeView:(UIView *)imageTypeView didSelectData:(id)data;

@end

@interface WYAPhotoTypeView : UIView

@property (nonatomic, weak) id<ImageTypeDelegate> delegate;

- (void)reload;
@end
