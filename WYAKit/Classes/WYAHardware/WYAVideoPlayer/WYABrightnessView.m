//
//  WYABrightnessView.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/7.
//

#import "WYABrightnessView.h"

@interface WYABrightnessView ()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIView * gridView;
@property (nonatomic, strong) NSMutableArray * tips;
@end

@implementation WYABrightnessView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(20*SizeAdapter);
    }];
    
    [self.gridView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(10*SizeAdapter);
    }];
    
    [self.gridView.subviews wya_mas_distributeSudokuViewsWithFixedLineSpacing:0 fixedInteritemSpacing:1 warpCount:10 topSpacing:1 bottomSpacing:1 leadSpacing:1 tailSpacing:1];
}

#pragma mark - Private Method -
- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5.f;
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.gridView];
    
    for (NSInteger index = 0; index<10; index++) {
        UIView * view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 2.f;
        view.layer.masksToBounds = YES;
        [self.gridView addSubview:view];
        [self.tips addObject:view];
    }
    
    [[UIScreen mainScreen] addObserver:self forKeyPath:@"brightness" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)setScreenBridghtnessNumber:(CGFloat)number{
    CGFloat stage = 0.1;
    NSInteger level = number / stage;
    
    for (int i = 0; i < self.tips.count; i++) {
        UIView *view = self.tips[i];
        
        if (i <= level) {
            view.hidden = NO;
        } else {
            view.hidden = YES;
        }
    }
}

- (void)appearSoundView {
    if (self.alpha == 0.0) {
        self.alpha = 1.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self disAppearSoundView];
        });
    }
}

- (void)disAppearSoundView {
    
    if (self.alpha == 1.0) {
        [UIView animateWithDuration:0.8 animations:^{
            self.alpha = 0.0;
        }];
    }
}

#pragma mark - KVO  -
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"brightness"]) {
        CGFloat number = [change[@"new"] floatValue];
        [self setScreenBridghtnessNumber:number];
        [self appearSoundView];
    }
}


#pragma mark - Setter -


#pragma mark - Getter -
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"亮度";
            object.textColor = [UIColor blackColor];
            object.font = FONT(15);
            object.textAlignment = NSTextAlignmentCenter;
            object;
        });
    }
    return _titleLabel;
}

- (UIView *)gridView{
    if(!_gridView){
        _gridView = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor grayColor];
            object;
        });
    }
    return _gridView;
}

- (NSMutableArray *)tips{
    if(!_tips){
        _tips = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
        });
    }
    return _tips;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
