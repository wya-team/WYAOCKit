//
//  WYAImageComposeTemplatePoints.h
//  WYAKit
//
//  Created by 李世航 on 2019/3/19.
//
//  模板数据依照微商水印相机顺序依次起名

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAImageComposeTemplatePoints : NSObject

// 一图
+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize;

// 二图
+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateThreeOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFourOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFiveOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSixOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSevenOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateEightOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateNineOfTwoWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTenOfTwoWithTemplateSize:(CGSize)templateSize;

// 三图
+ (NSArray *)templateOneOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateThreeOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFourOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFiveOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSixOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSevenOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateEightOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateNineOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTenOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateElevenOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwelveOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateThirteenOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFourteenOfThreeWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFifteenOfThreeWithTemplateSize:(CGSize)templateSize;

// 四图
+ (NSArray *)templateOneOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateTwoOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateThreeOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFourOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateFiveOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSixOfFourWithTemplateSize:(CGSize)templateSize;
+ (NSArray *)templateSevenOfFourWithTemplateSize:(CGSize)templateSize;

// 五图
+ (NSArray *)templateOneOfFiveWithTemplateSize:(CGSize)templateSize;

// 六图
+ (NSArray *)templateOneOfSixWithTemplateSize:(CGSize)templateSize;

// 七图
+ (NSArray *)templateOneOfSevenWithTemplateSize:(CGSize)templateSize;

// 八图
+ (NSArray *)templateOneOfEightWithTemplateSize:(CGSize)templateSize;

// 九图
+ (NSArray *)templateTwoOfNineWithTemplateSize:(CGSize)templateSize;
@end

NS_ASSUME_NONNULL_END
