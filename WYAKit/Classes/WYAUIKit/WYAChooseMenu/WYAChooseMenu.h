//
//  WYAChooseMenu.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WYAChooseMenuModel;
@class WYAChooseMenuSecondLevelModel;

typedef NS_ENUM(NSUInteger, WYAChooseMenuStyle) {
    WYAChooseMenuStyleTable,
    WYAChooseMenuStyleTableAndCollection,
};

@protocol WYAChooseMenuDelegate <NSObject>
@required
/**
 左侧tablecell点击事件

 @param indexPath indexPath
 */
- (void)wya_LeftTableDidSelectedRow:(NSIndexPath *)indexPath;

/**
 右侧视图点击事件

 @param indexPath indexPath
 */
- (void)wya_RightViewDidSelectedItem:(NSIndexPath *)indexPath;

@end

@interface WYAChooseMenu : UIView

@property (nonatomic, weak) id<WYAChooseMenuDelegate> wya_delegate;
@property (nonatomic, strong) NSMutableArray <WYAChooseMenuModel *>* titleArray;
@property (nonatomic, strong) NSMutableArray <WYAChooseMenuSecondLevelModel *>* contentArray;
@property (nonatomic, assign) CGFloat  leftTableProportion;//取值范围0~1，适用于左侧table，右侧table自适应
@property (nonatomic, assign) WYAChooseMenuStyle  menuStyle;

- (instancetype)initWithFrame:(CGRect)frame ChooseMenuStyle:(WYAChooseMenuStyle)chooseMenuStyle;
@end

NS_ASSUME_NONNULL_END
