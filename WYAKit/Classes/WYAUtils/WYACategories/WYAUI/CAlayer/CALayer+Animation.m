//
//  CALayer+Animation.m
//  WYAKit
//
//  Created by 李世航 on 2019/11/26.
//

#import "CALayer+Animation.h"

@implementation CALayer (Animation)

- (void)pause{
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    // 让CALayer的时间停止走动
    self.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    self.timeOffset = pausedTime;
}

- (void)resume{
    CFTimeInterval pausedTime = self.timeOffset;
    // 1. 让CALayer的时间继续行走
    self.speed = 1.0;
    // 2. 取消上次记录的停留时刻
    self.timeOffset = 0.0;
    // 3. 取消上次设置的时间
    self.beginTime = 0.0;
    // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
    self.beginTime = timeSincePause;
}

@end
