//
//  QRCodeViewController.h
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYAQRCodeViewController : UIViewController

@property (nonatomic, copy) void(^ScanReault)(NSString * reault);

@end
