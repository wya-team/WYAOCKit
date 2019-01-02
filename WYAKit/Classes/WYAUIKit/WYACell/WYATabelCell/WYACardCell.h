//
//  WYACardCell.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/27.
//

#import "WYATableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYACardCell : WYATableViewCell
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * subTitleLabel;
@property (nonatomic, copy) NSString * contentString;
@property (nonatomic, copy) NSString * subContentString;
+ (CGFloat)wya_cellHeight:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
