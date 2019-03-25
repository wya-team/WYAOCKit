//
//  WYAImageComposeTemplatePoints.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageComposeTemplatePoints : NSObject
+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize;
@end

NS_ASSUME_NONNULL_END
