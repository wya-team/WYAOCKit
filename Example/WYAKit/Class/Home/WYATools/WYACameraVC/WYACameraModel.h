//
//  WYACameraModel.h
//  WYAKit_Example
//
//  Created by 李世航 on 2018/12/26.
//  Copyright © 2018 WYATeam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WYACameraSourceType) {
    WYACameraSourceTypeImage,
    WYACameraSourceTypeVideo,
};

NS_ASSUME_NONNULL_BEGIN

@interface WYACameraModel : NSObject
@property (nonatomic, assign) WYACameraSourceType sourceType;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, copy) NSString * videoPath;

@end

NS_ASSUME_NONNULL_END
