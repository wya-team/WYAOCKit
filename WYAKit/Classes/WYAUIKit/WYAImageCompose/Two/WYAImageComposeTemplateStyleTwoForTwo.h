//
//  WYAImageComposeTemplateStyleTwoForTwo.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageComposeTemplateStyleTwoForTwo : UIView
@property(nonatomic, strong) UIImage * topImage;
@property(nonatomic, strong) UIImage * bottomImage;
- (void)wya_templatePath;
- (void)wya_templateView;
@end

NS_ASSUME_NONNULL_END
