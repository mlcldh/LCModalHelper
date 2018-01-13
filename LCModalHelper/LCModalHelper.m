//
//  LCModalHelper.m
//  MengPresent
//
//  Created by menglingchao on 2017/6/29.
//  Copyright © 2017年 menglingchao. All rights reserved.
//

#import "LCModalHelper.h"
#import "LCPresentTransitioning.h"
#import "LCDismissTransitioning.h"

@interface LCModalHelper()

/***/
//@property (nonatomic,strong) UIViewController *viewController;
/***/
@property (nonatomic,strong) LCPresentTransitioning *presentingAnimator;
/***/
@property (nonatomic,strong) LCDismissTransitioning *dismissingAnimator;

@end

@implementation LCModalHelper

- (void)dealloc {
    
}
#pragma mark - Setter
- (void)setViewController:(UIViewController *)viewController {
    _viewController = viewController;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.transitioningDelegate = self;
}
#pragma mark - Getter
- (LCPresentTransitioning *)presentingAnimator {
    if (!_presentingAnimator) {
        _presentingAnimator = [[LCPresentTransitioning alloc]init];
        _presentingAnimator.modalHelper = self;
    }
    return _presentingAnimator;
}
- (LCDismissTransitioning *)dismissingAnimator {
    if (!_dismissingAnimator) {
        _dismissingAnimator = [[LCDismissTransitioning alloc]init];
        _dismissingAnimator.modalHelper = self;
    }
    return _dismissingAnimator;
}
#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentingAnimator;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissingAnimator;
}
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
//    return nil;
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//    return nil;
//}

@end
