//
//  WYATextView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYATextViewDelegate <NSObject>

@optional
- (BOOL)wya_TextViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)wya_TextViewShouldEndEditing:(UITextView *)textView;

- (void)wya_TextViewDidBeginEditing:(UITextView *)textView;
- (void)wya_TextViewDidEndEditing:(UITextView *)textView;

- (BOOL)wya_TextView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)wya_TextViewDidChange:(UITextView *)textView;

- (void)wya_TextViewDidChangeSelection:(UITextView *)textView;

- (BOOL)wya_TextView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0);
- (BOOL)wya_TextView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0);

@end

@interface WYATextView : UIView

@property (nonatomic, weak) id<WYATextViewDelegate> wya_delegate;

@property (nonatomic, copy)   NSString * title;//标题
@property (nonatomic, assign) BOOL  showTitle; //default is YES
@property (nonatomic, assign) BOOL  showWordsCount; // default is YES
@property (nonatomic, assign) CGFloat  textViewMaxHeight;//最大高度
@property (nonatomic, assign) NSUInteger  textViewWordsCount;//最大字数
@property (nonatomic, readonly) UITextView * textView;
/**
 设置textView的PlaceHolder

 @param placeHoldString 文字
 @param placeHoldColor 颜色
 @param placeHoldFont 大小
 */
-(void)wya_PlaceHoldString:(NSString *)placeHoldString PlaceHoldColor:(UIColor *)placeHoldColor PlaceHoldFont:(CGFloat)placeHoldFont;

@end

NS_ASSUME_NONNULL_END
