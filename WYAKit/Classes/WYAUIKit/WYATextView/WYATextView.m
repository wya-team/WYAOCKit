//
//  WYATextView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/13.
//

#import "WYATextView.h"

@interface WYATextView () <UITextViewDelegate>

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * noteLabel;
@property (nonatomic, copy) NSString * placeHold; //占位文字
@property (nonatomic, strong) UIColor * placeHoldColor;
@property (nonatomic, assign) CGFloat placeHoldFont;

@property (nonatomic, copy) NSString * lastPlaceHold;
@end

@implementation WYATextView

- (instancetype)init {
    self = [super init];
    if (self) { [self createUI]; }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) { [self createUI]; }
    return self;
}

- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.noteLabel];
    [self addSubview:self.textView];

    self.showTitle          = YES;
    self.showWordsCount     = YES;
    self.textViewWordsCount = 0;
}

#pragma mark--- Private Method
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(self.mas_left).with.offset(5 * SizeAdapter);
        make.top.mas_equalTo(self.mas_top).with.offset(7 * SizeAdapter);
        make.size.mas_equalTo(CGSizeMake(40 * SizeAdapter, 20 * SizeAdapter));
    }];

    [self.noteLabel mas_remakeConstraints:^(MASConstraintMaker * make) {
        make.left.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_right).with.offset(-5 * SizeAdapter);
        make.height.mas_equalTo(20 * SizeAdapter);
    }];

    [self.textView mas_remakeConstraints:^(MASConstraintMaker * make) {
        if (self.showTitle == NO) {
            make.left.mas_equalTo(self.mas_left);
        } else {
            make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(0);
        }

        make.top.right.mas_equalTo(self);
        if (self.showWordsCount == YES) {
            make.bottom.mas_equalTo(self.noteLabel.mas_top);
        } else {
            make.bottom.mas_equalTo(self.mas_bottom);
        }

    }];
}

#pragma mark--- Public Method
- (void)wya_PlaceHoldString:(NSString *)placeHoldString
             PlaceHoldColor:(UIColor *)placeHoldColor
              PlaceHoldFont:(CGFloat)placeHoldFont {
    self.textView.text      = placeHoldString;
    self.lastPlaceHold      = placeHoldString;
    self.textView.textColor = placeHoldColor;
    self.placeHoldColor     = placeHoldColor;
    self.textView.font      = FONT(placeHoldFont);
    self.placeHoldFont      = placeHoldFont;
}

#pragma mark--- Setter
- (void)setTextViewMaxHeight:(float)textViewMaxHeight {
    _textViewMaxHeight = textViewMaxHeight;
}

- (void)setTextViewWordsCount:(NSUInteger)textViewWordsCount {
    _textViewWordsCount = textViewWordsCount;
    self.noteLabel.text = [NSString stringWithFormat:@"0/%lu", (unsigned long)textViewWordsCount];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    if (title) { self.titleLabel.text = title; }
}

