//
//  NSAttributedString+Category.m
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSAttributedString+Category.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (Category)
- (CGFloat)wya_heightWithContainWidth:(CGFloat)width {
    int total_height = 0;
    CTFramesetterRef framesetter =
        CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    CGRect drawingRect    = CGRectMake(0, 0, width, 100000);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);

    NSArray * linesArray = (NSArray *)CTFrameGetLines(textFrame);
    if (linesArray.count == 0) return 0;
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    int line_y = (int)origins[[linesArray count] - 1].y;
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    CTLineRef line = (__bridge CTLineRef)[linesArray wya_safeObjectAtIndex:[linesArray count] - 1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);

    total_height = 100000 - line_y + (int)descent + 1;
    CFRelease(textFrame);
    return total_height;
}
@end
