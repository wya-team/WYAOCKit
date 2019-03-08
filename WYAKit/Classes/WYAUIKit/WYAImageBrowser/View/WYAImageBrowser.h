//
//  WYABannerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageBrowser : UIView

@property (nonatomic, strong) NSArray<UIImage *> * images;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) UIColor * pageControlNormalColor;
@property (nonatomic, strong) UIColor * pageControlSelectColor;
@property (nonatomic, copy) void(^imageSelectBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
