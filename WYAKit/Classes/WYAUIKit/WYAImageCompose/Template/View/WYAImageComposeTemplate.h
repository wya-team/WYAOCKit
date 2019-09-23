//
//  WYAImageComposeTemplateStyleOneForTwo.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageComposeTemplate : UIView
@property (nonatomic, strong) NSArray * points;
- (instancetype)initWithPoints:(NSArray *)points images:(NSArray *)images;

- (void)wya_templatePath;
- (void)wya_templateView;
@end

NS_ASSUME_NONNULL_END
