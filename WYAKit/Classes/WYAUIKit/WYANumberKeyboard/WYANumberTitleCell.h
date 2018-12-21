//
//  WYANumberTitleCell.h
//  AFNetworking
//
//  Created by 李俊恒 on 2018/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYANumberTitleCell : UICollectionViewCell
@property (nonatomic, copy) NSString * titleString;
@property (nonatomic, strong) UIColor * bgColor;

@end

@interface WYANumberImageCell : UICollectionViewCell
@property (nonatomic, copy) NSString * imageNamed;
@property (nonatomic, strong) UIColor * bgColor;
@end
NS_ASSUME_NONNULL_END