- (void)setShowTitle:(BOOL)showTitle {
    _showTitle = showTitle;
    if (showTitle == NO) {
        self.titleLabel.hidden = YES;
    } else {
        self.titleLabel.hidden = NO;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setShowWordsCount:(BOOL)showWordsCount {
    _showWordsCount = showWordsCount;
    if (showWordsCount == NO) {
        self.noteLabel.hidden = YES;
    } else {
        self.noteLabel.hidden = NO;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text{
    if (text) {
        self.textView.text = text;
        self.noteLabel.text = [NSString
                               stringWithFormat:@"%ld/%ld", text.length, self.textViewWordsCount];
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    if (textColor) {
        self.textView.textColor = textColor;
    }
}

#pragma mark--- Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel               = [[UILabel alloc] init];
        _titleLabel.font          = FONT(15);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView          = [[UITextView alloc] init];
        _textView.delegate = self;
    }
    return _textView;
}

- (UILabel *)noteLabel {
    if (!_noteLabel) {
        _noteLabel               = [[UILabel alloc] init];
        _noteLabel.textColor     = random(153, 153, 153, 1);
        _noteLabel.font          = FONT(12);
        _noteLabel.textAlignment = NSTextAlignmentRight;
    }
    return _noteLabel;
}

- (NSString *)text{
    return self.textView.text;
}
#pragma mark--- UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:self.lastPlaceHold]) {
        textView.text      = @"";
        textView.textColor = [UIColor blackColor];
        textView.font      = FONT(17);
    } else {
        textView.textColor = self.textColor;
    }
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewShouldBeginEditing:)]) {
        return [self.wya_delegate wya_TextViewShouldBeginEditing:textView];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (textView.text.length < 1) {
        textView.text      = self.lastPlaceHold;
        textView.textColor = [UIColor blackColor];
        textView.font      = FONT(_placeHoldFont);
    } else {
        if ([textView.text isEqualToString:self.lastPlaceHold]) {
            textView.text      = self.lastPlaceHold;
            textView.textColor = [UIColor blackColor];
            textView.font      = FONT(_placeHoldFont);
        } else {
            textView.textColor = self.textColor;
        }
    }
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewShouldEndEditing:)]) {
        return [self.wya_delegate wya_TextViewShouldEndEditing:textView];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidBeginEditing:)]) {
        [self.wya_delegate wya_TextViewDidBeginEditing:textView];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidEndEditing:)]) {
        [self.wya_delegate wya_TextViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView
    shouldChangeTextInRange:(NSRange)range
            replacementText:(NSString *)text {
    if (self.wya_delegate &&
        [self.wya_delegate
            respondsToSelector:@selector(wya_TextView:shouldChangeTextInRange:replacementText:)]) {
        return [self.wya_delegate wya_TextView:textView
                       shouldChangeTextInRange:range
                               replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (![textView.text isEqualToString:self.lastPlaceHold]) {
        textView.textColor = self.textColor;
    }

    NSString * toBeString = textView.text;

    // 获取键盘输入模式

    NSString * lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;

    if ([lang isEqualToString:
                  @"zh-Hans"]) { // zh-Hans代表简体中文输入，包括简体拼音，健体五笔，简体手写

        UITextRange * selectedRange = [textView markedTextRange];

        //获取高亮部分

        UITextPosition * position = [textView positionFromPosition:selectedRange.start offset:0];

        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制

        if (!position) {
            if (toBeString.length > self.textViewWordsCount) {
                textView.text = [toBeString
                    substringToIndex:self.textViewWordsCount]; //超出限制则截取最大限制的文本

                self.noteLabel.text = [NSString
                    stringWithFormat:@"%ld/%ld", self.textViewWordsCount, self.textViewWordsCount];

            } else {
                self.noteLabel.text = [NSString
                    stringWithFormat:@"%ld/%ld", toBeString.length, self.textViewWordsCount];
            }
        }

    } else { // 中文输入法以外的直接统计

        if (toBeString.length > self.textViewWordsCount) {
            textView.text = [toBeString substringToIndex:self.textViewWordsCount];

            self.noteLabel.text = [NSString
                stringWithFormat:@"%ld/%ld", self.textViewWordsCount, self.textViewWordsCount];

        } else {
            self.noteLabel.text =
                [NSString stringWithFormat:@"%ld/%ld", toBeString.length, self.textViewWordsCount];
        }
    }
    /*
    CGFloat maxHeight;
    if (self.textViewMaxHeight>1) {
        maxHeight = self.textViewMaxHeight;
    }else{
        maxHeight = 750.0;
    }
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height<=frame.size.height) {
        size.height=frame.size.height;
    }else{
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动
        }
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,
    size.height+20*SizeAdapter);
    [self setNeedsLayout];
    [self layoutIfNeeded];*/
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidChange:)]) {
        [self.wya_delegate wya_TextViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextViewDidChangeSelection:)]) {
        [self.wya_delegate wya_TextViewDidChangeSelection:textView];
    }
}

- (BOOL)textView:(UITextView *)textView
    shouldInteractWithURL:(NSURL *)URL
                  inRange:(NSRange)characterRange
              interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    if (self.wya_delegate && [self.wya_delegate respondsToSelector:@selector(wya_TextView:
                                                                       shouldInteractWithURL:
                                                                                     inRange:
                                                                                 interaction:)]) {
        return [self.wya_delegate wya_TextView:textView
                         shouldInteractWithURL:URL
                                       inRange:characterRange
                                   interaction:interaction];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView
    shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment
                             inRange:(NSRange)characterRange
                         interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    if (self.wya_delegate &&
        [self.wya_delegate respondsToSelector:@selector(wya_TextView:
                                                  shouldInteractWithTextAttachment:
                                                                           inRange:
                                                                       interaction:)]) {
        return [self.wya_delegate wya_TextView:textView
              shouldInteractWithTextAttachment:textAttachment
                                       inRange:characterRange
                                   interaction:interaction];
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
