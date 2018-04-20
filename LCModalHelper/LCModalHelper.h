//
//  LCModalHelper.h
//  MengPresent
//
//  Created by menglingchao on 2017/6/29.
//  Copyright © 2017年 menglingchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LCModalHeader.h"

@interface LCModalHelper : NSObject<UIViewControllerTransitioningDelegate>

/**被修改模态弹出效果的视图控制器*/
@property (nonatomic,weak) UIViewController *viewController;
/**弹出时的背景视图，可以设置成半透明的*/
@property (nonatomic,strong) UIView *backgroundView;
/**背景颜色*/
@property (nonatomic,copy) UIColor *maskColor;
/**模态弹出前的样式*/
@property (nonatomic) LCPresentStartStyle presentStartStyle;
/**模态弹出后的样式*/
@property (nonatomic) LCPresentShownStyle presentShownStyle;
/**宽度类型*/
@property (nonatomic) LCModalLengthStyle widthStyle;
/**宽度类型*/
@property (nonatomic) LCModalLengthStyle heightStyle;
/**宽度比例，适用于widthStyle是LCModalLengthStyleEqualToSuperViewInProportion时，默认是0,按1处理*/
@property (nonatomic) CGFloat widthRate;
/**宽度，适用于widthStyle是LCModalLengthStyleFixedValue时*/
@property (nonatomic) CGFloat width;
/**高度比例，适用于heightStyle是LCModalLengthStyleEqualToSuperViewInProportion时，默认是0,按1处理*/
@property (nonatomic) CGFloat heightRate;
/**高度，适用于heightStyle是LCModalLengthStyleFixedValue时*/
@property (nonatomic) CGFloat height;
/**距离顶部的距离*/
@property (nonatomic) CGFloat topMargin;
/**距离屏幕底部的距离*/
@property (nonatomic) CGFloat bottomMargin;
/**距离屏幕左边的距离*/
@property (nonatomic) CGFloat leftMargin;
/**距离屏幕右边的距离*/
@property (nonatomic) CGFloat rightMargin;
/**触摸背景视图时，是否将被弹出的视图控制器dismiss掉*/
@property (nonatomic) BOOL forbidDimissWhenTapBackgroundView;
//- (void)setViewController:(UIViewController *)viewController;

@end
