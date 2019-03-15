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
@property(nonatomic, strong) NSArray * leftPoints;
@property(nonatomic, strong) WYAImageClipTemplate * leftTemplate;
@property(nonatomic, strong) WYAImageComposeView * leftImageView;

@property(nonatomic, strong) NSArray * rightPoints;
@property(nonatomic, strong) WYAImageClipTemplate * rightTemplate;
@property(nonatomic, strong) WYAImageComposeView * rightImageView;
@end

@implementation WYAImageComposeTemplateStyleOneForTwo

- (instancetype)init
{
    self = [super init];
    if (self) {
        WeakSelf(weakSelf);
        self.leftTemplate = [[WYAImageClipTemplate alloc]init];
        [self addSubview:self.leftTemplate];

        self.leftImageView = [[WYAImageComposeView alloc] init];
        [self.leftTemplate addSubview:self.leftImageView];
        self.leftImageView.panClick = ^(CGPoint point, UIView * _Nonnull view) {
            [weakSelf templateAnimationWithView:view point:point];
        };

        self.rightTemplate = [[WYAImageClipTemplate alloc]init];
        [self addSubview:self.rightTemplate];

        self.rightImageView = [[WYAImageComposeView alloc] init];
        [self.rightTemplate addSubview:self.rightImageView];
        self.rightImageView.panClick = ^(CGPoint point, UIView * _Nonnull view) {
            [weakSelf templateAnimationWithView:view point:point];
        };
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat leftTemplate_x = 0;
    CGFloat leftTemplate_y = 0;
    CGFloat leftTemplate_width = self.cmam_width / 2;
    CGFloat leftTemplate_height = self.cmam_height;
    CGRect leftTemplate_rect = CGRectMake(leftTemplate_x, leftTemplate_y,  leftTemplate_width, leftTemplate_height);
    self.leftTemplate.frame = leftTemplate_rect;
    self.leftImageView.frame = self.leftTemplate.bounds;

    CGFloat rightTemplate_x = self.cmam_width / 2;
    CGFloat rightTemplate_y = 0;
    CGFloat rightTemplate_width = self.cmam_width / 2;
    CGFloat rightTemplate_height = self.cmam_height;
    CGRect rightTemplate_rect = CGRectMake(rightTemplate_x, rightTemplate_y,  rightTemplate_width, rightTemplate_height);
    self.rightTemplate.frame = rightTemplate_rect;
    self.rightImageView.frame = self.rightTemplate.bounds;
}

- (void)wya_templatePath{
    [self templateViewWithView:self.leftTemplate points:self.leftPoints isTemplatePath:YES];
    [self templateViewWithView:self.rightTemplate points:self.rightPoints isTemplatePath:YES];
    self.leftImageView.hidden = YES;
    self.rightImageView.hidden = YES;
}

- (void)wya_templateView{
    [self templateViewWithView:self.leftTemplate points:self.leftPoints isTemplatePath:NO];
    [self templateViewWithView:self.rightTemplate points:self.rightPoints isTemplatePath:NO];
    self.leftImageView.hidden = NO;
    self.rightImageView.hidden = NO;
}

#pragma mark ======= Private Method
- (void)templateViewWithView:(WYAImageClipTemplate *)view points:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath{
    [view addCoverLayerWithPoints:points isTemplatePath:isTemplatePath];
}

- (void)templateAnimationWithView:(UIView *)view point:(CGPoint)point{
    [self.leftTemplate wya_templateAnimationWithView:view point:point];
}

#pragma mark ======= Setter
- (void)setLeftImage:(UIImage *)leftImage{
    self.leftImageView.image = leftImage;
}

- (void)setRightImage:(UIImage *)rightImage{
    self.rightImageView.image = rightImage;
}

#pragma mark ======= Getter
- (NSArray *)leftPoints{
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
                 @"point_x": @(width / 2),
                 @"point_y": @(height),
                 },
             @{
                 @"point_x": @(width / 2),
                 @"point_y": @(point_x),
                 },
             @{
                 @"point_x": @(point_x),
                 @"point_y": @(point_x),
                 },
             ];
}

- (NSArray *)rightPoints{
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
                 @"point_x": @(width / 2),
                 @"point_y": @(height),
                 },
             @{
                 @"point_x": @(width / 2),
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
