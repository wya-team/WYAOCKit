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

+ (NSArray *)templateEightOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 6 * 5),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 6),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 6 * 5),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 6 * 5),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 6 * 5),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
//                 @{
//                     @"point_x" : @(point_x),
//                     @"point_y" : @(height / 6),
//                     },
//                 @{
//                     @"point_x" : @(width / 20 * 11),
//                     @"point_y" : @(height / 5 * 2),
//                     },
//                 @{
//                     @"point_x" : @(width / 5 * 2),
//                     @"point_y" : @(height),
//                     },
//                 @{
//                     @"point_x" : @(point_x),
//                     @"point_y" : @(height),
//                     },
//                 @{
//                     @"point_x" : @(point_x),
//                     @"point_y" : @(height / 6),
//                     },
                 ],
             @[
//                 @{
//                     @"point_x" : @(width / 20 * 9),
//                     @"point_y" : @(height / 5 * 3),
//                     },
//                 @{
//                     @"point_x" : @(width),
//                     @"point_y" : @(height / 6 * 5),
//                     },
//                 @{
//                     @"point_x" : @(width),
//                     @"point_y" : @(height),
//                     },
//                 @{
//                     @"point_x" : @(width / 5 * 2),
//                     @"point_y" : @(height),
//                     },
//                 @{
//                     @"point_x" : @(width / 20 * 9),
//                     @"point_y" : @(height / 5 * 3),
//                     },
                 ],
             ];
}

+ (NSArray *)templateNineOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     }
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
                     @"point_y" : @(height / 2),
                     }
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
                     }
                 ],
             ];
}

+ (NSArray *)templateTenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 3 * 2),
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
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(point_x),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 3 * 2),
                     }
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
                     }
                 ],
             ];
}

+ (NSArray *)templateElevenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
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
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     }
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
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     }
                 ],
             ];
}

+ (NSArray *)templateTwelveOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
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
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
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
                     }
                 ],
             ];
}

+ (NSArray *)templateThirteenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 2),
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
                     @"point_y" : @(point_x),
                     }
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
                     }
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
                     }
                 ],
             ];
}

+ (NSArray *)templateFourteenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(point_x),
                     }
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
                     }
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
                     }
                 ],
             ];
}

+ (NSArray *)templateFifteenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
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
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height),
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
                     }
                 ],
             ];
}

+ (NSArray *)templateSixteenOfFourWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 3 * 2),
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
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(point_x),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(width / 3),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 3),
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
                     @"point_y" : @(height / 3),
                     }
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

+ (NSArray *)templateTwoOfFiveWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThreeOfFiveWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFourOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 2),
                     },
                 ],
             ];
}

+ (NSArray *)templateFiveOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3),
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
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
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
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3 * 2),
                     },
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
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
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
             ];
}

+ (NSArray *)templateSixOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 3),
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
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
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
                     @"point_y" : @(height / 3 * 2),
                     },
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
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
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
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3),
                     },
                 ],
             ];
}

+ (NSArray *)templateSevenOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 3),
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
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 2),
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
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3),
                     },
                 ],
             ];
}

+ (NSArray *)templateEightOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 3 * 2),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
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
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3),
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
                     @"point_x" : @(width / 3),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
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
             ];
}

+ (NSArray *)templateNineOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 4 * 3),
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
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 4),
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
                     @"point_y" : @(height / 4),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
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
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4),
                     },
                 ],
             ];
}

+ (NSArray *)templateTenOfFiveWithTemplateSize:(CGSize)templateSize {
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
             @[
                 @{
                     @"point_x" : @(point_x),
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

+ (NSArray *)templateElevenOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 8 * 3),
                     @"point_y" : @(height / 8 * 3),
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
                     @"point_x" : @(width / 8 * 5),
                     @"point_y" : @(height / 8 * 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
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
                     @"point_x" : @(width / 8 * 5),
                     @"point_y" : @(height / 8 * 5),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
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
                     @"point_x" : @(width / 8 * 3),
                     @"point_y" : @(height / 8 * 5),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 8 * 3),
                     @"point_y" : @(height / 8 * 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 8 * 5),
                     @"point_y" : @(height / 8 * 3),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 8 * 5),
                     @"point_y" : @(height / 8 * 5),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 8 * 3),
                     @"point_y" : @(height / 8 * 5),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     },
                 ],
             ];
}

+ (NSArray *)templateTwelveOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width),
                     @"point_y" : @(height / 3),
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
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 3),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 3 * 2),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 ],
             ];
}

+ (NSArray *)templateThirteenOfFiveWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
             @[
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4),
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
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 4 * 3),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 4 * 3),
                     },
                 ],
             ];
}

+ (NSArray *)templateFourteenOfFiveWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
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
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height),
                     }
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
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     }
                 ],
             @[
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 4),
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

+ (NSArray *)templateTwoOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThreeOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFourOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFiveOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSixOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSevenOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateEightOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateNineOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTenOfSixWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTwoOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThreeOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFourOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFiveOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSixOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSevenOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateEightOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateNineOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTenOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateElevenOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTwelveOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThirteenOfSevenWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTwoOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThreeOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFourOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFiveOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSixOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSevenOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateEightOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateNineOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTenOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateElevenOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTwelveOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThirteenOfEightWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateOneOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateThreeOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFourOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateFiveOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSixOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateSevenOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateEightOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateNineOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateTenOfNineWithTemplateSize:(CGSize)templateSize {
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

+ (NSArray *)templateElevenOfNineWithTemplateSize:(CGSize)templateSize {
    CGFloat width   = templateSize.width;
    CGFloat height  = templateSize.height;
    CGFloat point_x = 0;
    return @[
             @[
                 @{
                     @"point_x" : @(width / 4),
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

+ (NSArray *)templateTwelveOfNineWithTemplateSize:(CGSize)templateSize {
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
                     @"point_y" : @(height / 9 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
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
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 9 * 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
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
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 4 * 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 2),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 9 * 7),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
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
                 ],
             @[
                 @{
                     @"point_x" : @(point_x),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 9 * 7),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3 * 2),
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
                     @"point_x" : @(point_x),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
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
                     @"point_y" : @(height / 9 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 9 * 7),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 9 * 2),
                     },
                 ],
             ];
}

+ (NSArray *)templateThirteenOfNineWithTemplateSize:(CGSize)templateSize {
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
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 4),
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
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3 * 2),
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
                     @"point_y" : @(height / 3 * 2),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height),
                     },
                 @{
                     @"point_x" : @(width / 4),
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
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 2),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3 * 2),
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
                     @"point_y" : @(height / 3 * 2),
                     },
                 ],
             @[
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
                 ],
             @[
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
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
                 ],
             @[
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width),
                     @"point_y" : @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(point_x),
                     },
                 @{
                     @"point_x" : @(width / 4 * 3),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(height / 3 * 2),
                     },
                 @{
                     @"point_x" : @(width / 4),
                     @"point_y" : @(point_x),
                     },
                 ],
             ];
}
@end
