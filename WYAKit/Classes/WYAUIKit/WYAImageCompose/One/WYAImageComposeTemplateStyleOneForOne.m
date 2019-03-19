//
//  WYAImageComposeTemplateStyleOneForOne.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import "WYAImageComposeTemplateStyleOneForOne.h"
#import "WYAImageClipTemplate.h"

@interface WYAImageComposeTemplateStyleOneForOne ()
@property(nonatomic, strong) NSArray * points;
@property(nonatomic, strong) WYAImageClipTemplate * template;

@end

@implementation WYAImageComposeTemplateStyleOneForOne

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.template = [[WYAImageClipTemplate alloc]init];
        [self addSubview:self.template];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.template.frame = self.bounds;
}

- (void)wya_templatePath{
    [self templateViewWithPoints:self.points isTemplatePath:YES];
}

- (void)wya_templateView{
    [self templateViewWithPoints:self.points isTemplatePath:NO];
}

#pragma mark ======= Private Method
- (void)templateViewWithPoints:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{
    [self.template addCoverLayerWithPoints:points isTemplatePath:isTemplatePath];
}

#pragma mark ======= Setter
-(void)setImage:(UIImage *)image{
    self.template.image = image;
}

#pragma mark ======= Getter
- (NSArray *)points{
    CGFloat width = self.cmam_width;
    CGFloat height = self.cmam_height;
    CGFloat point_x = 0;
    return @[
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
             ];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
