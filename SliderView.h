//
//  SliderView.h
//  SunSoft
//
//  Created by 田司 on 2018/3/7.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SliderView;
@protocol LockSliderDelegate <NSObject>
@optional
- (void)sliderValueChanging:(SliderView *)slider;
- (void)sliderEndValueChanged:(SliderView *)slider;
@end
@interface SliderView : UIView
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong)UIFont *font;
@property (nonatomic,strong) UIImage *thumbImage;
@property (nonatomic,strong) UIImage *finishImage;
@property (nonatomic, assign) BOOL thumbHidden;
/**
 *  拖动后是否返回
 */
@property (nonatomic,assign) BOOL thumbBack;
@property (nonatomic, weak) id<LockSliderDelegate> delegate;
/**
 *  设置滑动条进度
 *  value取值0~1
 */
- (void)setSliderValue:(CGFloat)value;
/**
 *  动画设置滑动条进度
 */
- (void)setSliderValue:(CGFloat)value animation:(BOOL)animation completion:(void(^)(BOOL finish))completion;
/**
 *  设置滑动条颜色
 *
 *  @param backgroud  背景色
 *  @param foreground 前景色
 *  @param thumb      滑动控件颜色
 *  @param border     边框色
 */
- (void)setColorForBackgroud:(UIColor *)backgroud foreground:(UIColor *)foreground thumb:(UIColor *)thumb border:(UIColor *)border textColor:(UIColor *)textColor;

/**
 *  设置滑动控件的起始图片和完成图片(可选)
 *
 *  @param beginImage 启始图片
 *  @param endImage   完成图片
 */
- (void)setThumbBeginImage:(UIImage *)beginImage finishImage:(UIImage *)finishImage;
/**
 *  移除圆角和边框
 */
- (void)removeRoundCorners:(BOOL)corners border:(BOOL)border;

@end

