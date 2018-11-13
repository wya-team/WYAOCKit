//
//  WYATextView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/13.
//

#import "WYATextView.h"

@interface WYATextView ()<UITextViewDelegate>
@property (nonatomic, copy)   NSString * lastPlaceHold;
@end

@implementation WYATextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        _textViewMaxHeight = 60.f;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        _textViewMaxHeight = 60.f;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(nullable NSTextContainer *)textContainer
{
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        self.delegate = self;
        _textViewMaxHeight = 60.f;
    }
    return self;
}

-(void)setPlaceHold:(NSString *)placeHold{
    self.text = placeHold;
    self.textColor = random(234, 234, 234, 1);
    self.lastPlaceHold = placeHold;
}

#pragma mark --- UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:self.lastPlaceHold]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewShouldBeginEditing:)]) {
        return [self.wya_delegate wya_TextViewShouldBeginEditing:textView];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:self.lastPlaceHold]) {
        textView.text = self.lastPlaceHold;
        textView.textColor = [UIColor blackColor];
    }
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewShouldEndEditing:)]) {
        return [self.wya_delegate wya_TextViewShouldEndEditing:textView];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidBeginEditing:)]) {
        [self.wya_delegate wya_TextViewDidBeginEditing:textView];
    }
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:self.lastPlaceHold]) {
        textView.text = @"";
    }
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidEndEditing:)]) {
        [self.wya_delegate wya_TextViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextView:shouldChangeTextInRange:replacementText:)]) {
        return [self.wya_delegate wya_TextView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidChange:)]) {
        [self.wya_delegate wya_TextViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidChangeSelection:)]) {
        [self.wya_delegate wya_TextViewDidChangeSelection:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextView:shouldInteractWithURL:inRange:interaction:)]) {
        return [self.wya_delegate wya_TextView:textView shouldInteractWithURL:URL inRange:characterRange interaction:interaction];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0){
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextView:shouldInteractWithTextAttachment:inRange:interaction:)]) {
        return [self.wya_delegate wya_TextView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange interaction:interaction];
    }
    return YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
