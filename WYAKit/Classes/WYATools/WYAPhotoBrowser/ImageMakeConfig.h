

#ifndef ImageMakeConfig_h
#define ImageMakeConfig_h

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define TabBarHeigh WYAiPhoneX ? 83:49
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavBarHeight 44.0
#define TabBarHeight (WYAStatusBarHeight > 20 ? 83 : 49)
#define BottomHeight (WYAStatusBarHeight > 20 ? 34 : 0)
#define TopHeight (StatusBarHeight + NavBarHeight)


#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif /* ImageMakeConfig_h */
