//
//  WYAImageComposeTemplatePoints.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/19.
//

#import "WYAImageComposeTemplatePoints.h"

@implementation WYAImageComposeTemplatePoints
#pragma mark - 一图
+ (NSArray *)templateOneOfOneWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfOneWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfOneWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfOneWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = 200;
    CGFloat point_x = templateSize.width / 4;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + width / 2),
               @"point_y" : @(point_x + width),
           },
           @{
               @"point_x" : @(point_x + width),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

#pragma mark - 二图
+ (NSArray *)templateOneOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfTwoWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfTwoWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 5 + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 5 + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           }
        ],
    ];
}

+ (NSArray *)templateNineOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 5 + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 5 + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           }
        ],
    ];
}

+ (NSArray *)templateTenOfTwoWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
    ];
}

#pragma mark - 三图
+ (NSArray *)templateOneOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourteenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFifteenOfThreeWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFifteenOfThreeWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 1.5),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 1.5),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 1.5),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin * 1.5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(height - margin),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 4),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 4),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 4),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 4),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwelveOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 * 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateThirteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
    ];
}

+ (NSArray *)templateFifteenOfThreeWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2.5),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 1.5),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin * 2.5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin),
           },
        ],
    ];
}

#pragma mark - 四图
+ (NSArray *)templateOneOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourteenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFifteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFifteenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixteenOfFourWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixteenOfFourWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 5 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 414 * 230 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 414 * 184 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 414 * 184 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 414 * 230 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 3),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin * 3),
               @"point_y" : @(height / 2 - margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 3),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 3),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin * 3),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
    ];
}

+ (NSArray *)templateTenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           }
        ],
    ];
}

+ (NSArray *)templateElevenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 3),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 3),
           }
        ],
    ];
}

+ (NSArray *)templateTwelveOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 3),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           }
        ],
    ];
}

+ (NSArray *)templateThirteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           }
        ],
    ];
}

+ (NSArray *)templateFourteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
    ];
}

+ (NSArray *)templateFifteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height - margin),
           }
        ],
    ];
}

+ (NSArray *)templateSixteenOfFourWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           }
        ],
    ];
}

#pragma mark - 五图
+ (NSArray *)templateOneOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourteenOfFiveWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourteenOfFiveWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 3),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 6 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin * 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin),
           },
           @{
               @"point_x" : @(width / 6 * 5 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin * 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 6 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin),
           },
           @{
               @"point_x" : @(width / 6 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 6),
           },
           @{
               @"point_x" : @(width / 6 * 5),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 6 * 5),
           },
           @{
               @"point_x" : @(width / 6),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 6),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 8 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height / 8 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 7 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 + margin / 2),
               @"point_y" : @(height / 8 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 8 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 8 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 + margin / 2),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 7 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 8 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 8 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 8 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 8 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 - margin / 2),
               @"point_y" : @(height / 8 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 7 - margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 - margin / 2),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 8 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 + margin / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwelveOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
    ];
}

+ (NSArray *)templateThirteenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3 - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3),
           },
        ],
    ];
}

+ (NSArray *)templateFourteenOfFiveWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin),
               @"point_y" : @(height / 4 + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin),
               @"point_y" : @(height / 4 + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin),
               @"point_y" : @(height / 4 * 3 - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin),
               @"point_y" : @(height / 4 * 3 - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin),
               @"point_y" : @(height / 4 + margin),
           },
        ],
    ];
}

#pragma mark - 六图
+ (NSArray *)templateOneOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfSixWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfSixWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 7 * 5 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 7 * 4 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 7 * 5 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 4 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 5 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 4 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 7 * 4 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 4 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 7 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 7 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 7 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 7 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfSixWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

#pragma mark - 七图
+ (NSArray *)templateOneOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfSevenWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfSevenWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}
#pragma mark ======= 缩放功能模板写到这里了（2019-08-19）
+ (NSArray *)templateSixOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 8 * 5 - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 3),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 8 * 3 + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 8 * 5 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwelveOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThirteenOfSevenWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

#pragma mark - 八图
// 适用于运行时，用于接收对象参数
+ (NSArray *)templateOneOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfEightWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfEightWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 1.5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 1.5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 1.5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 1.5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 4),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 8 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 8 * 5 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 8 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 8 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 5 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 5 * 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 5 * 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width / 5 + margin / 2),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width / 5 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 * 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 5 + margin / 2),
           }
        ],
    ];
}

+ (NSArray *)templateTwelveOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 1.5),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 1.5),
           }
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 1.5),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width - margin * 1.5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 1.5),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 1.5),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 1.5),
           },
           @{
               @"point_x" : @(width / 2 - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 1.5),
           }
        ],
    ];
}

+ (NSArray *)templateThirteenOfEightWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

#pragma mark - 九图
+ (NSArray *)templateOneOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateOneOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwoOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwoOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThreeOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThreeOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFourOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFourOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateFiveOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateFiveOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSixOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSixOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateSevenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateSevenOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateEightOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateEightOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateNineOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateNineOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTenOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateElevenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateElevenOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateTwelveOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateTwelveOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateThirteenOfNineWithTemplateSizeString:(NSString *)templateSizeString marginNumber:(NSNumber *)marginNumber
{
    return [self templateThirteenOfNineWithTemplateSize:CGSizeFromString(templateSizeString) margin:marginNumber.floatValue];
}

+ (NSArray *)templateOneOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 * 2 - 10),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - 10),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - 5),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 - 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 - 5),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 + 5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + 5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 + 5),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - 10),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height / 3 * 2 - 10),
           },
           @{
               @"point_x" : @(width / 3 - 5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - 10),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2 - 5),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width / 3 * 2 - 5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2 + 5),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 - 5),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + 5),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - 5),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - 5),
               @"point_y" : @(height / 3 * 2 + 5),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height / 3 + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 3),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ]
    ];
}

+ (NSArray *)templateNineOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           // 1
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 12 * 5 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 12 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
        ],
        @[
           // 2
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 12 * 7 - margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 5 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           // 3
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 12 * 5 - margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 7 + margin / 2),
               @"point_y" : @(height / 4 - margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           // 4
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 12 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 12 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           // 5
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 12 * 7 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 12 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           // 6
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 12 * 5 + margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 7 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           // 7
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 12 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 5 - margin / 2),
               @"point_y" : @(height / 4 * 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           // 8
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 12 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 12 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           // 9
           @{
               @"point_x" : @(width / 12 * 5 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 7 - margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 12 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 12 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 7 - margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 5 + margin / 2),
               @"point_y" : @(height / 4 * 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 12 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 12 * 5 + margin / 2),
           },
           @{
               @"point_x" : @(width / 12 * 5 + margin / 2),
               @"point_y" : @(height / 4 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwelveOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 9 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 - margin / 4 * 3),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 9 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 9 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin),
           },
           @{
               @"point_x" : @(width - margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 9 * 7 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin * 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin * 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 - margin / 4),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 9 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 9 * 7 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 9 * 2 + margin / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThirteenOfNineWithTemplateSize:(CGSize)templateSize margin:(CGFloat)margin
{
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(point_x + margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 2 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 2 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height - margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height - margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 + margin / 2),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(height / 3 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 * 3 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width - margin),
               @"point_y" : @(point_x + margin),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(point_x + margin),
           },
           @{
               @"point_x" : @(width / 4 * 3 - margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(height / 3 * 2 - margin / 2),
           },
           @{
               @"point_x" : @(width / 4 + margin / 2),
               @"point_y" : @(point_x + margin),
           },
        ],
    ];
}
@end
