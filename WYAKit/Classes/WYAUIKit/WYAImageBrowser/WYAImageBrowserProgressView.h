//
//  WYAImageBrowserProgressView.h

#import <UIKit/UIKit.h>

/**
 *  进度视图类型类型
 */
typedef NS_ENUM(NSUInteger, WYAImageBrowserProgressViewMode) {
    /**
     *  圆环形
     */
    WYAImageBrowserProgressViewModeLoopDiagram = 1,
    /**
     *  圆饼型
     */
    WYAImageBrowserProgressViewModePieDiagram = 2
};

@interface WYAImageBrowserProgressView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) WYAImageBrowserProgressViewMode mode;

@end
