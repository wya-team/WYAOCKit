
#import "WYAAlertAction.h"

@implementation WYAAlertAction
+ (instancetype)appearance
{
    return [WYAAppearance appearanceForClass:[self class]];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[[self class] appearance] applyInvocationTo:self];
    }
    return self;
}

+ (instancetype)wya_actionWithTitle:(NSString *)title
                            handler:(void (^)(void))handler {
    WYAAlertAction * action = [[WYAAlertAction alloc] init];
    action.title            = title;
    action.handler          = handler;
    action.textColor        = [UIColor blackColor];
    action.textFont         = FONT(15);
    return action;
}

+ (instancetype)wya_actionWithTitle:(NSString *)title
                          textColor:(UIColor *)textColor
                            handler:(void (^)(void))handler {

    WYAAlertAction * action = [[WYAAlertAction alloc] init];
    action.title            = title;
    action.handler          = handler;
    if (textColor) {
        action.textColor = textColor;
    } else {
        action.textColor = [UIColor blackColor];
    }
    action.textFont = FONT(15);
    return action;
}

+ (instancetype)wya_actionWithTitle:(NSString *)title
                          textColor:(UIColor *)textColor
                           textFont:(UIFont *)textFont
                            handler:(void (^)(void))handler {
    WYAAlertAction * action = [[WYAAlertAction alloc] init];
    action.title            = title;
    action.handler          = handler;
    if (textColor) {
        action.textColor = textColor;
    } else {
        action.textColor = [UIColor blackColor];
    }
    if (textFont) {
        action.textFont = textFont;
    } else {
        action.textFont = FONT(15);
    }
    return action;
}

@end
