//
//  WYAImageComposeTemplateStyleTwoForTwo.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import "WYAImageComposeTemplateStyleTwoForTwo.h"
#import "WYAImageClipTemplate.h"
#import "WYAImageComposeView.h"

@interface WYAImageComposeTemplateStyleTwoForTwo ()

@property(nonatomic, strong) NSArray * topPoints;
@property(nonatomic, strong) WYAImageClipTemplate * topTemplate;
@property(nonatomic, strong) WYAImageComposeView * topImageView;

@property(nonatomic, strong) NSArray * bottomPoints;
@property(nonatomic, strong) WYAImageClipTemplate * bottomTemplate;
@property(nonatomic, strong) WYAImageComposeView * bottomImageView;
@end

@implementation WYAImageComposeTemplateStyleTwoForTwo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.topTemplate = [[WYAImageClipTemplate alloc]init];
        [self addSubview:self.topTemplate];

        self.topImageView = [[WYAImageComposeView alloc] init];
        [self.topTemplate addSubview:self.topImageView];

        self.bottomTemplate = [[WYAImageClipTemplate alloc]init];
        [self addSubview:self.bottomTemplate];

        self.bottomImageView = [[WYAImageComposeView alloc] init];
        [self.bottomTemplate addSubview:self.bottomImageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat topTemplate_x = 0;
    CGFloat topTemplate_y = 0;
    CGFloat topTemplate_width = self.cmam_width;
    CGFloat topTemplate_height = self.cmam_height / 2;
    CGRect topTemplate_rect = CGRectMake(topTemplate_x, topTemplate_y,  topTemplate_width, topTemplate_height);
    self.topTemplate.frame = topTemplate_rect;
    self.topImageView.frame = self.topTemplate.bounds;

    CGFloat bottomTemplate_x = 0;
    CGFloat bottomTemplate_y = self.cmam_height / 2;
    CGFloat bottomTemplate_width = self.cmam_width;
    CGFloat bottomTemplate_height = self.cmam_height / 2;
    CGRect bottomTemplate_rect = CGRectMake(bottomTemplate_x, bottomTemplate_y,  bottomTemplate_width, bottomTemplate_height);
    self.bottomTemplate.frame = bottomTemplate_rect;
    self.bottomImageView.frame = self.bottomTemplate.bounds;
}

- (void)wya_templatePath{
    [self templateViewWithView:self.topTemplate points:self.topPoints isTemplatePath:YES];
    [self templateViewWithView:self.bottomTemplate points:self.bottomPoints isTemplatePath:YES];
    self.topImageView.hidden = YES;
    self.bottomImageView.hidden = YES;
}

- (void)wya_templateView{
    [self templateViewWithView:self.topTemplate points:self.topPoints isTemplatePath:NO];
    [self templateViewWithView:self.bottomTemplate points:self.bottomPoints isTemplatePath:NO];
    self.topImageView.hidden = NO;
    self.bottomImageView.hidden = NO;
}

#pragma mark ======= Private Method
- (void)templateViewWithView:(WYAImageClipTemplate *)view points:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{
    [view addCoverLayerWithPoints:points isTemplatePath:isTemplatePath];
}

#pragma mark ======= Setter
- (void)setTopImage:(UIImage *)topImage{
    self.topImageView.image = topImage;
}

- (void)setBottomImage:(UIImage *)bottomImage{
    self.bottomImageView.image = bottomImage;
}

#pragma mark ======= Getter
- (NSArray *)topPoints{
    CGFloat width = self.cmam_width;
    CGFloat height = self.cmam_height;
    CGFloat point_x = 0;
    return @[
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
             ];
}

- (NSArray *)bottomPoints{
    CGFloat width = self.cmam_width;
    CGFloat height = self.cmam_height;
    CGFloat point_x = 0;
    return @[
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
