//
//  WYADownloaderCell.h
//  WYAKit
//
//  Created by 李世航 on 2019/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYADownloaderCell : UITableViewCell
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * placeholderButton; //开始或暂停
@property (nonatomic, strong) UILabel * fileNumberLabel;
@end

NS_ASSUME_NONNULL_END
