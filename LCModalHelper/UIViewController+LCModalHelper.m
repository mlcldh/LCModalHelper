//
//  UIViewController+LCModalHelper.m
//  MengPresent
//
//  Created by menglingchao on 2018/1/12.
//  Copyright © 2018年 menglingchao. All rights reserved.
//

#import "UIViewController+LCModalHelper.h"
#import <objc/runtime.h>

NSString const *EL_PresentationDelegate = @"EL_PresentationDelegate";
//static NSString *EL_PresentationDelegate = @"EL_PresentationDelegate";
//static char EL_PresentationDelegate;

@implementation UIViewController (LCModalHelper)
//@dynamic el_presentationDelegate;
- (void)setEl_presentationDelegate:(LCModalHelper *)el_presentationDelegate {
    [el_presentationDelegate setViewController:self];
    objc_setAssociatedObject(self, &EL_PresentationDelegate, el_presentationDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    NSLog(@"hehe %@",[self el_presentationDelegate]);
}

- (LCModalHelper *)el_presentationDelegate {
    return objc_getAssociatedObject(self, &EL_PresentationDelegate);
//    id delegate = objc_getAssociatedObject(self, &EL_PresentationDelegate);
//    return delegate;
}
- (void)el_createPresentationDelegateIfNeeded {
    LCModalHelper *delegate = [self el_presentationDelegate];
    if (!delegate) {
        delegate = [[LCModalHelper alloc]init];
//        self.el_presentationDelegate = delegate;
        [self setEl_presentationDelegate:delegate];
//        NSLog(@"new delegate %@,%@",delegate,[self el_presentationDelegate]);
    }
}

@end
