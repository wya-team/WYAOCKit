//
//  UITableView+CellAnimation.h
//  WYA_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellAnimation)
- (void)moveAnimation;        //左侧飞入
- (void)alphaAnimation;       //透明
- (void)fallAnimation;        //上面掉落
- (void)shakeAnimation;       //抖动动画
- (void)overTurnAnimation;    //上下翻转动画
- (void)toTopAnimation;       //从下往上
- (void)springListAnimation;  //从上往下弹动动画
- (void)shrinkToTopAnimation; //从下往上挤向顶部
- (void)layDownAnimation;     //从上往下展开
- (void)roteAnimation;        //左右翻转动画
@end
