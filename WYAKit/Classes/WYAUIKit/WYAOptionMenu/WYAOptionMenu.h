//
//  WYAChooseMenu.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WYAOptionMenu;
@class WYAOptionMenuModel;
@class WYAOptionMenuSecondLevelModel;

typedef NS_ENUM(NSUInteger, WYAOptionMenuStyle) {
    WYAOptionMenuStyleTable,
    WYAOptionMenuStyleTableAndCollection,
};

@protocol WYAOptionMenuDelegate <NSObject>
@required
/**
 左侧tablecell点击事件

 @param indexPath indexPath
 */
- (void)wya_optionMenu:(WYAOptionMenu *)menu leftTableDidSelectedRow:(NSIndexPath *)indexPath;

/**
 右侧视图点击事件

 @param indexPath indexPath
 */
- (void)wya_optionMenu:(WYAOptionMenu *)menu rightViewDidSelectedItem:(NSIndexPath *)indexPath;

@end

@interface WYAOptionMenu : UIView

@property (nonatomic, weak) id<WYAOptionMenuDelegate> wya_delegate;
@property (nonatomic, strong) NSMutableArray<WYAOptionMenuModel *> * titleArray;
/// 取值范围0~1，适用于左侧table，右侧table自适应
@property (nonatomic, assign) CGFloat leftTableProportion;
@property (nonatomic, assign) WYAOptionMenuStyle menuStyle;

- (instancetype)initWithFrame:(CGRect)frame optionMenuStyle:(WYAOptionMenuStyle)optionMenuStyle;
@end

NS_ASSUME_NONNULL_END
