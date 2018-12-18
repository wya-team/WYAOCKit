//
//  WYAEditCameraCell.m
//  WYAKit_Example
//
//  Created by 李世航 on 2018/11/30.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import "WYAEditCameraCell.h"

@implementation WYAEditCameraCell
- (IBAction)buttonClick:(id)sender {
    NSLog(@"111");
    if (self.editBlock) {
        self.editBlock();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.layer.masksToBounds = YES;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == nil) {
        
        for (UIView *subView in self.contentView.subviews) {
            
            CGPoint myPoint = [subView convertPoint:point fromView:self];
            
            if (CGRectContainsPoint(subView.bounds, myPoint)) {
                    return subView;
            }
            
        }
        
    }
    
    return view;
    
}


@end
