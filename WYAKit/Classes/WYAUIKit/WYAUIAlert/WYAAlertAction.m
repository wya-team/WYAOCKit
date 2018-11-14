
#import "WYAAlertAction.h"

@implementation WYAAlertAction

+ (instancetype)wya_ActionWithTitle:(NSString *)title style:(WYAAlertActionStyle)style handler:(void(^)(void))handler {
    WYAAlertAction *action = [[WYAAlertAction alloc] init];
    action.title = title;
    action.handler = handler;
    action.style = style;
    return action;
}


@end
