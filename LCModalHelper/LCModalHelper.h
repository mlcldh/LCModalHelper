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

/***/
@property (nonatomic,weak) UIViewController *viewController;
/***/
@property (nonatomic,strong) UIView *dimmingView;
/**背景颜色*/
@property (nonatomic,copy) UIColor *maskColor;
/***/
@property (nonatomic) LCPresentStartStyle presentStartStyle;
/***/
@property (nonatomic) LCPresentShownStyle presentShownStyle;
/***/
@property (nonatomic) LCModalLengthStyle widthStyle;
/***/
@property (nonatomic) LCModalLengthStyle heightStyle;
/**默认是0,按1处理*/
@property (nonatomic) CGFloat widthRate;
/***/
@property (nonatomic) CGFloat width;
/**默认是0,按1处理*/
@property (nonatomic) CGFloat heightRate;
/***/
@property (nonatomic) CGFloat height;
/***/
@property (nonatomic) CGFloat topMargin;
/***/
@property (nonatomic) CGFloat bottomMargin;
/***/
@property (nonatomic) CGFloat leftMargin;
/***/
@property (nonatomic) CGFloat rightMargin;
//- (void)setViewController:(UIViewController *)viewController;

@end
