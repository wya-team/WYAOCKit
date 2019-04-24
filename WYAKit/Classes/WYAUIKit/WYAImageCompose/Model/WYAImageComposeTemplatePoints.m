//
//  WYAImageComposeTemplatePoints.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/19.
//

#import "WYAImageComposeTemplatePoints.h"

@implementation WYAImageComposeTemplatePoints

+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = 200;
    CGFloat point_x = templateSize.width / 4;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x + width / 2),
               @"point_y" : @(point_x + width),
           },
           @{
               @"point_x" : @(point_x + width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 5 * 4),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 5),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 5),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 5 * 4),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           }
        ],
    ];
}

+ (NSArray *)templateNineOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 5 * 4),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 5),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           }
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 5),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 5 * 4),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           }
        ],
    ];
}

+ (NSArray *)templateTenOfTwoWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           }
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           }
        ],
    ];
}

+ (NSArray *)templateOneOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
        ],
        @[
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
        ],
    ];
}

+ (NSArray *)templateEightOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 4),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 3),
           },
        ],
    ];
}

+ (NSArray *)templateNineOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateTenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateElevenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwelveOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 7 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 7),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 7 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 7 * 6),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 7 * 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 7),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 7 * 3),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 7 * 6),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 7 * 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 7 * 6),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateThirteenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 7),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 7),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 7 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 6),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 3),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 6),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 7 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 7 * 6),
           },
        ],
    ];
}

+ (NSArray *)templateFourteenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
        ],
    ];
}

+ (NSArray *)templateFifteenOfThreeWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 4 * 3),
           },
        ],
    ];
}

+ (NSArray *)templateThreeOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
        ],
    ];
}

+ (NSArray *)templateFourOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 4),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 4 * 3),
               @"point_y" : @(point_x),
           },
        ],
    ];
}

+ (NSArray *)templateFiveOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateSixOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
        ],
    ];
}

+ (NSArray *)templateSevenOfFourWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 5 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 5 * 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 5 * 3),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 5 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 5 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 5 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 5 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfFiveWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfSixWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 2),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfSevenWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
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
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}

+ (NSArray *)templateOneOfEightWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 2),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 4 * 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 4 * 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 4 * 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 4 * 3),
           },
        ],
    ];
}

+ (NSArray *)templateTwoOfNineWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
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
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(point_x),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(point_x),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3),
           },
        ],
        @[
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(point_x),
               @"point_y" : @(height / 3 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3),
               @"point_y" : @(height / 3 * 2),
           },
        ],
        @[
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height / 3 * 2),
           },
           @{
               @"point_x" : @(width),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height),
           },
           @{
               @"point_x" : @(width / 3 * 2),
               @"point_y" : @(height / 3 * 2),
           },
        ],
    ];
}
@end
