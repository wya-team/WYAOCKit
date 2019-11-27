//
//  WYAImageComposeTemplateStyleOneForTwo.m
//  WYAKit
//
//  Created by 李世航 on 2019/3/13.
//

#import "WYAImageComposeTemplate.h"
#import "WYAImageClipTemplate.h"
#import "WYAImageComposeView.h"

@interface WYAImageComposeTemplate ()
@property (nonatomic, strong) NSArray * templates;

@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) WYAImageClipTemplate * exchangeTemplate;
@property (nonatomic, assign) BOOL isExchange;
@end

@implementation WYAImageComposeTemplate

- (void)layoutSubviews
{
    [super layoutSubviews];

    for (WYAImageClipTemplate * template in self.templates) {
        template.frame = self.bounds;
    }
}

#pragma mark - Public Method
- (instancetype)initWithPoints:(NSArray *)points images:(NSArray *)images
{
    self = [super init];
    if (self) {
        self.points     = points;
        self.images     = images;
        self.isExchange = NO;
    }
    return self;
}

- (void)wya_templatePath
{
    for (NSInteger index = 0; index < self.templates.count; index++) {
        [self templateViewWithView:self.templates[index] points:self.points[index] isTemplatePath:YES];
    }
}

- (void)wya_templateView
{
    for (NSInteger index = 0; index < self.templates.count; index++) {
        [self templateViewWithView:self.templates[index] points:self.points[index] isTemplatePath:NO];
    }
}

#pragma mark ======= Private Method
- (void)templateViewWithView:(WYAImageClipTemplate *)view points:(NSArray *)points isTemplatePath:(BOOL)isTemplatePath
{
    [view addCoverLayerWithPoints:points isTemplatePath:isTemplatePath];
}

- (void)templateAnimationWithView:(WYAImageClipTemplate *)view point:(CGPoint)point panChange:(BOOL)panChange
{
    if (panChange == NO) {
        // 已结束
        NSLog(@"手势结束");
        if (self.isExchange == YES) {
            UIImage * image             = view.image;
            UIImage * lastImage         = self.exchangeTemplate.image;
            view.image                  = lastImage;
            self.exchangeTemplate.image = image;
            view.resetImageFrame        = YES;
            if (self.exchangeTemplate) {
                [self.exchangeTemplate wya_templateRemoveAnimationPath];
            }
            self.isExchange = NO;
        } else {
            view.resetImageFrame = NO;
        }

        return;
    }

    for (WYAImageClipTemplate * template in self.templates) {
        if (template != view) {
            // 当前所在的模板和原来的模板不是同一个
            NSLog(@"\n当前便利的视图==%p,\n手势点击的视图==%p,\n要交换图片的视图==%p", template, view, self.exchangeTemplate);
            //            NSLog(@"\npoint==%@,\ntemplatePoints==%@",NSStringFromCGPoint(point),template.templatePoints);
            if (CGPathContainsPoint(template.pathRef, NULL, point, NO)) {
                // 当前手势滑到的区域
                self.isExchange = YES;
                if (template.haveAnimationShapeLayer == NO) {
                    NSLog(@"只执行了一次");
                    [template wya_templateAddAnimationPath];
                    self.exchangeTemplate = template;
                    return;
                }
            } else {
                if (template.haveAnimationShapeLayer) {
                    NSLog(@"就是这个图片");
                    [template wya_templateRemoveAnimationPath];
                    self.isExchange = NO;
                    return;
                }
            }
        } else {
        }
    }
}

#pragma mark ======= Setter
- (void)setPoints:(NSArray *)points
{
    _points = points;
    if (points) {
        for (WYAImageClipTemplate * template in self.templates) {
            [self addSubview:template];
        }
    }
}

- (void)setImages:(NSArray *)images
{
    if (images) {
        for (NSInteger index = 0; index < images.count; index++) {
            WYAImageClipTemplate * template = self.templates[index];
            template.image                  = images[index];
        }
    }
}

#pragma mark ======= Getter
- (NSArray *)templates
{
    if (!_templates) {
        WeakSelf(weakSelf);
        NSMutableArray * array = [NSMutableArray array];
        for (id obj in self.points) {
            WYAImageClipTemplate * template = [[WYAImageClipTemplate alloc] init];
            //            template.backgroundColor = randomColor;
            template.panClick = ^(CGPoint point, WYAImageClipTemplate * _Nonnull view, BOOL panIsChange) {
                [weakSelf templateAnimationWithView:view point:point panChange:panIsChange];
            };
            [array addObject:template];
        }
        _templates = [array copy];
        [array removeAllObjects];
    }
    return _templates;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
