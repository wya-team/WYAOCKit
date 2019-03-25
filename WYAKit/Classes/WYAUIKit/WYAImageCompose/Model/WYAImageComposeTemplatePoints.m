//
//  WYAImageComposeTemplatePoints.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/19.
//

#import "WYAImageComposeTemplatePoints.h"

@implementation WYAImageComposeTemplatePoints

+ (NSArray *)templateOneOfOneWithTemplateSize:(CGSize)templateSize{
    CGFloat width = templateSize.width;
    CGFloat height = templateSize.height;
    CGFloat point_x = 0;
    return @[
             @[
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(height),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(height),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 ],
             ];
}

+ (NSArray *)templateTwoOfOneWithTemplateSize:(CGSize)templateSize{
    CGFloat width = 200;
    CGFloat point_x = templateSize.width / 4;
    return @[
             @[
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(point_x + width / 2),
                     @"point_y": @(point_x + width),
                     },
                 @{
                     @"point_x": @(point_x + width),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 ],
             ];
}

+ (NSArray *)templateOneOfTwoWithTemplateSize:(CGSize)templateSize{
    CGFloat width = templateSize.width;
    CGFloat height = templateSize.height;
    CGFloat point_x = 0;
    return  @[
              @[
                  @{
                      @"point_x": @(point_x),
                      @"point_y": @(point_x),
                      },
                  @{
                      @"point_x": @(width / 2),
                      @"point_y": @(point_x),
                      },
                  @{
                      @"point_x": @(width / 2),
                      @"point_y": @(height),
                      },
                  @{
                      @"point_x": @(point_x),
                      @"point_y": @(height),
                      },
                  @{
                      @"point_x": @(point_x),
                      @"point_y": @(point_x),
                      },
                  ],
              @[
                  @{
                      @"point_x": @(width / 2),
                      @"point_y": @(point_x),
                      },
                  @{
                      @"point_x": @(width),
                      @"point_y": @(point_x),
                      },
                  @{
                      @"point_x": @(width),
                      @"point_y": @(height),
                      },
                  @{
                      @"point_x": @(width / 2),
                      @"point_y": @(height),
                      },
                  @{
                      @"point_x": @(width / 2),
                      @"point_y": @(point_x),
                      },
                  ],
              ];
}

+ (NSArray *)templateTwoOfTwoWithTemplateSize:(CGSize)templateSize{
    CGFloat width = templateSize.width;
    CGFloat height = templateSize.height;
    CGFloat point_x = 0;
    return @[
             @[
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(point_x),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(height / 2),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(height / 2),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(point_x),
                     },
                 ],
             @[
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(height / 2),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(height / 2),
                     },
                 @{
                     @"point_x": @(width),
                     @"point_y": @(height),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(height),
                     },
                 @{
                     @"point_x": @(point_x),
                     @"point_y": @(height / 2),
                     },
                 ],
             ];
}
@end
