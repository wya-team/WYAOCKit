//
//  UIScrollView+Category.m
//  WYAKit
//
//  Created by 李世航 on 2019/7/27.
//

#import "UIScrollView+Category.h"

@implementation UIScrollView (Category)

- (UIImage *)wya_captureScrollView
{
    UIImage * viewImage      = nil;
    UITableView * scrollView = self;

    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.opaque, 0.0);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame          = scrollView.frame;

        scrollView.contentOffset = CGPointZero;
        scrollView.frame         = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);

        [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();

        scrollView.contentOffset = savedContentOffset;
        scrollView.frame         = savedFrame;
    }
    UIGraphicsEndImageContext();
    return viewImage;
}

@end
