//
//  WYAImageComposeTemplateStyleTwoForOne.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import "WYAImageComposeTemplateStyleTwoForOne.h"
#import "WYAImageClipTemplate.h"

@interface WYAImageComposeTemplateStyleTwoForOne ()
@property(nonatomic, strong) NSArray * points;
@property(nonatomic, strong) WYAImageClipTemplate * template;

@end

@implementation WYAImageComposeTemplateStyleTwoForOne

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
    CGFloat width = 200;
    CGFloat point_x = self.cmam_width/4;
    return @[
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
