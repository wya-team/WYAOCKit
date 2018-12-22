//
//  NSObject+WYANetWorkState.m
//  WYAKit
//
//  Created by 李世航 on 2018/12/21.
//

#import "NSObject+WYANetWorkState.h"
#import "Reachability.h"
@implementation NSObject (WYANetWorkState)

-(void)wya_getNetWorkStatus:(void(^)(WYANetWorkStatus status))handle{
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    switch (internetStatus) {
        case ReachableViaWiFi:
            handle(WYANetWorkStatusWIFI);
            break;
            
        case ReachableViaWWAN:
            handle(WYANetWorkStatusWWAN);
            break;
            
        case NotReachable:
            handle(WYANetWorkStatusNoReach);
            
        default:
            break;
    }
}

@end
