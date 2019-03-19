//
//  WYAImageComposeTemplateStyleOneForTwo.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import "WYAImageComposeTemplateStyleOneForTwo.h"
#import "WYAImageClipTemplate.h"
#import "WYAImageComposeView.h"

@interface WYAImageComposeTemplateStyleOneForTwo ()
@property (nonatomic, strong) NSArray * templates;
@property (nonatomic, strong) NSArray * points;

@end

@implementation WYAImageComposeTemplateStyleOneForTwo

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (WYAImageClipTemplate * template in self.templates) {
            [self addSubview:template];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat leftTemplate_x = 0;
//    CGFloat leftTemplate_y = 0;
//    CGFloat leftTemplate_width = self.cmam_width / 2;
//    CGFloat leftTemplate_height = self.cmam_height;
//    CGRect leftTemplate_rect = CGRectMake(leftTemplate_x, leftTemplate_y,  leftTemplate_width, leftTemplate_height);
//    WYAImageClipTemplate * leftTemplate = [self.templates firstObject];
//    leftTemplate.frame = leftTemplate_rect;
//
//    CGFloat rightTemplate_x = self.cmam_width / 2;
//    CGFloat rightTemplate_y = 0;
//    CGFloat rightTemplate_width = self.cmam_width / 2;
//    CGFloat rightTemplate_height = self.cmam_height;
//    CGRect rightTemplate_rect = CGRectMake(rightTemplate_x, rightTemplate_y,  rightTemplate_width, rightTemplate_height);
//    WYAImageClipTemplate * rightTemplate = [self.templates lastObject];
//    rightTemplate.frame = rightTemplate_rect;

    for (WYAImageClipTemplate * template in self.templates) {
        template.frame = self.bounds;
    }
}

- (void)wya_templatePath{
    for (NSInteger index = 0; index < self.templates.count; index++) {
        [self templateViewWithView:self.templates[index] points:self.points[index] isTemplatePath:YES];
    }

}

- (void)wya_templateView{
    for (NSInteger index = 0; index < self.templates.count; index++) {
        [self templateViewWithView:self.templates[index] points:self.points[index] isTemplatePath:NO];
    }
}

#pragma mark ======= Private Method
- (void)templateViewWithView:(WYAImageClipTemplate *)view points:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{
    [view addCoverLayerWithPoints:points isTemplatePath:isTemplatePath];
}

- (void)templateAnimationWithView:(WYAImageClipTemplate *)view point:(CGPoint)point panChange:(BOOL)panChange{

    WYAImageClipTemplate * lastTemplate;
    for (WYAImageClipTemplate * template in self.templates) {
        if (template != view) {
            if (CGPathContainsPoint(template.pathRef, NULL, point, NO)) {

                if (panChange == NO) {
                    // 已结束
//                    UIImage * image = view.image;
//                    UIImage * lastImage = template.image;
//                    view.image = lastImage;
//                    template.image = image;
                    // 现在移动结束后移除layer失败
                    if (template.animationShapeLayer) {
                        [template wya_templateRemoveAnimationPath];
                    }
                } else {
                    // 改变中
                }
                if (!template.animationShapeLayer) {
                    NSLog(@"只执行了一次");
                    [template wya_templateAddAnimationPath];
                    lastTemplate = template;
                }
                return;
            } else {
                if (template.animationShapeLayer) {
                    NSLog(@"就是这个图片");
                    [template wya_templateRemoveAnimationPath];

                }
                return;
            }
        } else {

        }

    }

}

#pragma mark ======= Setter
-(void)setImages:(NSArray *)images{
    if (images) {
        for (NSInteger index = 0; index < images.count; index++) {
            WYAImageClipTemplate * template = self.templates[index];
            template.image = images[index];
        }
    }
}

#pragma mark ======= Getter
- (NSArray *)points{
    CGFloat width = self.cmam_width;
    CGFloat height = self.cmam_height;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (NSArray *)templates{
    if(!_templates) {
        WeakSelf(weakSelf);
        WYAImageClipTemplate * leftTemplate = [[WYAImageClipTemplate alloc]init];
//        leftTemplate.backgroundColor = [UIColor redColor];
        leftTemplate.panClick = ^(CGPoint point, WYAImageClipTemplate * _Nonnull view, BOOL panIsChange) {
            [weakSelf templateAnimationWithView:view point:point panChange:panIsChange];
        };
        WYAImageClipTemplate * rightTemplate = [[WYAImageClipTemplate alloc]init];
//        rightTemplate.backgroundColor = [UIColor blueColor];
        rightTemplate.panClick = ^(CGPoint point, WYAImageClipTemplate * _Nonnull view, BOOL panIsChange) {
            [weakSelf templateAnimationWithView:view point:point panChange:panIsChange];
        };
        _templates = @[leftTemplate, rightTemplate];
    }
    return _templates;
}
@end
//  @[
//    @{
//        @"point_x": @(point_x),
//        @"point_y": @(point_x),
//        },
//    @{
//        @"point_x": @(point_x),
//        @"point_y": @(height),
//        },
//    @{
//        @"point_x": @(width / 2),
//        @"point_y": @(height),
//        },
//    @{
//        @"point_x": @(width / 2),
//        @"point_y": @(point_x),
//        },
//    @{
//        @"point_x": @(point_x),
//        @"point_y": @(point_x),
//        },
//    ],
