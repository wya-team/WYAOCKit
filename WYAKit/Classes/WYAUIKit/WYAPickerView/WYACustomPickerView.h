//
//  WYACustomPickerView.h
//  WYAKit
//
//  Created by 李世航 on 2018/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYACustomPickerViewDataSource <NSObject>

@required

- (NSInteger)numberOfComponentsInCustomPickerView:(UIView *)pickerView;
- (NSInteger)customPickerView:(UIView *)pickerView numberOfRowsInComponent:(NSInteger)component;

@end

@protocol WYACustomPickerViewDelegate <NSObject>

@optional
- (CGFloat)customPickerView:(UIView *)pickerView widthForComponent:(NSInteger)component;
- (CGFloat)customPickerView:(UIView *)pickerView rowHeightForComponent:(NSInteger)component;
- (UIView *)customPickerView:(UIView *)pickerView
                  viewForRow:(NSInteger)row
                forComponent:(NSInteger)component
                 reusingView:(nullable UIView *)view;
- (void)customPickerView:(UIView *)pickerView
            didSelectRow:(NSInteger)row
             inComponent:(NSInteger)component;
@end

@interface WYACustomPickerView : UIView
@property (nonatomic, weak) id<WYACustomPickerViewDataSource> wya_dataSource;
@property (nonatomic, weak) id<WYACustomPickerViewDelegate> wya_delegate;

@end

NS_ASSUME_NONNULL_END
