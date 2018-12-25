
#ifndef WYAPopupHeader_h
#define WYAPopupHeader_h

/** present style */
typedef NS_ENUM(NSInteger, WYAPopupPresentStyle) {
    WYAPopupPresentStyleSystem,          // 系统样式
    WYAPopupPresentStyleFadeIn,          // 渐入
    WYAPopupPresentStyleBounce,          // 弹出
    WYAPopupPresentStyleExpandHorizontal,// 水平展开
    WYAPopupPresentStyleExpandVertical,  // 垂直展开
    WYAPopupPresentStyleSlideDown,       // 从上往下划入
    WYAPopupPresentStyleSlideUp,         // 从下往上划入
    WYAPopupPresentStyleSlideLeft,       // 从右往左划入
    WYAPopupPresentStyleSlideRight,      // 从左往右划入
};

/** dismiss style */
typedef NS_ENUM(NSInteger, WYAPopupDismissStyle) {
    WYAPopupDismissStyleFadeOut,             // 渐出
    WYAPopupDismissStyleShrink,              // 缩起
    WYAPopupDismissStyleContractHorizontal,  // 水平收起
    WYAPopupDismissStyleContractVertical,    // 垂直收起
    WYAPopupDismissStyleSlideDown,           // 向下划出
    WYAPopupDismissStyleSlideUp,             // 向上划出
    WYAPopupDismissStyleSlideLeft,           // 向左划出
    WYAPopupDismissStyleSlideRight,          // 向右划出
};

typedef NS_ENUM(NSInteger, WYAAlertStyle) {
    WYAAlertStyleDefalut,
    WYAAlertStyleSheet,
    WYAAlertStyleCustomAlert,
    WYAAlertStyleCustomSheet,
};


/**
 只有在WYAAlertStyleDefalut模式下有效

 - WYAAlertLayoutStyleHorizontal: 水平
 - WYAAlertStyleSheetVertical: 垂直
 */
typedef NS_ENUM(NSInteger, WYAAlertLayoutStyle) {
    WYAAlertLayoutStyleHorizontal,
    WYAAlertLayoutStyleVertical,
};

#endif /* WYAPopupHeader_h */
