//
//  WYAAdaptiveLatticeView.m
//  WYAKit
//
//  Created by 李世航 on 2019/6/18.
//

#import "WYAAdaptiveLatticeView.h"

@implementation WYAAdaptiveLatticeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
//        [self configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//            layout.isEnabled = YES;
//            layout.flexDirection = YGFlexDirectionRow;
//            layout.justifyContent =  YGJustifyFlexStart;
//            layout.flexWrap = YGWrapWrap;
//        }];
    }
    return self;
}

- (void)addTitles:(NSArray *)titles{
    if (titles.count > 0) {
        __block UIButton * btn;
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * string = (NSString *)obj;
            UIButton *  object = [[UIButton alloc]init];
            [object setTitle:string forState:UIControlStateNormal];
            object.titleLabel.font = FONT(15);
            [object setBackgroundColor:randomColor];
            object.layer.cornerRadius = 8;
            object.layer.masksToBounds = YES;
            CGFloat width = [UILabel getWidthWithTitle:object.titleLabel.text font:object.titleLabel.font];
//            [object configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//                layout.isEnabled = YES;
//                layout.marginTop = YGPointValue(10);
//                layout.marginBottom = YGPointValue(10);
//                layout.marginLeft = YGPointValue(10);
//                layout.marginRight = YGPointValue(10);
//                layout.width = YGPointValue(width + 10);
//                layout.maxHeight = YGPointValue(44);
//            }];
            [self addSubview:object];
//            [self.yoga applyLayoutPreservingOrigin:YES];
            if (idx == titles.count - 1) {
                btn = object;
            }
        }];
        if (self.updateFrame) {
            [self setNeedsLayout];
            [self layoutIfNeeded];
            NSLog(@"frame==%@",NSStringFromCGRect(btn.frame));
            self.updateFrame(self, CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, btn.frame.origin.y + btn.frame.size.height));
        }
    }
}

@end
