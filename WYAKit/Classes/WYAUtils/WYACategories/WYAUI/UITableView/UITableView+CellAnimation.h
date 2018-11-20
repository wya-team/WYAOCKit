//
//  UITableView+CellAnimation.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellAnimation)
- (void)wya_moveAnimation;        //左侧飞入
- (void)wya_alphaAnimation;       //透明
- (void)wya_fallAnimation;        //上面掉落
- (void)wya_shakeAnimation;       //抖动动画
- (void)wya_overTurnAnimation;    //上下翻转动画
- (void)wya_toTopAnimation;       //从下往上
- (void)wya_springListAnimation;  //从上往下弹动动画
- (void)wya_shrinkToTopAnimation; //从下往上挤向顶部
- (void)wya_layDownAnimation;     //从上往下展开
- (void)wya_roteAnimation;        //左右翻转动画
@end
