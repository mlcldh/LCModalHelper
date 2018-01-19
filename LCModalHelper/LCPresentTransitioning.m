//
//  LCPresentTransitioning.m
//  MengPresent
//
//  Created by menglingchao on 2017/6/29.
//  Copyright © 2017年 menglingchao. All rights reserved.
//

#import "LCPresentTransitioning.h"
#import "Masonry.h"

@interface LCPresentTransitioning ()

@property (nonatomic,weak) UIViewController *toViewController;

@end

@implementation LCPresentTransitioning

- (void)dealloc {
    
}
#pragma mark - Event
- (void)tapAction:(UITapGestureRecognizer *)recognizer {
    [self.toViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
//    if (!transitionContext.animated) {
//        NSLog(@"no animate");
//        return 0;
//    }
//    NSLog(@"has animate");
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    transitionContext.containerView.alpha = 0;
    self.modalHelper.dimmingView = [[UIView alloc] init];
    self.modalHelper.dimmingView.backgroundColor = self.modalHelper.maskColor?:[UIColor colorWithWhite:0.5 alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.modalHelper.dimmingView addGestureRecognizer:tap];
    [transitionContext.containerView addSubview:self.modalHelper.dimmingView];
    //    NSLog(@"%@",transitionContext.containerView.superview);
    [self.modalHelper.dimmingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(transitionContext.containerView);
    }];
    
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = self.toViewController.view;
    
    [transitionContext.containerView addSubview:toView];
    [toView mas_makeConstraints:^(MASConstraintMaker *make) {
        switch (self.modalHelper.presentStartStyle) {
            case LCPresentStartStyleFromTop:{
                make.bottom.equalTo(transitionContext.containerView.mas_top);
                make.centerX.equalTo(transitionContext.containerView);
            }
                break;
            case LCPresentStartStyleFromBottom:{
                make.top.equalTo(transitionContext.containerView.mas_bottom);
                make.centerX.equalTo(transitionContext.containerView);
            }
                break;
            case LCPresentStartStyleFromLeft:{
                make.right.equalTo(transitionContext.containerView.mas_left);
                make.centerY.equalTo(transitionContext.containerView);
            }
                break;
            case LCPresentStartStyleFromRight:{
                make.left.equalTo(transitionContext.containerView.mas_right);
                make.centerY.equalTo(transitionContext.containerView);
            }
                break;
            default:
                break;
        }
        switch (self.modalHelper.widthStyle) {
            case LCModalLengthStyleEqualToSuperViewInProportion:
                make.width.equalTo(transitionContext.containerView).multipliedBy(self.modalHelper.widthRate?:1);
                break;
            case LCModalLengthStyleFixedValue:
                make.width.mas_equalTo(self.modalHelper.width);
            default:
                break;
        }
        switch (self.modalHelper.heightStyle) {
            case LCModalLengthStyleEqualToSuperViewInProportion:
                make.height.equalTo(transitionContext.containerView).multipliedBy(self.modalHelper.heightRate?:1);
                break;
            case LCModalLengthStyleFixedValue:
                make.height.mas_equalTo(self.modalHelper.height);
            default:
                break;
        }
    }];
    [transitionContext.containerView layoutIfNeeded];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:toView firstAttribute:(NSLayoutAttributeTop)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:toView firstAttribute:(NSLayoutAttributeBottom)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:toView firstAttribute:(NSLayoutAttributeLeft)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:toView firstAttribute:(NSLayoutAttributeRight)];
    [toView mas_updateConstraints:^(MASConstraintMaker *make) {
        switch (self.modalHelper.presentShownStyle) {
            case LCPresentShownStyleAtCenter:{
                make.center.equalTo(transitionContext.containerView);
            }
                break;
            case LCPresentShownStyleAtTop:{
                make.top.equalTo(transitionContext.containerView).offset(self.modalHelper.topMargin);
            }
                break;
            case LCPresentShownStyleAtBottom:{
                make.bottom.equalTo(transitionContext.containerView).offset(-self.modalHelper.bottomMargin);
            }
                break;
            case LCPresentShownStyleAtLeft:{
                make.left.equalTo(transitionContext.containerView).offset(self.modalHelper.leftMargin);
            }
                break;
            case LCPresentShownStyleAtRight:{
                make.right.equalTo(transitionContext.containerView).offset(-self.modalHelper.rightMargin);
            }
                break;
            default:
                break;
        }
    }];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        transitionContext.containerView.alpha = 1;
        [transitionContext.containerView layoutIfNeeded];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
//- (void)hehea:(id <UIViewControllerContextTransitioning>)transitionContext {
//    [transitionContext completeTransition:YES];
//}
//- (void)animationEnded:(BOOL) transitionCompleted {
//    
//}

@end
