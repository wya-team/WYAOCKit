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

/**************************** 一图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfOneWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfOneWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 二图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 三图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFifteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFifteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 四图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFifteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFifteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 五图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourteenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourteenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 六图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 七图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 八图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;

/**************************** 九图 ****************************/
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwoOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThreeOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFourOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateFiveOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSixOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateSevenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateEightOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateNineOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateElevenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateTwelveOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
+ (NSArray *)templateThirteenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber;
// 直接调用
+ (NSArray *)templateOneOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwoOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThreeOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFourOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateFiveOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSixOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateSevenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateEightOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateNineOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateElevenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateTwelveOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
+ (NSArray *)templateThirteenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin;
@end

NS_ASSUME_NONNULL_END
