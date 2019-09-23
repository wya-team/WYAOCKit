//
//  WYAWaterMark.h
//  WYAKit
//
//  Created by 李世航 on 2019/8/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYAWaterMark : NSObject
- (void)AVsaveVideoPath:(NSURL*)videoPath WithWaterImg:(UIImage*)img WithCoverImage:(UIImage*)coverImg WithQustion:(NSString*)question WithFileName:(NSString*)fileName;
@end

NS_ASSUME_NONNULL_END
