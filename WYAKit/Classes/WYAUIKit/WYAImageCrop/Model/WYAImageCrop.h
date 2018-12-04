//
//  WYAImageCrop.h
//  WYAKit
//
//  Created by 李世航 on 2018/12/3.
//

#ifndef WYAImageCrop_h
#define WYAImageCrop_h

/**
 The shape of the cropping region of this crop view controller
 */
typedef NS_ENUM(NSInteger, WYACropViewCroppingStyle) {
    WYACropViewCroppingStyleDefault,     // The regular, rectangular crop box
    WYACropViewCroppingStyleCircular     // A fixed, circular crop box
};

/**
 Preset values of the most common aspect ratios that can be used to quickly configure
 the crop view controller.
 */
typedef NS_ENUM(NSInteger, WYACropViewControllerAspectRatioPreset) {
    WYACropViewControllerAspectRatioPresetOriginal,
    WYACropViewControllerAspectRatioPresettSquare,
    WYACropViewControllerAspectRatioPreset3x2,
    WYACropViewControllerAspectRatioPreset5x3,
    WYACropViewControllerAspectRatioPreset4x3,
    WYACropViewControllerAspectRatioPreset5x4,
    WYACropViewControllerAspectRatioPreset7x5,
    WYACropViewControllerAspectRatioPreset16x9,
    WYACropViewControllerAspectRatioPresetCustom
};

#endif /* WYAImageCrop_h */
