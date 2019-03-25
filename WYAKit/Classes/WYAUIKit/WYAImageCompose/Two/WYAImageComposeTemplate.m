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
@property (nonatomic, strong) NSArray * points;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) WYAImageClipTemplate * lastTemplate;
@property (nonatomic, assign) BOOL isExchange;
@end

@implementation WYAImageComposeTemplate

- (instancetype)initWithPoints:(NSArray *)points images:(NSArray *)images
{
    self = [super init];
    if (self) {
        self.points = points;
        self.images = images;
        self.isExchange = NO;
        for (WYAImageClipTemplate * template in self.templates) {
            [self addSubview:template];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

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

    if (panChange == NO) {
        // 已结束
        if (self.isExchange == YES) {
            UIImage * image = view.image;
            UIImage * lastImage = self.lastTemplate.image;
            view.image = lastImage;
            self.lastTemplate.image = image;
            view.resetImageFrame = YES;
            if (self.lastTemplate) {
                [self.lastTemplate wya_templateRemoveAnimationPath];
            }
        }

        return;
    }

    for (WYAImageClipTemplate * template in self.templates) {
        if (template != view) {
            if (CGPathContainsPoint(template.pathRef, NULL, point, NO)) {

                if (!template.animationShapeLayer) {
                    NSLog(@"只执行了一次");
                    [template wya_templateAddAnimationPath];
                    self.lastTemplate = template;
                    self.isExchange = YES;
                }
                return;
            } else {
                if (template.animationShapeLayer) {
                    NSLog(@"就是这个图片");
                    [template wya_templateRemoveAnimationPath];
                    self.isExchange = NO;
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
- (NSArray *)templates{
    if(!_templates) {
        WeakSelf(weakSelf);
        NSMutableArray * array = [NSMutableArray array];
        for (id obj in self.points) {
            WYAImageClipTemplate * template = [[WYAImageClipTemplate alloc]init];
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
