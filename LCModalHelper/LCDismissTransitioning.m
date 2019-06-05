//
//  LCDismissTransitioning.m
//  MengPresent
//
//  Created by menglingchao on 2017/6/29.
//  Copyright © 2017年 menglingchao. All rights reserved.
//

#import "LCDismissTransitioning.h"
#import "Masonry.h"

@implementation LCDismissTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [toViewController beginAppearanceTransition:YES animated:YES];
    //    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    //    fromView.userInteractionEnabled = NO;
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeTop)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeBottom)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeLeft)];
    [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeRight)];
    if (self.modalHelper.presentShownStyle == LCPresentShownStyleAtCenter) {
        switch (self.modalHelper.presentStartStyle) {
            case LCPresentStartStyleFromTop:
            case LCPresentStartStyleFromBottom:
                [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeCenterY)];
                break;
            case LCPresentStartStyleFromLeft:
            case LCPresentStartStyleFromRight:
                [transitionContext.containerView lc_removeConstraintsWithFirstItem:fromView firstAttribute:(NSLayoutAttributeCenterX)];
                break;
            default:
                break;
        }
    }
    [fromView mas_updateConstraints:^(MASConstraintMaker *make) {
        switch (self.modalHelper.presentStartStyle) {
            case LCPresentStartStyleFromTop:
                make.bottom.mas_equalTo(transitionContext.containerView.mas_top);
                break;
            case LCPresentStartStyleFromBottom:
                make.top.mas_equalTo(transitionContext.containerView.mas_bottom);
                break;
            case LCPresentStartStyleFromLeft:
                make.right.mas_equalTo(transitionContext.containerView.mas_left);
                break;
            case LCPresentStartStyleFromRight:
                make.left.mas_equalTo(transitionContext.containerView.mas_right);
                break;
            default:
                break;
        }
    }];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        transitionContext.containerView.alpha = 0;
        [transitionContext.containerView layoutIfNeeded];
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        [toViewController endAppearanceTransition];
        [transitionContext completeTransition:YES];
    }];
}

@end
