//
//  WYATextView.m
//  WYAKit
//
//  Created by 李世航 on 2018/11/13.
//

#import "WYATextView.h"
#import "UITextView+WYAPlaceholder.h"

@interface WYATextView ()

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * noteLabel;

@end

@implementation WYATextView {
    CGFloat _initialHeight;
}
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat titleLabel_x      = 5 * SizeAdapter;
    CGFloat titleLabel_y      = 7 * SizeAdapter;
    CGFloat titleLabel_width  = 40 * SizeAdapter;
    CGFloat titleLabel_height = 20 * SizeAdapter;
    CGRect titleLabel_rect    = CGRectMake(titleLabel_x, titleLabel_y, titleLabel_width, titleLabel_height);
    self.titleLabel.frame     = titleLabel_rect;

    CGFloat noteLabel_x      = 0;
    CGFloat noteLabel_y      = self.cmam_height - 20 * SizeAdapter;
    CGFloat noteLabel_width  = self.cmam_width - 5 * SizeAdapter;
    CGFloat noteLabel_height = 20 * SizeAdapter;
    CGRect noteLabel_rect    = CGRectMake(noteLabel_x, noteLabel_y, noteLabel_width, noteLabel_height);
    self.noteLabel.frame     = noteLabel_rect;

    CGFloat textView_x;
    CGFloat textView_width;
    if (self.showTitle == NO) {
        textView_x     = 0;
        textView_width = self.cmam_width;
    } else {
        textView_x     = self.titleLabel.cmam_right;
        textView_width = self.cmam_width - self.titleLabel.cmam_right;
    }
    CGFloat textView_y = self.textViewPadding;
    CGFloat textView_height;
    if (self.showWordsCount == YES) {
        textView_height = self.cmam_height - self.noteLabel.cmam_height - self.textViewPadding * 2;
    } else {
        textView_height = self.cmam_height - self.textViewPadding * 2;
    }
    CGRect textView_rect = CGRectMake(textView_x, textView_y, textView_width, textView_height);
    self.textView.frame  = textView_rect;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

#pragma mark--- Private Method
- (void)textChange:(NSNotification *) not{
    UITextView * textView = (UITextView *)not.object;
    if (self.showWordsCount) {
        [self recordTextViewInputWithTextView:textView];
    }
    if (self.autoChangeHeight) {
        [self autoChnageTextViewHeightWithTextView:textView];
    }
}

- (void)recordTextViewInputWithTextView:(UITextView *)textView {
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
}

- (void)autoChnageTextViewHeightWithTextView:(UITextView *)textView {
    CGFloat maxHeight     = self.textViewMaxHeight;
    CGRect frame          = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size           = [textView sizeThatFits:constraintSize];
    NSLog(@"self.height==%f,size.height==%f,maxHeight==%f", self.cmam_height, size.height, self.textViewMaxHeight);
    NSLog(@"initialHeight==%f", _initialHeight);
    if (size.height >= maxHeight) {
        // 如果大于最大高度，就不在增加高度
        size.height = maxHeight;
    } else if (size.height < _initialHeight) {
        // 记录的是初始值，如果有文字记录需要减去文字记录label的高度w
        if (self.showWordsCount) {
            size.height = _initialHeight - self.noteLabel.cmam_height;
        } else {
            size.height = _initialHeight;
        }
    }

    textView.frame     = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    CGFloat self_x     = self.cmam_left;
    CGFloat self_y     = self.cmam_top;
    CGFloat self_width = self.cmam_width;
    CGFloat self_height;
    if (self.showWordsCount) {
        self_height = size.height + self.noteLabel.cmam_height + self.textViewPadding * 2;
    } else {
        self_height = size.height + self.textViewPadding * 2;
    }
    CGRect self_rect = CGRectMake(self_x, self_y, self_width, self_height);
    self.frame       = self_rect;
    if (self.textViewContentFrame) {
        self.textViewContentFrame();
    }
}

#pragma mark--- Public Method

#pragma mark--- Setter
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (!_initialHeight) {
        _initialHeight = frame.size.height;
    }
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

- (void)setText:(NSString *)text {
    if (text) {
        self.textView.text  = text;
        self.noteLabel.text = [NSString
            stringWithFormat:@"%ld/%ld", text.length, self.textViewWordsCount];
    }
}

- (void)setPlaceHoldString:(NSString *)placeHoldString {
    self.textView.wya_placeHolder = placeHoldString;
}

- (void)setPlaceHoldColor:(UIColor *)placeHoldColor {
    self.textView.wya_placeHolderColor = placeHoldColor;
}

- (void)setTextViewPadding:(CGFloat)textViewPadding{
    _textViewPadding = textViewPadding;
    [self layoutIfNeeded];
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
        _textView               = [[UITextView alloc] init];
        _textView.scrollEnabled = YES;
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

- (NSString *)text {
    return self.textView.text;
}

@end
